Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755B6CD98C5
	for <igt-dev@archiver.kernel.org>; Sun, 14 Jun 2026 10:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C6410E071;
	Sun, 14 Jun 2026 10:38:50 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DF710E071;
 Sun, 14 Jun 2026 10:38:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1092124008879489686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_DC5_DPMS/PSR_suspend/res?=
 =?utf-8?q?ume_validation_test_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Sun, 14 Jun 2026 10:38:26 -0000
Message-ID: <178143350625.76658.15490181905230591371@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610070253.25329-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260610070253.25329-1-mohammed.thasleem@intel.com>
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

--===============1092124008879489686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DC5 DPMS/PSR suspend/resume validation test (rev3)
URL   : https://patchwork.freedesktop.org/series/168218/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_18676_full -> IGTPW_15362_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_15362_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_15362_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/index.html

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_15362_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@gamma:
    - shard-tglu:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-10/igt@kms_color@gamma.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_color@gamma.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume (NEW):
    - shard-glk:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-rkl:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-dg1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_vblank@crtc-id:
    - shard-mtlp:         [PASS][8] -> [TIMEOUT][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-8/igt@kms_vblank@crtc-id.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_vblank@crtc-id.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-mtlp:         [SKIP][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-mtlp:         [SKIP][12] ([i915#15989]) -> [TIMEOUT][13] +1 other test timeout
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_18676_full and IGTPW_15362_full:

### New IGT tests (2) ###

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - Statuses : 1 incomplete(s) 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.74] s

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 4.63] s

  

Known issues
------------

  Here are the changes found in IGTPW_15362_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#6230])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@api_intel_bb@crc32.html

  * igt@device_reset@cold-reset-bound:
    - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#11078])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> [SKIP][17] ([i915#11078])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@dmabuf@all-tests:
    - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#14544] / [i915#15931])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@dmabuf@all-tests.html

  * igt@drm_buddy@drm_buddy:
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#15678])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@drm_buddy@drm_buddy.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#3936])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-tglu-1:       NOTRUN -> [SKIP][22] ([i915#7697])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#7697])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-tglu-1:       NOTRUN -> [SKIP][24] ([i915#6335])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#6335])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#6335])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-hostile:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8555]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hostile.html
    - shard-mtlp:         NOTRUN -> [SKIP][29] ([i915#8555])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hostile.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglu:         NOTRUN -> [SKIP][30] ([i915#280])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#4525]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_exec_balancer@parallel.html
    - shard-tglu:         NOTRUN -> [SKIP][32] ([i915#4525])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#4525]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][34] ([i915#6334]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#6334]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3539])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-dg2:          NOTRUN -> [SKIP][37] ([i915#3539] / [i915#4852]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#5107])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html
    - shard-dg2:          NOTRUN -> [SKIP][39] ([i915#5107])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3281]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_exec_reloc@basic-active.html
    - shard-mtlp:         NOTRUN -> [SKIP][41] ([i915#3281])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-3/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3281]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#3281]) +19 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_reloc@basic-write-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14544] / [i915#3281]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_reloc@basic-write-cpu.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-rkl:          [PASS][45] -> [INCOMPLETE][46] ([i915#13356]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4860])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu:         NOTRUN -> [SKIP][48] ([i915#2190])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([i915#2190])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#4613] / [i915#7582])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4613]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][52] ([i915#4613]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_lmem_swapping@random-engines.html
    - shard-tglu:         NOTRUN -> [SKIP][53] ([i915#4613]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#4613])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#8289])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#284])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_media_vme.html
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#284])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_media_vme.html
    - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#284])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#284])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@gem_media_vme.html
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#284])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@bad-object:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4077])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_mmap_gtt@bad-object.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4077])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gem_mmap_gtt@bad-object.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4077]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][64] -> [INCOMPLETE][65] ([i915#16021] / [i915#16108] / [i915#16202]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-rkl:          NOTRUN -> [SKIP][66] ([i915#14544] / [i915#3282])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3282]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#3282])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#3282])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglu-1:       NOTRUN -> [WARN][70] ([i915#2658])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk10:        NOTRUN -> [WARN][71] ([i915#14702] / [i915#2658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4270]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_pxp@display-protected-crc.html
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4270]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu-1:       NOTRUN -> [SKIP][74] ([i915#13398])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_readwrite@read-write:
    - shard-rkl:          NOTRUN -> [SKIP][75] ([i915#3282]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@gem_readwrite@read-write.html

  * igt@gem_render_copy@yf-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_render_copy@yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@gem_render_tiled_blits@basic.html
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#4079])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_render_tiled_blits@basic.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#3297]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#3297]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3282] / [i915#3297])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#3297])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#3297])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#3281] / [i915#3297])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@gem_userptr_blits@relocations.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-glk10:        NOTRUN -> [SKIP][86] +155 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#2856]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gen9_exec_parse@allowed-single.html
    - shard-glk:          NOTRUN -> [ABORT][88] ([i915#5566])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][89] +73 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-tglu:         NOTRUN -> [SKIP][90] ([i915#2527] / [i915#2856]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#2856])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html
    - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#2527])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#2527] / [i915#2856])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#2527]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-rkl:          NOTRUN -> [SKIP][95] ([i915#14544] / [i915#2527])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_drm_fdinfo@virtual-busy-hang-all:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#14118])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#14118])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#14118])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@i915_drm_fdinfo@virtual-busy-hang-all.html

  * igt@i915_module_load@fault-injection@__uc_init:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#15479]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html

  * igt@i915_module_load@fault-injection@intel_connector_register:
    - shard-rkl:          NOTRUN -> [ABORT][100] ([i915#15342]) +1 other test abort
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#14544] / [i915#6412])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][102] -> [INCOMPLETE][103] ([i915#13356] / [i915#13820]) +1 other test incomplete
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglu-1:       NOTRUN -> [SKIP][104] ([i915#16080] / [i915#16166])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          NOTRUN -> [FAIL][105] ([i915#12964]) +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][106] ([i915#13356]) +1 other test incomplete
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [PASS][107] -> [INCOMPLETE][108] ([i915#13356] / [i915#15172])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#4387])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#5723])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [PASS][111] -> [ABORT][112] ([i915#15131])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@i915_suspend@basic-s3-without-i915.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          NOTRUN -> [INCOMPLETE][113] ([i915#16182] / [i915#4817])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@i915_suspend@debugfs-reader.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#4212])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4212])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4212])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#12454] / [i915#12712])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][119] ([i915#14888]) +2 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-rkl:          [PASS][120] -> [INCOMPLETE][121] ([i915#12761]) +1 other test incomplete
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-dg2:          [PASS][122] -> [FAIL][123] ([i915#5956]) +1 other test fail
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#1769] / [i915#3555])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#1769] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#1769] / [i915#3555])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-snb:          NOTRUN -> [SKIP][127] ([i915#1769])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#1769] / [i915#3555])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#5286]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#5286]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#5286]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#14544] / [i915#5286])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#4538] / [i915#5286])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][134] ([i915#3638]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#3828]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#4538] / [i915#5190]) +7 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][137] +138 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][139] +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#10307] / [i915#6095]) +107 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][142] ([i915#12313])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
    - shard-glk:          NOTRUN -> [SKIP][143] +541 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][144] ([i915#6095]) +44 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#6095]) +61 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([i915#12805]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#6095]) +54 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2:          [PASS][148] -> [ABORT][149] ([i915#15132])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-3:
    - shard-dg2:          NOTRUN -> [ABORT][150] ([i915#15132])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#12805])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#12805])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][153] ([i915#12805])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#12805])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([i915#6095]) +12 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:
    - shard-glk:          NOTRUN -> [INCOMPLETE][156] ([i915#14694] / [i915#15582])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#12313]) +1 other test skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#12313])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#14098] / [i915#6095]) +46 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#14544] / [i915#6095]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][162] ([i915#6095]) +19 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][163] ([i915#6095]) +205 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([i915#3742])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#11151] / [i915#7828]) +9 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#11151] / [i915#7828]) +12 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#11151] / [i915#7828]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-tglu-1:       NOTRUN -> [SKIP][169] ([i915#11151] / [i915#7828]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#11151] / [i915#7828]) +2 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-fast.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@deep-color:
    - shard-dg2:          [PASS][172] -> [SKIP][173] ([i915#12655] / [i915#3555])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_color@deep-color.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_color@deep-color.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#12655] / [i915#3555])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_color@deep-color.html
    - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#3555] / [i915#9979])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#15865])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#15330])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
    - shard-tglu-1:       NOTRUN -> [SKIP][178] ([i915#15330])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#15330] / [i915#3299])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html
    - shard-rkl:          NOTRUN -> [SKIP][180] ([i915#15330] / [i915#3116])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html
    - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#15330] / [i915#3299])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][182] ([i915#15330] / [i915#3299])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#15330] / [i915#3116] / [i915#3299]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#15330]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-tglu-1:       NOTRUN -> [SKIP][185] ([i915#15865])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [FAIL][186] ([i915#7173]) +1 other test fail
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#15865]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#15865])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_content_protection@srm.html
    - shard-tglu:         NOTRUN -> [SKIP][189] ([i915#15865]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#15865])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][191] ([i915#13049]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-rkl:          [PASS][192] -> [FAIL][193] ([i915#13566]) +3 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-tglu:         [PASS][194] -> [FAIL][195] ([i915#13566]) +5 other tests fail
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#3555]) +8 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][197] ([i915#13566]) +4 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#3555]) +5 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#3555]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#3555] / [i915#8814])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#8814])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#13049])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#13049])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][204] ([i915#14544]) +16 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#4103]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#13046] / [i915#5354]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#9067])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#9067])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#9067])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-tglu:         NOTRUN -> [SKIP][210] ([i915#9067])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#9723])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-tglu:         NOTRUN -> [SKIP][212] ([i915#9723])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#9833])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#13691])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#13749])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-tglu-1:       NOTRUN -> [SKIP][216] ([i915#13749])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-tglu:         NOTRUN -> [SKIP][217] ([i915#13707])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#16361])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#16361]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-bigjoiner:
    - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#14544] / [i915#16361])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-formats-bigjoiner:
    - shard-tglu-1:       NOTRUN -> [SKIP][221] ([i915#16361]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk11:        NOTRUN -> [INCOMPLETE][222] ([i915#9878])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-dg2:          [PASS][223] -> [FAIL][224] ([i915#4767])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#16084])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#16081])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_feature_discovery@display-2x.html
    - shard-tglu-1:       NOTRUN -> [SKIP][227] ([i915#16081])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-rkl:          NOTRUN -> [SKIP][228] ([i915#9337])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#14544] / [i915#9934])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#9934])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#3637] / [i915#9934]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][232] ([i915#12745] / [i915#4839])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk10:        NOTRUN -> [INCOMPLETE][233] ([i915#12745])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#9934]) +5 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9934]) +8 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_flip@2x-plain-flip.html
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#9934]) +4 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_flip@2x-plain-flip.html
    - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3637] / [i915#9934]) +7 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][238] ([i915#3637] / [i915#9934]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-mtlp:         [PASS][239] -> [INCOMPLETE][240] ([i915#6113])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-rkl:          [PASS][241] -> [FAIL][242] ([i915#13027])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][243] ([i915#13027])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#12745] / [i915#4839])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk4/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][245] ([i915#12745])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3555] / [i915#8810] / [i915#8813]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#15643]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#15643]) +6 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:
    - shard-tglu-1:       NOTRUN -> [SKIP][249] ([i915#15643]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][250] ([i915#15104] / [i915#15990])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#15990] / [i915#8708]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [PASS][252] -> [SKIP][253] ([i915#15989]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#15989]) +26 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#15989]) +30 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#15991]) +6 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] +58 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:
    - shard-rkl:          [PASS][258] -> [SKIP][259] ([i915#15989]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-stridechange:
    - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#15989]) +15 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#14544] / [i915#15102] / [i915#3023]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#15990] / [i915#8708]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#10433] / [i915#15102])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][264] +19 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#15991] / [i915#1825]) +6 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#15102] / [i915#3023]) +33 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][267] ([i915#5439])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#15990]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#14544] / [i915#15102]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#15102]) +41 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html
    - shard-dg1:          NOTRUN -> [SKIP][271] ([i915#15102]) +7 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][272] ([i915#15989]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html
    - shard-mtlp:         NOTRUN -> [SKIP][273] ([i915#15989]) +7 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#15989]) +7 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][275] -> [SKIP][276] +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#15990]) +13 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-rkl:          NOTRUN -> [SKIP][278] ([i915#14544] / [i915#9766])
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#15104] / [i915#15990]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#15102]) +19 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-glk11:        NOTRUN -> [SKIP][281] +144 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#14544] / [i915#1825]) +4 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#15991] / [i915#5354]) +14 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#1825]) +8 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][285] ([i915#15102]) +21 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#15102]) +43 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][287] +116 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][288] ([i915#15990]) +5 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#15991]) +17 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#16012] / [i915#3555] / [i915#8228]) +1 other test skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_hdr@bpc-switch.html
    - shard-tglu-1:       NOTRUN -> [SKIP][291] ([i915#16012] / [i915#3555] / [i915#8228])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#16012] / [i915#3555] / [i915#8228])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][293] ([i915#16012] / [i915#3555] / [i915#8228])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][294] ([i915#16012]) +1 other test skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-dg1:          NOTRUN -> [SKIP][295] ([i915#16012]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#16012]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#16012]) +5 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html
    - shard-tglu-1:       NOTRUN -> [SKIP][298] ([i915#16012]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-4-xrgb2101010:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#16011]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-4-xrgb2101010.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-tglu-1:       NOTRUN -> [SKIP][300] ([i915#16011] / [i915#3555] / [i915#8228])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-tglu-1:       NOTRUN -> [SKIP][301] ([i915#16011]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#16011]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#16011]) +6 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#15458])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#13688])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_joiner@basic-max-non-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#13688])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#15459])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#15638] / [i915#15722])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#15815])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#6301]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#6301])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#14712])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#14544] / [i915#15709]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-rkl:          NOTRUN -> [SKIP][314] ([i915#15709]) +5 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-tglu-1:       NOTRUN -> [SKIP][315] ([i915#15709])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-tglu:         NOTRUN -> [SKIP][316] ([i915#15709]) +3 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
    - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#16386]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
    - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#16386]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:
    - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#16386]) +5 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#15709]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
    - shard-mtlp:         NOTRUN -> [SKIP][321] ([i915#15709])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#16112])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html
    - shard-tglu-1:       NOTRUN -> [SKIP][323] ([i915#16112])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-glk:          NOTRUN -> [INCOMPLETE][324] ([i915#13026])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][325] ([i915#12178])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][326] ([i915#7862]) +1 other test fail
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-glk11:        NOTRUN -> [FAIL][327] ([i915#10647] / [i915#12169])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - shard-glk11:        NOTRUN -> [FAIL][328] ([i915#10647]) +1 other test fail
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][329] ([i915#10647] / [i915#12177])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][330] ([i915#10647]) +1 other test fail
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-tglu:         NOTRUN -> [SKIP][331] ([i915#13958])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#13958])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#15329]) +7 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][334] ([i915#15329]) +4 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#15329] / [i915#6953])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#15329]) +3 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([i915#12343] / [i915#9812])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#12343] / [i915#9812])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#12343] / [i915#5354])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#15948])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [FAIL][341] ([i915#15752])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-rkl:          NOTRUN -> [SKIP][342] ([i915#15948]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#15739])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][344] ([i915#8430])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#15073])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#15073])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          [PASS][347] -> [SKIP][348] ([i915#15073])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-tglu-1:       NOTRUN -> [SKIP][349] ([i915#15403])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][350] +3 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_pm_rpm@pc8-residency.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#6524])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([i915#6524])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-glk11:        NOTRUN -> [SKIP][353] ([i915#11520]) +4 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][354] ([i915#11520]) +9 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#11520]) +3 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][356] ([i915#11520]) +3 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#11520]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#9808])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][359] ([i915#11520]) +17 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#12316]) +2 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
    - shard-glk10:        NOTRUN -> [SKIP][361] ([i915#11520]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#11520]) +9 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][363] ([i915#11520] / [i915#14544]) +2 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#11520]) +2 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][365] ([i915#9683])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#1072] / [i915#9732]) +29 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#1072] / [i915#9732]) +5 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#9732]) +20 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][370] ([i915#9688]) +4 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr-primary-mmap-gtt@edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#4077] / [i915#9688]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html

  * igt@kms_psr@psr-sprite-mmap-cpu:
    - shard-tglu-1:       NOTRUN -> [SKIP][372] ([i915#9732]) +8 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][373] ([i915#1072] / [i915#9732]) +10 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][374] ([i915#15949]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [INCOMPLETE][375] ([i915#15500] / [i915#16184])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#5289]) +1 other test skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#12755] / [i915#15867])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#12755] / [i915#15867])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg1:          NOTRUN -> [SKIP][379] ([i915#5289])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#5289])
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#5289]) +2 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-rkl:          NOTRUN -> [ABORT][382] ([i915#13179]) +1 other test abort
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html
    - shard-tglu-1:       NOTRUN -> [ABORT][383] ([i915#13179]) +1 other test abort
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#8623])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][385] ([i915#12276]) +1 other test incomplete
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#15243] / [i915#3555]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_vrr@flip-basic.html
    - shard-tglu-1:       NOTRUN -> [SKIP][387] ([i915#3555])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][388] ([i915#15243] / [i915#3555])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_vrr@flip-dpms.html
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#3555] / [i915#8808])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][390] ([i915#3555]) +5 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#11920])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#9906])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_vrr@max-min.html
    - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#9906]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_vrr@max-min.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#9906])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#14544] / [i915#9906])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#9906])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-mtlp:         NOTRUN -> [SKIP][397] ([i915#8808] / [i915#9906])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-tglu-1:       NOTRUN -> [SKIP][398] ([i915#9906])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@perf_pmu@busy-accuracy-98@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][399] ([i915#4349]) +2 other tests fail
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@perf_pmu@busy-accuracy-98@rcs0.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][400] -> [FAIL][401] ([i915#4349])
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][402] -> [FAIL][403] ([i915#4349]) +4 other tests fail
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@rc6-all-gts:
    - shard-rkl:          NOTRUN -> [SKIP][404] ([i915#8516])
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][405] ([i915#3291] / [i915#3708])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#3708] / [i915#4077])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][407] ([i915#3708])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@prime_vgem@fence-write-hang.html

  * igt@sriov_basic@bind-unbind-vf@vf-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][408] ([i915#16066]) +9 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
    - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#16066]) +9 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-rkl:          NOTRUN -> [SKIP][410] ([i915#9917])
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  
#### Possible fixes ####

  * igt@gem_exec_big@single:
    - shard-mtlp:         [FAIL][411] ([i915#15871]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-4/igt@gem_exec_big@single.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_exec_big@single.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-rkl:          [SKIP][413] ([i915#4270]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-glk:          [INCOMPLETE][415] ([i915#13356] / [i915#14586]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-rkl:          [INCOMPLETE][417] ([i915#13356]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][419] ([i915#7984]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-5/igt@i915_power@sanity.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@i915_power@sanity.html

  * igt@i915_selftest@live:
    - shard-dg2:          [DMESG-FAIL][421] -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@i915_selftest@live.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_selftest@live.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-dg2:          [DMESG-FAIL][423] ([i915#16077]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@i915_selftest@live@gem_contexts.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_suspend@sysfs-reader:
    - shard-glk:          [INCOMPLETE][425] ([i915#16182] / [i915#4817]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk9/igt@i915_suspend@sysfs-reader.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@i915_suspend@sysfs-reader.html
    - shard-rkl:          [ABORT][427] ([i915#15140]) -> [PASS][428]
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-1/igt@i915_suspend@sysfs-reader.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][429] ([i915#15662]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-rkl:          [INCOMPLETE][431] ([i915#15582]) -> [PASS][432] +1 other test pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          [INCOMPLETE][433] ([i915#15582]) -> [PASS][434]
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][435] ([i915#13566]) -> [PASS][436] +1 other test pass
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][437] ([i915#13566] / [i915#15733]) -> [PASS][438] +2 other tests pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1:
    - shard-snb:          [FAIL][439] ([i915#13027]) -> [PASS][440] +1 other test pass
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-snb5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-tglu:         [ABORT][441] ([i915#15840]) -> [PASS][442] +1 other test pass
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
    - shard-rkl:          [SKIP][443] ([i915#15989]) -> [PASS][444] +11 other tests pass
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html

  * igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:
    - shard-dg2:          [SKIP][445] ([i915#15989]) -> [PASS][446] +2 other tests pass
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [SKIP][447] -> [PASS][448] +10 other tests pass
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][449] ([i915#13030]) -> [PASS][450]
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-glk:          [INCOMPLETE][451] ([i915#13026]) -> [PASS][452]
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [SKIP][453] ([i915#15073]) -> [PASS][454] +1 other test pass
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][455] ([i915#15073]) -> [PASS][456] +1 other test pass
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg1:          [SKIP][457] ([i915#15073]) -> [PASS][458] +2 other tests pass
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-dg2:          [INCOMPLETE][459] ([i915#14419]) -> [PASS][460]
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-rkl:          [INCOMPLETE][461] ([i915#14419]) -> [PASS][462]
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@perf_pmu@all-busy-idle-check-all:
    - shard-dg2:          [FAIL][463] ([i915#15453]) -> [PASS][464]
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@perf_pmu@all-busy-idle-check-all.html
    - shard-mtlp:         [FAIL][465] ([i915#15453]) -> [PASS][466]
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html

  * igt@perf_pmu@most-busy-check-all@bcs0:
    - shard-dg2:          [FAIL][467] ([i915#15997]) -> [PASS][468] +1 other test pass
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@perf_pmu@most-busy-check-all@bcs0.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@perf_pmu@most-busy-check-all@bcs0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-glk:          [INCOMPLETE][469] ([i915#13356] / [i915#14242] / [i915#16236]) -> [PASS][470]
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk4/igt@perf_pmu@rc6-suspend.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk6/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          [SKIP][471] ([i915#7697]) -> [SKIP][472] ([i915#14544] / [i915#7697])
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_basic@multigpu-create-close.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-rkl:          [SKIP][473] ([i915#14544] / [i915#3555] / [i915#9323]) -> [SKIP][474] ([i915#3555] / [i915#9323])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-rkl:          [SKIP][475] ([i915#9323]) -> [SKIP][476] ([i915#14544] / [i915#9323])
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#7697]) -> [SKIP][478] ([i915#7697])
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-rkl:          [SKIP][479] ([i915#280]) -> [SKIP][480] ([i915#14544] / [i915#280])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-rkl:          [SKIP][481] ([i915#4525]) -> [SKIP][482] ([i915#14544] / [i915#4525])
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_big@single:
    - shard-tglu:         [FAIL][483] ([i915#15944]) -> [FAIL][484] ([i915#15816])
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-8/igt@gem_exec_big@single.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@gem_exec_big@single.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          [SKIP][485] ([i915#3281]) -> [SKIP][486] ([i915#14544] / [i915#3281]) +1 other test skip
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-rkl:          [SKIP][487] ([i915#14544] / [i915#3281]) -> [SKIP][488] ([i915#3281])
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_readwrite@beyond-eob:
    - shard-rkl:          [SKIP][489] ([i915#3282]) -> [SKIP][490] ([i915#14544] / [i915#3282]) +2 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_readwrite@beyond-eob.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_readwrite@beyond-eob.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          [SKIP][491] ([i915#14544] / [i915#8411]) -> [SKIP][492] ([i915#8411])
   [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-rkl:          [SKIP][493] ([i915#14544] / [i915#3297]) -> [SKIP][494] ([i915#3297])
   [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-rkl:          [SKIP][495] ([i915#2527]) -> [SKIP][496] ([i915#14544] / [i915#2527])
   [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html
   [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_pm_freq_api@freq-reset-multiple:
    - shard-rkl:          [SKIP][497] ([i915#8399]) -> [SKIP][498] ([i915#14544] / [i915#8399]) +1 other test skip
   [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html
   [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          [SKIP][499] ([i915#14544] / [i915#8399]) -> [SKIP][500] ([i915#8399])
   [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
   [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-rkl:          [SKIP][501] ([i915#9531]) -> [SKIP][502] ([i915#14544] / [i915#9531])
   [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-rkl:          [SKIP][503] ([i915#14544] / [i915#5286]) -> [SKIP][504] ([i915#5286]) +1 other test skip
   [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][505] ([i915#5286]) -> [SKIP][506] ([i915#14544] / [i915#5286])
   [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-rkl:          [SKIP][507] ([i915#3828]) -> [SKIP][508] ([i915#14544] / [i915#3828])
   [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#3638]) -> [SKIP][510] ([i915#3638])
   [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-rkl:          [SKIP][511] ([i915#3638]) -> [SKIP][512] ([i915#14544] / [i915#3638])
   [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          [SKIP][513] ([i915#14544]) -> [SKIP][514] +11 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-rkl:          [SKIP][515] ([i915#14098] / [i915#14544] / [i915#6095]) -> [SKIP][516] ([i915#14098] / [i915#6095])
   [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          [SKIP][517] ([i915#6095]) -> [SKIP][518] ([i915#14544] / [i915#6095]) +3 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
   [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          [SKIP][519] ([i915#12313]) -> [SKIP][520] ([i915#12313] / [i915#14544])
   [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-rkl:          [SKIP][521] ([i915#12313] / [i915#14544]) -> [SKIP][522] ([i915#12313]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-glk:          [INCOMPLETE][523] ([i915#15582]) -> [INCOMPLETE][524] ([i915#14694] / [i915#15582])
   [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-rkl:          [SKIP][525] ([i915#14098] / [i915#6095]) -> [SKIP][526] ([i915#14098] / [i915#14544] / [i915#6095]) +5 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          [SKIP][527] ([i915#14544] / [i915#3742]) -> [SKIP][528] ([i915#3742])
   [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_cdclk@mode-transition.html
   [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-rkl:          [SKIP][529] ([i915#11151] / [i915#7828]) -> [SKIP][530] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html
   [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-rkl:          [SKIP][531] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][532] ([i915#11151] / [i915#7828])
   [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-rkl:          [SKIP][533] ([i915#13049]) -> [SKIP][534] ([i915#13049] / [i915#14544]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html
   [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-rkl:          [SKIP][535] ([i915#4103]) -> [SKIP][536] ([i915#14544] / [i915#4103])
   [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:
    - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#16361]) -> [SKIP][538] ([i915#16361])
   [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html
   [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-rkl:          [SKIP][539] ([i915#16361]) -> [SKIP][540] ([i915#14544] / [i915#16361])
   [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-4x:
    - shard-rkl:          [SKIP][541] ([i915#16081]) -> [SKIP][542] ([i915#14544] / [i915#16081])
   [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_feature_discovery@display-4x.html
   [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-rkl:          [SKIP][543] ([i915#14544] / [i915#9934]) -> [SKIP][544] ([i915#9934])
   [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-rkl:          [SKIP][545] ([i915#9934]) -> [SKIP][546] ([i915#14544] / [i915#9934]) +2 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check.html
   [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-glk:          [INCOMPLETE][547] ([i915#12745] / [i915#4839] / [i915#6113]) -> [INCOMPLETE][548] ([i915#12745] / [i915#4839])
   [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-rkl:          [SKIP][549] ([i915#14544] / [i915#15643]) -> [SKIP][550] ([i915#15643]) +2 other tests skip
   [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-rkl:          [SKIP][551] ([i915#15643]) -> [SKIP][552] ([i915#14544] / [i915#15643]) +2 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][553] ([i915#1825]) -> [SKIP][554] ([i915#14544] / [i915#1825]) +2 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
   [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][555] ([i915#15990] / [i915#4423] / [i915#8708]) -> [SKIP][556] ([i915#15990] / [i915#8708])
   [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2:          [SKIP][557] ([i915#10433] / [i915#15102]) -> [SKIP][558] ([i915#15102]) +2 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-dg2:          [SKIP][559] ([i915#15102]) -> [SKIP][560] ([i915#10433] / [i915#15102])
   [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#15102]) -> [SKIP][562] ([i915#15102]) +2 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-rkl:          [SKIP][563] -> [SKIP][564] ([i915#14544]) +21 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
   [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
    - shard-rkl:          [SKIP][565] ([i915#15102]) -> [SKIP][566] ([i915#14544] / [i915#15102]) +7 other tests skip
   [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html
   [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-rkl:          [SKIP][567] ([i915#14544] / [i915#1825]) -> [SKIP][568] ([i915#1825]) +2 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
   [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
    - shard-rkl:          [SKIP][569] ([i915#14544] / [i915#15102] / [i915#3023]) -> [SKIP][570] ([i915#15102] / [i915#3023]) +2 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html
   [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-rkl:          [SKIP][571] ([i915#15102] / [i915#3023]) -> [SKIP][572] ([i915#14544] / [i915#15102] / [i915#3023]) +7 other tests skip
   [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-rkl:          [SKIP][573] ([i915#15709]) -> [SKIP][574] ([i915#14544] / [i915#15709]) +2 other tests skip
   [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-modifier.html
   [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-rkl:          [SKIP][575] ([i915#13958] / [i915#14544]) -> [SKIP][576] ([i915#13958])
   [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html
   [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-rkl:          [SKIP][577] ([i915#12343] / [i915#5354]) -> [SKIP][578] ([i915#12343] / [i915#14544] / [i915#5354])
   [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html
   [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [SKIP][579] ([i915#15128]) -> [SKIP][580] ([i915#15739])
   [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html
   [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          [SKIP][581] ([i915#14544] / [i915#9340]) -> [SKIP][582] ([i915#3828])
   [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html
   [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          [SKIP][583] ([i915#6524]) -> [SKIP][584] ([i915#14544] / [i915#6524])
   [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html
   [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-rkl:          [SKIP][585] ([i915#11520]) -> [SKIP][586] ([i915#11520] / [i915#14544])
   [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-rkl:          [SKIP][587] ([i915#11520] / [i915#14544]) -> [SKIP][588] ([i915#11520]) +1 other test skip
   [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-rkl:          [SKIP][589] ([i915#9683]) -> [SKIP][590] ([i915#14544] / [i915#9683]) +1 other test skip
   [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html
   [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-rkl:          [SKIP][591] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][592] ([i915#1072] / [i915#9732]) +3 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-render.html
   [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          [SKIP][593] ([i915#1072] / [i915#9732]) -> [SKIP][594] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
   [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_psr@fbc-psr2-sprite-render.html
   [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2:          [SKIP][595] ([i915#12755] / [i915#15867]) -> [SKIP][596] ([i915#15867])
   [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html
   [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          [SKIP][597] ([i915#15867]) -> [SKIP][598] ([i915#12755] / [i915#15867])
   [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@module-unload:
    - shard-dg2:          [ABORT][599] ([i915#13029] / [i915#15778]) -> [ABORT][600] ([i915#15778])
   [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-7/igt@perf_pmu@module-unload.html
   [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@perf_pmu@module-unload.html

  
  [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
  [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
  [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
  [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
  [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
  [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
  [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
  [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
  [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
  [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
  [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
  [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
  [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
  [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
  [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
  [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
  [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
  [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
  [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
  [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
  [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
  [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
  [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
  [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
  [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
  [i915#13027]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027
  [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
  [i915#13030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030
  [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
  [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
  [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
  [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
  [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
  [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
  [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
  [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
  [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
  [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
  [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
  [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
  [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
  [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
  [i915#14242]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242
  [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419
  [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
  [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
  [i915#14694]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694
  [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
  [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
  [i915#14888]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888
  [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073
  [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102
  [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104
  [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128
  [i915#15131]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131
  [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132
  [i915#15140]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140
  [i915#15172]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172
  [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243
  [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329
  [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330
  [i915#15342]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342
  [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403
  [i915#15453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453
  [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458
  [i915#15459]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459
  [i915#15479]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479
  [i915#15500]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500
  [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582
  [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638
  [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643
  [i915#15662]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662
  [i915#15678]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678
  [i915#15709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709
  [i915#15722]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722
  [i915#15733]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733
  [i915#15739]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739
  [i915#15752]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752
  [i915#15778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778
  [i915#15815]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815
  [i915#15816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816
  [i915#15840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840
  [i915#15865]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865
  [i915#15867]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867
  [i915#15871]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871
  [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
  [i915#15944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944
  [i915#15948]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948
  [i915#15949]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949
  [i915#15989]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989
  [i915#15990]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990
  [i915#15991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991
  [i915#15997]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997
  [i915#16011]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011
  [i915#16012]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012
  [i915#16021]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021
  [i915#16066]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066
  [i915#16077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077
  [i915#16080]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080
  [i915#16081]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081
  [i915#16084]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084
  [i915#16108]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108
  [i915#16112]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112
  [i915#16166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166
  [i915#16182]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182
  [i915#16184]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184
  [i915#16202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202
  [i915#16236]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236
  [i915#16361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361
  [i915#16386]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386
  [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
  [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
  [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
  [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
  [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
  [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
  [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
  [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
  [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
  [i915#3936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936
  [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
  [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
  [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
  [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
  [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
  [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
  [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
  [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
  [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
  [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
  [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
  [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
  [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
  [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
  [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
  [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
  [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
  [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
  [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
  [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
  [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
  [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
  [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
  [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
  [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
  [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
  [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
  [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
  [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
  [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
  [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
  [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
  [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
  [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
  [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
  [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
  [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
  [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
  [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
  [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
  [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
  [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
  [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
  [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
  [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
  [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
  [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
  [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
  [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
  [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
  [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
  [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
  [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
  [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
  [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
  [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
  [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
  [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
  [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
  [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
  [i915#9979]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8962 -> IGTPW_15362
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_18676: 0739fda8b8a06a8397e98a3c68da956230bc742f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_15362: 15362
  IGT_8962: 8962
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/index.html

--===============1092124008879489686==
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
<tr><td><b>Series:</b></td><td>DC5 DPMS/PSR suspend/resume validation test (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168218/">https://patchwork.freedesktop.org/series/168218/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_18676_full -&gt; IGTPW_15362_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_15362_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_15362_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/index.html</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_15362_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-10/igt@kms_color@gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_color@gamma.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk1/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a></li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a></li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a></li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@crtc-id:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-8/igt@kms_vblank@crtc-id.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_vblank@crtc-id.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_18676_full and IGTPW_15362_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>Statuses : 1 incomplete(s) 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 12.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>Statuses : 1 pass(s) 6 skip(s)</li>
<li>Exec time: [0.0, 4.63] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_15362_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@api_intel_bb@crc32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230">i915#6230</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@device_reset@cold-reset-bound.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078">i915#11078</a>)</li>
</ul>
</li>
<li>
<p>igt@dmabuf@all-tests:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@dmabuf@all-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931">i915#15931</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@drm_buddy@drm_buddy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15678">i915#15678</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_busy@semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3936">i915#3936</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-hostile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334">i915#6334</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@gem_exec_flush@basic-wb-ro-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852">i915#4852</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107">i915#5107</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-3/igt@gem_exec_reloc@basic-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_reloc@basic-write-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_suspend@basic-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860">i915#4860</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_lmem_evict@dontneed-evict-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582">i915#7582</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@gem_lmem_swapping@random-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@gem_lmem_swapping@verify-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289">i915#8289</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_media_vme.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284">i915#284</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@bad-object:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gem_mmap_gtt@bad-object.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-3/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@gem_mmap_offset@clear-via-pagefault.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16021">i915#16021</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16108">i915#16108</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16202">i915#16202</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702">i915#14702</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gem_pxp@hw-rejects-pxp-context.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398">i915#13398</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@read-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@gem_readwrite@read-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_render_copy@yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428">i915#8428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_render_tiled_blits@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-19/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@gem_userptr_blits@relocations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@gen7_exec_parse@bitmasks.html">SKIP</a> +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@gen9_exec_parse@allowed-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +2 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566">i915#5566</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb7/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> +73 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_drm_fdinfo@virtual-busy-hang-all:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@i915_drm_fdinfo@virtual-busy-hang-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118">i915#14118</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@__uc_init:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@i915_module_load@fault-injection@__uc_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15479">i915#15479</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@fault-injection@intel_connector_register:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@i915_module_load@fault-injection@intel_connector_register.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15342">i915#15342</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@i915_module_load@resize-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412">i915#6412</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820">i915#13820</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16080">i915#16080</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16166">i915#16166</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964">i915#12964</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk4/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172">i915#15172</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387">i915#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@i915_suspend@basic-s3-without-i915.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131">i915#15131</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712">i915#12712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14888">i915#14888</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_async_flips@async-flip-suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761">i915#12761</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956">i915#5956</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190">i915#5190</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +138 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538">i915#4538</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> +541 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132">i915#15132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805">i915#12805</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +205 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +4 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655">i915#12655</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9979">i915#9979</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299">i915#3299</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330">i915#15330</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_content_protection@legacy-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173">i915#7173</a>) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865">i915#15865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +3 other tests fail</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814">i915#8814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067">i915#9067</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723">i915#9723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833">i915#9833</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691">i915#13691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749">i915#13749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707">i915#13707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_dsc@dsc-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-bigjoiner:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_dsc@dsc-with-formats-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878">i915#9878</a>)</li>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16084">i915#16084</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337">i915#9337</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_flip@2x-flip-vs-suspend-interruptible@ac-hdmi-a1-hdmi-a2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +8 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +4 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637">i915#3637</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk4/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk4/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810">i915#8810</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813">i915#8813</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_flip_scaled_crc@flip-p010-4tile-to-p016-4tile.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> +58 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-stridechange:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> +19 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439">i915#5439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +41 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +4 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766">i915#9766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104">i915#15104</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> +116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991">i915#15991</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@bpc-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_hdr@bpc-switch-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-13/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +5 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@bpc-switch@pipe-a-hdmi-a-1-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012">i915#16012</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-4-xrgb2101010:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-18/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-4-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-1-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011">i915#16011</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458">i915#15458</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688">i915#13688</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459">i915#15459</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638">i915#15638</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722">i915#15722</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15815">i915#15815</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301">i915#6301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712">i915#14712</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-15/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16386">i915#16386</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16112">i915#16112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178">i915#12178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862">i915#7862</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169">i915#12169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177">i915#12177</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647">i915#10647</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953">i915#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329">i915#15329</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812">i915#9812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752">i915#15752</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15948">i915#15948</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430">i915#8430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403">i915#15403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_pm_rpm@pc8-residency.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk11/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808">i915#9808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316">i915#12316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-glk10:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk10/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +29 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-4/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-mmap-gtt@edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@kms_psr@psr-primary-mmap-gtt@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688">i915#9688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949">i915#15949</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15500">i915#15500</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16184">i915#16184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-17/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289">i915#5289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_selftest@drm_framebuffer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179">i915#13179</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623">i915#8623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276">i915#12276</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243">i915#15243</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920">i915#11920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-14/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906">i915#9906</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-accuracy-98@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-9/igt@perf_pmu@busy-accuracy-98@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-7/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349">i915#4349</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-all-gts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516">i915#8516</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-6/igt@prime_vgem@basic-fence-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@prime_vgem@fence-write-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708">i915#3708</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf@vf-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16066">i915#16066</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917">i915#9917</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-4/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15871">i915#15871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-7/igt@gem_exec_big@single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270">i915#4270</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586">i915#14586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-5/igt@i915_power@sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-5/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@i915_selftest@live.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_selftest@live.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-1/igt@i915_selftest@live@gem_contexts.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16077">i915#16077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk9/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16182">i915#16182</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817">i915#4817</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-1/igt@i915_suspend@sysfs-reader.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15140">i915#15140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662">i915#15662</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-6/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566">i915#13566</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733">i915#15733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-3/igt@kms_cursor_crc@cursor-random-128x128@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-snb5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027">i915#13027</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-snb1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-vga1-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-10/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15840">i915#15840</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbchdr-tiling-linear.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989">i915#15989</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-pri-indfb-multidraw.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk1/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13030">i915#13030</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-5/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026">i915#13026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073">i915#15073</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-16/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-3/igt@kms_pm_rpm@system-suspend-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-1/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419">i915#14419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@all-busy-idle-check-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-mtlp-2/igt@perf_pmu@all-busy-idle-check-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15453">i915#15453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-mtlp-8/igt@perf_pmu@all-busy-idle-check-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@perf_pmu@most-busy-check-all@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15997">i915#15997</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-3/igt@perf_pmu@most-busy-check-all@bcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk4/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356">i915#13356</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14242">i915#14242</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16236">i915#16236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk6/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_basic@multigpu-create-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323">i915#9323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280">i915#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_balancer@parallel-keep-in-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_big@single:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-8/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15944">i915#15944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-7/igt@gem_exec_big@single.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15816">i915#15816</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282">i915#3282</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@i915_pm_freq_api@freq-reset-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531">i915#9531</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638">i915#3638</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313">i915#12313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk3/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14694">i915#14694</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582">i915#15582</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098">i915#14098</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095">i915#6095</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742">i915#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049">i915#13049</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16361">i915#16361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16081">i915#16081</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934">i915#9934</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113">i915#6113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643">i915#15643</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990">i915#15990</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708">i915#8708</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825">i915#1825</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102">i915#15102</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023">i915#3023</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-5/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709">i915#15709</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958">i915#13958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343">i915#12343</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354">i915#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-tglu-6/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15128">i915#15128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739">i915#15739</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340">i915#9340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524">i915#6524</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520">i915#11520</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683">i915#9683</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-8/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-rkl-8/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-rkl-6/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544">i915#14544</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732">i915#9732</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755">i915#12755</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867">i915#15867</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18676/shard-dg2-7/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029">i915#13029</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15362/shard-dg2-8/igt@perf_pmu@module-unload.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778">i915#15778</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8962 -&gt; IGTPW_15362</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_18676: 0739fda8b8a06a8397e98a3c68da956230bc742f @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_15362: 15362<br />
  IGT_8962: 8962<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============1092124008879489686==--
