Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53F4EDF025
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 04:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F78810E6D4;
	Thu, 12 Feb 2026 04:25:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF3810E152;
 Thu, 12 Feb 2026 04:25:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4968059539889114997=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_series_starting_with_=5B?=
 =?utf-8?q?i-g-t=2C1/2=5D_lib/amdgpu=3A_support_FWM_packet_in_user_queue?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yogesh Mohan Marimuthu" <yogesh.mohanmarimuthu@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 12 Feb 2026 04:25:15 -0000
Message-ID: <177087031553.248754.260152430834275599@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
In-Reply-To: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
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

--===============4968059539889114997==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/amdgpu: support FWM packet in user queue
URL   : https://patchwork.freedesktop.org/series/161494/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8751_full -> IGTPW_14540_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_14540_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_14540_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_14540_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@hibernate:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_eio@hibernate.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gem_eio@hibernate.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-rkl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-mtlp:         [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@kms_hdmi_inject@inject-audio.html

  
#### Warnings ####

  * igt@gem_pread@exhaustion:
    - shard-snb:          [WARN][6] ([i915#2658]) -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-snb6/igt@gem_pread@exhaustion.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb6/igt@gem_pread@exhaustion.html

  
Known issues
------------

  Here are the changes found in IGTPW_14540_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_bad_reloc@negative-reloc-bltcopy:
    - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#3281])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@gem_bad_reloc@negative-reloc-bltcopy.html
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#3281])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@gem_bad_reloc@negative-reloc-bltcopy.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#3281]) +8 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][12] -> [INCOMPLETE][13] ([i915#13356])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gem_ccs@suspend-resume.html

  * igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][14] -> [INCOMPLETE][15] ([i915#12392] / [i915#13356])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#7697])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#14544] / [i915#6335])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#6335])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#280])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#4771])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#4771])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.html
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#4771])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-tglu-1:       NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#4525]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu-1:       NOTRUN -> [ABORT][26] ([i915#11713])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#6334]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#3539])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_reloc@basic-wc-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#14544] / [i915#3281]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3281]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_suspend@basic-s0:
    - shard-rkl:          [PASS][32] -> [ABORT][33] ([i915#15131]) +1 other test abort
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@gem_exec_suspend@basic-s0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@gem_exec_suspend@basic-s0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][34] -> [INCOMPLETE][35] ([i915#13356]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4613]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][37] ([i915#4613]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@gem_lmem_swapping@heavy-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#14544] / [i915#4613])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-glk:          NOTRUN -> [SKIP][40] ([i915#4613]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][41] ([i915#4613]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#4083]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@basic-read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4077]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_mmap_gtt@basic-read-write-distinct.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4077]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#4077]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][46] ([i915#4083]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@gem_mmap_wc@write-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4083]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#3282]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-glk:          NOTRUN -> [WARN][49] ([i915#14702] / [i915#2658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk5/igt@gem_pwrite@basic-exhaustion.html
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#14544] / [i915#3282])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#13717] / [i915#14544])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#13398])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#13398])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4270])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4270])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][57] ([i915#3282])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@gem_readwrite@new-obj.html
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#3282])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_readwrite@new-obj.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#5190] / [i915#8428])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#8428])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4079])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#8411]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4079]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][65] ([i915#4079])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@access-control:
    - shard-mtlp:         NOTRUN -> [SKIP][67] ([i915#3297]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#3297]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3297]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3297]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#3297]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#3297] / [i915#4958])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_userptr_blits@sd-probe.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3297] / [i915#4958])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#3297])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][75] +98 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          NOTRUN -> [ABORT][76] ([i915#5566])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#2527] / [i915#2856]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglu-1:       NOTRUN -> [SKIP][78] ([i915#2527] / [i915#2856])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#2856])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#14544] / [i915#2527])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#2527]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@gen9_exec_parse@unaligned-access.html
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#2856])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gen9_exec_parse@unaligned-access.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#2527]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_drm_fdinfo@all-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#14123])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-all.html

  * igt@i915_module_load@fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][85] ([i915#11815] / [i915#15481]) +1 other test abort
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@i915_module_load@fault-injection.html

  * igt@i915_module_load@fault-injection@i915_driver_mmio_probe:
    - shard-dg1:          NOTRUN -> [INCOMPLETE][86] ([i915#15481])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@i915_module_load@fault-injection@i915_driver_mmio_probe.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-tglu:         NOTRUN -> [ABORT][87] ([i915#15342]) +1 other test abort
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#15479]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@i915_module_load@fault-injection@uc_fw_rsa_data_create.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu-1:       NOTRUN -> [SKIP][89] ([i915#8399])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][90] ([i915#13356])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk10/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#11681] / [i915#6621])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#11681] / [i915#6621])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@i915_pm_rps@min-max-config-loaded.html
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#11681] / [i915#6621])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#7984])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_power@sanity.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          NOTRUN -> [INCOMPLETE][95] ([i915#4817])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [PASS][96] -> [ABORT][97] ([i915#15140])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-rkl:          [PASS][98] -> [INCOMPLETE][99] ([i915#4817])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i915_suspend@fence-restore-untiled.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#7707])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][101] -> [FAIL][102] ([i915#14888]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2:          [PASS][103] -> [FAIL][104] ([i915#15285])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][105] ([i915#15285])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][106] ([i915#1769])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][107] -> [FAIL][108] ([i915#5956]) +1 other test fail
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#14544] / [i915#5286])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#5286]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5286]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#5286]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu-1:       NOTRUN -> [SKIP][113] ([i915#5286]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#3638]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][115] +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4538] / [i915#5190]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#3638]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][118] +18 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4538]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6095]) +4 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#10307] / [i915#10434] / [i915#6095])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#6095]) +186 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#6095]) +78 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][124] ([i915#6095]) +29 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#6095]) +40 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][126] ([i915#12313]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#12313]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#12313]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#12313]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#6095]) +24 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][131] ([i915#12805])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][132] ([i915#15582])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#14098] / [i915#6095]) +50 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#12313]) +4 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#10307] / [i915#6095]) +86 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#14098] / [i915#14544] / [i915#6095]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#14544] / [i915#6095]) +10 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][138] ([i915#12313])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3742])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_cdclk@mode-transition.html
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#3742])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-9/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#13781]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#11151] / [i915#7828]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-read.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#11151] / [i915#7828]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#11151] / [i915#7828]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#11151] / [i915#7828]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#11151] / [i915#7828]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html
    - shard-mtlp:         NOTRUN -> [SKIP][147] ([i915#11151] / [i915#7828]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#11151] / [i915#14544] / [i915#7828])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][149] ([i915#7173])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#6944])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#6944] / [i915#9424])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#14544] / [i915#15330])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#15330])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#15330])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#15330] / [i915#3116])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#15330])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#6944])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#6944])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#6944])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#6944])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_content_protection@lic-type-0-hdcp14.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6944])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#6944] / [i915#7118] / [i915#9424])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#3555]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [FAIL][165] ([i915#13566]) +1 other test fail
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-rkl:          [PASS][166] -> [FAIL][167] ([i915#13566])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][168] ([i915#13566])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
    - shard-tglu:         [PASS][169] -> [FAIL][170] ([i915#13566]) +1 other test fail
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#13049])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3555]) +4 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#13049])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#13049])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-tglu:         NOTRUN -> [SKIP][175] ([i915#13049])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu-1:       NOTRUN -> [SKIP][176] ([i915#4103]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#13046] / [i915#5354])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][178] ([i915#9809])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#9067])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4103] / [i915#4213])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#4103])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4103] / [i915#4213])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#4103])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#4213])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#9723])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#9723])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][187] ([i915#13748])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2:          [PASS][188] -> [SKIP][189] ([i915#13707])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#14544] / [i915#3555] / [i915#3840])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#3840] / [i915#9053])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#3840] / [i915#9053])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][193] ([i915#9878])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#2065] / [i915#4854])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1839])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#9337])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3637] / [i915#9934])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#9934])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_flip@2x-dpms-vs-vblank-race.html
    - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#3637] / [i915#9934])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#14544] / [i915#9934]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#9934])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#9934]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg1:          NOTRUN -> [SKIP][203] ([i915#9934]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-race.html
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#3637] / [i915#9934]) +5 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [FAIL][205] ([i915#14600]) +1 other test fail
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [FAIL][206] ([i915#13027]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][207] ([i915#6113]) +1 other test incomplete
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][208] ([i915#15643]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#15643] / [i915#5190])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15643])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#15643]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#15643]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][213] ([i915#15643]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#15643]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8708]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
    - shard-tglu:         NOTRUN -> [SKIP][216] +41 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][217] ([i915#10056])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#15102]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#15102]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#14544] / [i915#15102])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#15102]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#15102]) +6 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#1825]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][224] +20 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#15102] / [i915#3458]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#14544] / [i915#15102] / [i915#3023]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-tglu:         NOTRUN -> [SKIP][227] ([i915#15102]) +14 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#15102] / [i915#3023]) +18 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#8708]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#8708]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][231] ([i915#14544] / [i915#1825]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#1825]) +29 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#5354]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#15102] / [i915#3458]) +7 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#3555] / [i915#8228]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#8228])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8228])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [PASS][238] -> [SKIP][239] ([i915#3555] / [i915#8228]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#15459])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#15458])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#15458]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][243] ([i915#13688])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#15458])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-4tiled:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#14712])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_pipe_stress@stress-xrgb8888-4tiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-dg1:          NOTRUN -> [SKIP][246] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-2:
    - shard-glk10:        NOTRUN -> [SKIP][247] +143 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-a-plane-2.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#15608]) +25 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#15608]) +8 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0.html
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#14544] / [i915#15608])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#15608]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#15608] / [i915#8825]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#14544] / [i915#15608] / [i915#8825]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#15608] / [i915#8825]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#15608] / [i915#15609] / [i915#8825]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#15609] / [i915#8825]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][257] ([i915#15608] / [i915#8825]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#15608] / [i915#8825]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#15609]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#15609]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#15608] / [i915#15609] / [i915#8825])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#15609])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#15609]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#15609] / [i915#8825])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#15609]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#15609] / [i915#8825]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#15609] / [i915#8825]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#15608]) +15 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#15609]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-tglu:         NOTRUN -> [SKIP][270] ([i915#15608] / [i915#15609] / [i915#8825]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3:
    - shard-tglu:         NOTRUN -> [SKIP][271] ([i915#15608]) +37 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#15608] / [i915#15609] / [i915#8825]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#15608]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-3.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][274] ([i915#15609] / [i915#8825]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plane-7.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#13958]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          [PASS][276] -> [SKIP][277] ([i915#6953] / [i915#9423])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#15329]) +4 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#15329]) +4 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#15329]) +7 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#15329]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#15329] / [i915#6953])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#15329]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#5354])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.html
    - shard-tglu:         NOTRUN -> [SKIP][285] ([i915#9812])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-tglu-1:       NOTRUN -> [SKIP][286] ([i915#9812])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#14544] / [i915#9685])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][288] ([i915#9685])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][289] ([i915#9685])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#9340])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#3828])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#8430])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#8430])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg1:          [PASS][294] -> [SKIP][295] ([i915#15073])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][296] -> [SKIP][297] ([i915#15073])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#15073])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-glk:          NOTRUN -> [INCOMPLETE][299] ([i915#10553])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.html
    - shard-dg1:          [PASS][300] -> [DMESG-WARN][301] ([i915#4423]) +1 other test dmesg-warn
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][302] ([i915#11520]) +7 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#11520]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][304] ([i915#11520] / [i915#14544]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-snb:          NOTRUN -> [SKIP][305] ([i915#11520]) +2 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#11520]) +3 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#11520]) +5 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#12316]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-glk10:        NOTRUN -> [SKIP][309] ([i915#11520]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#11520]) +4 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][311] ([i915#11520]) +3 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#1072] / [i915#9732]) +4 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move.html
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#1072] / [i915#9732]) +15 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#9688]) +4 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-plane-move@edp-1.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#9732]) +13 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-tglu-1:       NOTRUN -> [SKIP][316] ([i915#9732]) +6 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][317] +374 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][318] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#1072] / [i915#9732]) +8 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-glk:          NOTRUN -> [INCOMPLETE][320] ([i915#15492])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#5190])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#5289])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#14544] / [i915#5289])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-tglu:         NOTRUN -> [SKIP][324] ([i915#5289]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#5289]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-none:
    - shard-rkl:          NOTRUN -> [SKIP][326] ([i915#3555]) +5 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-none.html

  * igt@kms_setmode@basic:
    - shard-snb:          [PASS][327] -> [FAIL][328] ([i915#15106]) +2 other tests fail
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-snb1/igt@kms_setmode@basic.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [PASS][329] -> [FAIL][330] ([i915#15106]) +2 other tests fail
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#3555])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-dg1:          NOTRUN -> [SKIP][332] ([i915#3555]) +3 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_setmode@invalid-clone-single-crtc.html
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#3555] / [i915#8809])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][334] ([i915#10959])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk3/igt@kms_tiled_display@basic-test-pattern.html
    - shard-rkl:          NOTRUN -> [SKIP][335] ([i915#8623])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu-1:       NOTRUN -> [SKIP][336] ([i915#8623])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-rkl:          [PASS][337] -> [INCOMPLETE][338] ([i915#12276])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][339] ([i915#12276]) +1 other test incomplete
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html
    - shard-rkl:          NOTRUN -> [INCOMPLETE][340] ([i915#12276])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#15243] / [i915#3555]) +2 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flipline:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#3555] / [i915#8808])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_vrr@flipline.html
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#15243] / [i915#3555])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#3555] / [i915#9906])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [PASS][345] -> [FAIL][346] ([i915#4349]) +2 other tests fail
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs1.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-dg2:          [PASS][347] -> [FAIL][348] ([i915#4349]) +1 other test fail
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-7/igt@perf_pmu@busy-idle-check-all.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@busy-idle-check-all@ccs0:
    - shard-mtlp:         [PASS][349] -> [FAIL][350] ([i915#4349]) +4 other tests fail
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@ccs0.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html

  * igt@perf_pmu@event-wait:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#8807])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@perf_pmu@event-wait.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][352] +4 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@perf_pmu@event-wait@rcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][353] +14 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@perf_pmu@event-wait@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#3555] / [i915#8807])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@frequency:
    - shard-dg2:          NOTRUN -> [FAIL][355] ([i915#12549] / [i915#6806]) +1 other test fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@perf_pmu@frequency.html
    - shard-dg1:          NOTRUN -> [FAIL][356] ([i915#12549] / [i915#6806]) +1 other test fail
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@perf_pmu@frequency.html

  * igt@perf_pmu@module-unload:
    - shard-glk:          NOTRUN -> [FAIL][357] ([i915#14433])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk1/igt@perf_pmu@module-unload.html
    - shard-tglu:         NOTRUN -> [FAIL][358] ([i915#14433])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][359] ([i915#8516])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg1:          NOTRUN -> [SKIP][360] ([i915#14121]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#3708])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@prime_vgem@fence-write-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3708])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@prime_vgem@fence-write-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#3708])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@prime_vgem@fence-write-hang.html
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#3708])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#9917])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#9917]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][367] ([i915#9917])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [FAIL][368] ([i915#12910]) +9 other tests fail
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
    - shard-mtlp:         NOTRUN -> [FAIL][369] ([i915#12910]) +9 other tests fail
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3:
    - shard-rkl:          [INCOMPLETE][370] ([i915#13356]) -> [PASS][371] +1 other test pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-dg2:          [TIMEOUT][372] ([i915#3778] / [i915#7016]) -> [PASS][373] +1 other test pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-1/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-dg2:          [FAIL][374] -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [CRASH][376] ([i915#5493]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-rkl:          [SKIP][378] ([i915#4270]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_pxp@create-regular-context-1.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html

  * igt@i915_module_load@load:
    - shard-rkl:          ([PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [SKIP][402]) ([i915#14785]) -> ([PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@i915_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@i915_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@i915_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@i915_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@i915_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@i915_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i915_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i915_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i915_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@i915_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@i915_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@i915_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@i915_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@i915_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@i915_module_load@load.html

  * igt@i915_suspend@debugfs-reader:
    - shard-rkl:          [INCOMPLETE][428] ([i915#4817]) -> [PASS][429] +1 other test pass
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_suspend@debugfs-reader.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [INCOMPLETE][430] ([i915#12761]) -> [PASS][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][432] ([i915#15582]) -> [PASS][433]
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [FAIL][434] ([i915#13566]) -> [PASS][435] +5 other tests pass
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-tglu:         [FAIL][436] ([i915#13566]) -> [PASS][437] +1 other test pass
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-2/igt@kms_cursor_crc@cursor-random-64x21.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2:          [SKIP][438] ([i915#3555]) -> [PASS][439]
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-mtlp:         [SKIP][440] -> [PASS][441]
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][442] ([i915#3555] / [i915#8228]) -> [PASS][443]
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-5/igt@kms_hdr@static-toggle.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-rkl:          [SKIP][444] ([i915#6953]) -> [PASS][445]
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#15073]) -> [PASS][447] +1 other test pass
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg1:          [SKIP][448] ([i915#15073]) -> [PASS][449]
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][450] ([i915#15073]) -> [PASS][451] +1 other test pass
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][452] ([i915#15073]) -> [PASS][453]
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [FAIL][454] ([i915#4349]) -> [PASS][455] +3 other tests pass
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [FAIL][456] ([i915#4349]) -> [PASS][457] +4 other tests pass
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-6/igt@perf_pmu@semaphore-busy@vecs0.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html

  
#### Warnings ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-rkl:          [SKIP][458] ([i915#14544] / [i915#8411]) -> [SKIP][459] ([i915#8411])
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_buddy@drm_buddy:
    - shard-rkl:          [SKIP][460] ([i915#15678]) -> [SKIP][461] ([i915#14544] / [i915#15678])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@drm_buddy@drm_buddy.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@drm_buddy@drm_buddy.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          [SKIP][462] ([i915#8562]) -> [SKIP][463] ([i915#14544] / [i915#8562])
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_create@create-ext-set-pat.html
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][464] ([i915#280]) -> [SKIP][465] ([i915#14544] / [i915#280])
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          [SKIP][466] ([i915#14544] / [i915#4525]) -> [SKIP][467] ([i915#4525]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_exec_balancer@parallel.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-rkl:          [SKIP][468] ([i915#4525]) -> [SKIP][469] ([i915#14544] / [i915#4525]) +1 other test skip
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_reloc@basic-wc-cpu:
    - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#3281]) -> [SKIP][471] ([i915#3281]) +2 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html

  * igt@gem_exec_reloc@basic-write-wc-noreloc:
    - shard-rkl:          [SKIP][472] ([i915#3281]) -> [SKIP][473] ([i915#14544] / [i915#3281]) +4 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#4613] / [i915#7582]) -> [SKIP][475] ([i915#4613] / [i915#7582])
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-rkl:          [SKIP][476] ([i915#14544] / [i915#4613]) -> [SKIP][477] ([i915#4613]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          [SKIP][478] ([i915#4613]) -> [SKIP][479] ([i915#14544] / [i915#4613]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_vme:
    - shard-rkl:          [SKIP][480] ([i915#14544] / [i915#284]) -> [SKIP][481] ([i915#284])
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_media_vme.html
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_media_vme.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-rkl:          [SKIP][482] ([i915#14544] / [i915#3282]) -> [SKIP][483] ([i915#3282]) +1 other test skip
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          [SKIP][484] ([i915#3282]) -> [SKIP][485] ([i915#14544] / [i915#3282]) +1 other test skip
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-rkl:          [SKIP][486] ([i915#13717]) -> [SKIP][487] ([i915#13717] / [i915#14544])
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_tiled_pread_basic@basic:
    - shard-rkl:          [SKIP][488] ([i915#15656]) -> [SKIP][489] ([i915#14544] / [i915#15656])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gem_tiled_pread_basic@basic.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-rkl:          [SKIP][490] ([i915#3297] / [i915#3323]) -> [SKIP][491] ([i915#14544] / [i915#3297] / [i915#3323])
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-rkl:          [SKIP][492] ([i915#14544] / [i915#3297]) -> [SKIP][493] ([i915#3297]) +1 other test skip
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#2527]) -> [SKIP][495] ([i915#2527])
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          [SKIP][496] ([i915#2527]) -> [SKIP][497] ([i915#14544] / [i915#2527]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#8399]) -> [SKIP][499] ([i915#8399])
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_query@hwconfig_table:
    - shard-rkl:          [SKIP][500] ([i915#6245]) -> [SKIP][501] ([i915#14544] / [i915#6245])
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i915_query@hwconfig_table.html
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_query@hwconfig_table.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          [SKIP][502] ([i915#5723]) -> [SKIP][503] ([i915#14544] / [i915#5723])
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          [SKIP][504] ([i915#5286]) -> [SKIP][505] ([i915#14544] / [i915#5286]) +1 other test skip
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          [SKIP][506] ([i915#14544] / [i915#5286]) -> [SKIP][507] ([i915#5286]) +1 other test skip
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-rkl:          [SKIP][508] ([i915#14544] / [i915#3828]) -> [SKIP][509] ([i915#3828])
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-rkl:          [SKIP][510] ([i915#3638]) -> [SKIP][511] ([i915#14544] / [i915#3638])
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][512] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][513] ([i915#14098] / [i915#6095]) +3 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][514] ([i915#14544] / [i915#6095]) -> [SKIP][515] ([i915#6095]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-rkl:          [SKIP][516] ([i915#6095]) -> [SKIP][517] ([i915#14544] / [i915#6095]) +1 other test skip
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
    - shard-rkl:          [SKIP][518] ([i915#14098] / [i915#6095]) -> [SKIP][519] ([i915#14098] / [i915#14544] / [i915#6095]) +4 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][520] ([i915#12313]) -> [SKIP][521] ([i915#12313] / [i915#14544])
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-dg1:          [SKIP][522] ([i915#4423] / [i915#6095]) -> [SKIP][523] ([i915#6095])
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          [SKIP][524] ([i915#3742]) -> [SKIP][525] ([i915#14544] / [i915#3742])
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_cdclk@plane-scaling.html
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          [SKIP][526] -> [SKIP][527] ([i915#14544]) +10 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_chamelium_color@degamma.html
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-rkl:          [SKIP][528] ([i915#11151] / [i915#7828]) -> [SKIP][529] ([i915#11151] / [i915#14544] / [i915#7828]) +3 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          [SKIP][530] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][531] ([i915#11151] / [i915#7828]) +2 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-dg2:          [SKIP][532] ([i915#6944]) -> [FAIL][533] ([i915#7173])
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-3/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          [SKIP][534] ([i915#15330] / [i915#3116]) -> [SKIP][535] ([i915#14544] / [i915#15330] / [i915#3116])
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][537] ([i915#6944] / [i915#7118] / [i915#9424])
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_content_protection@legacy.html
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-rkl:          [SKIP][538] ([i915#6944] / [i915#9424]) -> [SKIP][539] ([i915#14544] / [i915#6944] / [i915#9424])
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_content_protection@lic-type-1.html
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          [SKIP][540] ([i915#6944] / [i915#7118] / [i915#9424]) -> [SKIP][541] ([i915#6944] / [i915#7118] / [i915#7162] / [i915#9424])
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-6/igt@kms_content_protection@type1.html
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-rkl:          [SKIP][542] ([i915#13049]) -> [SKIP][543] ([i915#13049] / [i915#14544]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-rkl:          [SKIP][544] ([i915#3555]) -> [SKIP][545] ([i915#14544] / [i915#3555]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-rkl:          [SKIP][546] ([i915#13049] / [i915#14544]) -> [SKIP][547] ([i915#13049])
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-rkl:          [SKIP][548] ([i915#14544] / [i915#3555]) -> [SKIP][549] ([i915#3555]) +2 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          [SKIP][550] ([i915#14544]) -> [SKIP][551] +6 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          [SKIP][552] ([i915#13691]) -> [SKIP][553] ([i915#13691] / [i915#14544])
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-rkl:          [SKIP][554] ([i915#13707]) -> [SKIP][555] ([i915#13707] / [i915#14544])
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          [SKIP][556] ([i915#14544] / [i915#3840]) -> [SKIP][557] ([i915#3840])
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-rkl:          [SKIP][558] ([i915#3555] / [i915#3840]) -> [SKIP][559] ([i915#14544] / [i915#3555] / [i915#3840])
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#4854]) -> [SKIP][561] ([i915#4854])
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-rkl:          [SKIP][562] ([i915#9934]) -> [SKIP][563] ([i915#14544] / [i915#9934]) +3 other tests skip
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-rkl:          [SKIP][564] ([i915#14544] / [i915#9934]) -> [SKIP][565] ([i915#9934]) +5 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-rkl:          [SKIP][566] ([i915#14544] / [i915#15643]) -> [SKIP][567] ([i915#15643])
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          [SKIP][568] ([i915#15643]) -> [SKIP][569] ([i915#14544] / [i915#15643]) +2 other tests skip
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg1:          [SKIP][570] -> [SKIP][571] ([i915#4423])
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][572] ([i915#1825]) -> [SKIP][573] ([i915#14544] / [i915#1825]) +16 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:
    - shard-rkl:          [SKIP][574] ([i915#15102]) -> [SKIP][575] ([i915#14544] / [i915#15102])
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][576] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][577] ([i915#15102] / [i915#3023]) +4 other tests skip
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#1825]) -> [SKIP][579] ([i915#1825]) +15 other tests skip
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-dg2:          [SKIP][580] ([i915#15102] / [i915#3458]) -> [SKIP][581] ([i915#10433] / [i915#15102] / [i915#3458]) +1 other test skip
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:
    - shard-rkl:          [SKIP][582] ([i915#14544] / [i915#15102]) -> [SKIP][583] ([i915#15102]) +1 other test skip
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-rkl:          [SKIP][584] ([i915#15102] / [i915#3023]) -> [SKIP][585] ([i915#14544] / [i915#15102] / [i915#3023]) +10 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][586] ([i915#10433] / [i915#15102] / [i915#3458]) -> [SKIP][587] ([i915#15102] / [i915#3458]) +3 other tests skip
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-mtlp:         [SKIP][588] ([i915#1187] / [i915#12713]) -> [SKIP][589] ([i915#12713])
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html
    - shard-dg2:          [SKIP][590] ([i915#13331]) -> [SKIP][591] ([i915#12713])
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html
    - shard-tglu:         [SKIP][592] ([i915#1187] / [i915#12713]) -> [SKIP][593] ([i915#12713])
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          [SKIP][594] ([i915#14544] / [i915#3555] / [i915#8228]) -> [SKIP][595] ([i915#3555] / [i915#8228])
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          [SKIP][596] ([i915#15459]) -> [SKIP][597] ([i915#14544] / [i915#15459])
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-rkl:          [SKIP][598] ([i915#15458]) -> [SKIP][599] ([i915#14544] / [i915#15458])
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-rkl:          [SKIP][600] ([i915#14544] / [i915#15458]) -> [SKIP][601] ([i915#15458])
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          [SKIP][602] ([i915#15638]) -> [SKIP][603] ([i915#14544] / [i915#15638])
   [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][604] ([i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][605] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825]) +2 other tests skip
   [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          [SKIP][606] ([i915#15608]) -> [SKIP][607] ([i915#14544] / [i915#15608]) +3 other tests skip
   [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0.html
   [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          [SKIP][608] ([i915#15609] / [i915#8825]) -> [SKIP][609] ([i915#14544] / [i915#15609] / [i915#8825]) +2 other tests skip
   [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5.html
   [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-rkl:          [SKIP][610] ([i915#15608] / [i915#8825]) -> [SKIP][611] ([i915#14544] / [i915#15608] / [i915#8825]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          [SKIP][612] ([i915#14544] / [i915#15608] / [i915#8825]) -> [SKIP][613] ([i915#15608] / [i915#8825]) +1 other test skip
   [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5.html
   [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-rkl:          [SKIP][614] ([i915#14544] / [i915#15608] / [i915#15609] / [i915#8825]) -> [SKIP][615] ([i915#15608] / [i915#15609] / [i915#8825])
   [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
   [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0:
    - shard-rkl:          [SKIP][616] ([i915#14544] / [i915#15608]) -> [SKIP][617] ([i915#15608]) +1 other test skip
   [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html
   [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-rkl:          [SKIP][618] ([i915#14544] / [i915#15609] / [i915#8825]) -> [SKIP][619] ([i915#15609] / [i915#8825])
   [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html
   [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          [SKIP][620] ([i915#9685]) -> [SKIP][621] ([i915#14544] / [i915#9685])
   [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
   [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-tglu:         [FAIL][622] ([i915#9295]) -> [SKIP][623] ([i915#15128])
   [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html
   [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][624] ([i915#6524]) -> [SKIP][625] ([i915#14544] / [i915#6524]) +1 other test skip
   [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html
   [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][626] ([i915#11520]) -> [SKIP][627] ([i915#11520] / [i915#14544]) +1 other test skip
   [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
   [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          [SKIP][628] ([i915#11520] / [i915#14544]) -> [SKIP][629] ([i915#11520]) +4 other tests skip
   [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-dg1:          [SKIP][630] ([i915#11520]) -> [SKIP][631] ([i915#11520] / [i915#4423])
   [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-dg1-16/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html
   [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@pr-cursor-render:
    - shard-rkl:          [SKIP][632] ([i915#1072] / [i915#9732]) -> [SKIP][633] ([i915#1072] / [i915#14544] / [i915#9732]) +10 other tests skip
   [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@kms_psr@pr-cursor-render.html
   [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr@pr-cursor-render.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-rkl:          [SKIP][634] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][635] ([i915#1072] / [i915#9732]) +8 other tests skip
   [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html
   [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_vrr@lobf:
    - shard-rkl:          [SKIP][636] ([i915#11920]) -> [SKIP][637] ([i915#11920] / [i915#14544])
   [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@kms_vrr@lobf.html
   [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_vrr@lobf.html

  * igt@perf@mi-rpc:
    - shard-rkl:          [SKIP][638] ([i915#14544] / [i915#2434]) -> [SKIP][639] ([i915#2434])
   [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@perf@mi-rpc.html
   [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@perf@mi-rpc.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          [SKIP][640] ([i915#14544] / [i915#8516]) -> [SKIP][641] ([i915#8516])
   [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
   [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@perf_pmu@rc6-all-gts.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-rkl:          [SKIP][642] ([i915#9917]) -> [SKIP][643] ([i915#14544] / [i915#9917])
   [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html

  
  [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10553]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10553
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
  [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
  [i915#11815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11815
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
  [i915#12549]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
  [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
  [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
  [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
  [i915#14433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14433
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14600
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14785
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15285]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15285
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15481]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15481
  [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15492
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608
  [i915#15609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
  [i915#6806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6806
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
  [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
  [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8751 -> IGTPW_14540

  CI-20190529: 20190529
  CI_DRM_17976: 2938ce73d01357a5816ed7dbd041154b58635a37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_14540: bfe6039f200c7fd3c8e238c9bd4cae1d3dd9f50b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/index.html

--===============4968059539889114997==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] lib/amdgpu:=
 support FWM packet in user queue</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/161494/">https://patchwork.freedesktop.org/series/161494/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14540/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14540/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8751_full -&gt; IGTPW_14540_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_14540_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_14540_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/index=
.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1454=
0_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gem_e=
io@hibernate.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_cursor_legacy@cursor-vs-flip-=
atomic-transitions.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtl=
p-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_pread@exhaustion:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard=
-snb6/igt@gem_pread@exhaustion.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_14540_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-bltcopy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@gem_bad_reloc@negative-reloc-blt=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@gem_bad_reloc@negative-reloc-blt=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3281">i915#3281</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@=
gem_ccs@suspend-resume.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_ccs@suspend-resume@tile4-compressed-compfmt0-=
lmem0-lmem0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14540/shard-dg2-3/igt@gem_ccs@suspend-resume@tile4-compress=
ed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/12392">i915#12392</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>=
)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_create@create-ext-cpu-access-=
big.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280=
">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_balancer@parallel-balan=
cer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/4525">i915#4525</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_exec_balancer@parallel-keep-=
submit-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_big@single.html">ABORT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/117=
13">i915#11713</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_exec_capture@capture-invisib=
le@smem0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-defa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_exec_reloc@basic-wc-read-nore=
loc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@gem_exec_reloc@basic-write-read-=
noreloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@gem_exec_suspend@basic-s0.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/i=
gt@gem_exec_suspend@basic-s0.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>) +1 other test =
abort</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/i=
gt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/4613">i915#4613</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@gem_lmem_swapping@heavy-multi.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@gem_lmem_swapping@heavy-multi.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk1/igt@gem_lmem_swapping@parallel-random-=
engines.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_mmap@big-bo.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i91=
5#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_mmap_gtt@basic-read-write-dis=
tinct.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_mmap_gtt@cpuset-medium-copy-=
xy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4077">i915#4077</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@gem_mmap_gtt@hang-busy.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
077">i915#4077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@gem_mmap_wc@write-read.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4=
083">i915#4083</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-a=
fter-reads-display.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3282">i915#3282</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk5/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14702">i915#14702</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_pwrite@basic-exhaustion.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13717">i915#13717</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@gem_pxp@regular-baseline-src-copy=
-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/4270">i915#4270</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_pxp@regular-baseline-src-cop=
y-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_readwrite@new-obj.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
2">i915#3282</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_readwrite@new-obj.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/32=
82">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_render_copy@yf-tiled-to-vebox=
-x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/5190">i915#5190</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@gem_render_copy@yf-tiled-to-vebo=
x-x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-1/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/4079">i915#4079</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/8411">i915#8411</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-u=
ntiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_softpin@evict-snoop-interrupt=
ible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gem_userptr_blits@access-control=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3297">i915#3297</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@gem_userptr_blits@sd-probe.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/4958">i915#4958</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@gem_userptr_blits@sd-probe.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gem_userptr_blits@unsync-overlap=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-snb5/igt@gen7_exec_parse@oacontrol-tracking=
.html">SKIP</a> +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk3/igt@gen9_exec_parse@allowed-single.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@gen9_exec_parse@basic-rejected-c=
tx-param.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@gen9_exec_parse@unaligned-access.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2856">i915#2856</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2527">i915#2527</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gen9_exec_parse@valid-registers.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/2527">i915#2527</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@i915_drm_fdinfo@all-busy-check-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14123">i915#14123</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@i915_module_load@fault-injection=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11815">i915#11815</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15481">i915#15481</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@i915_driver_mmio_probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@i915_module_load@fault-injection=
@i915_driver_mmio_probe.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15481">i915#15481</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@i915_module_load@fault-injection=
@intel_connector_register.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abo=
rt</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@uc_fw_rsa_data_create:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@i915_module_load@fault-injection=
@uc_fw_rsa_data_create.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk10/igt@i915_pm_rpm@system-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13356">i915#13356</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-6/igt@i915_pm_rps@min-max-config-loaded=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11681">i915#11681</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_power@sanity.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i=
915#7984</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk3/igt@i915_suspend@basic-s3-without-i915=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@i915_suspend@fence-restore-tiled2untiled.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1454=
0/shard-rkl-1/igt@i915_suspend@fence-restore-tiled2untiled.html">ABORT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">=
i915#15140</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@i915_suspend@fence-restore-untiled.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-rkl-3/igt@i915_suspend@fence-restore-untiled.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#481=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@intel_hwmon@hwmon-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7=
707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-=
hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14540/shard-dg2-3/igt@kms_async_flips@alternate-sync-async-fli=
p@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14888">i915#14888</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-6/igt@kms_async_flips@async-flip-suspend-resume.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
40/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15285=
">i915#15285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_async_flips@async-flip-suspe=
nd-resume@pipe-d-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15285">i915#15285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-snb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
3:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transi=
tion@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_atomic_transition@plane-=
toggle-modeset-transition@pipe-a-hdmi-a-3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 o=
ther test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +4 other tests=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_big_fb@linear-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3638">i915#3638</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@kms_big_fb@x-tiled-64bpp-rotate-=
90.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4538">i915#4538</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5190">i915#5190</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@y-tiled-8bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-=
270.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_big_fb@yf-tiled-8bpp-rotate-=
90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/4538">i915#4538</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@kms_ccs@bad-pixel-format-4-tiled=
-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-=
mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +186 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-m=
tl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +78 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tile=
d-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +29 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_ccs@crc-primary-basic-4-tiled=
-dg2-rc-ccs-cc@pipe-c-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +40 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tile=
d-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_ccs@crc-primary-basic-4-til=
ed-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +24 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tile=
d-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +50 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/12313">i915#12313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095=
</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_cdclk@mode-transition.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3742">i915#3742</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-9/igt@kms_cdclk@mode-transition.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-b=
-dp-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13781">i915#13781</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_chamelium_edid@hdmi-edid-rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_chamelium_edid@hdmi-edid-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/7828">i915#7828</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_chamelium_frames@hdmi-cmp-pl=
anar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_chamelium_frames@hdmi-crc-mu=
ltiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-storm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@atomic-dp=
ms-hdcp14@pipe-a-dp-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_content_protection@atomic-hd=
cp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@dp-mst-lic=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-17/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_content_protection@dp-mst-ty=
pe-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_content_protection@dp-mst-typ=
e-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15330">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_content_protection@dp-mst-typ=
e-1-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_content_protection@lic-type-0=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_content_protection@lic-type-=
0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/6944">i915#6944</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_content_protection@type1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_content_protection@type1.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7116">i915#7116</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-3=
2x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-random-128=
x42@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/sha=
rd-rkl-8/igt@kms_cursor_crc@cursor-random-256x85.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x=
85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/13566">i915#13566</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-7/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-=
a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14540/shard-tglu-3/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-h=
dmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/13566">i915#13566</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x=
512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-move=
ment-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-sliding-51=
2x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flip=
b-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/13046">i915#13046</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-1/igt@kms_cursor_legacy@cursora-vs-fli=
pb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9809">i915#9809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_legacy@modeset-atomic-=
cursor-hotspot.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_cursor_legacy@short-busy-fli=
p-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/9723">i915#9723</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13748">i915#13748</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/=
shard-dg2-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#1=
3707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats-=
with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/3840">i915#3840</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/9053">i915#9053</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/9878">i915#9878</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2065">i915#2065</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_feature_discovery@display-2x.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_feature_discovery@dp-mst.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_flip@2x-blocking-absolute-wf=
_vblank-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_flip@2x-dpms-vs-vblank-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9934">i915#9934</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-7/igt@kms_flip@2x-dpms-vs-vblank-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms-on-nop.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_flip@2x-flip-vs-wf_vblank-int=
erruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_flip@2x-modeset-vs-vblank-ra=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3637">i915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14600">i915#14600</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-in=
terruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/6113">i915#6113</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915=
#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-=
indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-shrfb-plflip-blt.html">SKIP</a> +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk5/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/10056">i915#10056</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-cpu=
:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscreen-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-gtt=
:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-r=
gb101010-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023"=
>i915#3023</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-r=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/3023">i915#3023</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +29 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3=
555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_hdr@invalid-metadata-sizes.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg=
2-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_joiner@basic-force-big-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15458">i915#15458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_joiner@basic-max-non-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-4tiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_pipe_stress@stress-xrgb8888-=
4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/882=
5">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe=
-a-plane-2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk10/igt@kms_plane@pixel-format-4-tiled-bm=
g-ccs-modifier-source-clamping@pipe-a-plane-2.html">SKIP</a> +143 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_plane@pixel-format-4-tiled-b=
mg-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a=
>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-a-plane-0:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +8 other te=
sts skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-3:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg=
2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/88=
25">i915#8825</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane@pixel-format-4-tiled-d=
g2-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825=
">i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_plane@pixel-format-4-tiled-ln=
l-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825"=
>i915#8825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_plane@pixel-format-4-tiled-l=
nl-ccs-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)=
 +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-=
lnl-ccs-modifier@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-7:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_plane@pixel-format-4-tiled-m=
odifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-cc-modifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15=
609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-a-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-a-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-5:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_plane@pixel-format-4-tiled-mt=
l-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/88=
25">i915#8825</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping@p=
ipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-18/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_plane@pixel-format-4-tiled-m=
tl-rc-ccs-modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#156=
09</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +1=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping@pipe-a-p=
lane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane@pixel-format-y-tiled-cc=
s-modifier-source-clamping@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">=
i915#8825</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-3:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@kms_plane@pixel-format-yf-tiled-=
ccs-modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) =
+37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915=
#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-3:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-3.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +11 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping@pipe-b-plan=
e-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane@pixel-format-yf-tiled-=
modifier-source-clamping@pipe-b-plane-7.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#=
8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13958">i915#13958</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/s=
hard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
423">i915#9423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-b:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-c:</=
p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-u=
nity-scaling-with-rotation@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-2=
0x20-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/5354">i915#5354</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_pm_backlight@bad-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i=
915#9685</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@kms_pm_dc@dc6-psr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">=
i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340=
">i915#9340</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/382=
8">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-=
dg1-18/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/sha=
rd-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073<=
/a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_pm_rpm@system-suspend-modeset.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/10553">i915#10553</a>)</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-dg1-12/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#442=
3</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk1/igt@kms_psr2_sf@fbc-psr2-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-plane-move-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +3 other te=
sts skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-snb7/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_psr2_sf@pr-overlay-plane-upd=
ate-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/12316">i915#12316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk10/igt@kms_psr2_sf@pr-primary-plane-upda=
te-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/11520">i915#11520</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_psr2_sf@psr2-overlay-plane-up=
date-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_psr@fbc-psr-cursor-plane-move=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/9732">i915#9732</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@kms_psr@fbc-psr-cursor-plane-mov=
e@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-2/igt@kms_psr@fbc-psr-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
9732">i915#9732</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_psr@fbc-psr2-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.h=
tml">SKIP</a> +374 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-mmap-gtt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_psr@psr2-cursor-mmap-gtt.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk1/igt@kms_rotation_crc@multiplane-rotati=
on-cropping-top.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15492">i915#15492</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5190">i915#5190</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_rotation_crc@primary-y-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-no=
ne.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-snb1/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-snb1/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15106">i915#15106</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-m=
tlp-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106">i915#15106</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@kms_setmode@invalid-clone-single-=
crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a>) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-2/igt@kms_setmode@invalid-clone-single=
-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk3/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/10959">i915#10959</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_tiled_display@basic-test-patt=
ern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@kms_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540=
/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1227=
6">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk5/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test in=
complete</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_vblank@ts-continuation-dpms-s=
uspend@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_vrr@flip-basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243"=
>i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-6/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/8808">i915#8808</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_vrr@flipline.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">=
i915#15243</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_vrr@negative-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/35=
55">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-13/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-=
dg1-12/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-7/igt@perf_pmu@busy-idle-check-all.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-=
3/igt@perf_pmu@busy-idle-check-all.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-8/igt@perf_pmu@busy-idle-check-all@ccs0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-mtlp-6/igt@perf_pmu@busy-idle-check-all@ccs0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)=
 +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@perf_pmu@event-wait.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807=
">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@perf_pmu@event-wait@rcs0.html">SK=
IP</a> +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> +14 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@perf_pmu@event-wait@rcs0.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3555">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/8807">i915#8807</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-7/igt@perf_pmu@frequency.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549"=
>i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/6806">i915#6806</a>) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@perf_pmu@frequency.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549=
">i915#12549</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6806">i915#6806</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-glk1/igt@perf_pmu@module-unload.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/144=
33">i915#14433</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-4/igt@perf_pmu@module-unload.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4433">i915#14433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-1/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-14/igt@prime_mmap@test_aperture_limit@t=
est_aperture_limit-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/14121">i915#14121</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-4/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-8/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3708">i915#3708</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@prime_vgem@fence-write-hang.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@sriov_basic@enable-vfs-autoprobe-=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@sriov_basic@enable-vfs-autoprobe=
-off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-mtlp-8/igt@sriov_basic@enable-vfs-autoprobe=
-off@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/12910">i915#12910</a>) +9 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3356">i915#13356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14540/shard-rkl-8/igt@gem_ctx_isolation@preservation-s3.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@ccs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-4/igt@gem_exec_endless@dispatch@ccs0.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778">i=
915#3778</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/7016">i915#7016</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14540/shard-dg2-1/igt@gem_exec_endless@dispatch@ccs0.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom.html">FAIL</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-8/=
igt@gem_lmem_swapping@smem-oom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">CRASH</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493">i=
915#5493</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14540/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i9=
15#4270</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14540/shard-rkl-2/igt@gem_pxp@create-regular-context-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-rkl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8751/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-7/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8751/shard-rkl-4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl=
-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shar=
d-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-6/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751=
/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
_8751/shard-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-1/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8751/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8751/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-8/igt@i91=
5_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl-2/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8751/shard-rkl-3/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8751/shard-rkl=
-3/igt@i915_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/14785">i915#14785</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-r=
kl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@i915_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
540/shard-rkl-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14540/shard-rkl-3/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-=
rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4540/shard-rkl-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@i915_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14540/shard-rkl-5/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard=
-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14540/shard-rkl-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14540/shard-rkl-7/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-rkl-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@i915_module_load@loa=
d.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i=
915#4817</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14540/shard-rkl-7/igt@i915_suspend@debugfs-reader.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_async_flips@async-flip-suspend-resume.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/12761">i915#12761</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_async_flips@async-flip-suspend=
-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-glk6/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdm=
i-a-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-glk9/igt@kms_ccs@crc-primary-su=
spend-y-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/135=
66">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14540/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">=
PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-2/igt@kms_cursor_crc@cursor-random-64x21.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566=
">i915#13566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14540/shard-tglu-5/igt@kms_cursor_crc@cursor-random-64x21.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i9=
15#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14540/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-mtlp-2=
/igt@kms_hdmi_inject@inject-4k.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-5/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228"=
>i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14540/shard-dg2-11/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953=
">i915#6953</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14540/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14540/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-14/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1507=
3">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_14540/shard-dg1-18/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i91=
5#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14540/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
073">i915#15073</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14540/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-12/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#=
4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4540/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> +3 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-6/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#=
4349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4540/shard-dg2-1/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> +4 other =
tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/145=
44">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/8411">i915#8411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@api_intel_bb@object-reloc-purg=
e-cache.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/sha=
rd-rkl-6/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562">i915#=
8562</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4540/shard-rkl-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8562">i915#8562</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/s=
hard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#=
280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_14540/shard-rkl-5/igt@gem_exec_balancer@parallel.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">=
i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525"=
>i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14540/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-cpu:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#1=
4544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3281">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14540/shard-rkl-2/igt@gem_exec_reloc@basic-wc-cpu.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281=
">i915#3281</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/328=
1">i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_14540/shard-rkl-6/igt@gem_exec_reloc@basic-write-wc-noreloc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544"=
>i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/7582">i915#7582</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_lmem_evict@dont=
need-evict-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/4613">i915#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_lmem_swapping@heavy-ve=
rify-random-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i91=
5#4613</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14540/shard-rkl-6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#=
14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4613">i915#4613</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#2=
84</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
40/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@gem_partial_pwrite_pread@write-=
snoop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-uncac=
hed.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3282">i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@gem_partial_pwrite_pread@writes=
-after-reads-uncached.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-buffer:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915=
#13717</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_14540/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-buffer.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717">i915#13=
717</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15656">i915#1=
5656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1=
4540/shard-rkl-6/igt@gem_tiled_pread_basic@basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15=
656">i915#15656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#=
3297</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/3323">i915#3323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14540/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14=
544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/3297">i915#3297</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3297">i915#3297</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14540/shard-rkl-4/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i91=
5#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2527">i915#2527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_14540/shard-rkl-8/igt@gen9_exec_parse@allowed-single.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2=
527</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14=
540/shard-rkl-6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/25=
27">i915#2527</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/8399">i915#8399</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14540/shard-rkl-4/igt@i915_pm_freq_api@freq-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@hwconfig_table:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i915#6245=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540=
/shard-rkl-6/igt@i915_query@hwconfig_table.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245">i9=
15#6245</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@i915_query@test-query-geometry-subslices.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
5723">i915#5723</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14540/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i=
915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14540/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i=
915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">=
i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/5286">i915#5286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_big_fb@line=
ar-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638"=
>i915#3638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14540/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14098">i915#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pip=
e-b-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_cc=
s@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pip=
e-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@bad-rotation-9=
0-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#=
6095</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pip=
e-c-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/14098">i915#14098</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915=
#14098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/6095">i915#6095</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/12313">i915#12313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14540/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/12313">i915#12313</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-13/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/4423">i915#4423</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-16/igt@kms_ccs@crc-primary=
-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540=
/shard-rkl-6/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_chamelium_color@degamma.html">SKIP</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6=
/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +10 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1115=
1">i915#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_chamelium_frames@hdmi-frame=
-dump.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i91=
5#11151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-5/igt@kms_chamelium_hpd@vga=
-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/11151">i915#11151</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-3/igt@kms_content_protection@atomic-dpms-hdcp14.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/6944">i915#6944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@atomic-dpms-hdcp14=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1533=
0">i915#15330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3116">i915#3116</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@dp-mst-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915=
#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_conten=
t_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_content_protection@lic-type-1.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i=
915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_content_protection@lic-type-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-6/igt@kms_content_protection@type1.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944">i915#6=
944</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/7118">i915#7118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/9424">i915#9424</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_14540/shard-dg2-11/igt@kms_content_protection@typ=
e1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/6944">i915#6944</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/7118">i915#7118</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/7162">i915#7162</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424">i915#9424</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
3049">i915#13049</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_14540/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x512.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14540/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-max-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13049">i915#13049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_crc@cursor=
-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3555">i915#3555</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14540/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3555">i915#3555</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14544">i915#14544</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14540/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legac=
y.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_display_modes@extended-mode-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/136=
91">i915#13691</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14540/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/13691">i915#13691</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13=
707">i915#13707</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_14540/shard-rkl-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/13707">i915#13707</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544=
">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3840">i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840">=
i915#3840</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14540/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3840">i915#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i9=
15#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/4854">i915#4854</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_feature_discovery@chamelium.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/4854">i915#4854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-7/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915=
#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14540/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14=
544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/9934">i915#9934</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9934">i915#9934</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_flip@2x-plain-flip-interrup=
tible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-=
ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-7/igt@k=
ms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/156=
43">i915#15643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yf=
tile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_flip_scaled_cr=
c@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643=
">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-ind=
fb-fullscreen.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_14540/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer_trac=
king@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i=
915#1825</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontbuffer=
_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#145=
44</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/sh=
ard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pw=
rite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i91=
5#1825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-4/igt@kms_frontbuffer_t=
racking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#151=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/3458">i915#3458</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-ind=
fb-draw-pwrite.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-2/igt@km=
s_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-pwrite.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102=
">i915#15102</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-ms=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_frontb=
uffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/151=
02">i915#15102</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3023">i915#3023</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/10433">i915#10433</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/i915/kernel/-/issues/15102">i915#15102</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/3458">i915#3458</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-dg2-3/igt@km=
s_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458=
">i915#3458</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14540/shard-mtlp-4/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
713">i915#12713</a>)</li>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13331">i915#=
13331</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
14540/shard-dg2-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713">i915#127=
13</a>)</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187">i915#1=
187</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/12713">i915#12713</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_14540/shard-tglu-5/igt@kms_hdr@brightness-with-hdr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12=
713">i915#12713</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555"=
>i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/8228">i915#8228</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_hdr@invalid-hdr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">=
i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/15459">i915#15459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-big-j=
oiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@invalid-modeset-force-ult=
ra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/15458">i915#15458</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-8/igt@kms_joiner@invalid-modeset=
-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/15638">i915#15638</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-=
joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-s=
ource-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-rkl-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/=
-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@p=
ipe-a-plane-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifie=
r-source-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@=
kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping@pipe-a-p=
lane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane=
-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-modifier-source-cl=
amping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/i=
gt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-b-plane-5.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/=
issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifie=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8825">i915#8825</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_plane@pixel-f=
ormat-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#156=
08</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-plane-5:</=
p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifie=
r@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/sh=
ard-rkl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-b-pla=
ne-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/8825">i915#8825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sour=
ce-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i=
915#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_14540/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sourc=
e-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15608">i915#15608</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-=
plane-0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sour=
ce-clamping@pipe-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608">i915#15608</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-=
rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe=
-a-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/15608">i915#15608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-=
plane-5:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-sour=
ce-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i9=
15#8825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_14540/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source=
-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/15609">i915#15609</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825">i915#8825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-r=
kl-6/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685">i915#9685</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295">i915#9295</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shar=
d-tglu-6/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#652=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1454=
0/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">=
i915#6524</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14540/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-p=
lane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous=
-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/11520">i915#11520</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-3/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#1=
1520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-dg1-16/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exc=
eed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/11520">i915#11520</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_14540/shard-dg1-12/igt@kms_psr2_sf@pr-overlay-pl=
ane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-5/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9=
732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_14540/shard-rkl-6/igt@kms_psr@pr-cursor-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#=
1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/14544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1=
4544">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/9732">i915#9732</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_14540/shard-rkl-4/igt@kms_psr@psr2-cursor-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/1072">i915#1072</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14540/shard-rkl-=
6/igt@kms_vrr@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/11920">i915#11920</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434">i915#24=
34</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_145=
40/shard-rkl-7/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516=
">i915#8516</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_14540/shard-rkl-1/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a=
>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8751/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917"=
>i915#9917</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_14540/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1454=
4">i915#14544</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8751 -&gt; IGTPW_14540</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_17976: 2938ce73d01357a5816ed7dbd041154b58635a37 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_14540: bfe6039f200c7fd3c8e238c9bd4cae1d3dd9f50b @ https://gitlab.fr=
eedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8751: af788251f1ef729d17c802aec2c4547b52059e58 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============4968059539889114997==--
