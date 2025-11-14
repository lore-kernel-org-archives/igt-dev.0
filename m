Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E747CE7AA3
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 10:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A236210EA28;
	Fri, 14 Nov 2025 10:19:20 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A987110EA28;
 Fri, 14 Nov 2025 10:19:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3444724907808751449=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_Add_writeback_changes_fo?=
 =?utf-8?q?r_intel-supported_formats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sowmiya S" <sowmiya.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 14 Nov 2025 10:19:19 -0000
Message-ID: <176311555966.55014.12499943664880788722@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251113085801.3088957-1-sowmiya.s@intel.com>
In-Reply-To: <20251113085801.3088957-1-sowmiya.s@intel.com>
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

--===============3444724907808751449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add writeback changes for intel-supported formats (rev2)
URL   : https://patchwork.freedesktop.org/series/156913/
State : success

== Summary ==

CI Bug Log - changes from IGT_8623_full -> IGTPW_14050_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_14050_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14050_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14050_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-rkl:          [SKIP][1] ([i915#14544]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  
New tests
---------

  New tests have been introduced between IGT_8623_full and IGTPW_14050_full:

### New IGT tests (16) ###

  * igt@i915_pm_rps@bad-hsync-start:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@create-ext-placement-all:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@ctm-signed:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@cursor-offscreen-128x42:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@engines-basic:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@fault-concurrent-x:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@filter-scaler-upscale:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@flip-vs-panning-interruptible:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@getfb-handle-protection:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@i915-ref-count:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@psr-rgb565-draw-mmap-cpu:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@single-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@spin-all-new:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@timeline-wait:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@verify-pxp-key-change-after-suspend-resume:
    - Statuses :
    - Exec time: [None] s

  * igt@i915_pm_rps@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_14050_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-rkl:          [PASS][3] -> [SKIP][4] ([i915#14544] / [i915#2582]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@fbdev@nullptr.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#7697])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#3936])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#3936])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_busy@semaphore.html

  * igt@gem_caching@read-writes:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#4873])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@gem_caching@read-writes.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-snb:          NOTRUN -> [SKIP][9] +35 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb4/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@gem_ccs@block-copy-compressed.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.html
    - shard-rkl:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][15] -> [INCOMPLETE][16] ([i915#12392] / [i915#13356])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#7697])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu-1:       NOTRUN -> [SKIP][18] ([i915#6335])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8555])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8555])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#14544] / [i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-mtlp:         [PASS][25] -> [SKIP][26] ([i915#15178])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-mtlp-5/igt@gem_eio@unwedge-stress.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-pair:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#4771])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#4771])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4036])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglu-1:       NOTRUN -> [SKIP][31] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fence@submit:
    - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@gem_exec_fence@submit.html
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][36] ([i915#3539] / [i915#4852])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#3281]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#14544] / [i915#3281]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html
    - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#3281]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt-noreloc:
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#3281]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][42] -> [INCOMPLETE][43] ([i915#13356]) +2 other tests incomplete
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613] / [i915#7582])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][47] ([i915#4613]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk6/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          NOTRUN -> [TIMEOUT][48] ([i915#5493]) +1 other test timeout
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4083])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@gem_mmap@big-bo.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4083]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4077]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4077]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#4077]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_offset@clear:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][54] ([i915#12964]) +4 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_mmap_offset@clear.html

  * igt@gem_pread@exhaustion:
    - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#3282]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-self:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#3282]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pwrite@basic-self.html
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#3282]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@gem_pwrite@basic-self.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][58] ([i915#12964])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4270])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          NOTRUN -> [TIMEOUT][60] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          [PASS][61] -> [TIMEOUT][62] ([i915#12917] / [i915#12964]) +1 other test timeout
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#8428]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#5190] / [i915#8428]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4885])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_pread_pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4079])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4079])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-8/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#3297])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#3323])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3297] / [i915#4880])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate.html
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4880])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate.html
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3297])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3297] / [i915#4958])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][75] ([i915#3297]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][76] ([i915#13356])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#14544]) +21 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gen7_exec_parse@chained-batch.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#2527] / [i915#2856])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu:         NOTRUN -> [SKIP][79] ([i915#2527] / [i915#2856]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#2856])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#2856]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_drm_fdinfo@all-busy-idle-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#14123])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_drm_fdinfo@all-busy-idle-check-all.html

  * igt@i915_drm_fdinfo@virtual-busy-idle:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#14118])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-idle.html

  * igt@i915_drm_fdinfo@virtual-busy-idle-all:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#14118])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-busy-idle-all.html

  * igt@i915_module_load@reload-no-display:
    - shard-dg2:          [PASS][86] -> [DMESG-WARN][87] ([i915#13029] / [i915#14545])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-11/igt@i915_module_load@reload-no-display.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@i915_module_load@reload-no-display.html
    - shard-dg1:          [PASS][88] -> [DMESG-WARN][89] ([i915#13029] / [i915#14545])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_module_load@reload-no-display.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_load@reload-no-display.html
    - shard-snb:          [PASS][90] -> [DMESG-WARN][91] ([i915#14545])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb4/igt@i915_module_load@reload-no-display.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb4/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#8399])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [PASS][93] -> [FAIL][94] ([i915#12964]) +1 other test fail
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#14498])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-rkl:          [PASS][96] -> [SKIP][97] ([i915#13328])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_pm_rpm@gem-pread.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][98] ([i915#13356] / [i915#15172])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk10/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#11681] / [i915#6621])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [PASS][100] -> [INCOMPLETE][101] ([i915#13821])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb4/igt@i915_pm_rps@reset.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb1/igt@i915_pm_rps@reset.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][102] -> [DMESG-FAIL][103] ([i915#12061]) +1 other test dmesg-fail
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-mtlp-8/igt@i915_selftest@live@workarounds.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][104] ([i915#4817] / [i915#7443])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#4212])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#12454] / [i915#12712])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#1769] / [i915#3555])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-glk:          NOTRUN -> [SKIP][108] ([i915#1769])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#1769] / [i915#3555])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][110] -> [FAIL][111] ([i915#5956]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#5286]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4538] / [i915#5286]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][114] ([i915#5286])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#5286]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#3638])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#3638]) +1 other test skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-rkl:          [PASS][118] -> [SKIP][119] ([i915#14544]) +43 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][120] +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#4538] / [i915#5190]) +4 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#5190])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#6187])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_busy@basic:
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#11190] / [i915#14544])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_busy@basic.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#6095]) +157 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#6095]) +64 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#12313]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#12313]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#6095]) +9 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#10307] / [i915#6095]) +121 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#12313])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#10307] / [i915#10434] / [i915#6095])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#12805])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#14098] / [i915#6095]) +42 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][136] ([i915#12796] / [i915#14694])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#6095]) +16 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#6095]) +24 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#12313])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#12313])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#6095]) +47 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
    - shard-glk10:        NOTRUN -> [SKIP][142] +14 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk10/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-glk:          NOTRUN -> [SKIP][143] +231 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][144] ([i915#3742])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][145] ([i915#13783]) +4 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#13783]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#11151] / [i915#7828]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg1:          NOTRUN -> [SKIP][148] +14 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#11151] / [i915#7828]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#11151] / [i915#7828]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#11151] / [i915#7828]) +9 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#11151] / [i915#7828]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#11151] / [i915#7828]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-negative:
    - shard-rkl:          [PASS][154] -> [SKIP][155] ([i915#12655] / [i915#14544]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_color@ctm-negative.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_color@ctm-negative.html

  * igt@kms_color@deep-color:
    - shard-tglu-1:       NOTRUN -> [SKIP][156] ([i915#3555] / [i915#9979])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#3116] / [i915#3299]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][158] ([i915#6944] / [i915#9424]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][159] ([i915#7173])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_content_protection@lic-type-0@pipe-a-dp-3.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#9424])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#7116])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6944] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          [PASS][163] -> [FAIL][164] ([i915#13566]) +2 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][165] ([i915#8814])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#13049]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-tglu-1:       NOTRUN -> [FAIL][167] ([i915#13566]) +1 other test fail
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][168] ([i915#13566]) +1 other test fail
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][169] -> [INCOMPLETE][170] ([i915#12358] / [i915#14152]) +1 other test incomplete
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2:
    - shard-rkl:          [PASS][171] -> [DMESG-WARN][172] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#13046] / [i915#5354]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#9809]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][175] +62 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-rkl:          [PASS][176] -> [FAIL][177] ([i915#2346])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#4103]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#4103] / [i915#4213])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([i915#9723])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [PASS][181] -> [SKIP][182] ([i915#3555])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#1257])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#13748])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#13707])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#8812])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3555] / [i915#3840])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#3840])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][189] ([i915#9878])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][190] ([i915#2065] / [i915#4854])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-1x:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#14544] / [i915#9738])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#9337])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglu-1:       NOTRUN -> [SKIP][193] ([i915#3637] / [i915#9934]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#9934]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#9934])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#3637] / [i915#9934]) +7 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#9934]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#9934]) +4 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_flip@2x-plain-flip-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637] / [i915#9934]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8381])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#8381])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#8381])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [PASS][203] -> [INCOMPLETE][204] ([i915#12314] / [i915#12745] / [i915#4839]) +1 other test incomplete
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [ABORT][205] ([i915#15132])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-rkl:          [PASS][206] -> [SKIP][207] ([i915#14544] / [i915#3637]) +4 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_flip@plain-flip-ts-check.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#14544] / [i915#3637])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][209] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#2672] / [i915#8813]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#14544] / [i915#3555]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#2587] / [i915#2672] / [i915#3555])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#2587] / [i915#2672])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-rkl:          [PASS][214] -> [SKIP][215] ([i915#14544] / [i915#3555]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#2672] / [i915#3555])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#2587] / [i915#2672]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#2587] / [i915#2672])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#2672]) +3 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-rkl:          [PASS][222] -> [SKIP][223] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_frontbuffer_tracking@basic.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-dg1:          [PASS][224] -> [DMESG-WARN][225] ([i915#4423])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14544] / [i915#1849] / [i915#5354]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#1825]) +10 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#8708]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][229] +18 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#10056])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#15102]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
    - shard-dg1:          NOTRUN -> [SKIP][232] ([i915#15102])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#10433] / [i915#15102] / [i915#3458])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#15102] / [i915#3458]) +9 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#8708])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][236] ([i915#8708]) +7 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#5354]) +10 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#1825]) +25 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#15104])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#15102]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#15102] / [i915#3023]) +8 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][242] ([i915#15102]) +6 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#15102]) +24 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#15102] / [i915#3458]) +6 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [PASS][245] -> [SKIP][246] ([i915#3555] / [i915#8228]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-11/igt@kms_hdr@static-toggle.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglu-1:       NOTRUN -> [SKIP][247] ([i915#3555] / [i915#8228])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@zero-vdisplay:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#14544] / [i915#3555] / [i915#8826])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#10656])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#10656])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][252] ([i915#10656])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#10656])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#10656])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#15283])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_joiner@basic-max-non-joiner.html
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#15283])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#10656] / [i915#12388])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#12339])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#13522])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#1839])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#6301]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-dg2:          NOTRUN -> [SKIP][262] +8 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-rkl:          [PASS][263] -> [SKIP][264] ([i915#11190] / [i915#14544]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#13705])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][266] ([i915#13705])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-rkl:          [PASS][267] -> [SKIP][268] ([i915#14544] / [i915#8825])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][269] ([i915#10647] / [i915#12177])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][270] ([i915#10647] / [i915#12169])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][271] ([i915#10647]) +3 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-rkl:          [PASS][272] -> [SKIP][273] ([i915#14544] / [i915#7294]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#11614] / [i915#3582]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#14259])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-dg1:          NOTRUN -> [SKIP][277] ([i915#12247]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#12247])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-rkl:          [PASS][279] -> [SKIP][280] ([i915#14544] / [i915#6953] / [i915#8152])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-rkl:          [PASS][281] -> [SKIP][282] ([i915#12247] / [i915#14544])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:
    - shard-rkl:          [PASS][283] -> [SKIP][284] ([i915#12247] / [i915#14544] / [i915#8152])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#12343])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#5354])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#9685])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-rkl:          [PASS][288] -> [DMESG-WARN][289] ([i915#12964]) +50 other tests dmesg-warn
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2:          [PASS][290] -> [SKIP][291] ([i915#15073])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][292] ([i915#15073])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#15073])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][294] -> [SKIP][295] ([i915#15073]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#14544] / [i915#6524])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#6524])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#11521] / [i915#14544])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-glk10:        NOTRUN -> [SKIP][299] ([i915#11520])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#12316]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#11520]) +2 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-snb:          NOTRUN -> [SKIP][302] ([i915#11520]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#11520]) +4 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][304] ([i915#9808])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#11520]) +11 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][306] ([i915#11520]) +5 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][307] ([i915#11520])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][308] ([i915#11520]) +4 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][309] ([i915#9683])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][310] ([i915#9732]) +5 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-mmap-cpu.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#9688]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#1072] / [i915#9732]) +9 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr-primary-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +11 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_psr@psr-primary-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#1072] / [i915#14544] / [i915#9732])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-cpu.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9732]) +20 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr2-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#1072] / [i915#9732]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#9685]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#9685]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#12755]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][320] ([i915#4884])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12755]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#3555]) +3 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-none.html
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#3555])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#3555])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#3555] / [i915#8809] / [i915#8823])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#15232]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][327] ([i915#15232])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#15232])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#15232])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][330] ([i915#10959])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#8623])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#3555]) +7 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_vrr@flip-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][333] ([i915#15243] / [i915#3555])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          NOTRUN -> [SKIP][334] ([i915#11920])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#3555] / [i915#9906])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#2437])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#2437])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#2437])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-dg1:          NOTRUN -> [SKIP][339] ([i915#2437])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#2437] / [i915#9412])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_writeback@writeback-pixel-formats.html
    - shard-glk:          NOTRUN -> [SKIP][341] ([i915#2437])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-tglu:         [PASS][342] -> [FAIL][343] ([i915#4349]) +1 other test fail
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-tglu-3/igt@perf_pmu@busy-accuracy-98.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-rkl:          [PASS][344] -> [DMESG-FAIL][345] ([i915#12964]) +3 other tests dmesg-fail
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@perf_pmu@busy-idle-check-all.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@interrupts-sync:
    - shard-rkl:          [PASS][346] -> [FAIL][347] ([i915#14470])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@perf_pmu@interrupts-sync.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@perf_pmu@interrupts-sync.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#8516]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [PASS][349] -> [INCOMPLETE][350] ([i915#13356] / [i915#14242])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-glk5/igt@perf_pmu@rc6-suspend.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk9/igt@perf_pmu@rc6-suspend.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#8516])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#8516])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][353] ([i915#8516])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#9917]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][355] ([i915#12910]) +10 other tests fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
    - shard-mtlp:         NOTRUN -> [FAIL][356] ([i915#12910]) +10 other tests fail
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#9917])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][358] +8 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#4818])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#4818])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#4818])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [INCOMPLETE][362] ([i915#13356]) -> [PASS][363] +1 other test pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_eio@in-flight-suspend:
    - shard-rkl:          [INCOMPLETE][364] ([i915#13390]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@gem_eio@in-flight-suspend.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][366] ([i915#13356]) -> [PASS][367] +1 other test pass
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [TIMEOUT][368] ([i915#5493]) -> [PASS][369] +1 other test pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [ABORT][370] ([i915#14809]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          [TIMEOUT][372] ([i915#12917] / [i915#12964]) -> [PASS][373] +2 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-rkl:          [TIMEOUT][374] ([i915#12964]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@i915_module_load@load:
    - shard-dg1:          ([PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [SKIP][396], [PASS][397], [PASS][398], [PASS][399]) ([i915#14785]) -> ([PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-18/igt@i915_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-17/igt@i915_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-17/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-13/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-18/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-13/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-17/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-18/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-13/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i915_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@i915_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@i915_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i915_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@i915_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@i915_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i915_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@i915_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@i915_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@i915_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@i915_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@i915_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i915_module_load@load.html
    - shard-rkl:          ([PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [SKIP][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448]) ([i915#14785]) -> ([PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [PASS][463], [PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473])
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@i915_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@i915_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@i915_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@i915_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i915_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i915_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@i915_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@i915_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i915_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@i915_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@i915_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i915_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@i915_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i915_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@i915_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@i915_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i915_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i915_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@i915_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i915_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@i915_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html

  * igt@i915_selftest@live@workarounds:
    - shard-dg2:          [DMESG-FAIL][474] ([i915#12061]) -> [PASS][475] +1 other test pass
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-3/igt@i915_selftest@live@workarounds.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@i915_selftest@live@workarounds.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [ABORT][476] ([i915#15132]) -> [PASS][477] +1 other test pass
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][478] ([i915#12796] / [i915#14694]) -> [PASS][479]
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_color@gamma:
    - shard-rkl:          [SKIP][480] ([i915#12655] / [i915#14544]) -> [PASS][481]
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_color@gamma.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_color@gamma.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-rkl:          [SKIP][482] ([i915#14544]) -> [PASS][483] +56 other tests pass
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-rkl:          [FAIL][484] ([i915#13566]) -> [PASS][485] +2 other tests pass
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-tglu:         [FAIL][486] ([i915#13566]) -> [PASS][487] +5 other tests pass
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-tglu:         [FAIL][488] ([i915#2346]) -> [PASS][489]
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-tglu-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-rkl:          [SKIP][490] ([i915#14544] / [i915#14561]) -> [PASS][491]
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-snb:          [TIMEOUT][492] ([i915#14033] / [i915#14350]) -> [PASS][493]
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [TIMEOUT][494] ([i915#14033]) -> [PASS][495] +2 other tests pass
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [DMESG-WARN][496] ([i915#12917] / [i915#12964]) -> [PASS][497] +1 other test pass
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#3637]) -> [PASS][499] +6 other tests pass
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg1:          [DMESG-WARN][500] ([i915#4423]) -> [PASS][501] +1 other test pass
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][502] ([i915#14544] / [i915#3555]) -> [PASS][503] +2 other tests pass
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][505] +8 other tests pass
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-snb:          [SKIP][506] -> [PASS][507]
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-snb5/igt@kms_hdmi_inject@inject-audio.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][509]
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          [SKIP][510] ([i915#12388]) -> [PASS][511]
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - shard-rkl:          [SKIP][512] ([i915#11190] / [i915#14544]) -> [PASS][513] +2 other tests pass
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#8825]) -> [PASS][515]
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-rkl:          [SKIP][516] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][517]
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
    - shard-rkl:          [SKIP][518] ([i915#12247] / [i915#14544]) -> [PASS][519] +4 other tests pass
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-rkl:          [SKIP][520] ([i915#12247] / [i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][521] +1 other test pass
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:
    - shard-rkl:          [SKIP][522] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][523] +6 other tests pass
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@fences:
    - shard-rkl:          [SKIP][524] ([i915#14544] / [i915#1849]) -> [PASS][525]
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_pm_rpm@fences.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_pm_rpm@fences.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][526] ([i915#14419]) -> [PASS][527]
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-rkl:          [SKIP][528] ([i915#11521] / [i915#14544]) -> [PASS][529]
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_properties@crtc-properties-atomic.html

  * igt@perf@polling@0-rcs0:
    - shard-rkl:          [DMESG-WARN][530] ([i915#12964]) -> [PASS][531] +29 other tests pass
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@perf@polling@0-rcs0.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-mtlp:         [FAIL][532] ([i915#11943]) -> [PASS][533] +2 other tests pass
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][534] ([i915#14544] / [i915#8411]) -> [SKIP][535] ([i915#8411])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          [SKIP][536] ([i915#11078] / [i915#14544]) -> [SKIP][537] ([i915#11078])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          [SKIP][538] ([i915#3555] / [i915#9323]) -> [SKIP][539] ([i915#14544] / [i915#3555] / [i915#9323])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#9323]) -> [SKIP][541] ([i915#9323])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_ccs@suspend-resume.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_ccs@suspend-resume.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][542] ([i915#14544] / [i915#8562]) -> [SKIP][543] ([i915#8562])
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_create@create-ext-set-pat.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_create@create-ext-set-pat.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          [SKIP][544] ([i915#14544] / [i915#4525]) -> [SKIP][545] ([i915#4525]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          [SKIP][546] ([i915#6334]) -> [SKIP][547] ([i915#14544] / [i915#6334]) +1 other test skip
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          [SKIP][548] ([i915#14544] / [i915#3281]) -> [SKIP][549] ([i915#3281]) +7 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          [SKIP][550] ([i915#3281]) -> [SKIP][551] ([i915#14544] / [i915#3281]) +7 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-rkl:          [SKIP][552] ([i915#4613]) -> [SKIP][553] ([i915#14544] / [i915#4613]) +2 other tests skip
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-engines.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          [SKIP][554] ([i915#14544] / [i915#4613]) -> [SKIP][555] ([i915#4613]) +4 other tests skip
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          [SKIP][556] ([i915#3282]) -> [SKIP][557] ([i915#14544] / [i915#3282]) +4 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@bench:
    - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#3282]) -> [SKIP][559] ([i915#3282]) +4 other tests skip
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_pread@bench.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_pread@bench.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-rkl:          [SKIP][560] ([i915#4270]) -> [TIMEOUT][561] ([i915#12964])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          [TIMEOUT][562] ([i915#12917] / [i915#12964]) -> [FAIL][563] ([i915#15257])
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-rkl:          [SKIP][564] ([i915#4270]) -> [TIMEOUT][565] ([i915#12917] / [i915#12964])
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_userptr_blits@access-control:
    - shard-rkl:          [SKIP][566] ([i915#14544] / [i915#3297]) -> [SKIP][567] ([i915#3297]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gem_userptr_blits@access-control.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          [SKIP][568] ([i915#3297]) -> [SKIP][569] ([i915#14544] / [i915#3297])
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][570] ([i915#14544] / [i915#2527]) -> [SKIP][571] ([i915#2527]) +4 other tests skip
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          [SKIP][572] ([i915#2527]) -> [SKIP][573] ([i915#14544] / [i915#2527]) +4 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][574] ([i915#8399]) -> [SKIP][575] ([i915#14544] / [i915#8399]) +1 other test skip
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-rkl:          [SKIP][576] -> [SKIP][577] ([i915#14544]) +10 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#4387]) -> [SKIP][579] ([i915#4387])
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          [SKIP][580] ([i915#14544] / [i915#7984]) -> [SKIP][581] ([i915#7984])
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_power@sanity.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_power@sanity.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][582] ([i915#14544]) -> [SKIP][583] ([i915#5286]) +3 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-rkl:          [SKIP][584] ([i915#5286]) -> [SKIP][585] ([i915#14544]) +2 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg1:          [SKIP][586] ([i915#3638]) -> [SKIP][587] ([i915#3638] / [i915#4423])
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][588] ([i915#14544]) -> [SKIP][589] ([i915#3638]) +4 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][590] ([i915#3638]) -> [SKIP][591] ([i915#14544]) +2 other tests skip
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - shard-rkl:          [DMESG-WARN][592] ([i915#12964]) -> [SKIP][593] ([i915#14544]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_busy@extended-modeset-hang-newfb-with-reset.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-rkl:          [SKIP][594] ([i915#14098] / [i915#6095]) -> [SKIP][595] ([i915#14544]) +5 other tests skip
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][596] ([i915#14544]) -> [SKIP][597] ([i915#12313]) +1 other test skip
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][598] ([i915#6095]) -> [SKIP][599] ([i915#14098] / [i915#6095]) +1 other test skip
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][600] ([i915#12805]) -> [SKIP][601] ([i915#14544])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][602] ([i915#14098] / [i915#6095]) -> [SKIP][603] ([i915#6095]) +1 other test skip
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          [SKIP][604] ([i915#14544]) -> [SKIP][605] ([i915#14098] / [i915#6095]) +8 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][606] ([i915#12313]) -> [SKIP][607] ([i915#14544]) +1 other test skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][608] ([i915#14544] / [i915#3742]) -> [SKIP][609] ([i915#3742])
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-dg1:          [SKIP][610] ([i915#11151] / [i915#7828]) -> [SKIP][611] ([i915#11151] / [i915#4423] / [i915#7828])
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-rkl:          [SKIP][612] ([i915#11151] / [i915#7828]) -> [SKIP][613] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_chamelium_frames@vga-frame-dump.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-rkl:          [SKIP][614] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][615] ([i915#11151] / [i915#7828]) +7 other tests skip
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          [FAIL][616] ([i915#7173]) -> [SKIP][617] ([i915#7118] / [i915#9424])
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-11/igt@kms_content_protection@atomic.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          [SKIP][618] ([i915#3116]) -> [SKIP][619] ([i915#14544])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2:          [SKIP][620] ([i915#9424]) -> [FAIL][621] ([i915#7173])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-3/igt@kms_content_protection@lic-type-0.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_content_protection@lic-type-0.html
    - shard-rkl:          [SKIP][622] ([i915#14544]) -> [SKIP][623] ([i915#9424]) +1 other test skip
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_content_protection@lic-type-0.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][624] ([i915#9424]) -> [SKIP][625] ([i915#9433])
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@kms_content_protection@mei-interface.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-rkl:          [SKIP][626] ([i915#3555]) -> [SKIP][627] ([i915#14544]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          [SKIP][628] ([i915#14544]) -> [SKIP][629] ([i915#3555]) +3 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-rkl:          [SKIP][630] ([i915#14544]) -> [SKIP][631] ([i915#13049]) +1 other test skip
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-rkl:          [SKIP][632] ([i915#13049]) -> [SKIP][633] ([i915#14544])
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg1:          [SKIP][634] ([i915#4103] / [i915#4213]) -> [SKIP][635] ([i915#4103] / [i915#4213] / [i915#4423])
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][636] ([i915#11190] / [i915#14544]) -> [SKIP][637] ([i915#4103])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-rkl:          [SKIP][638] ([i915#14544]) -> [SKIP][639] +6 other tests skip
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          [SKIP][640] ([i915#14544]) -> [SKIP][641] ([i915#4103])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          [SKIP][642] ([i915#3555] / [i915#3804]) -> [SKIP][643] ([i915#14544])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-rkl:          [SKIP][644] ([i915#13749]) -> [SKIP][645] ([i915#14544])
   [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html
   [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-rkl:          [SKIP][646] ([i915#13748]) -> [SKIP][647] ([i915#14544])
   [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst.html
   [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][648] ([i915#14544]) -> [SKIP][649] ([i915#13707])
   [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          [SKIP][650] ([i915#14544]) -> [SKIP][651] ([i915#3840])
   [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html
   [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][652] ([i915#14544] / [i915#4854]) -> [SKIP][653] ([i915#4854])
   [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
   [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-dg1:          [SKIP][654] ([i915#9934]) -> [SKIP][655] ([i915#4423] / [i915#9934])
   [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank.html
   [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-rkl:          [SKIP][656] ([i915#14544] / [i915#9934]) -> [SKIP][657] ([i915#9934]) +7 other tests skip
   [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-rkl:          [SKIP][658] ([i915#9934]) -> [SKIP][659] ([i915#14544] / [i915#9934]) +3 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check.html
   [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          [SKIP][660] ([i915#14544] / [i915#3637]) -> [ABORT][661] ([i915#15132])
   [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html
   [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg1:          [SKIP][662] ([i915#2587] / [i915#2672] / [i915#3555] / [i915#4423]) -> [SKIP][663] ([i915#2587] / [i915#2672] / [i915#3555])
   [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          [SKIP][664] ([i915#2587] / [i915#2672] / [i915#4423]) -> [SKIP][665] ([i915#2587] / [i915#2672])
   [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
   [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][666] ([i915#14544] / [i915#3555]) -> [SKIP][667] ([i915#2672] / [i915#3555])
   [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          [SKIP][668] ([i915#2672] / [i915#3555]) -> [SKIP][669] ([i915#14544] / [i915#3555]) +2 other tests skip
   [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-rkl:          [DMESG-WARN][670] ([i915#12964]) -> [SKIP][671] ([i915#14544] / [i915#1849] / [i915#5354])
   [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][672] ([i915#8708]) -> [SKIP][673] ([i915#4423] / [i915#8708])
   [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][674] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][675] ([i915#1825]) +26 other tests skip
   [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          [SKIP][676] ([i915#4423] / [i915#8708]) -> [SKIP][677] ([i915#8708])
   [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][678] ([i915#14544]) -> [SKIP][679] ([i915#15102]) +3 other tests skip
   [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][680] ([i915#15102] / [i915#3023]) -> [SKIP][681] ([i915#14544] / [i915#1849] / [i915#5354]) +18 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          [SKIP][682] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][683] +1 other test skip
   [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html
   [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         [INCOMPLETE][684] -> [SKIP][685]
   [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][686] ([i915#15102] / [i915#3458]) -> [SKIP][687] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          [SKIP][688] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][689] ([i915#15102] / [i915#3023]) +20 other tests skip
   [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][690] ([i915#15102]) -> [SKIP][691] ([i915#14544]) +3 other tests skip
   [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
   [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          [SKIP][692] ([i915#1825]) -> [SKIP][693] ([i915#14544] / [i915#1849] / [i915#5354]) +22 other tests skip
   [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][694] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][695] ([i915#15102] / [i915#3458]) +1 other test skip
   [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2:          [SKIP][696] ([i915#12713]) -> [SKIP][697] ([i915#13331])
   [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html
   [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          [SKIP][698] ([i915#14544]) -> [SKIP][699] ([i915#3555] / [i915#8228]) +1 other test skip
   [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_hdr@static-toggle.html
   [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-rkl:          [SKIP][700] ([i915#15283]) -> [SKIP][701] ([i915#14544] / [i915#15283])
   [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_joiner@basic-max-non-joiner.html
   [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          [SKIP][702] ([i915#12339]) -> [SKIP][703] ([i915#12339] / [i915#14544])
   [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html
   [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][704] ([i915#4070] / [i915#4816]) -> [SKIP][705] ([i915#1839] / [i915#4816])
   [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-rkl:          [SKIP][706] ([i915#14544]) -> [SKIP][707] ([i915#14712])
   [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          [SKIP][708] ([i915#14544]) -> [SKIP][709] ([i915#14259])
   [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
   [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][710] ([i915#12247]) -> [SKIP][711] ([i915#12247] / [i915#14544]) +1 other test skip
   [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][712] ([i915#12247]) -> [SKIP][713] ([i915#12247] / [i915#14544] / [i915#8152]) +3 other tests skip
   [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html
   [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          [SKIP][714] ([i915#12247] / [i915#14544]) -> [SKIP][715] ([i915#12247])
   [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
    - shard-rkl:          [SKIP][716] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][717] ([i915#12247]) +1 other test skip
   [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
   [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-rkl:          [SKIP][718] ([i915#5354]) -> [SKIP][719] ([i915#14544] / [i915#5354])
   [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html
   [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          [SKIP][720] ([i915#8430]) -> [SKIP][721] ([i915#14544] / [i915#8430])
   [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html
   [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [SKIP][722] ([i915#15073]) -> [SKIP][723] ([i915#14544] / [i915#15073]) +1 other test skip
   [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html
   [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][724] ([i915#14544] / [i915#15073]) -> [SKIP][725] ([i915#15073])
   [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_prime@d3hot:
    - shard-rkl:          [SKIP][726] ([i915#14544] / [i915#6524]) -> [SKIP][727] ([i915#6524]) +1 other test skip
   [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_prime@d3hot.html
   [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-rkl:          [SKIP][728] ([i915#11520]) -> [SKIP][729] ([i915#11520] / [i915#14544]) +6 other tests skip
   [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          [SKIP][730] ([i915#11520] / [i915#14544]) -> [SKIP][731] ([i915#11520]) +8 other tests skip
   [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][732] ([i915#14544] / [i915#9683]) -> [SKIP][733] ([i915#9683])
   [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
   [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          [SKIP][734] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][735] ([i915#1072] / [i915#9732]) +17 other tests skip
   [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html
   [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-cursor-plane-move:
    - shard-dg1:          [SKIP][736] ([i915#1072] / [i915#4423] / [i915#9732]) -> [SKIP][737] ([i915#1072] / [i915#9732]) +1 other test skip
   [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@kms_psr@psr-cursor-plane-move.html
   [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          [SKIP][738] ([i915#1072] / [i915#9732]) -> [SKIP][739] ([i915#1072] / [i915#14544] / [i915#9732]) +13 other tests skip
   [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_psr@psr2-sprite-mmap-cpu.html
   [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-rkl:          [SKIP][740] ([i915#5289]) -> [SKIP][741] ([i915#14544])
   [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][742] ([i915#14544]) -> [DMESG-WARN][743] ([i915#12964])
   [742]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [743]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          [SKIP][744] ([i915#14544]) -> [SKIP][745] ([i915#5289])
   [744]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [745]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          [SKIP][746] ([i915#3555]) -> [SKIP][747] ([i915#14544] / [i915#3555])
   [746]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [747]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-rkl:          [SKIP][748] ([i915#15232]) -> [SKIP][749] ([i915#14544])
   [748]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@kms_sharpness_filter@filter-suspend.html
   [749]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-rkl:          [SKIP][750] ([i915#14544]) -> [SKIP][751] ([i915#15232]) +1 other test skip
   [750]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [751]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          [SKIP][752] ([i915#14544]) -> [SKIP][753] ([i915#8623])
   [752]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [753]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          [SKIP][754] ([i915#14544]) -> [SKIP][755] ([i915#15243] / [i915#3555]) +1 other test skip
   [754]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_vrr@flip-basic.html
   [755]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          [SKIP][756] ([i915#9906]) -> [SKIP][757] ([i915#14544])
   [756]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@kms_vrr@max-min.html
   [757]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          [SKIP][758] ([i915#14544]) -> [SKIP][759] ([i915#9906])
   [758]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
   [759]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          [SKIP][760] ([i915#14544] / [i915#2435]) -> [SKIP][761] ([i915#2435])
   [760]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html
   [761]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          [SKIP][762] ([i915#2433]) -> [SKIP][763] ([i915#14544] / [i915#2433])
   [762]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html
   [763]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][764] ([i915#8516]) -> [SKIP][765] ([i915#14544] / [i915#8516])
   [764]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html
   [765]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-rkl:          [SKIP][766] ([i915#14544] / [i915#3708]) -> [SKIP][767] ([i915#3708])
   [766]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html
   [767]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          [SKIP][768] ([i915#3708]) -> [SKIP][769] ([i915#14544] / [i915#3708])
   [768]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@prime_vgem@fence-write-hang.html
   [769]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-rkl:          [SKIP][770] ([i915#14544] / [i915#9917]) -> [SKIP][771] ([i915#9917])
   [770]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html
   [771]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-rkl:          [SKIP][772] ([i915#9917]) -> [SKIP][773] ([i915#14544] / [i915#9917]) +1 other test skip
   [772]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [773]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
  [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11943]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
  [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13328]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13328
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
  [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13705]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13705
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
  [i915#13821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821
  [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
  [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14470
  [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
  [i915#14561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14561
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15178
  [i915#15232]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15257
  [i915#15283]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15283
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
  [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
  [i915#2435]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4818]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4818
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4873
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
  [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9738]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9738
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8623 -> IGTPW_14050

  CI-20190529: 20190529
  CI_DRM_17544: 9d61bbd3042d1976dc5f67a30e0aa6c010cbc98f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14050: 14050
  IGT_8623: 8623

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/index.html

--===============3444724907808751449==
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
<tr><td><b>Series:</b></td><td>Add writeback changes for intel-supported fo=
rmats (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/156913/">https://patchwork.freedesktop.org/series/156913/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14050/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14050/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8623_full -&gt; IGTPW_14050_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_14050_full need to be verified<b=
r />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14050_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/index=
.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1405=
0_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitio=
ns.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_legacy@cursor-vs-fl=
ip-atomic-transitions.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8623_full and IGTPW_14050_ful=
l:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@i915_pm_rps@bad-hsync-start:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@create-ext-placement-all:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@ctm-signed:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@cursor-offscreen-128x42:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engines-basic:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@fault-concurrent-x:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@filter-scaler-upscale:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@flip-vs-panning-interruptible:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@getfb-handle-protection:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@i915-ref-count:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@single-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@spin-all-new:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@timeline-wait:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14050_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@fbdev@nul=
lptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2582">i915#2582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gem_busy@semaphore.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">=
i915#3936</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_busy@semaphore.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936"=
>i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@gem_caching@read-writes.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4873">i915#4873</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-snb4/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> +35 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_ccs@block-copy-compressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9323">i915#9323</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_ccs@block-copy-compressed.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@gem_ccs@suspend-resume.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-6/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-=
lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14050/shard-dg2-4/igt@gem_ccs@suspend-resume@tile4-compress=
ed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_close_race@multigpu-basic-pro=
cess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gem_create@create-ext-cpu-access=
-sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-ha=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-ho=
stile.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/280">i915#280</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_ctx_sseu@mmap-args.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
80">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-mtlp-5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-mtlp-3/ig=
t@gem_eio@unwedge-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15178">i915#15178</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-pair:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@gem_exec_balancer@hog.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4036">i915#4036</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gem_exec_balancer@parallel-conte=
xts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_exec_balancer@parallel-orderi=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@gem_exec_fence@submit.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/48=
12">i915#4812</a>) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_exec_fence@submit.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/481=
2">i915#4812</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_exec_flush@basic-uc-pro-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@gem_exec_flush@basic-wb-rw-defau=
lt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3539">i915#3539</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@gem_exec_reloc@basic-cpu-noreloc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_exec_reloc@basic-wc-read-nor=
eloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt-noreloc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_exec_reloc@basic-write-gtt-no=
reloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_exec_reloc@basic-write-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3281">i915#3281</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/i=
gt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +2 other =
tests incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@gem_lmem_swapping@parallel-multi=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk6/igt@gem_lmem_swapping@random.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5493">i915#5493</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@gem_mmap@big-bo.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i9=
15#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@gem_mmap@pf-nonblock.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/408=
3">i915#4083</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@gem_mmap_gtt@basic-small-copy.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_mmap_gtt@cpuset-medium-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4077">i915#4077</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_mmap_gtt@zero-extend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_mmap_offset@clear.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12964">i915#12964</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_pread@exhaustion.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-self:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pwrite@basic-self.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@gem_pwrite@basic-self.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@gem_pxp@create-protected-buffer.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@gem_pxp@create-valid-protected-c=
ontext.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-buffer.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12964">i915#12964</a>) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@gem_render_copy@yf-tiled-ccs-to-=
yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox=
-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/8428">i915#8428</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@gem_softpin@evict-snoop.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
885">i915#4885</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
079">i915#4079</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-8/igt@gem_tiled_pread_pwrite.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/40=
79">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_userptr_blits@coherency-unsyn=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4880">i915#4880</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@gem_userptr_blits@map-fixed-inva=
lidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-8/igt@gem_userptr_blits@unsync-unmap-a=
fter-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3297">i915#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@gem_workarounds@suspend-resume-con=
text.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gen7_exec_parse@chained-batch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@gen9_exec_parse@bb-large.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@gen9_exec_parse@bb-start-far.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2856">i915#2856</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_drm_fdinfo@all-busy-idle-ch=
eck-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_drm_fdinfo@virtual-busy-idl=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@i915_drm_fdinfo@virtual-busy-idl=
e-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-11/igt@i915_module_load@reload-no-display.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/sha=
rd-dg2-7/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#1=
3029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14545">i915#14545</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-15/igt@i915_module_load@reload-no-display.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/sha=
rd-dg1-19/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#=
13029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14545">i915#14545</a>)</li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb4/igt@i915_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard=
-snb4/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545">i915#145=
45</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@i915_pm_freq_api@freq-reset-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shar=
d-rkl-6/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a=
>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@i915_pm_rc6_residency@rc6-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14498">i915#14498</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@i915_pm_rpm@gem-pread.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i=
915_pm_rpm@gem-pread.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13328">i915#13328</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk10/igt@i915_pm_rpm@system-suspend-execbu=
f.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@i915_pm_rps@basic-api.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11=
681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb4/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb1/igt@i915_pm=
_rps@reset.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13821">i915#13821</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-mtlp-8/igt@i915_selftest@live@workarounds.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-m=
tlp-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a=
>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4817">i915#4817</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7443">i915#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_addfb_basic@addfb25-x-tiled-=
mismatch-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_addfb_basic@invalid-smem-bo-o=
n-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/12454">i915#12454</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_atomic_transition@plane-all-=
modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915=
#3555</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk6/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transitio=
n@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_atomic_transition@plane-all=
-modeset-transition@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/5286">i915#5286</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_big_fb@4-tiled-16bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_big_fb@4-tiled-32bpp-rotate-=
180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@kms_big_fb@4-tiled-addfb-size-of=
fset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_big_fb@linear-32bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_big_fb@x-tiled-16bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard=
-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
 +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> +8 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride=
-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/4538">i915#4538</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-ov=
erflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_big_fb@yf-tiled-addfb-size-o=
verflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6187">i915#6187</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_busy@basic.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190">i91=
5#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-a-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +157 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-c=
cs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled=
-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12313">i915#12313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +9 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_ccs@crc-primary-basic-yf-til=
ed-ccs@pipe-a-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +121 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_ccs@crc-primary-rotation-180-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">=
i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_ccs@crc-primary-suspend-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) =
+42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12796">i915#12796</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-til=
ed-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +16 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-yf-t=
iled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +47 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk10/igt@kms_ccs@missing-ccs-buffer-4-tile=
d-mtl-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_cdclk@mode-transition.html">SK=
IP</a> +231 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hd=
mi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13783">i915#13783</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_chamelium_audio@hdmi-audio.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_chamelium_hpd@hdmi-hpd-for-=
each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_color@ctm-negative.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@=
kms_color@ctm-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_color@deep-color.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-8/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9424">i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_content_protection@lic-type-1=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_content_protection@srm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/7116">i915#7116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_content_protection@uevent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi=
-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a=
-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/13566">i915#13566</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-64=
x21.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x=
21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12358">i915#12358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14152">i915#14152</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdmi-a=
-2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-top-edge@pipe-b-hdm=
i-a-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flip=
a-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitio=
ns.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-rkl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_cursor_legacy@short-busy-fl=
ip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +2 other tests skip</l=
i>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard=
-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@kms_dp_aux_dev.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257">i91=
5#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_dp_link_training@uhbr-sst.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_dp_linktrain_fallback@dp-fall=
back.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_draw_crc@draw-method-mmap-wc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/3840">i915#3840</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_feature_discovery@display-1x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/9738">i915#9738</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_flip@2x-flip-vs-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-=
interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_flip@2x-flip-vs-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip@2x-plain-flip-interrupti=
ble.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@kms_flip@2x-plain-flip-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_flip@flip-vs-fences.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
381">i915#8381</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8381">i915#8381</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/s=
hard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314">i=
915#12314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12745">i915#12745</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4839">i915#4839</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a=
1.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-=
6/igt@kms_flip@plain-flip-ts-check.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip@wf_vblank-ts-check.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8=
813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i91=
5#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8813">i915#8813</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-xt=
ile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
legen12rcccs-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_flip_scaled_crc@flip=
-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1=
 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672"=
>i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rk=
l-6/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1=
849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/5354">i915#5354</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-in=
dfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-1p-=
offscreen-pri-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +10 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other t=
ests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i91=
5#3458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) =
+9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +25 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-=
offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscreen-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +8 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +24 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-sus=
pend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@=
kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-vdisplay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_invalid_mode@zero-vdisplay.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/8826">i915#8826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10656">i915#10656</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10656">i915#10656</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10656">i915#10656</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/10656">i915#10656</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10656">i915#10656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-7/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/15283">i915#15283</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-7/igt@kms_joiner@basic-max-non-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15283">i915#15283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_joiner@invalid-modeset-force=
-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/10656">i915#10656</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12388">i915#12388</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_joiner@invalid-modeset-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/12339">i915#12339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@kms_joiner@switch-modeset-ultra-j=
oiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/13522">i915#13522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_multipipe_modeset@basic-max-=
pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@kms_panel_fitting@atomic-fastset=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_pipe_b_c_ivb@from-pipe-c-to-=
b-with-3-lanes.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_pipe_stress@stress-xrgb8888-=
ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/13705">i915#13705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-7/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14050/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_plane_alpha_blend@alpha-transp=
arent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10647">i915#10647</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +3 other tests fail</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@kms_plane_alpha_blend@constant-alpha-min.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1405=
0/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/7294">i915#7294</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_plane_lowres@tiling-x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/11614">i915#11614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3582">i915#3582</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_plane_lowres@tiling-x@pipe-a=
-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/10226">i915#10226</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/11614">i915#11614</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3582">i915#3582</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14259">i915#14259</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_plane_scaling@plane-downscal=
e-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
c:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#12247</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/=
shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6953">i915#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20@pipe-b.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_pm_backlight@brightness-with=
-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/12343">i915#12343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_pm_dc@dc3co-vpb-simulation.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2=
/igt@kms_pm_dc@dc5-dpms-negative.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +50 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-d=
g2-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-10/igt@kms_pm_rpm@dpms-non-lpsp.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
050/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6524">i915#6524</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_prime@basic-modeset-hybrid.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_properties@plane-properties-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11521">i915#11521</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk10/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-snb4/igt@kms_psr2_sf@fbc-psr2-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-7/igt@kms_psr2_sf@fbc-psr2-primary-pla=
ne-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_psr2_sf@pr-plane-move-sf-dmg-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/11520">i915#11520</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_psr2_sf@psr2-plane-move-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_psr@fbc-pr-cursor-mmap-cpu.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-8/igt@kms_psr@fbc-pr-dpms.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688=
">i915#9688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr@fbc-pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
72">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9732">i915#9732</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_psr@psr-primary-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr@psr2-cursor-mmap-cpu.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-6/igt@kms_psr@psr2-cursor-plane-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_psr@psr2-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/107=
2">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_psr_stress_test@flip-primary=
-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-7/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9685">i915#9685</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_rotation_crc@bad-pixel-forma=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@kms_rotation_crc@exhaust-fences.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/4884">i915#4884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/12755">i915#12755</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_scaling_modes@scaling-mode-no=
ne.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@kms_scaling_modes@scaling-mode-n=
one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-10/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-2/igt@kms_setmode@invalid-clone-exclus=
ive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8809">i915#8809</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/8823">i915#8823</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_sharpness_filter@filter-scal=
er-upscale.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15232">i915#15232</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@kms_sharpness_filter@filter-susp=
end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_sharpness_filter@invalid-fil=
ter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15232">i915#15232</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk5/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/355=
5">i915#3555</a>) +7 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@kms_vrr@flip-suspend.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/152=
43">i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_vrr@lobf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#=
11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-5/igt@kms_vrr@negative-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2437">i915#2437</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-1/igt@kms_writeback@writeback-invalid-=
parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2437">i915#2437</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_writeback@writeback-invalid-=
parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-9/igt@kms_writeback@writeback-pixel-fo=
rmats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/2437">i915#2437</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9412">i915#9412</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-glk3/igt@kms_writeback@writeback-pixel-form=
ats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-tglu-3/igt@perf_pmu@busy-accuracy-98.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-3=
/igt@perf_pmu@busy-accuracy-98.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@perf_pmu@busy-idle-check-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-=
6/igt@perf_pmu@busy-idle-check-all.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +3 =
other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@interrupts-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@perf_pmu@interrupts-sync.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/ig=
t@perf_pmu@interrupts-sync.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14470">i915#14470</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@perf_pmu@rc6-all-gts.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/851=
6">i915#8516</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-glk5/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk9/igt@per=
f_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/8516">i915#8516</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-6/igt@sriov_basic@bind-unbind-vf.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9917">i915#9917</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@sriov_basic@bind-unbind-vf@vf-4.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/12910">i915#12910</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-5/igt@sriov_basic@enable-vfs-autoprobe=
-on@numvfs-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12910">i915#12910</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@tools_test@sysfs_l3_parity.html">=
SKIP</a> +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-mtlp-3/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg2-11/igt@tools_test@sysfs_l3_parity.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4818">i915#4818</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-6/igt@gem_ctx_isolation@preservation-s3.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-3/igt@gem_eio@in-flight-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390">i9=
15#13390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-7/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1335=
6">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493"=
>i915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-dg2-4/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/148=
09">i915#14809</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14050/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-encrypted-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@gem_pxp@protected-encrypted-src-copy-not-readible=
.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pxp@prote=
cted-encrypted-src-copy-not-readible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@gem_pxp@regular-baseline-src-copy-readible.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-re=
adible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg1:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8623/shard-dg1-18/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-17/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-d=
g1-19/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-14/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/=
shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
T_8623/shard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8623/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-17/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8623/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-18/=
igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-=
dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-16/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623=
/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-12/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GT_8623/shard-dg1-18/igt@i915_module_load@load.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-15/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8623/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-dg1-19/igt@i9=
15_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/s=
hard-dg1-14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-dg1-12/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-dg1-12/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard=
-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14050/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/igt@i915_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14050/shard-dg1-19/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-=
14/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-15/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
50/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-dg1-13/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-16/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-dg1-18/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/sh=
ard-dg1-15/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@i915_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-dg1-17/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@i=
915_module_load@load.html">PASS</a>)</li>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8623/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8623/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl=
-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shar=
d-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-3/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623=
/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-8/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8623/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-7/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-4/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8623/shard-rkl-5/igt@i915_module_load@load.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-2/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl-6/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8623/shard-rkl-6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8623/shard-rkl=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8623/shard-rkl-5/igt@i915_module_load@load.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14785">i915#14785</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-=
4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050=
/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-r=
kl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
050/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-=
rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4050/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard=
-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14050/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-3/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1206=
1">i915#12061</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-dg2-7/igt@i915_selftest@live@workarounds.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html">A=
BORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15132">i915#15132</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resu=
me.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-glk3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdm=
i-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12796">i915#12796</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-glk1/igt@kms_cc=
s@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_color@gamma.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-8/igt@kms_color@gamma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x256.html=
">PASS</a> +56 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566"=
>i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</=
a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
566">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-128x42.html"=
>PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-tglu-10/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transit=
ions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-tglu-3/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14561">i915#14561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14050/shard-rkl-8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14033">i915#14033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14350">i915#14350</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb7/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb4/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-=
hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14033">i915#14033</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb7/igt@kms_flip@2x-flip-vs-sus=
pend-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@kms_flip@absolute-wf_vblank-interruptible.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_flip@absolute-=
wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_flip@flip-vs-panning-interruptible.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_flip@flip-vs-panning-inte=
rruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-19/igt@kms_flip@flip-vs-suspend-interruptible.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4423">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14050/shard-dg1-12/igt@kms_flip@flip-vs-suspend-interruptibl=
e.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yti=
le-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">PASS</a> +2 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidr=
aw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-3/igt@km=
s_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> +8 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-snb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-snb1/=
igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8826">i915#8826</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_invalid_mode@zero-cloc=
k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-4/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388">=
i915#12388</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-dg2-10/igt@kms_joiner@basic-force-big-joiner.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_pipe_crc_bas=
ic@nonblocking-crc-frame-sequence.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_plane@plane-panning-bottom-=
right.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clam=
ping-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/sh=
ard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-f=
ormats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_plane_sca=
ling@planes-downscale-factor-0-5@pipe-a.html">PASS</a> +4 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i91=
5#8152</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fac=
tor-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-b:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-=
factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050=
/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
75@pipe-b.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@fences:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_pm_rpm@fences.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i=
915#1849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-8/igt@kms_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-7/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1441=
9">i915#14419</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-dg2-11/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_properties@crtc-properties-atomic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/115=
21">i915#11521</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_properties@crtc-properti=
es-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@perf@polling@0-rcs0.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#129=
64</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
50/shard-rkl-8/igt@perf@polling@0-rcs0.html">PASS</a> +29 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
1943">i915#11943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.ht=
ml">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@api_intel_bb@object-reloc-purg=
e-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/110=
78">i915#11078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@device_reset@unbind-cold-res=
et-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9323">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/93=
23">i915#9323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-rkl-8/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#932=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8562">i915#8562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14050/shard-rkl-5/igt@gem_create@create-ext-set-pat.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@gem_exec_capture@capture-invisible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">=
i915#6334</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14050/shard-rkl-6/igt@gem_exec_capture@capture-invisible.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@gem_exec_reloc@basic-gtt-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281"=
>i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3281">i915#3281</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-engines.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-engines.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_lmem_swapping@parallel-=
random-verify.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14050/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-re=
ads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@bench:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_pread@bench.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i91=
5#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-7/igt@gem_pread@bench.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
70">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-rkl-6/igt@gem_pxp@create-valid-protected-context.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@gem_pxp@hw-rejects-pxp-context.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917">=
i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/15257">i915#15257</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/42=
70">i915#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-rkl-6/igt@gem_pxp@verify-pxp-stale-buf-execution.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/12917">i915#12917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gem_userptr_blits@access-control.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14050/shard-rkl-7/igt@gem_userptr_blits@access-control.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap-after-close.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-clos=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14050/shard-rkl-3/igt@gen9_exec_parse@allowed-single.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#25=
27</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
50/shard-rkl-6/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527=
">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#=
8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4050/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SK=
IP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1405=
0/shard-rkl-6/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/4387">i915#4387</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-rkl-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">=
i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286"=
>i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-14/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i=
915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-dg1-17/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i9=
15#3638</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-rkl-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/36=
38">i915#3638</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">=
i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14050/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_busy@extended-modeset-hang-newfb-with-reset.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_busy@extended-modeset-ha=
ng-newfb-with-reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@bad-pixel-for=
mat-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-c=
cs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_ccs@crc-prim=
ary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#140=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6095">i915#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/12805">i915#12805</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bm=
g-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pi=
pe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_c=
cs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i91=
5#6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/6095">i915#6095</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i9=
15#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-18/igt@kms_chamelium_edid@hdmi-edid-change-during-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_chamelium_e=
did@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151=
">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_chamelium_frames@vga-frame-d=
ump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#111=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/7828">i915#7828</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-11/igt@kms_content_protection@atomic.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915=
#7173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14050/shard-dg2-3/igt@kms_content_protection@atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116=
">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-3/igt@kms_content_protection@lic-type-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i=
915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-dg2-11/igt@kms_content_protection@lic-type-0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i=
915#7173</a>)</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-rkl-8/igt@kms_content_protection@lic-type-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">=
i915#9424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-16/igt@kms_content_protection@mei-interface.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/942=
4">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-dg1-13/igt@kms_content_protection@mei-interface.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9433">i915#9433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14050/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-19/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-=
atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/4213">i915#4213</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-17/igt@kms_cursor_le=
gacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#=
4213</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-l=
egacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11190">i915#11190</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_cursor_=
legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-legac=
y.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-t=
oggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3804">i915#3804</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">=
i915#13749</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14050/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748">i915=
#13748</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-6/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
050/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4854">i915#4854</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_feature_discovery@chamelium.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-13/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-dg1-12/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_flip@2x-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-7/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i91=
5#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3637">i915#3637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-4/igt@kms_flip@flip-vs-suspend.html">ABORT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i=
915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i9=
15#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14050/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytil=
eccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yt=
ileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423=
">i915#4423</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-=
ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672">i915#2672=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@km=
s_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672=
">i915#2672</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
ledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2672">i915#2672</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@=
kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrf=
b-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbu=
ffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-ind=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_frontbuffer_t=
racking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708"=
>i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-=
rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/1825">i915#1825</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-14/igt@kms_=
frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i=
915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_frontbuffe=
r_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#1=
5102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-gtt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +18 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrac=
k-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-=
7/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKI=
P</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-=
indfb-fullscreen.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-tglu-2/igt@kms_frontbuffer_tracking@=
fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprim=
ary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-4/igt@kms_frontbuffer=
_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15=
102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mm=
ap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/1849">i915#1849</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt=
@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915=
#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/3023">i915#3023</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-ind=
fb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_=
tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_frontbuffer_tracking@p=
sr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849">i915#1849</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354"=
>i915#5354</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-dg2-1/igt@km=
s_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458=
">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg2-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#1=
2713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4050/shard-dg2-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#133=
31</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/s=
hard-rkl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15283">i9=
15#15283</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/15283">i915#15283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915=
#12339</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339">i915#12=
339</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4816">i915#4816</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_multipipe_modeset@b=
asic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/1839">i915#1839</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14050/shard-rkl-8/igt@kms_pipe_stress@stress-xrgb8888-yftiled.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4050/shard-rkl-8/igt@kms_plane_multiple@tiling-4.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259">i915#14259<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scalin=
g@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with=
-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/12247">i915#12247</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_plane_scalin=
g@plane-downscale-factor-0-5-with-rotation@pipe-b.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/8152">i915#8152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotati=
on@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_pla=
ne_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247">i915#122=
47</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotati=
on@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12247">i915#12247</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152">i915#8152</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl=
-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
2247">i915#12247</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i=
915#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14050/shard-rkl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8=
430</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
050/shard-rkl-6/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/84=
30">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#150=
73</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
50/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i=
915#15073</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/15073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14050/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-str=
ess-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i91=
5#6524</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14050/shard-rkl-8/igt@kms_prime@d3hot.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dm=
g-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overl=
ay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-2/igt@kms_psr2_sf@pr-ove=
rlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9683">i915#9683</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">=
i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_psr@fbc-psr2-primary-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-dg1-12/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915=
#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_14050/shard-dg1-13/igt@kms_psr@psr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1=
072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-6/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072=
">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5289">i915#5289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14050/shard-rkl-6/igt@kms_rotation_crc@primary-4-tiled-refl=
ect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-re=
flect-x-270.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12964">i915#12964</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14050/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14050/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15232=
">i915#15232</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-rkl-6/igt@kms_sharpness_filter@filter-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_sharpness_filter@invalid-filter-with-plane.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14050/shard-rkl-8/igt@kms_sharpness_filter@invalid-filter=
-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15232">i915#15232</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14050/shard-rkl-7/igt@kms_tiled_display@basic-test-p=
attern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shar=
d-rkl-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shard-rkl=
-6/igt@kms_vrr@max-min.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14050/shard-rkl-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9=
906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@perf@per-context-mode-unprivileged.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14050/shard-rkl-8/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2435">i915#2435</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@perf@unprivileged-single-ctx-counters.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/243=
3">i915#2433</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14050/shard-rkl-6/igt@perf@unprivileged-single-ctx-counters.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-2/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14050/shar=
d-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3708">i915#3708</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">=
i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-8/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#37=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_140=
50/shard-rkl-6/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708=
">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-6/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9917">i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14050/shard-rkl-5/igt@sriov_basic@bind-unbind-vf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">=
i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8623/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917=
">i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14050/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9917">i915#9917</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8623 -&gt; IGTPW_14050</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17544: 9d61bbd3042d1976dc5f67a30e0aa6c010cbc98f @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14050: 14050<br />
  IGT_8623: 8623</p>

</body>
</html>

--===============3444724907808751449==--
