Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93D1E77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 05:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4AB10EF9B;
	Fri, 10 Jan 2025 05:11:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0F910EF9B;
 Fri, 10 Jan 2025 05:11:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8991782068092759534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EFull=3A_success_for_tests/kms=5Fhistogram=3A?=
 =?utf-8?q?_Add_check_for_ghe_api_call_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 10 Jan 2025 05:11:47 -0000
Message-ID: <173648590743.1843433.10422458698323251512@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108124637.291978-1-mohammed.thasleem@intel.com>
In-Reply-To: <20250108124637.291978-1-mohammed.thasleem@intel.com>
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

--===============8991782068092759534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_histogram: Add check for ghe api call (rev4)
URL   : https://patchwork.freedesktop.org/series/143142/
State : success

== Summary ==

CI Bug Log - changes from IGT_8182_full -> IGTPW_12402_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_12402_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12402_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/index.html

Participating hosts (11 -> 12)
------------------------------

  Additional (1): shard-dg2-set2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12402_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][1] ([i915#4817]) -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk2/igt@i915_suspend@sysfs-reader.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@i915_suspend@sysfs-reader.html

  
Known issues
------------

  Here are the changes found in IGTPW_12402_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-mtlp:         NOTRUN -> [SKIP][4] ([i915#8411])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg1:          NOTRUN -> [SKIP][8] ([i915#11078])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-tglu:         NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#11078])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@device_reset@unbind-cold-reset-rebind.html
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#11078])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-rkl:          [PASS][12] -> [ABORT][13] ([i915#5507])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-7/igt@device_reset@unbind-reset-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@device_reset@unbind-reset-rebind.html
    - shard-tglu:         [PASS][14] -> [ABORT][15] ([i915#12817] / [i915#5507])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html
    - shard-glk:          [PASS][16] -> [ABORT][17] ([i915#5507])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk8/igt@device_reset@unbind-reset-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@device_reset@unbind-reset-rebind.html
    - shard-mtlp:         [PASS][18] -> [ABORT][19] ([i915#5507])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-2/igt@device_reset@unbind-reset-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8414]) +12 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@busy-idle@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#8414]) +8 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html

  * igt@drm_fdinfo@busy-idle@vecs0:
    - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#8414]) +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@drm_fdinfo@busy-idle@vecs0.html

  * igt@gem_basic@multigpu-create-close:
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][24] ([i915#9323]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][25] ([i915#9323]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-dg1:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#9323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#9323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
    - shard-tglu:         NOTRUN -> [SKIP][28] ([i915#9323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@large-ctrl-surf-copy:
    - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#13008])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@gem_ccs@large-ctrl-surf-copy.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#7697])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#7697])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#6335])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [ABORT][33] ([i915#13427])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#6335])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][35] ([i915#1099]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#280])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_ctx_sseu@engines.html
    - shard-dg1:          NOTRUN -> [SKIP][37] ([i915#280])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#280])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@gem_ctx_sseu@engines.html
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#280])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_ctx_sseu@engines.html
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#280])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][41] -> [FAIL][42] ([i915#12543] / [i915#5784])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-17/igt@gem_eio@reset-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4771])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu:         NOTRUN -> [SKIP][44] ([i915#4525])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4525]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#6334]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@gem_exec_capture@capture-invisible.html
    - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#6334]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][48] ([i915#6334]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg1:          NOTRUN -> [FAIL][49] ([i915#11965]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][50] ([i915#3539] / [i915#4852])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#5107])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +10 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_reloc@basic-write-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@gem_exec_reloc@basic-write-wc-active.html
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@gem_exec_reloc@basic-write-wc-active.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4537] / [i915#4812])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#7276])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          NOTRUN -> [ABORT][59] ([i915#7975] / [i915#8213]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][60] ([i915#7975] / [i915#8213]) +2 other tests abort
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][63] ([i915#2190])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613] / [i915#7582])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613] / [i915#7582])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-tglu:         NOTRUN -> [SKIP][66] ([i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#12193])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4565])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-glk:          NOTRUN -> [SKIP][69] ([i915#4613]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4613]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#4613]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8289])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#8289])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#284])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@gem_media_vme.html

  * igt@gem_mmap@pf-nonblock:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@basic-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4077])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_mmap_gtt@basic-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4077]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4083]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#4083])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_mmap_wc@write.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3282]) +5 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#3282]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglu:         NOTRUN -> [WARN][83] ([i915#2658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3282]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-rkl:          NOTRUN -> [TIMEOUT][85] ([i915#12917] / [i915#12964]) +3 other tests timeout
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@linear-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4079]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4885])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4077]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#4079]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-glk:          NOTRUN -> [ABORT][94] ([i915#13263] / [i915#13449])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk5/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-glk:          NOTRUN -> [SKIP][96] ([i915#3323])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#3297]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#3297]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#3297] / [i915#4880])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-tglu:         NOTRUN -> [SKIP][103] ([i915#3297])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][104] +500 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb2/igt@gem_vm_create@invalid-create.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][105] -> [ABORT][106] ([i915#5566])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk6/igt@gen9_exec_parse@allowed-all.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk4/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#2527] / [i915#2856]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#2527]) +3 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#2527]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#2856])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#2856]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu-1:       NOTRUN -> [SKIP][112] ([i915#2527] / [i915#2856])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134]) -> ([PASS][135], [DMESG-WARN][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157]) ([i915#13368])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-3/igt@i915_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-4/igt@i915_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@i915_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-8/igt@i915_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-5/igt@i915_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-5/igt@i915_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@i915_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-2/igt@i915_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-8/igt@i915_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-4/igt@i915_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-10/igt@i915_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-6/igt@i915_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-7/igt@i915_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-3/igt@i915_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@i915_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-4/igt@i915_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-10/igt@i915_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-6/igt@i915_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-7/igt@i915_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@i915_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@i915_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@i915_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@i915_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-4/igt@i915_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@i915_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@i915_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@i915_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@i915_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@i915_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@i915_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@i915_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@i915_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@i915_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@i915_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@i915_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@i915_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [PASS][158] -> [ABORT][159] ([i915#11703])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-snb5/igt@i915_module_load@reload-no-display.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb7/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         NOTRUN -> [ABORT][160] ([i915#12817] / [i915#9820])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg2:          NOTRUN -> [ABORT][161] ([i915#9820])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][162] -> [FAIL][163] ([i915#3591]) +1 other test fail
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#11681] / [i915#6621])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-idle:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#11681])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_pm_rps@thresholds-idle.html

  * igt@i915_pm_rps@thresholds-idle-park:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#11681])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#4387])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@i915_pm_sseu@full-enable.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#4387])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#5723])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][170] ([i915#9311]) +1 other test dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb5/igt@i915_selftest@mock.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-tglu-1:       NOTRUN -> [INCOMPLETE][171] ([i915#7443])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#4212]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][173] -> [INCOMPLETE][174] ([i915#12761])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [INCOMPLETE][175] ([i915#12761])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#8709]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#8709]) +15 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#1769] / [i915#3555])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][179] -> [FAIL][180] ([i915#11808] / [i915#5956]) +1 other test fail
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#5286]) +4 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][182] +9 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#4538] / [i915#5286]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-tglu-1:       NOTRUN -> [SKIP][184] ([i915#5286])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#5286]) +4 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3638]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#3638]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#4538] / [i915#5190]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#6187])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][190] ([i915#4538]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][191] ([i915#6095]) +4 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#10307] / [i915#6095]) +148 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#6095]) +105 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][194] ([i915#6095]) +9 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#6095]) +44 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#6095]) +20 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          NOTRUN -> [INCOMPLETE][197] ([i915#12796]) +1 other test incomplete
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#12313]) +2 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][199] ([i915#12313]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#6095]) +154 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-mtlp:         NOTRUN -> [SKIP][202] +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#7828]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#7828]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#7828]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#7828]) +9 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#7828]) +11 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#6944] / [i915#9424])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_content_protection@content-type-change.html
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#9424])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#3116])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][211] ([i915#3299])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#3116] / [i915#3299])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][213] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#9424])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#9433])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#7118] / [i915#9424])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#8814])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3555]) +7 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#13049]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3555]) +8 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#13049])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#13049]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#13049])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#13049])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-rkl:          [PASS][225] -> [DMESG-WARN][226] ([i915#12964]) +47 other tests dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#3555]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#3555]) +3 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-32x10.html
    - shard-mtlp:         NOTRUN -> [SKIP][229] ([i915#3555] / [i915#8814])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][230] ([i915#12358] / [i915#7882])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][231] ([i915#12358])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][232] ([i915#12964]) +27 other tests dmesg-warn
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][233] +29 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][234] ([i915#4103] / [i915#4213])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#13046] / [i915#5354])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#9067])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#4103]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][238] ([i915#12170])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][239] ([i915#11968])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#3804])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#1257])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#8812])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#3840])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3840])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#3840])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#3555] / [i915#3840])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#3840] / [i915#9053])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#4854])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#1839]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#658])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3637]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#9934]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#9934]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9934]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip@2x-plain-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#3637]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][256] -> [FAIL][257] ([i915#11989]) +1 other test fail
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-rkl:          [PASS][258] -> [DMESG-WARN][259] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-tglu:         NOTRUN -> [FAIL][260] ([i915#11989]) +2 other tests fail
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:
    - shard-snb:          NOTRUN -> [FAIL][261] ([i915#11989]) +1 other test fail
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-mtlp:         [PASS][262] -> [FAIL][263] ([i915#11989]) +2 other tests fail
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#8381])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8381])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_flip@flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#8381])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][267] ([i915#12745] / [i915#1982] / [i915#4839])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][268] ([i915#12745] / [i915#1982])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2:          [PASS][269] -> [FAIL][270] ([i915#11989])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-4/igt@kms_flip@plain-flip-fb-recreate.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-rkl:          [PASS][271] -> [FAIL][272] ([i915#11989])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][273] ([i915#11989]) +1 other test fail
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:
    - shard-dg2:          NOTRUN -> [FAIL][274] ([i915#11989]) +2 other tests fail
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555]) +4 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555] / [i915#8813])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#2672] / [i915#8813])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][278] ([i915#2672] / [i915#3555]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][279] ([i915#2587] / [i915#2672]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#3555] / [i915#8810] / [i915#8813])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#3555] / [i915#8810])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#2672] / [i915#3555])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][283] ([i915#2587] / [i915#2672]) +4 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#2672]) +2 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#2587] / [i915#2672] / [i915#3555])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#2587] / [i915#2672]) +4 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#2672] / [i915#3555]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#2672] / [i915#3555]) +5 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#2672]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg1:          [PASS][291] -> [DMESG-WARN][292] ([i915#4423]) +1 other test dmesg-warn
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][293] ([i915#8708]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][294] +44 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#5439])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#5439])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#10055])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#10055])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#3458]) +17 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#5354]) +25 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] +8 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#5439])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-tglu-1:       NOTRUN -> [SKIP][303] ([i915#9766])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][304] +50 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#3023]) +25 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][306] ([i915#8708]) +19 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#8708]) +11 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#1825]) +37 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][309] ([i915#1825]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#3458]) +16 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][311] -> [SKIP][312] ([i915#3555] / [i915#8228])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#1187] / [i915#12713])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#3555] / [i915#8228]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_hdr@static-swap.html
    - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#3555] / [i915#8228])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#3555] / [i915#8228])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@kms_hdr@static-swap.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#3555] / [i915#8228])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#3555] / [i915#8228]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@global-basic:
    - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#13388])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#13388])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_histogram@global-color.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#10656])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12388])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#12339])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#10656])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#12394])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#12394])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-tglu:         NOTRUN -> [SKIP][327] ([i915#12394])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][328] ([i915#10656])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-glk:          [PASS][329] -> [INCOMPLETE][330] ([i915#12756])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][331] ([i915#13026])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][332] ([i915#10647] / [i915#12169])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][333] ([i915#10647]) +1 other test fail
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([i915#12247]) +9 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-glk:          NOTRUN -> [SKIP][335] +404 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][336] ([i915#12247]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#12247]) +10 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#12247] / [i915#9423])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#12247]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][340] ([i915#6953])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#12247] / [i915#6953])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#12247] / [i915#6953])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][343] ([i915#12247]) +7 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#5354])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#12343])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#3361])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         [PASS][347] -> [SKIP][348] ([i915#4281])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][349] -> [SKIP][350] ([i915#9519])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html
    - shard-rkl:          [PASS][351] -> [SKIP][352] ([i915#12916])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][353] -> [FAIL][354] ([i915#8717])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-3/igt@kms_pm_rpm@i2c.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#9519])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][356] ([i915#9519])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][357] -> [SKIP][358] ([i915#9519])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][359] ([i915#6524] / [i915#6805])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#6524])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#11520]) +8 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][362] ([i915#12316]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#11520]) +8 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#9808]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][365] ([i915#11520])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][366] ([i915#11520]) +10 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][367] ([i915#11520]) +5 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][368] ([i915#11520]) +12 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#11520]) +10 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-rkl:          NOTRUN -> [SKIP][370] ([i915#9683]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-tglu-1:       NOTRUN -> [SKIP][371] ([i915#9732]) +2 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][372] ([i915#9688]) +6 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9732]) +12 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#1072] / [i915#9732]) +25 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#1072] / [i915#9732]) +17 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][376] ([i915#1072] / [i915#9732]) +24 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][377] ([i915#9685]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#9685])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#5289])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][380] ([i915#5190]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#5289])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#3555])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][383] ([i915#13179]) +1 other test abort
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][384] ([i915#8623])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#8623])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-mtlp:         [PASS][386] -> [FAIL][387] ([i915#9196]) +1 other test fail
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#3555] / [i915#8808])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2:          NOTRUN -> [SKIP][389] ([i915#11920])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_vrr@lobf.html
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#11920])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][391] ([i915#9906])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#2437])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][393] ([i915#2437] / [i915#9412])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-tglu:         NOTRUN -> [SKIP][394] ([i915#2437] / [i915#9412])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
    - shard-glk:          NOTRUN -> [SKIP][395] ([i915#2437]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][396] ([i915#2437])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][397] ([i915#9100]) +1 other test fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@perf@non-zero-reason.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-dg1:          NOTRUN -> [SKIP][398] ([i915#2433])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][399] -> [FAIL][400] ([i915#4349]) +4 other tests fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][401] -> [FAIL][402] ([i915#11943]) +1 other test fail
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][403] -> [FAIL][404] ([i915#4349]) +1 other test fail
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-dg1:          [PASS][405] -> [FAIL][406] ([i915#11943]) +1 other test fail
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [PASS][407] -> [FAIL][408] ([i915#11943]) +1 other test fail
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#8516])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][410] ([i915#8516])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][411] ([i915#8516])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-dg1:          NOTRUN -> [FAIL][412] ([i915#4349]) +3 other tests fail
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#3708] / [i915#4077]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@basic-write:
    - shard-rkl:          NOTRUN -> [SKIP][414] ([i915#3291] / [i915#3708])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg1:          NOTRUN -> [SKIP][415] ([i915#3708])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#3708])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@prime_vgem@fence-flip-hang.html
    - shard-dg2:          NOTRUN -> [SKIP][417] ([i915#3708])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][418] ([i915#3708]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - shard-dg2:          NOTRUN -> [SKIP][419] ([i915#9917])
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
    - shard-mtlp:         NOTRUN -> [FAIL][420] ([i915#12910]) +9 other tests fail
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          NOTRUN -> [SKIP][421] ([i915#9917])
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-dg1:          NOTRUN -> [SKIP][422] ([i915#9917])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-tglu:         [DMESG-WARN][423] -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglu:         [ABORT][425] -> [PASS][426] +1 other test pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][427] ([i915#12714] / [i915#5784]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-dg1:          [FAIL][429] ([i915#13364]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-12/igt@gem_exec_balancer@full-pulse.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          [INCOMPLETE][431] ([i915#13306]) -> [PASS][432]
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk1/igt@gem_softpin@noreloc-s3.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-rkl:          [DMESG-WARN][433] ([i915#12964]) -> [PASS][434] +46 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_module_load@reload-no-display:
    - shard-tglu:         [DMESG-WARN][435] ([i915#13029]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-tglu-4/igt@i915_module_load@reload-no-display.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][437] ([i915#9820]) -> [PASS][438]
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [ABORT][439] ([i915#9820]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-rkl:          [FAIL][441] ([i915#12942]) -> [PASS][442] +1 other test pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][443] ([i915#13393]) -> [PASS][444] +1 other test pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-2/igt@i915_selftest@live@workarounds.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-glk:          [INCOMPLETE][445] ([i915#4817]) -> [PASS][446]
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk4/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         [INCOMPLETE][447] -> [PASS][448]
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-3/igt@i915_suspend@debugfs-reader.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-4/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-rkl:          [INCOMPLETE][449] ([i915#4817]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-glk:          [FAIL][451] ([i915#10991] / [i915#13335]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:
    - shard-glk:          [FAIL][453] ([i915#10991]) -> [PASS][454]
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][455] ([i915#5138]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb:
    - shard-dg1:          [DMESG-WARN][457] ([i915#4423]) -> [PASS][458]
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg1-12/igt@kms_busy@extended-pageflip-modeset-hang-oldfb.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_busy@extended-pageflip-modeset-hang-oldfb.html

  * igt@kms_cursor_crc@cursor-r

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/index.html

--===============8991782068092759534==
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
<tr><td><b>Series:</b></td><td>tests/kms_histogram: Add check for ghe api c=
all (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/143142/">https://patchwork.freedesktop.org/series/143142/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12402/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12402/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8182_full -&gt; IGTPW_12402_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_12402_full need to be verified<b=
r />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12402_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/index=
.html</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): shard-dg2-set2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1240=
2_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@i915_suspend@sysfs-reader:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk2/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i=
915#4817]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12402/shard-glk2/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12402_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> ([i915#8411])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@api_intel_bb@blit-reloc-purge-ca=
che.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cac=
he.html">SKIP</a> ([i915#8411])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@api_intel_bb@blit-reloc-purge-cac=
he.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@device_reset@unbind-cold-reset-re=
bind.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@device_reset@unbind-cold-reset-r=
ebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-7/igt@device_reset@unbind-reset-rebind.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-=
rkl-4/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])</l=
i>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-tglu-4/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-tglu-4/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#12817] =
/ [i915#5507])</li>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk8/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-g=
lk9/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-2/igt@device_reset@unbind-reset-rebind.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-mtlp-6/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#5507])<=
/li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@drm_fdinfo@busy-idle-check-all@v=
cs1.html">SKIP</a> ([i915#8414]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@drm_fdinfo@busy-idle@bcs0.html">=
SKIP</a> ([i915#8414]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@drm_fdinfo@busy-idle@vecs0.html"=
>SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_ccs@block-multicopy-compresse=
d.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_ccs@block-multicopy-compress=
ed.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> ([i915#9323])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.h=
tml">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@gem_ccs@large-ctrl-surf-copy.htm=
l">SKIP</a> ([i915#13008])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> ([i915#7697])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_close_race@multigpu-basic-thr=
eads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_create@create-ext-cpu-acces=
s-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_create@create-ext-cpu-access-=
big.html">ABORT</a> ([i915#13427])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_create@create-ext-cpu-access-=
sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb7/igt@gem_ctx_persistence@smoketest.html=
">SKIP</a> ([i915#1099]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_ctx_sseu@engines.html">SKIP</=
a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_ctx_sseu@engines.html">SKIP<=
/a> ([i915#280])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@gem_ctx_sseu@engines.html">SKIP</=
a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-17/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@=
gem_eio@reset-stress.html">FAIL</a> ([i915#12543] / [i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_balancer@bonded-sync.ht=
ml">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> ([i915#4525]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@gem_exec_capture@capture-invisibl=
e.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@gem_exec_capture@capture-invisib=
le.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk2/igt@gem_exec_capture@capture-invisible=
@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_capture@capture@vecs0-l=
mem0.html">FAIL</a> ([i915#11965]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_exec_flush@basic-wb-rw-befor=
e-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@gem_exec_params@rsvd2-dirt.html"=
>SKIP</a> ([i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-norel=
oc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_exec_reloc@basic-wc-gtt-nore=
loc.html">SKIP</a> ([i915#3281]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@gem_exec_reloc@basic-write-wc-ac=
tive.html">SKIP</a> ([i915#3281]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@gem_exec_reloc@basic-write-wc-act=
ive.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_exec_schedule@preempt-queue.h=
tml">SKIP</a> ([i915#4537] / [i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@gem_exec_schedule@semaphore-power=
.html">SKIP</a> ([i915#7276])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices=
.html">ABORT</a> ([i915#7975] / [i915#8213]) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-=
fences-busy.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-=
fences-interruptible.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@gem_huc_copy@huc-copy.html">SKI=
P</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-rac=
e.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@gem_lmem_swapping@heavy-random.h=
tml">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk2/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@gem_lmem_swapping@verify-ccs.htm=
l">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_lmem_swapping@verify-random.h=
tml">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@gem_media_fill@media-fill.html">=
SKIP</a> ([i915#8289])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_media_fill@media-fill.html">S=
KIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@gem_media_vme.html">SKIP</a> ([i=
915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_mmap@pf-nonblock.html">SKIP<=
/a> ([i915#4083]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_mmap_gtt@basic-copy.html">SK=
IP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-=
copy-odd.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@gem_mmap_wc@copy.html">SKIP</a> (=
[i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_mmap_wc@write.html">SKIP</a>=
 ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_partial_pwrite_pread@reads-un=
cached.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html"=
>SKIP</a> ([i915#3282]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html=
">SKIP</a> ([i915#3282]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@gem_pwrite@basic-exhaustion.html=
">WARN</a> ([i915#2658])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@gem_pwrite@basic-exhaustion.html=
">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@gem_pxp@display-protected-crc.htm=
l">TIMEOUT</a> ([i915#12917] / [i915#12964]) +3 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-aft=
er-suspend-resume.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_pxp@verify-pxp-stale-buf-opto=
ut-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@gem_render_copy@linear-to-vebox-=
y-tiled.html">SKIP</a> ([i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_render_copy@y-tiled-mc-ccs-to=
-yf-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-t=
iled.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_softpin@evict-snoop.html">SK=
IP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@gem_tiled_partial_pwrite_pread@wr=
ites.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk5/igt@gem_tiled_swapping@non-threaded.ht=
ml">ABORT</a> ([i915#13263] / [i915#13449])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@gem_userptr_blits@create-destroy=
-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@gem_userptr_blits@dmabuf-sync.html=
">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.h=
tml">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@gem_userptr_blits@map-fixed-inva=
lidate-busy.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@gem_userptr_blits@map-fixed-inval=
idate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test=
 skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> ([i915#3297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@gem_userptr_blits@unsync-unmap-c=
ycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb2/igt@gem_vm_create@invalid-create.html"=
>SKIP</a> +500 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk6/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk4/i=
gt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@gen9_exec_parse@basic-rejected.h=
tml">SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html=
">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@gen9_exec_parse@cmd-crossing-pag=
e.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@gen9_exec_parse@shadow-peek.html=
">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@gen9_exec_parse@unaligned-jump.h=
tml">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8182/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-4/igt@i915_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGT_8182/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-8/igt@i9=
15_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGT_8182/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-5/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-d=
g2-2/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-8/igt@i915_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/sh=
ard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-10/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8=
182/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_8182/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGT_8182/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-11/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8182/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2-10/ig=
t@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_8182/shard-dg2-6/igt@i915_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8182/shard-dg2=
-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_8182/shard-dg2-1/igt@i915_module_load@load.html">=
PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12402/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@i915_modul=
e_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2=
-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_124=
02/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@i915_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12402/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@=
i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@i915_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@i915_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12402/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@i915_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12402/shard-dg2-6/igt@i915_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@i915_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shar=
d-dg2-8/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12402/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12402/shard-dg2-8/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-5/=
igt@i915_module_load@load.html">PASS</a>) ([i915#13368])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-snb5/igt@i915_module_load@reload-no-display.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-snb7/igt@i915_module_load@reload-no-display.html">ABORT</a> ([i915#11703])=
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@i915_module_load@reload-with-fau=
lt-injection.html">ABORT</a> ([i915#12817] / [i915#9820])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@i915_module_load@reload-with-fau=
lt-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1240=
2/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (=
[i915#3591]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@i915_pm_rps@min-max-config-loade=
d.html">SKIP</a> ([i915#11681] / [i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@i915_pm_rps@thresholds-idle.html"=
>SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@i915_pm_rps@thresholds-idle-park=
.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> ([i915#4387])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@i915_query@test-query-geometry-su=
bslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb5/igt@i915_selftest@mock.html">DMESG-WAR=
N</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@i915_suspend@basic-s3-without-i9=
15.html">INCOMPLETE</a> ([i915#7443])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_addfb_basic@bo-too-small-due=
-to-tiling.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_124=
02/shard-rkl-5/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLE=
TE</a> ([i915#12761])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_async_flips@async-flip-suspen=
d-resume@pipe-a-hdmi-a-2.html">INCOMPLETE</a> ([i915#12761])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-r=
c-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_async_flips@async-flip-with-p=
age-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-r=
c-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_async_flips@async-flip-with-=
page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_atomic_transition@plane-all-m=
odeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]=
)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transiti=
on-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_atomic_trans=
ition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL<=
/a> ([i915#11808] / [i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-1=
80.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_big_fb@4-tiled-64bpp-rotate-2=
70.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-=
90.html">SKIP</a> ([i915#4538] / [i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-9=
0.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5286]) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_big_fb@linear-16bpp-rotate-2=
70.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-2=
70.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_big_fb@y-tiled-8bpp-rotate-27=
0.html">SKIP</a> ([i915#4538] / [i915#5190]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_big_fb@y-tiled-addfb-size-ov=
erflow.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_big_fb@yf-tiled-32bpp-rotate=
-270.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mt=
l-rc-ccs-cc@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +14=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-til=
ed-dg2-mc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +105 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-ti=
led-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +44 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +20 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-til=
ed-ccs.html">INCOMPLETE</a> ([i915#12796]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-=
4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-y=
f-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [=
i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +154 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_chamelium_color@ctm-0-50.htm=
l">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-mul=
tiple.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_chamelium_hpd@hdmi-hpd-for-e=
ach-pipe.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm=
-disable.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> ([i915#7828]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_content_protection@content-t=
ype-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_content_protection@content-ty=
pe-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_content_protection@dp-mst-lic=
-type-0.html">SKIP</a> ([i915#3116])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_content_protection@dp-mst-li=
c-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-3/igt@kms_content_protection@dp-mst-ty=
pe-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_content_protection@legacy.ht=
ml">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_content_protection@lic-type-0=
.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_content_protection@mei-inter=
face.html">SKIP</a> ([i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_content_protection@uevent.htm=
l">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-1=
28x42.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-32=
x32.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> ([i915#3555]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x=
170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-mov=
ement-512x512.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> ([i915#13049])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_cursor_crc@cursor-rapid-move=
ment-512x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/s=
hard-rkl-1/igt@kms_cursor_crc@cursor-sliding-256x256.html">DMESG-WARN</a> (=
[i915#12964]) +47 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-32x=
10.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32=
x10.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html=
">INCOMPLETE</a> ([i915#12358] / [i915#7882])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe=
-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12358])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_edge_walk@128x128-righ=
t-edge@pipe-a-hdmi-a-2.html">DMESG-WARN</a> ([i915#12964]) +27 other tests =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-curs=
or-legacy.html">SKIP</a> +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-fli=
pa-varying-size.html">SKIP</a> ([i915#13046] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html=
">FAIL</a> ([i915#12170])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hd=
mi-a-1.html">FAIL</a> ([i915#11968])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@=
pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_dp_aux_dev.html">SKIP</a> ([=
i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.=
html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_dsc@dsc-basic.html">SKIP</a>=
 ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-b=
pc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_dsc@dsc-with-bpc-formats.html=
">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats.h=
tml">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_dsc@dsc-with-output-formats-w=
ith-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_feature_discovery@chamelium.=
html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_feature_discovery@display-4x.=
html">SKIP</a> ([i915#1839]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_feature_discovery@psr1.html">=
SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_flip@2x-flip-vs-modeset.html=
">SKIP</a> ([i915#3637]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_flip@2x-flip-vs-panning.html"=
>SKIP</a> ([i915#9934]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_flip@2x-flip-vs-panning-vs-ha=
ng.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> ([i915#9934]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_flip@2x-plain-flip.html">SKI=
P</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk7/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12402/shard-glk4/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a=
2.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-5/igt@kms_flip@absolute-wf_vblank-interruptible.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_124=
02/shard-rkl-6/igt@kms_flip@absolute-wf_vblank-interruptible.html">DMESG-WA=
RN</a> ([i915#12917] / [i915#12964]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@kms_flip@flip-vs-absolute-wf_vbl=
ank-interruptible.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb7/igt@kms_flip@flip-vs-absolute-wf_vblan=
k-interruptible@a-vga1.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@b-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@b-edp1.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> ([i915#8381])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> ([i915#8381])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_flip@flip-vs-fences.html">SK=
IP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_flip@flip-vs-suspend.html">INC=
OMPLETE</a> ([i915#12745] / [i915#1982] / [i915#4839])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1=
.html">INCOMPLETE</a> ([i915#12745] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-4/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-d=
g2-6/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> ([i915#11989])</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-r=
kl-5/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> ([i915#11989])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_flip@plain-flip-fb-recreate@b=
-hdmi-a2.html">FAIL</a> ([i915#11989]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_flip@plain-flip-fb-recreate@b=
-hdmi-a3.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555]) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
([i915#2672] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#258=
7] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling.html">SKIP</a> ([i915#3555] / [i915#8810]=
 / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_flip_scaled_crc@flip-32bpp-l=
inear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915=
#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555=
])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#258=
7] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]=
 / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2=
672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-y=
tileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] =
/ [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +=
5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yf=
tile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672=
]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-ind=
fb-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12402/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-cur-indfb-move.html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-=
scndscrn-shrfb-pgflip-blt.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-tili=
ng-4.html">SKIP</a> ([i915#5439])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-til=
ing-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> ([i915#10055])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-til=
ing-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-pwrite:</=
p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-offscren-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#5354]) +25 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-7/igt@kms_frontbuffer_tracking@fbcpsr-=
tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fb=
c-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-1p-=
offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-o=
ffscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3023]) +25 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +19 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +37 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-shrfb-msflip-blt.html">SKIP</a> ([i915#1825]) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-indf=
b-scaledprimary.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-3/ig=
t@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> ([i915#1187] / [i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-9/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@kms_hdr@static-swap.html">SKIP</=
a> ([i915#3555] / [i915#8228])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_hdr@static-swap.html">SKIP</a=
> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_hdr@static-toggle.html">SKIP<=
/a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_histogram@global-basic.html"=
>SKIP</a> ([i915#13388])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_histogram@global-color.html">=
SKIP</a> ([i915#13388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_joiner@basic-big-joiner.html=
">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_joiner@basic-ultra-joiner.ht=
ml">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_joiner@invalid-modeset-force-=
ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#12394])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_12402/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-=
a-1.html">INCOMPLETE</a> ([i915#12756])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk6/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend@pipe-b.html">INCOMPLETE</a> ([i915#13026])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#10647]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247]) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk8/igt@kms_plane_scaling@plane-upscale-20=
x20-with-rotation.html">SKIP</a> +404 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-=
factor-0-25-with-rotation@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-a:=
</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-unity-scaling@pipe-a.html">SKIP</a> ([i915#12247]) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-20x20@pipe-a.html">SKIP</a> ([i915#12247]) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-7/igt@kms_plane_scaling@planes-unity-s=
caling-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-=
factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953=
])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953=
])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-8/igt@kms_plane_scaling@planes-upscale=
-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> ([i915#12247]) +7 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_pm_backlight@bad-brightness.h=
tml">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-1/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 ([i915#3361])</li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@k=
ms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-8/ig=
t@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-5/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-rkl-6/ig=
t@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#12916])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-3/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_pm_r=
pm@i2c.html">FAIL</a> ([i915#8717])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-3/igt@kms_pm_rpm@modeset-lpsp.html">SKI=
P</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress.ht=
ml">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
402/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</=
a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_prime@basic-crc-hybrid.html">=
SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane=
-move-continuous-exceed-sf.html">SKIP</a> ([i915#12316]) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-=
update-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-snb2/igt@kms_psr2_sf@pr-overlay-plane-updat=
e-continuous-sf.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-u=
pdate-sf-dmg-area.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-a=
rea.html">SKIP</a> ([i915#11520]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-18/igt@kms_psr2_sf@psr2-primary-plane-u=
pdate-sf-dmg-area-big-fb.html">SKIP</a> ([i915#11520]) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-4/igt@kms_psr2_su@page_flip-p010.html">=
SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_psr@fbc-psr-cursor-plane-mov=
e.html">SKIP</a> ([i915#9732]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_psr@fbc-psr-primary-page-fli=
p@edp-1.html">SKIP</a> ([i915#9688]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_psr@fbc-psr2-cursor-blt.html=
">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_psr@psr-sprite-mmap-cpu.html=
">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.ht=
ml">SKIP</a> ([i915#1072] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@kms_psr@psr2-suspend.html">SKIP</=
a> ([i915#1072] / [i915#9732]) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@kms_psr_stress_test@invalidate-=
primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@kms_psr_stress_test@invalidate-pr=
imary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_rotation_crc@primary-4-tiled=
-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-=
reflect-x-0.html">SKIP</a> ([i915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-90.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-f=
ull-aspect.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-2/igt@kms_selftest@drm_framebuffer.htm=
l">ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-5/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-6/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/sha=
rd-mtlp-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> ([i915#9196=
]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-3/igt@kms_vrr@flip-dpms.html">SKIP</a>=
 ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@kms_vrr@lobf.html">SKIP</a> ([i91=
5#11920])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_vrr@lobf.html">SKIP</a> ([i9=
15#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-2/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-17/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-8/igt@kms_writeback@writeback-fb-id-xr=
gb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-glk9/igt@kms_writeback@writeback-fb-id-xrgb=
2101010.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-6/igt@kms_writeback@writeback-invalid-=
parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-5/igt@perf@non-zero-reason.html">FAIL</=
a> ([i915#9100]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@perf@per-context-mode-unprivileg=
ed.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-dg2-10/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +=
4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg2-6/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard=
-dg2-7/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) =
+1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/=
shard-rkl-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i91=
5#4349]) +1 other test fail</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402=
/shard-dg1-18/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i=
915#11943]) +1 other test fail</li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-8/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402=
/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i=
915#11943]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> ([i915#8516])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@perf_pmu@rc6@other-idle-gt0.html=
">SKIP</a> ([i915#8516])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-tglu-10/igt@perf_pmu@rc6@other-idle-gt0.htm=
l">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@v=
cs0.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-14/igt@prime_vgem@basic-gtt.html">SKIP<=
/a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@prime_vgem@basic-write.html">SKIP=
</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> ([i915#3708])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-1/igt@prime_vgem@fence-flip-hang.html"=
>SKIP</a> ([i915#3708])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-1/igt@prime_vgem@fence-flip-hang.html">=
SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-6/igt@prime_vgem@fence-write-hang.html"=
>SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg2-11/igt@sriov_basic@enable-vfs-autoprobe=
-on.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-mtlp-2/igt@sriov_basic@enable-vfs-autoprobe=
-on@numvfs-2.html">FAIL</a> ([i915#12910]) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-rkl-2/igt@sriov_basic@enable-vfs-bind-unbin=
d-each-numvfs-all.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@sriov_basic@enable-vfs-bind-unbi=
nd-each-numvfs-all.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DME=
SG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12402/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-tglu-3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">ABO=
RT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1240=
2/shard-tglu-10/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#127=
14] / [i915#5784]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12402/shard-dg1-17/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-12/igt@gem_exec_balancer@full-pulse.html">FAIL</a> ([i9=
15#13364]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
12402/shard-dg1-17/igt@gem_exec_balancer@full-pulse.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk1/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> ([i915=
#13306]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
402/shard-glk2/igt@gem_softpin@noreloc-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-4/igt@gem_userptr_blits@sync-unmap-cycles.html">DMESG-W=
ARN</a> ([i915#12964]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12402/shard-rkl-1/igt@gem_userptr_blits@sync-unmap-cycles.html"=
>PASS</a> +46 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-tglu-4/igt@i915_module_load@reload-no-display.html">DMESG-W=
ARN</a> ([i915#13029]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12402/shard-tglu-7/igt@i915_module_load@reload-no-display.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-3/igt@i915_module_load@reload-with-fault-injection.html=
">ABORT</a> ([i915#9820]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_12402/shard-rkl-4/igt@i915_module_load@reload-with-fault-inj=
ection.html">PASS</a></li>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html"=
>ABORT</a> ([i915#9820]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_12402/shard-snb2/igt@i915_module_load@reload-with-fault-injec=
tion.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-7/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a>=
 ([i915#12942]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_12402/shard-rkl-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-2/igt@i915_selftest@live@workarounds.html">DMESG-FAIL<=
/a> ([i915#13393]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_12402/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk9/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLET=
E</a> ([i915#4817]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12402/shard-glk4/igt@i915_suspend@basic-s3-without-i915.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-3/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shar=
d-mtlp-4/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2untiled.html">IN=
COMPLETE</a> ([i915#4817]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_12402/shard-rkl-5/igt@i915_suspend@fence-restore-tiled2unti=
led.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic.h=
tml">FAIL</a> ([i915#10991] / [i915#13335]) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk5/igt@kms_async_flips@alter=
nate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-glk8/igt@kms_async_flips@alternate-sync-async-flip-atomic@p=
ipe-b-hdmi-a-2.html">FAIL</a> ([i915#10991]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_12402/shard-glk5/igt@kms_async_flips@alte=
rnate-sync-async-flip-atomic@pipe-b-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-mtlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180=
.html">FAIL</a> ([i915#5138]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12402/shard-mtlp-5/igt@kms_big_fb@linear-max-hw-stride-6=
4bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8182/shard-dg1-12/igt@kms_busy@extended-pageflip-modeset-hang-oldfb.ht=
ml">DMESG-WARN</a> ([i915#4423]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_12402/shard-dg1-12/igt@kms_busy@extended-pageflip-mod=
eset-hang-oldfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-r</p>
</li>
</ul>

</body>
</html>

--===============8991782068092759534==--
