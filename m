Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947B8E7717D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 00:55:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F910E59B;
	Tue, 10 Dec 2024 00:55:19 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC9F10E36D;
 Tue, 10 Dec 2024 00:55:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Avoid_Virtual_connector_?=
 =?utf-8?q?or_kms=5Fcursor=5Flegacy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 10 Dec 2024 00:55:17 -0000
Message-ID: <173379211745.656544.575054694047378758@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241209211620.3679545-1-juhapekka.heikkila@gmail.com>
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

Series: Avoid Virtual connector or kms_cursor_legacy
URL   : https://patchwork.freedesktop.org/series/142315/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8145_full -> IGTPW_12280_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12280_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12280_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/index.html

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12280_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-glk:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk5/igt@gem_workarounds@suspend-resume-context.html

  
New tests
---------

  New tests have been introduced between IGT_8145_full and IGTPW_12280_full:

### New IGT tests (2) ###

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.24] s

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.77] s

  

Known issues
------------

  Here are the changes found in IGTPW_12280_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@drm_fdinfo@busy-hang@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][2] ([i915#8414]) +7 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@drm_fdinfo@busy-hang@bcs0.html
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8414]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@drm_fdinfo@busy-hang@bcs0.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8414]) +6 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu-1:       NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][6] ([i915#3555] / [i915#9323])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#3555] / [i915#9323])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#9323])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][9] ([i915#9323]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#9323]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@gem_ccs@suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#9323]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu:         NOTRUN -> [SKIP][12] ([i915#7697]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-3/igt@gem_close_race@multigpu-basic-process.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#7697]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#7697]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#7697]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-dg1:          NOTRUN -> [SKIP][16] ([i915#7697]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-tglu:         NOTRUN -> [ABORT][17] ([i915#13218]) +25 other tests abort
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-5/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb4/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#5882]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#280])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#280])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#280])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-3/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#280])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#280])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][25] ([i915#4525])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@waits:
    - shard-dg1:          NOTRUN -> [ABORT][26] ([i915#13218]) +24 other tests abort
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@gem_exec_balancer@waits.html

  * igt@gem_exec_capture@capture:
    - shard-mtlp:         NOTRUN -> [FAIL][27] ([i915#11965]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@gem_exec_capture@capture.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][28] ([i915#11965]) +2 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fence@submit67:
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@gem_exec_fence@submit67.html
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#4812])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_exec_fence@submit67.html
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#4812])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][33] ([i915#3539])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#3539] / [i915#4852])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@gem_exec_flush@basic-wb-rw-default.html
    - shard-dg1:          NOTRUN -> [SKIP][35] ([i915#3539] / [i915#4852])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][36] ([i915#5107])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#5107])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#3281]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@gem_exec_reloc@basic-cpu-wc-active.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#3281]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_exec_reloc@basic-cpu-wc-active.html
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-wc-active.html
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#3281]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#4860]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4860]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][44] ([i915#4860])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.html
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#4613])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@gem_lmem_swapping@heavy-multi.html
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4613])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][49] -> [TIMEOUT][50] ([i915#5493]) +1 other test timeout
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3282]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4077]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@gem_mmap_gtt@basic-small-bo.html
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4077]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4077]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#4083]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@gem_mmap_wc@fault-concurrent.html
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4083])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4083]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@gem_mmap_wc@read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3282]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@gem_partial_pwrite_pread@reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#3282]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pread@uncached:
    - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#3282]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_pread@uncached.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-rkl:          NOTRUN -> [TIMEOUT][61] ([i915#12964])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@hw-rejects-pxp-buffer:
    - shard-tglu:         NOTRUN -> [SKIP][62] ([i915#13033])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@gem_pxp@hw-rejects-pxp-buffer.html
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#13033])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@gem_pxp@hw-rejects-pxp-buffer.html

  * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [TIMEOUT][64] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#4270]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#4270]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#5190] / [i915#8428]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#8428]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4079])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#8411])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4079])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4079])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][73] ([i915#3297]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#3297] / [i915#4880])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3297]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#3297] / [i915#4880])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3297])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@gem_userptr_blits@unsync-unmap.html
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3297]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap.html
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-rkl:          NOTRUN -> [DMESG-FAIL][80] ([i915#12964])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen3_render_tiledx_blits:
    - shard-dg2:          NOTRUN -> [SKIP][81] +10 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@gen3_render_tiledx_blits.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#2527] / [i915#2856])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@gen9_exec_parse@bb-large.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#2527]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@gen9_exec_parse@bb-large.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#2856]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-8/igt@gen9_exec_parse@bb-large.html
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#2527])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#2856]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-1/igt@gen9_exec_parse@shadow-peek.html
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [ABORT][88] ([i915#9820])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#7091])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#5723])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#5723])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#5723])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-2/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-tglu:         NOTRUN -> [DMESG-WARN][93] ([i915#9311]) +1 other test dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][94] ([i915#9311]) +1 other test dmesg-warn
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk9/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][95] ([i915#9311]) +1 other test dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][96] ([i915#9311]) +1 other test dmesg-warn
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-2/igt@i915_selftest@mock@memory_region.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][97] ([i915#9311]) +1 other test dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#7707])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@intel_hwmon@hwmon-write.html
    - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#7707])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-7/igt@intel_hwmon@hwmon-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#7707])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4212])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4212])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4212])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#5286])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#5286]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#4538] / [i915#5286]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#5286]) +5 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3638]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_big_fb@linear-32bpp-rotate-90.html
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3638]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][110] +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4538] / [i915#5190]) +5 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#5190])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#6187])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#4538]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#6095]) +4 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#6095]) +49 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#6095]) +44 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#10307] / [i915#6095]) +41 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#6095]) +63 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-glk:          NOTRUN -> [SKIP][120] +181 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#6095]) +29 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#6095]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#12313])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#12313])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#12313])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#12313])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#10434] / [i915#6095])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#3742])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#3742])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#4087]) +4 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-2.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7828]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#7828]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#7828]) +4 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#7828]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#7828]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_color@deep-color:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#3555]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_color@deep-color.html
    - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#3555] / [i915#9979])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-7/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#7116] / [i915#9424])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@kms_content_protection@atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][139] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-3/igt@kms_content_protection@atomic.html
    - shard-mtlp:         NOTRUN -> [SKIP][140] ([i915#6944] / [i915#9424])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@kms_content_protection@atomic.html
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#7118] / [i915#9424])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_content_protection@atomic.html
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#7118] / [i915#9424])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][143] ([i915#3116])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#3299])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#3299])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#3555]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3555]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-7/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][148] ([i915#3555] / [i915#8814]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#13049])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#13049])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#13049])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#13049])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#13049])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_edge_walk@64x64-left-edge:
    - shard-rkl:          [PASS][154] -> [DMESG-WARN][155] ([i915#12964]) +6 other tests dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-rkl-5/igt@kms_cursor_edge_walk@64x64-left-edge.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_cursor_edge_walk@64x64-left-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][156] +18 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#9809]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][158] +54 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#9067])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#9067])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#9067])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#9067])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#4103])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#4213])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#4103] / [i915#4213])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#4103])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4103] / [i915#4213])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][168] ([i915#12170])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][169] ([i915#11968])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#3555] / [i915#3804])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#1769] / [i915#3555] / [i915#3804])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3804])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#3804])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_feature_discovery@chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#2065] / [i915#4854])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@kms_feature_discovery@chamelium.html

  * igt@kms_fence_pin_leak:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#4881])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_fence_pin_leak.html
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#4881])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][177] -> [FAIL][178] ([i915#11989]) +1 other test fail
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#9934]) +4 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#9934]) +5 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#8381])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#8381])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#8381])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3637]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@kms_flip@2x-flip-vs-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][185] ([i915#12745] / [i915#1982] / [i915#4839])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][186] ([i915#1982] / [i915#4839])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk2/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-tglu:         NOTRUN -> [SKIP][187] ([i915#3637]) +3 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#9934]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][189] ([i915#3637])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-snb:          NOTRUN -> [FAIL][190] ([i915#11989]) +1 other test fail
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][191] ([i915#12964]) +8 other tests dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#2672] / [i915#3555])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][193] ([i915#2672] / [i915#3555] / [i915#8813]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#2672] / [i915#3555])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#2672] / [i915#3555])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#2672] / [i915#8813]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#2672])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#2672])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][201] ([i915#2587] / [i915#2672])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#3555] / [i915#8810] / [i915#8813])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8810])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-snb:          [PASS][204] -> [SKIP][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#1825]) +20 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#1825]) +14 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][208] +30 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#5354]) +21 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][210] +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#3023]) +19 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#8708]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3458]) +11 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#8708]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#8708]) +5 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3458]) +10 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-13/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-2/igt@kms_hdr@bpc-switch-suspend.html
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#1187] / [i915#12713])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#6301])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-8/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#6301])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-6/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-tglu-1:       NOTRUN -> [ABORT][224] ([i915#10159] / [i915#13218]) +1 other test abort
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][225] ([i915#13026]) +1 other test incomplete
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][226] ([i915#12169])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][227] ([i915#10647]) +1 other test fail
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#12247]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#12247]) +9 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#12247]) +4 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg1:          NOTRUN -> [SKIP][231] ([i915#12247]) +9 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#9685])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-3/igt@kms_pm_dc@dc5-psr.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#9685])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#9685])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#9519])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#6524])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#6524])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#6524])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#6524])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#11520]) +8 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-glk:          NOTRUN -> [SKIP][241] ([i915#11520]) +7 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk1/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
    - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#12316]) +4 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][243] ([i915#11520]) +9 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][244] ([i915#9808])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#11520]) +10 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-snb:          NOTRUN -> [SKIP][246] ([i915#11520]) +16 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#11520]) +10 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#9688]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-6/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-dg2:          NOTRUN -> [SKIP][249] ([i915#1072] / [i915#9732]) +16 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#1072] / [i915#9732]) +15 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#9732]) +13 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr2-primary-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#1072] / [i915#9732]) +15 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_psr@psr2-primary-mmap-cpu.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#5289]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#12755] / [i915#5190])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#5289]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#5289]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#12755])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#3555]) +6 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][259] ([i915#13179]) +1 other test abort
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-1/igt@kms_selftest@drm_framebuffer.html
    - shard-snb:          NOTRUN -> [ABORT][260] ([i915#13179]) +1 other test abort
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb1/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu:         NOTRUN -> [ABORT][261] ([i915#13179]) +1 other test abort
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-3/igt@kms_selftest@drm_framebuffer.html
    - shard-glk:          NOTRUN -> [ABORT][262] ([i915#13179]) +1 other test abort
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk5/igt@kms_selftest@drm_framebuffer.html
    - shard-mtlp:         NOTRUN -> [ABORT][263] ([i915#13179]) +1 other test abort
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][264] ([i915#13179]) +1 other test abort
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-11/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#9906]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#9906]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-2/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#9906]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8808]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][269] ([i915#11920])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-7/igt@kms_vrr@lobf.html
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#11920])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@kms_vrr@lobf.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#11920])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-14/igt@kms_vrr@lobf.html
    - shard-tglu:         NOTRUN -> [SKIP][272] ([i915#11920])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#11920])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-3/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9906]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@kms_vrr@max-min.html
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8808] / [i915#9906])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-6/igt@kms_vrr@max-min.html

  * igt@perf@gen12-oa-tlb-invalidate:
    - shard-rkl:          NOTRUN -> [ABORT][276] ([i915#13218]) +25 other tests abort
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-5/igt@perf@gen12-oa-tlb-invalidate.html
    - shard-tglu-1:       NOTRUN -> [ABORT][277] ([i915#13218]) +1 other test abort
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-1/igt@perf@gen12-oa-tlb-invalidate.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [ABORT][278] ([i915#13218]) +23 other tests abort
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-10/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-accuracy-98:
    - shard-snb:          NOTRUN -> [SKIP][279] +521 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb4/igt@perf_pmu@busy-accuracy-98.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-snb:          NOTRUN -> [ABORT][280] ([i915#13218]) +14 other tests abort
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb1/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@render-node-busy@rcs0:
    - shard-glk:          NOTRUN -> [ABORT][281] ([i915#13218]) +21 other tests abort
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk4/igt@perf_pmu@render-node-busy@rcs0.html
    - shard-mtlp:         NOTRUN -> [ABORT][282] ([i915#13218]) +30 other tests abort
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@perf_pmu@render-node-busy@rcs0.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#3708] / [i915#4077])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#3708] / [i915#4077])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#3708] / [i915#4077])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3291] / [i915#3708])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-1/igt@prime_vgem@basic-write.html
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#10216] / [i915#3708])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-5/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#3708]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-18/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#3708])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-7/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3708])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#9917])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-10/igt@sriov_basic@bind-unbind-vf.html
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#9917]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-7/igt@sriov_basic@bind-unbind-vf.html
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#9917]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@bind-unbind-vf@vf-4:
    - shard-tglu:         NOTRUN -> [FAIL][294] ([i915#12910]) +10 other tests fail
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-10/igt@sriov_basic@bind-unbind-vf@vf-4.html

  * igt@sriov_basic@bind-unbind-vf@vf-5:
    - shard-mtlp:         NOTRUN -> [FAIL][295] ([i915#12910]) +10 other tests fail
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-mtlp-2/igt@sriov_basic@bind-unbind-vf@vf-5.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - shard-glk:          ([PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [DMESG-WARN][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320]) ([i915#118]) -> ([PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk6/igt@i915_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk1/igt@i915_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk2/igt@i915_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk3/igt@i915_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk4/igt@i915_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk4/igt@i915_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk5/igt@i915_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk5/igt@i915_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk6/igt@i915_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk7/igt@i915_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk8/igt@i915_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-glk9/igt@i915_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk4/igt@i915_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk8/igt@i915_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@i915_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk4/igt@i915_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk2/igt@i915_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk1/igt@i915_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk9/igt@i915_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@i915_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk8/igt@i915_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@i915_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk1/igt@i915_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk5/igt@i915_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@i915_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk4/igt@i915_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@i915_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk4/igt@i915_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk3/igt@i915_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk5/igt@i915_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@i915_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@i915_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk7/igt@i915_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk6/igt@i915_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk3/igt@i915_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk5/igt@i915_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-glk9/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [DMESG-WARN][346] ([i915#12964]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [ABORT][348] ([i915#9820]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-rkl:          [SKIP][350] ([i915#9519]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
#### Warnings ####

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [INCOMPLETE][352] ([i915#7297]) -> [ABORT][353] ([i915#13218]) +1 other test abort
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg2-3/igt@gem_ccs@suspend-resume.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-8/igt@gem_ccs@suspend-resume.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [ABORT][354] ([i915#13010]) -> [ABORT][355] ([i915#12817] / [i915#9820])
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-tglu-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [FAIL][356] ([i915#1339] / [i915#7173]) -> [SKIP][357] ([i915#7118] / [i915#9424])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg2-10/igt@kms_content_protection@uevent.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg2-6/igt@kms_content_protection@uevent.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg1:          [SKIP][358] ([i915#1187] / [i915#12713]) -> [SKIP][359] ([i915#12713])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8145/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10159]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10159
  [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
  [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
  [i915#11968]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11968
  [i915#11989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11989
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12170]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12170
  [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
  [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
  [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13010]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13010
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13033
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13218]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13218
  [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
  [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
  [i915#7091]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7297
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
  [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
  [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
  [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8145 -> IGTPW_12280

  CI-20190529: 20190529
  CI_DRM_15808: 9d12021e081c72b18c31bda175fb9a43f1d005fc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12280: 12280
  IGT_8145: 9ecc5cadf47dc934af126a6b34653b860974b9f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12280/index.html
