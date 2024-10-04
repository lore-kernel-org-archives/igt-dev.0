Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3708BCFA749
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 04:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE28D10E31C;
	Fri,  4 Oct 2024 04:54:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB84C10E0DD;
 Fri,  4 Oct 2024 04:54:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7322379381241330798=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_i915/drm=5Ffdinfo=3A_Quiesc?=
 =?utf-8?q?e_GPU_prior_to_running_some_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 04 Oct 2024 04:54:23 -0000
Message-ID: <172801766374.1172277.11953781463943816824@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
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

--===============7322379381241330798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/drm_fdinfo: Quiesce GPU prior to running some tests
URL   : https://patchwork.freedesktop.org/series/139451/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8050_full -> IGTPW_11859_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11859_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11859_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11859_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_balancer@nop:
    - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@gem_exec_balancer@nop.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_exec_balancer@nop.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg1:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-dg1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          [SKIP][9] ([i915#9197]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  
New tests
---------

  New tests have been introduced between IGT_8050_full and IGTPW_11859_full:

### New IGT tests (7) ###

  * igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  * igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.28] s

  * igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.19] s

  * igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_11859_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][11] ([i915#8411])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-noreloc-keep-cache-simple:
    - shard-snb:          NOTRUN -> [SKIP][12] +39 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb4/igt@api_intel_bb@object-noreloc-keep-cache-simple.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][13] ([i915#11814] / [i915#11815])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8414]) +19 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +27 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@fbdev@nullptr:
    - shard-dg2:          [PASS][16] -> [SKIP][17] ([i915#2582])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@fbdev@nullptr.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@fbdev@nullptr.html

  * igt@gem_busy@close-race:
    - shard-dg2:          NOTRUN -> [FAIL][18] ([i915#12297])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_busy@close-race.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][19] ([i915#9323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_ccs@block-multicopy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][20] ([i915#9323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
    - shard-dg2:          [PASS][22] -> [INCOMPLETE][23] ([i915#7297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-mtlp:         [PASS][26] -> [FAIL][27] ([i915#12027])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@gem_ctx_engines@invalid-engines.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][28] ([i915#1099])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb6/igt@gem_ctx_persistence@engines-persistence.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#8555])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][30] ([i915#5882]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#280])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          NOTRUN -> [ABORT][33] ([i915#7975] / [i915#8213])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@gem_eio@hibernate.html
    - shard-dg2:          NOTRUN -> [ABORT][34] ([i915#10030] / [i915#7975] / [i915#8213])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          [PASS][35] -> [FAIL][36] ([i915#5784])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@gem_eio@kms.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#4771]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4812])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4525])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [PASS][40] -> [ABORT][41] ([i915#11713])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-7/igt@gem_exec_big@single.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> [SKIP][42] ([i915#6344])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@capture@vecs0-lmem0:
    - shard-dg2:          NOTRUN -> [FAIL][43] ([i915#11965]) +4 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_exec_capture@capture@vecs0-lmem0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-tglu:         NOTRUN -> [FAIL][44] ([i915#2842]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html
    - shard-dg1:          NOTRUN -> [SKIP][47] ([i915#3539])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3281]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_reloc@basic-cpu-read-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#3281]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-read-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#3281]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_schedule@pi-ringfull@bcs0:
    - shard-tglu:         NOTRUN -> [FAIL][53] ([i915#12296]) +5 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_schedule@pi-ringfull@bcs0.html

  * igt@gem_exec_schedule@pi-ringfull@vcs1:
    - shard-mtlp:         NOTRUN -> [FAIL][54] ([i915#12296]) +6 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_exec_schedule@pi-ringfull@vcs1.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-dg1:          NOTRUN -> [FAIL][55] ([i915#12296]) +5 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_exec_schedule@preempt-queue:
    - shard-dg1:          NOTRUN -> [SKIP][56] ([i915#4812]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_exec_schedule@preempt-queue.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4860]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@gem_lmem_swapping@random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#8289])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#284])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4083]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4077]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_mmap_gtt@big-copy-odd.html
    - shard-dg1:          NOTRUN -> [SKIP][66] ([i915#4077]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@gem_mmap_gtt@big-copy-odd.html

  * igt@gem_mmap_wc@bad-object:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +6 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@gem_mmap_wc@write-read.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#3282]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3282]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#4270]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4270])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-on.html
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_render_copy@y-tiled-ccs-to-linear:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#5190] / [i915#8428]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-linear.html

  * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#8428]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4079]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4079]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_tiled_pread_basic.html
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4079]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_tiled_pread_basic.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-rkl:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#3297] / [i915#4880])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#2527] / [i915#2856])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#2856])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#2527]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#2527]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][92] -> [ABORT][93] ([i915#10131] / [i915#10887] / [i915#9820])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#6412])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#8399])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rps@thresholds-park:
    - shard-dg1:          NOTRUN -> [SKIP][96] ([i915#11681])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html

  * igt@i915_pm_rps@waitboost:
    - shard-mtlp:         NOTRUN -> [FAIL][97] ([i915#8346])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@i915_pm_rps@waitboost.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#5723])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][99] -> [ABORT][100] ([i915#12216]) +1 other test abort
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-4/igt@i915_selftest@live@workarounds.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [PASS][101] -> [ABORT][102] ([i915#11703])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][103] ([i915#7707])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4212]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#4212])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#6228])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg1:          [PASS][107] -> [FAIL][108] ([i915#5956])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#1769] / [i915#3555])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#1769] / [i915#3555])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][111] ([i915#5956])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][112] +10 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][113] -> [FAIL][114] ([i915#5138])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#5286]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#5286]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4538] / [i915#5286]) +6 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#3638]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#3638])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#4538] / [i915#5190]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#6187])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][122] ([i915#4538]) +7 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#12313])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#6095]) +34 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#12313]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#10307] / [i915#6095]) +177 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#6095]) +29 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][129] ([i915#6095]) +59 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][130] ([i915#6095]) +118 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7213]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#7828]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#7828]) +7 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#7828]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#7828]) +6 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#7828]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          [PASS][137] -> [SKIP][138] ([i915#5354]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_color@ctm-max.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_color@ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#7116] / [i915#9424]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_content_protection@atomic.html
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][141] ([i915#7118] / [i915#9424]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#6944] / [i915#9424]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_content_protection@content-type-change.html
    - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#9424])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#3299])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#3116])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#3299])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#3116] / [i915#3299])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#7118] / [i915#9424])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#6944] / [i915#9424])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-dg2:          [PASS][150] -> [SKIP][151] ([i915#9197]) +21 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#4103] / [i915#4213])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#5354]) +27 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-mtlp:         [PASS][154] -> [FAIL][155] ([i915#2346])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#9723])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#9833])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#3555]) +7 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3555] / [i915#3840]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-tglu:         NOTRUN -> [SKIP][160] ([i915#3555] / [i915#3840])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3555] / [i915#3840])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#1839])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#1839])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_feature_discovery@display-3x.html
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#1839])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([i915#1839])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#9337])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_feature_discovery@dp-mst.html
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#9337])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#9337])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#9934]) +2 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#3637]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [PASS][171] -> [FAIL][172] ([i915#2122]) +3 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][173] +13 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#3637])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#8381])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2:          [PASS][176] -> [INCOMPLETE][177] ([i915#4839] / [i915#6113])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_flip@flip-vs-suspend-interruptible.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][178] ([i915#4839] / [i915#6113])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp3:
    - shard-dg2:          NOTRUN -> [FAIL][179] ([i915#2122])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp3.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-tglu:         [PASS][180] -> [FAIL][181] ([i915#2122]) +1 other test fail
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#2672] / [i915#3555])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#2672] / [i915#3555])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#2587] / [i915#2672])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#2587] / [i915#2672])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#2672] / [i915#3555])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#2672])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#2672]) +2 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [PASS][189] -> [SKIP][190] +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][191] +52 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#5439])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3023]) +13 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][194] +22 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([i915#1825]) +14 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#9766])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#8708]) +10 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3458]) +6 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#1825]) +17 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#8708]) +8 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8708]) +5 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#3458]) +8 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#3555] / [i915#8228]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#3555] / [i915#8228])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_hdr@static-swap.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#3555] / [i915#8228])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-dg2:          [PASS][207] -> [SKIP][208] ([i915#3555]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#12339])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#10656]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#6301])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][212] ([i915#6301])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#6301])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_panel_fitting@legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#6301])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-dg2:          [PASS][215] -> [SKIP][216] ([i915#9581])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-7/igt@kms_plane@planar-pixel-format-settings.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:
    - shard-dg2:          NOTRUN -> [FAIL][217] ([i915#8292]) +1 other test fail
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          [PASS][218] -> [FAIL][219] ([i915#8292]) +1 other test fail
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          [PASS][220] -> [SKIP][221] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#12247]) +8 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#12247]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
    - shard-dg1:          NOTRUN -> [SKIP][224] ([i915#12247]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8152] / [i915#9423])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#12247]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#8152])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-dg2:          [PASS][228] -> [SKIP][229] ([i915#6953] / [i915#8152] / [i915#9423])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:
    - shard-dg2:          [PASS][230] -> [SKIP][231] ([i915#12247]) +2 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [PASS][232] -> [SKIP][233] ([i915#12247] / [i915#8152])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#12247] / [i915#3555] / [i915#6953])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#5354])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9685])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9685])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#9685])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@cursor-dpms:
    - shard-dg2:          [PASS][239] -> [SKIP][240] ([i915#1849]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@kms_pm_rpm@cursor-dpms.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][241] -> [SKIP][242] ([i915#9519]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-dg2:          [PASS][243] -> [SKIP][244] ([i915#11521])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_properties@plane-properties-atomic.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#11520]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#11520]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#11520]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][248] ([i915#9808]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-snb:          NOTRUN -> [SKIP][249] ([i915#11520])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#11520]) +4 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][251] ([i915#12316]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#9688]) +4 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#9732]) +14 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#1072] / [i915#9732]) +17 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@pr-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#1072] / [i915#9732]) +17 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#4077] / [i915#9688]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([i915#1072] / [i915#9732]) +13 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([i915#9685])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#11131])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#5190]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#5289])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#5190] / [i915#9197]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#5289]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#3555])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#3555]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][266] ([i915#12231]) +1 other test abort
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#3555]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#8623])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#8623])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#8623])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-idle-hang:
    - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9197])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_vblank@ts-continuation-idle-hang.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#9906])
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#9906])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_vrr@flip-basic-fastset.html
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#9906])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#9906])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#2437] / [i915#9412])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#2436])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#2434])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@perf@mi-rpc.html
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#2434])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason:
    - shard-dg2:          NOTRUN -> [FAIL][280] ([i915#7484]) +1 other test fail
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@perf@non-zero-reason.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][281] -> [FAIL][282] ([i915#4349]) +4 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][283] ([i915#8850])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@most-busy-check-all:
    - shard-rkl:          [PASS][284] -> [FAIL][285] ([i915#4349]) +1 other test fail
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all:
    - shard-dg2:          [PASS][286] -> [FAIL][287] ([i915#11943]) +1 other test fail
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg1:          [PASS][288] -> [FAIL][289] ([i915#11943]) +1 other test fail
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [PASS][290] -> [FAIL][291] ([i915#11943]) +1 other test fail
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#8516])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#8516])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_mmap_kms@buffer-sharing:
    - shard-dg2:          [PASS][294] -> [SKIP][295]
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#3708])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#3708]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each:
    - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#9917])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-tglu:         NOTRUN -> [SKIP][299] ([i915#9917])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-dg2:          NOTRUN -> [SKIP][300] ([i915#9917])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#9917])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-dg2:          NOTRUN -> [FAIL][302] ([i915#9781])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-rkl:          NOTRUN -> [SKIP][303] +14 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          [FAIL][304] ([i915#11980]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@gem_ctx_persistence@hostile.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][306] ([i915#5784]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-16/igt@gem_eio@unwedge-stress.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][308] ([i915#2846]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-tglu:         [FAIL][310] ([i915#2842]) -> [PASS][311] +1 other test pass
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-3/igt@gem_exec_fair@basic-pace-share.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][312] ([i915#7984]) -> [PASS][313]
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-1/igt@i915_power@sanity.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@i915_power@sanity.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-rkl:          [INCOMPLETE][314] ([i915#4817]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-dg1:          [FAIL][316] ([i915#5956]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][318] ([i915#5138]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-snb:          [FAIL][320] -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
    - shard-mtlp:         [FAIL][322] ([i915#2346]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [SKIP][324] ([i915#1257]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_dp_aux_dev.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [SKIP][326] ([i915#1849]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-snb:          [FAIL][328] ([i915#2122]) -> [PASS][329] +6 other tests pass
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-rkl:          [FAIL][330] ([i915#10826]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg1:          [INCOMPLETE][332] ([i915#4839] / [i915#6113]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-snb:          [INCOMPLETE][334] ([i915#4839]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-edp1:
    - shard-mtlp:         [INCOMPLETE][336] ([i915#6113]) -> [PASS][337] +1 other test pass
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-2/igt@kms_flip@flip-vs-suspend@d-edp1.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_flip@flip-vs-suspend@d-edp1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-dg2:          [FAIL][338] ([i915#10826] / [i915#2122]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2:          [SKIP][340] ([i915#3555]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2:          [SKIP][342] ([i915#5354]) -> [PASS][343] +7 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:
    - shard-snb:          [SKIP][344] -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2:          [SKIP][346] ([i915#10656]) -> [PASS][347]
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2:          [INCOMPLETE][348] ([i915#1982]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-dg2:          [SKIP][350] ([i915#7294]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
    - shard-dg2:          [SKIP][352] ([i915#8152]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2:          [SKIP][354] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][355]
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          [SKIP][356] ([i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][357]
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          [SKIP][358] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:
    - shard-dg2:          [SKIP][360] ([i915#12247] / [i915#8152]) -> [PASS][361] +3 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-dg2:          [SKIP][362] ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:
    - shard-dg2:          [SKIP][364] ([i915#12247]) -> [PASS][365] +14 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [SKIP][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][368] ([i915#9519]) -> [PASS][369] +2 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-mtlp:         [FAIL][370] -> [PASS][371] +3 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-6/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          [FAIL][372] ([IGT#2]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_sysfs_edid_timing.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@query-forked-hang:
    - shard-dg2:          [SKIP][374] ([i915#9197]) -> [PASS][375] +19 other tests pass
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_vblank@query-forked-hang.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_vblank@query-forked-hang.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          [SKIP][376] ([i915#3555] / [i915#9906]) -> [PASS][377]
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_vrr@negative-basic.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@render-node-busy-idle:
    - shard-mtlp:         [FAIL][378] ([i915#4349]) -> [PASS][379] +2 other tests pass
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle.html

  * igt@perf_pmu@render-node-busy-idle@vcs0:
    - shard-dg1:          [FAIL][380] ([i915#4349]) -> [PASS][381] +3 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@perf_pmu@render-node-busy-idle@vcs0.html

  
#### Warnings ####

  * igt@i915_selftest@mock:
    - shard-dg2:          [DMESG-WARN][382] ([i915#9311]) -> [DMESG-WARN][383] ([i915#1982] / [i915#9311])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-7/igt@i915_selftest@mock.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@i915_selftest@mock.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2:          [SKIP][384] ([i915#9197]) -> [SKIP][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2:          [SKIP][386] ([i915#5190] / [i915#9197]) -> [SKIP][387] ([i915#5190])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2:          [SKIP][388] ([i915#4538] / [i915#5190]) -> [SKIP][389] ([i915#5190] / [i915#9197]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][390] ([i915#5190] / [i915#9197]) -> [SKIP][391] ([i915#4538] / [i915#5190]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][392] ([i915#9197]) -> [SKIP][393] ([i915#12313])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-dg2:          [SKIP][394] ([i915#9197]) -> [SKIP][395] ([i915#10307] / [i915#6095]) +6 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2:          [SKIP][396] ([i915#10307] / [i915#6095]) -> [SKIP][397] ([i915#9197]) +5 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-snb:          [INCOMPLETE][398] ([i915#8816]) -> [SKIP][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb4/igt@kms_content_protection@atomic-dpms.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          [TIMEOUT][400] ([i915#7173]) -> [SKIP][401] ([i915#7118])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_content_protection@srm.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          [SKIP][402] -> [SKIP][403] ([i915#9197]) +4 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          [SKIP][404] ([i915#3555]) -> [SKIP][405] ([i915#9197])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          [SKIP][406] ([i915#9197]) -> [SKIP][407] ([i915#3555]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-dg2:          [SKIP][408] ([i915#5354]) -> [SKIP][409] ([i915#9197]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          [SKIP][410] ([i915#9197]) -> [SKIP][411] ([i915#5354]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][412] ([i915#9197]) -> [SKIP][413] ([i915#9833])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          [SKIP][414] ([i915#8812]) -> [SKIP][415] ([i915#9197])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          [SKIP][416] ([i915#9197]) -> [SKIP][417] ([i915#8812])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2:          [SKIP][418] ([i915#3555] / [i915#3840]) -> [SKIP][419] ([i915#9197])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_dsc@dsc-basic.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2:          [SKIP][420] ([i915#3840] / [i915#9053]) -> [SKIP][421] ([i915#9197])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2:          [SKIP][422] ([i915#5354]) -> [FAIL][423] ([i915#2122])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg2:          [SKIP][424] ([i915#3555]) -> [SKIP][425] ([i915#2672] / [i915#3555])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          [SKIP][426] ([i915#3555] / [i915#5190]) -> [SKIP][427] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2:          [SKIP][428] ([i915#2672] / [i915#3555]) -> [SKIP][429] ([i915#3555])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-dg1:          [ABORT][430] ([i915#4423]) -> [SKIP][431]
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_force_connector_basic@force-load-detect.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          [SKIP][432] ([i915#5354]) -> [SKIP][433] ([i915#3458]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          [SKIP][434] ([i915#3458]) -> [SKIP][435] ([i915#5354]) +5 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [SKIP][436] ([i915#10433] / [i915#3458]) -> [SKIP][437] ([i915#3458])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          [SKIP][438] ([i915#5354]) -> [SKIP][439] ([i915#8708]) +9 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          [SKIP][440] ([i915#10055]) -> [SKIP][441] ([i915#5354])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          [SKIP][442] ([i915#8708]) -> [SKIP][443] ([i915#5354]) +3 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-dg2:          [SKIP][444] ([i915#9197]) -> [SKIP][445] ([i915#3555] / [i915#8228])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_hdr@bpc-switch-suspend.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          [SKIP][446] ([i915#3555] / [i915#8228]) -> [SKIP][447] ([i915#9197])
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][448] ([i915#4070] / [i915#4816]) -> [SKIP][449] ([i915#4816])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][450] ([i915#12247] / [i915#9423]) -> [SKIP][451] ([i915#12247] / [i915#8152] / [i915#9423])
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][452] ([i915#12247]) -> [SKIP][453] ([i915#12247] / [i915#8152])
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          [FAIL][454] ([i915#9295]) -> [SKIP][455] ([i915#3361])
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTP

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html

--===============7322379381241330798==
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
<tr><td><b>Series:</b></td><td>i915/drm_fdinfo: Quiesce GPU prior to running some tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139451/">https://patchwork.freedesktop.org/series/139451/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8050_full -&gt; IGTPW_11859_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11859_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11859_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11859_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@gem_exec_balancer@nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_exec_balancer@nop.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a></li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-offscreen-512x512:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8050_full and IGTPW_11859_full:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-size-hints@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.28] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11859_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-noreloc-keep-cache-simple:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb4/igt@api_intel_bb@object-noreloc-keep-cache-simple.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> ([i915#8414]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@fbdev@nullptr.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@close-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_busy@close-race.html">FAIL</a> ([i915#12297])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb6/igt@gem_ctx_persistence@engines-persistence.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> ([i915#5882]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_eio@hibernate.html">ABORT</a> ([i915#10030] / [i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-7/igt@gem_exec_big@single.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-7/igt@gem_exec_big@single.html">ABORT</a> ([i915#11713])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture@vecs0-lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_exec_capture@capture@vecs0-lmem0.html">FAIL</a> ([i915#11965]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_fair@basic-throttle.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_exec_flush@basic-wb-set-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@gem_exec_reloc@basic-concurrent0.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-read-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@gem_exec_reloc@basic-cpu-read-noreloc.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_exec_reloc@basic-gtt-read-active.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@bcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_exec_schedule@pi-ringfull@bcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_exec_schedule@pi-ringfull@vcs1.html">FAIL</a> ([i915#12296]) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_exec_schedule@preempt-queue.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@gem_mmap_gtt@big-copy-odd.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@gem_mmap_wc@bad-object.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-linear:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@gem_render_copy@y-tiled-ccs-to-linear.html">SKIP</a> ([i915#5190] / [i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2527] / [i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@i915_pm_rps@thresholds-park.html">SKIP</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@i915_pm_rps@waitboost.html">FAIL</a> ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-4/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#12216]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> ([i915#11703])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small-due-to-tiling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> ([i915#5956])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-4.html">FAIL</a> ([i915#5956])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([i915#5286]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([i915#6187])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-7/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-a-dp-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +177 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#6095]) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_color@ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_color@ctm-max.html">SKIP</a> ([i915#5354]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_content_protection@legacy.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_cursor_crc@cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> ([i915#9197]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([i915#5354]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-14/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> ([i915#4839] / [i915#6113])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check-interruptible@a-dp3.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-3/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3023]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#1825]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> ([i915#9766])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-7/igt@kms_plane@planar-pixel-format-settings.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane@planar-pixel-format-settings.html">SKIP</a> ([i915#9581])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-3.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_plane_scaling@invalid-num-scalers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> ([i915#12247]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> ([i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-c.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">SKIP</a> ([i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_pm_dc@dc5-psr.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> ([i915#1849]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_properties@plane-properties-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_properties@plane-properties-atomic.html">SKIP</a> ([i915#11521])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_psr@fbc-pr-basic.html">SKIP</a> ([i915#9688]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> ([i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_psr@pr-suspend.html">SKIP</a> ([i915#1072] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html">SKIP</a> ([i915#4077] / [i915#9688]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5190] / [i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_vblank@ts-continuation-idle-hang.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-12/igt@kms_vrr@flip-basic-fastset.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@perf@non-zero-reason.html">FAIL</a> ([i915#7484]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-3/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@perf_pmu@most-busy-check-all.html">FAIL</a> ([i915#4349]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@perf_pmu@most-busy-idle-check-all.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-2/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#11943]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@perf_pmu@rc6-all-gts.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap_kms@buffer-sharing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@prime_mmap_kms@buffer-sharing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@prime_mmap_kms@buffer-sharing.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-17/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-4/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-3/igt@sriov_basic@enable-vfs-bind-unbind-each.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@tools_test@sysfs_l3_parity.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-16/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-16/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-tglu-3/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-1/igt@i915_power@sanity.html">SKIP</a> ([i915#7984]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> ([i915#4817]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> ([i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html">FAIL</a> ([i915#10826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-5/igt@kms_flip@dpms-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> ([i915#4839] / [i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-18/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> ([i915#4839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-2/igt@kms_flip@flip-vs-suspend@d-edp1.html">INCOMPLETE</a> ([i915#6113]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-4/igt@kms_flip@flip-vs-suspend@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">FAIL</a> ([i915#10826] / [i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip@flip-vs-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#10656]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-c.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_pm_rpm@i2c.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-6/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-8/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_vblank@query-forked-hang.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-4/igt@kms_vblank@query-forked-hang.html">PASS</a> +19 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_vrr@negative-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-mtlp-3/igt@perf_pmu@render-node-busy-idle.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-mtlp-1/igt@perf_pmu@render-node-busy-idle.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-12/igt@perf_pmu@render-node-busy-idle@vcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-13/igt@perf_pmu@render-node-busy-idle@vcs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-7/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#1982] / [i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> ([i915#5190] / [i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> ([i915#9197]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-snb4/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> ([i915#8816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-snb1/igt@kms_content_protection@atomic-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#7173]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#9197]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-10/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#3555] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg1-13/igt@kms_force_connector_basic@force-load-detect.html">ABORT</a> ([i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg1-19/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#5354]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> ([i915#10433] / [i915#3458]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> ([i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#10055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#5354]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-2/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-11/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4070] / [i915#4816]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8050/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTP">SKIP</a> ([i915#3361])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7322379381241330798==--
