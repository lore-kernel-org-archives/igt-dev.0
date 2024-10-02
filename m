Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D6CF318A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 01:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DFF110E0FB;
	Wed,  2 Oct 2024 01:15:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9647810E0FB;
 Wed,  2 Oct 2024 01:15:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4763282547984438898=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/kms=5Fplane=5Fscaling?=
 =?utf-8?q?=3A_Improve_error_handling_in_kms=5Fplane=5Fscaling_tests?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 02 Oct 2024 01:15:44 -0000
Message-ID: <172783174460.1144163.9909078050399321390@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001053838.2192132-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20241001053838.2192132-1-ramanaidu.naladala@intel.com>
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

--===============4763282547984438898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_scaling: Improve error handling in kms_plane_scaling tests
URL   : https://patchwork.freedesktop.org/series/139358/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8046_full -> IGTPW_11848_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11848_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11848_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/index.html

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11848_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][4] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_joiner@basic-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][6] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][7] +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_joiner@basic-force-big-joiner:
    - {shard-tglu-1}:     NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html

  
Known issues
------------

  Here are the changes found in IGTPW_11848_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#11078])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          NOTRUN -> [ABORT][10] ([i915#11814] / [i915#11815])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#8414]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html
    - shard-dg1:          NOTRUN -> [SKIP][12] ([i915#8414])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@drm_fdinfo@virtual-busy-idle-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#8414])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@fbdev@unaligned-write:
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#2582])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@fbdev@unaligned-write.html

  * igt@gem_bad_reloc@negative-reloc:
    - shard-dg1:          NOTRUN -> [SKIP][15] ([i915#3281]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@gem_bad_reloc@negative-reloc.html
    - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#3281]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#3936])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@gem_busy@semaphore.html
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#3936])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#3936])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#3555] / [i915#9323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html
    - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
    - shard-mtlp:         NOTRUN -> [SKIP][24] ([i915#3555] / [i915#9323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#9323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][26] -> [INCOMPLETE][27] ([i915#7297])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#7697])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-mtlp:         [PASS][29] -> [FAIL][30] ([i915#12027])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][31] ([i915#8555]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#8555]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#8555]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_eio@hibernate:
    - shard-dg1:          [PASS][34] -> [ABORT][35] ([i915#7975] / [i915#8213])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-15/igt@gem_eio@hibernate.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@gem_eio@hibernate.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4812])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#4525]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-tglu:         NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_fair@basic-flow:
    - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4473] / [i915#4771])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_exec_fair@basic-flow.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-rkl:          NOTRUN -> [FAIL][40] ([i915#2842]) +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#2842]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [PASS][42] -> [FAIL][43] ([i915#2876])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3539] / [i915#4852]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][46] ([i915#3281]) +15 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@pi-ringfull@bcs0:
    - shard-tglu:         NOTRUN -> [FAIL][48] ([i915#12296]) +5 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_exec_schedule@pi-ringfull@bcs0.html

  * igt@gem_exec_schedule@pi-ringfull@vecs0:
    - shard-rkl:          NOTRUN -> [FAIL][49] ([i915#12296]) +4 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_schedule@pi-ringfull@vecs0.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4860]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4860]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4860])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4613])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][54] ([i915#4613]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#4613]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_media_vme.html

  * igt@gem_mmap@pf-nonblock:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#4083])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gem_mmap@pf-nonblock.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4077]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy-xy:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4077]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy-xy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][61] ([i915#4083]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@gem_mmap_wc@copy.html
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4083]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@gem_mmap_wc@copy.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#3282]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#3282]) +6 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3282])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html

  * igt@gem_pxp@create-regular-context-2:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4270])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_pxp@create-regular-context-2.html
    - shard-dg1:          NOTRUN -> [SKIP][67] ([i915#4270])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_pxp@create-regular-context-2.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4270]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4270]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
    - shard-rkl:          NOTRUN -> [SKIP][70] ([i915#4270]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#8428])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#5190] / [i915#8428]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#8411])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4079])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4885])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4885])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4885])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_fence_blits@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4077]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@gem_tiled_fence_blits@basic.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3281] / [i915#3297])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_userptr_blits@relocations.html
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3281] / [i915#3297])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gem_userptr_blits@relocations.html
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3281] / [i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap.html
    - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3297]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html
    - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3297]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#3297]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([i915#3297]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][87] +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#2527] / [i915#2856]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#2856]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html
    - shard-dg1:          NOTRUN -> [SKIP][90] ([i915#2527])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@gen9_exec_parse@shadow-peek.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#2856])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2527]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglu:         [PASS][93] -> [ABORT][94] ([i915#10887] / [i915#9820])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#8399]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][96] ([i915#2681]) +1 other test warn
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#8431])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#4387])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-6/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#7984])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#6188])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#6188])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][102] ([i915#5723])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live:
    - shard-mtlp:         NOTRUN -> [ABORT][103] ([i915#12061] / [i915#12216])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][104] -> [ABORT][105] ([i915#12061] / [i915#12216])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@i915_selftest@live@workarounds.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][106] ([i915#9311]) +1 other test dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@i915_selftest@mock.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][107] ([i915#9311]) +1 other test dmesg-warn
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][108] ([i915#9311]) +1 other test dmesg-warn
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][109] ([i915#9311]) +1 other test dmesg-warn
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][110] ([i915#9311]) +1 other test dmesg-warn
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@i915_selftest@mock@memory_region.html
    - shard-dg1:          NOTRUN -> [DMESG-WARN][111] ([i915#9311]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#7707])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4212])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4212])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4212]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#8709]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#8709]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#8709]) +11 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2:          [PASS][119] -> [SKIP][120] ([i915#9197]) +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#1769] / [i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#1769] / [i915#3555])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#4538] / [i915#5286])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][124] ([i915#5286]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#5286]) +6 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][126] -> [FAIL][127] ([i915#5138])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> [SKIP][128] +83 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#3638])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#3638]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4538] / [i915#5190]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#10307] / [i915#6095]) +166 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#6095]) +78 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#6095]) +44 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6095]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][138] ([i915#12313])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#12313]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#12313]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][141] ([i915#6095]) +124 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#3742])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#11616] / [i915#7213]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3742]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_cdclk@plane-scaling.html
    - shard-dg1:          NOTRUN -> [SKIP][145] ([i915#3742])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#4087]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4087]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][148] ([i915#7828]) +8 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7828]) +8 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][150] ([i915#7828]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-mtlp:         NOTRUN -> [SKIP][151] ([i915#7828]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#7828]) +6 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@atomic:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7118] / [i915#9424])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#3116] / [i915#3299])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#3299])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3116])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3555]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#11453]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#11453])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3555]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#9197]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#9809]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#4103] / [i915#4213])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#4103]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#4103])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#9723])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#3804])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#1257])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#8812])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#8812])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([i915#3840])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#3555] / [i915#3840])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#3555] / [i915#3840]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3555] / [i915#3840])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2:          [PASS][175] -> [SKIP][176] ([i915#1849])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#3955])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#3469])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#4854])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_feature_discovery@chamelium.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#4854])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#1839])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#658])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#3637]) +5 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#3637]) +4 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3637] / [i915#3966]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][186] +20 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][187] +35 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_flip@2x-plain-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#9934]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [PASS][189] -> [FAIL][190] ([i915#2122]) +1 other test fail
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-rkl:          NOTRUN -> [FAIL][191] ([i915#2122])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [FAIL][192] ([i915#11961]) +1 other test fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          NOTRUN -> [FAIL][193] ([i915#2122]) +4 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:
    - shard-tglu:         NOTRUN -> [FAIL][194] ([i915#2122]) +2 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2672] / [i915#3555])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#2672]) +5 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#2587] / [i915#2672]) +1 other test skip
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#2672] / [i915#3555] / [i915#8813])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#2587] / [i915#2672] / [i915#3555])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672] / [i915#3555])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#2672] / [i915#3555])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#2672] / [i915#3555]) +5 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-dg2:          [PASS][204] -> [SKIP][205] ([i915#3555]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#2672]) +4 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#5274])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-dg2:          [PASS][209] -> [SKIP][210] ([i915#5354]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#1825]) +48 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [PASS][212] -> [SKIP][213] +8 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][214] ([i915#1825]) +11 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-dg1:          [PASS][215] -> [DMESG-WARN][216] ([i915#4423])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#5439])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#10055])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#3458]) +17 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8708]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#10433] / [i915#3458])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#8708]) +11 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#3023]) +30 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][224] +21 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#5354]) +42 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          NOTRUN -> [SKIP][226] +78 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
    - shard-dg1:          NOTRUN -> [SKIP][227] ([i915#8708]) +6 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3458]) +10 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][229] -> [SKIP][230] ([i915#3555] / [i915#8228]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3555] / [i915#8228])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#8228])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-dg2:          [PASS][233] -> [SKIP][234] ([i915#7294])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#8821])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555]) +6 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html

  * igt@kms_plane_scaling@invalid-num-scalers:
    - shard-dg2:          NOTRUN -> [SKIP][237] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#12247]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#12247]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#12247] / [i915#6953])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#12247] / [i915#9423]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#12247]) +14 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#12247] / [i915#6953] / [i915#9423])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#12247] / [i915#6953])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#12247] / [i915#6953])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#12247]) +7 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#12247]) +8 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#6953] / [i915#8152] / [i915#9423])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-dg2:          [PASS][250] -> [SKIP][251] ([i915#12247]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:
    - shard-dg2:          [PASS][252] -> [SKIP][253] ([i915#12247] / [i915#8152])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#3555] / [i915#8152] / [i915#9423])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#12247] / [i915#8152])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#12247] / [i915#6953]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#9812]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-rkl:          NOTRUN -> [SKIP][258] ([i915#5354])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#4281])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#9519])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#9519]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          NOTRUN -> [SKIP][262] ([i915#9519])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#9519])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][264] -> [SKIP][265] ([i915#9519]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2:          [PASS][266] -> [SKIP][267] ([i915#9519]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([i915#6524])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][269] ([i915#6524])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-crc-vgem:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#6524] / [i915#6805])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#6524])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-snb:          NOTRUN -> [SKIP][272] ([i915#11520]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#11520]) +4 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#11520]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#9808])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#11520]) +10 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#11520]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#12316]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#9683])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#9683])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#9683])
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][282] ([i915#9732]) +19 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#9688]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@pr-sprite-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#1072] / [i915#9732]) +25 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_psr@pr-sprite-mmap-gtt.html

  * igt@kms_psr@psr-cursor-render:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#1072] / [i915#9732]) +23 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_psr@psr-cursor-render.html

  * igt@kms_psr@psr2-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#1072] / [i915#9732]) +14 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_psr@psr2-cursor-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][287] ([i915#9685]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#9685])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#4235])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_rotation_crc@exhaust-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#4235])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#11131])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-mtlp:         NOTRUN -> [SKIP][292] ([i915#5289])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#5289]) +2 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#5289])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#11131] / [i915#5190])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#5289]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][297] ([i915#3555]) +9 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#3555] / [i915#8809])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][299] ([IGT#2])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][300] ([IGT#2] / [i915#6493])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#8623])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][302] ([i915#11920])
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@negative-basic:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3555] / [i915#9906])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#9906]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#9906])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#9906]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#9906]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-mtlp:         NOTRUN -> [SKIP][308] ([i915#2437])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_writeback@writeback-fb-id.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#2437])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#2437]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][311] ([i915#2437])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#2437] / [i915#9412])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][313] ([i915#2437])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#2435])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#2433])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html
    - shard-dg1:          NOTRUN -> [SKIP][316] ([i915#2433])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [PASS][317] -> [FAIL][318] ([i915#11943])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@perf_pmu@all-busy-idle-check-all.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-dg1:          [PASS][319] -> [FAIL][320] ([i915#11943])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [PASS][321] -> [FAIL][322] ([i915#11943])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][323] -> [FAIL][324] ([i915#4349]) +4 other tests fail
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#8850])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#8850])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#3708] / [i915#4077])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@prime_vgem@coherency-gtt.html
    - shard-rkl:          NOTRUN -> [SKIP][328] ([i915#3708])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@prime_vgem@coherency-gtt.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#9917]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-dg1:          NOTRUN -> [SKIP][330] ([i915#9917])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#9917])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-tglu:         NOTRUN -> [FAIL][332] ([i915#9781])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@syncobj_timeline@invalid-wait-zero-handles.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg1:          NOTRUN -> [SKIP][333] ([i915#4818])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@tools_test@sysfs_l3_parity.html
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#4818])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@tools_test@sysfs_l3_parity.html
    - shard-dg2:          NOTRUN -> [SKIP][335] ([i915#4818])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][336] ([i915#5784]) -> [PASS][337]
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-14/igt@gem_eio@reset-stress.html
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][338] ([i915#2846]) -> [PASS][339]
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [FAIL][340] ([i915#2842]) -> [PASS][341] +1 other test pass
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [ABORT][342] ([i915#9820]) -> [PASS][343]
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-dg1:          [DMESG-WARN][344] ([i915#1982] / [i915#4391] / [i915#4423]) -> [PASS][345]
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@i915_suspend@basic-s2idle-without-i915.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg1:          [FAIL][346] ([i915#5956]) -> [PASS][347] +1 other test pass
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [FAIL][348] ([i915#5138]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [SKIP][350] ([i915#9197]) -> [PASS][351] +32 other tests pass
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg1:          [INCOMPLETE][352] -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-12/igt@kms_cursor_crc@cursor-suspend.html
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][354] ([i915#10826]) -> [PASS][355] +1 other test pass
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][356] ([i915#2122]) -> [PASS][357] +1 other test pass
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-mtlp:         [FAIL][358] ([i915#2122]) -> [PASS][359] +1 other test pass
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-4/igt@kms_flip@blocking-wf_vblank.html
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:
    - shard-dg1:          [FAIL][360] ([i915#2122]) -> [PASS][361] +2 other tests pass
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html

  * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
    - shard-tglu:         [FAIL][362] ([i915#2122]) -> [PASS][363] +5 other tests pass
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-snb:          [INCOMPLETE][364] ([i915#4839]) -> [PASS][365]
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-snb:          [INCOMPLETE][366] -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [SKIP][368] ([i915#5354]) -> [PASS][369] +12 other tests pass
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-snb:          [SKIP][370] -> [PASS][371] +4 other tests pass
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@zero-hdisplay:
    - shard-dg2:          [SKIP][372] ([i915#3555]) -> [PASS][373] +3 other tests pass
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_invalid_mode@zero-hdisplay.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_invalid_mode@zero-hdisplay.html

  * igt@kms_plane_alpha_blend@constant-alpha-mid:
    - shard-dg2:          [SKIP][374] ([i915#7294]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-tglu:         [SKIP][376] ([i915#12247] / [i915#6953]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-tglu:         [SKIP][378] ([i915#6953]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-tglu:         [SKIP][380] ([i915#12247]) -> [PASS][381] +15 other tests pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-tglu:         [SKIP][382] ([i915#12247] / [i915#3555] / [i915#6953]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-dg2:          [SKIP][384] ([i915#9293]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [SKIP][386] -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_rpm@i2c.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][388] ([i915#9519]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [FAIL][390] ([i915#10393]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@kms_vrr@negative-basic.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_vrr@negative-basic.html

  * igt@perf_pmu@busy-idle-check-all:
    - shard-dg1:          [FAIL][392] -> [PASS][393] +1 other test pass
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@perf_pmu@busy-idle-check-all.html
    - shard-mtlp:         [FAIL][394] -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all.html

  * igt@perf_pmu@busy-idle-check-all@bcs0:
    - shard-mtlp:         [FAIL][396] ([i915#4349]) -> [PASS][397] +4 other tests pass
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all@bcs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [FAIL][398] ([i915#4349]) -> [PASS][399] +3 other tests pass
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - shard-dg1:          [FAIL][400] ([i915#4349]) -> [PASS][401] +2 other tests pass
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html

  * igt@perf_pmu@busy-idle-check-all@vecs1:
    - shard-dg2:          [FAIL][402] -> [PASS][403] +1 other test pass
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vecs1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@busy-idle-check-all@vecs1.html

  
#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][404] ([i915#9697]) -> [ABORT][405] ([i915#9820])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2:          [SKIP][406] -> [SKIP][407] ([i915#9197])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][408] ([i915#3638]) -> [ABORT][409] ([i915#10354])
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-dg2:          [SKIP][410] ([i915#4538] / [i915#5190]) -> [SKIP][411] ([i915#5190] / [i915#9197]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][412] ([i915#5190] / [i915#9197]) -> [SKIP][413] ([i915#4538] / [i915#5190]) +6 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2:          [SKIP][414] ([i915#9197]) -> [SKIP][415] ([i915#10307] / [i915#6095]) +6 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][416] ([i915#12313]) -> [SKIP][417] ([i915#9197])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2:          [SKIP][418] ([i915#10307] / [i915#6095]) -> [SKIP][419] ([i915#9197]) +3 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2:          [SKIP][420] ([i915#9197]) -> [SKIP][421] ([i915#12313]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg2:          [SKIP][422] ([i915#9197]) -> [SKIP][423] ([i915#4087])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cdclk@plane-scaling.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          [SKIP][424] ([i915#3299]) -> [SKIP][425] ([i915#9197])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg1:          [SKIP][426] ([i915#9424]) -> [SKIP][427] ([i915#9433])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-15/igt@kms_content_protection@mei-interface.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          [SKIP][428] ([i915#9197]) -> [SKIP][429] ([i915#7118] / [i915#9424]) +2 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_content_protection@uevent.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_content_protection@uevent.html
    - shard-snb:          [SKIP][430] -> [INCOMPLETE][431] ([i915#8816])
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb2/igt@kms_content_protection@uevent.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2:          [SKIP][432] ([i915#3555]) -> [SKIP][433] ([i915#9197]) +1 other test skip
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-1/igt@kms_cursor_crc@cursor-random-max-size.html
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2:          [SKIP][434] ([i915#9197]) -> [SKIP][435] ([i915#11453])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-dg2:          [SKIP][436] ([i915#5354]) -> [SKIP][437] ([i915#9197])
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          [SKIP][438] ([i915#9197]) -> [SKIP][439] ([i915#5354])
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg2:          [SKIP][440] ([i915#9833]) -> [SKIP][441] ([i915#9197])
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][442] ([i915#9197]) -> [SKIP][443] ([i915#3555]) +2 other tests skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          [SKIP][444] ([i915#9197]) -> [SKIP][445] ([i915#8588])
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_display_modes@mst-extended-mode-negative.html
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-dg1:          [SKIP][446] -> [SKIP][447] ([i915#9934]) +26 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2:          [SKIP][448] ([i915#3555]) -> [SKIP][449] ([i915#2672] / [i915#3555])
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/index.html

--===============4763282547984438898==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_scaling: Improve error handling in kms_plane_scaling tests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139358/">https://patchwork.freedesktop.org/series/139358/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8046_full -&gt; IGTPW_11848_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11848_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11848_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/index.html</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11848_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_joiner@basic-force-big-joiner:<ul>
<li>{shard-tglu-1}:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11848_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414]) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582])</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@gem_bad_reloc@negative-reloc.html">SKIP</a> ([i915#3281]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-6/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-15/igt@gem_eio@hibernate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@gem_eio@hibernate.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_exec_fair@basic-flow.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_exec_fair@basic-none-rrul.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@gem_exec_fair@basic-pace-solo.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2876])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> ([i915#3281]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@bcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_exec_schedule@pi-ringfull@bcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@vecs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_schedule@pi-ringfull@vecs0.html">FAIL</a> ([i915#12296]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_fence_thrash@bo-write-verify-x.html">SKIP</a> ([i915#4860]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_lmem_swapping@heavy-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@pf-nonblock:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gem_mmap@pf-nonblock.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_mmap_gtt@basic-small-bo.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@gem_mmap_gtt@basic-small-copy-xy.html">SKIP</a> ([i915#4077]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@gem_pxp@create-regular-context-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-optout-execution:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#8428])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled-ccs.html">SKIP</a> ([i915#5190] / [i915#8428]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_fence_blits@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@gem_tiled_fence_blits@basic.html">SKIP</a> ([i915#4077]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_userptr_blits@relocations.html">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@gen3_render_linear_blits.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> ([i915#2527] / [i915#2856]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856]) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2527])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10887] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> ([i915#8399]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@i915_selftest@live.html">ABORT</a> ([i915#12061] / [i915#12216])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">ABORT</a> ([i915#12061] / [i915#12216])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#9197]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#4538])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#10307] / [i915#6095]) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +78 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#6095]) +124 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> ([i915#11616] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> ([i915#4087]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-1/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> ([i915#7828]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> ([i915#9197]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-10/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([i915#3637] / [i915#3966]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> +35 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_flip@2x-plain-flip.html">SKIP</a> ([i915#9934]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a2.html">FAIL</a> ([i915#11961]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_flip@wf_vblank-ts-check-interruptible@d-hdmi-a1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> ([i915#1825]) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([i915#1825]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> ([i915#10055])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-pwrite.html">SKIP</a> ([i915#3458]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> ([i915#3023]) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +78 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-10/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-1/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_plane_multiple@tiling-4.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-num-scalers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@invalid-num-scalers.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#12247] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_pm_backlight@fade.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@kms_prime@basic-crc-vgem.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-2/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> ([i915#12316]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> ([i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a> ([i915#9688]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_psr@pr-sprite-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_psr@psr-cursor-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@kms_psr@psr2-cursor-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4235])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#11131] / [i915#5190])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-15/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> ([i915#3555]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_vrr@lobf.html">SKIP</a> ([i915#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-5/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-4/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([i915#2435])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-17/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-5/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> ([i915#11943])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-11/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-9/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@tools_test@sysfs_l3_parity.html">SKIP</a> ([i915#4818])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-14/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> ([i915#1982] / [i915#4391] / [i915#4423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-16/igt@i915_suspend@basic-s2idle-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> ([i915#5956]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-12/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-14/igt@kms_cursor_crc@cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#10826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb1/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-18/igt@kms_flip@blocking-wf_vblank@b-hdmi-a4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-4/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> ([i915#4839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-hdisplay:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_invalid_mode@zero-hdisplay.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_invalid_mode@zero-hdisplay.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_plane_alpha_blend@constant-alpha-mid.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#6953]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-10/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#6953]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-tglu-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> ([i915#9293]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_rpm@i2c.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@kms_vrr@negative-basic.html">FAIL</a> ([i915#10393]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-4/igt@kms_vrr@negative-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@perf_pmu@busy-idle-check-all.html">PASS</a> +1 other test pass</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-mtlp-2/igt@perf_pmu@busy-idle-check-all@bcs0.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-16/igt@perf_pmu@busy-idle-check-all@vecs0.html">FAIL</a> ([i915#4349]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vecs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@perf_pmu@busy-idle-check-all@vecs1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@perf_pmu@busy-idle-check-all@vecs1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9697]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-rkl-2/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#3638]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-rkl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">ABORT</a> ([i915#10354])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-5/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> ([i915#5190] / [i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5190] / [i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#10307] / [i915#6095]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> ([i915#9197]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#4087])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-15/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-12/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9433])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-6/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118] / [i915#9424]) +2 other tests skip</li>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-snb2/igt@kms_content_protection@uevent.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-snb4/igt@kms_content_protection@uevent.html">INCOMPLETE</a> ([i915#8816])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-1/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> ([i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-11/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-5/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg1-19/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> ([i915#9934]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8046/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11848/shard-dg2-4/igt">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4763282547984438898==--
