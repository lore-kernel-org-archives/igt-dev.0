Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B72CCF9E9
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 09:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04ED10E328;
	Thu, 26 Sep 2024 09:18:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D36610E328;
 Thu, 26 Sep 2024 09:18:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7473233271605616122=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Ffault=5Fin?=
 =?utf-8?q?jection=3A_Add_new_test_for_fault_injection_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 26 Sep 2024 09:18:14 -0000
Message-ID: <172734229455.1105509.363292424373032324@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923084942.3839098-1-francois.dugast@intel.com>
In-Reply-To: <20240923084942.3839098-1-francois.dugast@intel.com>
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

--===============7473233271605616122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_fault_injection: Add new test for fault injection (rev2)
URL   : https://patchwork.freedesktop.org/series/138923/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15444_full -> IGTPW_11786_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11786_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11786_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-glk-0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11786_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@gem_ctx_engines@invalid-engines.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_exec_schedule@pi-common:
    - shard-tglu:         NOTRUN -> [FAIL][5] +5 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@gem_exec_schedule@pi-common.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-glk:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:
    - shard-dg1:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:
    - shard-dg2:          [PASS][9] -> [SKIP][10] +14 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][11] +25 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][12] +46 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:
    - shard-tglu:         NOTRUN -> [SKIP][13] +43 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][14] +24 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][15] +53 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          [SKIP][16] ([i915#5354]) -> [SKIP][17] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  
New tests
---------

  New tests have been introduced between CI_DRM_15444_full and IGTPW_11786_full:

### New IGT tests (1) ###

  * igt@gem_exec_fence:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_11786_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg1:          NOTRUN -> [SKIP][18] ([i915#8411])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8411])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6230])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@api_intel_bb@crc32.html
    - shard-tglu:         NOTRUN -> [SKIP][21] ([i915#6230])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@api_intel_bb@crc32.html

  * igt@api_intel_bb@object-reloc-keep-cache:
    - shard-rkl:          NOTRUN -> [SKIP][22] ([i915#8411]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#9318])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@busy@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8414]) +12 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@drm_fdinfo@busy@vcs1.html

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-rkl:          NOTRUN -> [FAIL][25] ([i915#12179])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all.html

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][26] ([i915#7742])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#8414]) +17 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-mtlp:         NOTRUN -> [SKIP][28] ([i915#8414]) +14 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#9323])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html
    - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#9323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#9323])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][32] -> [INCOMPLETE][33] ([i915#7297])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][34] ([i915#7697])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html
    - shard-rkl:          NOTRUN -> [SKIP][35] ([i915#7697])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-tglu:         NOTRUN -> [SKIP][36] ([i915#7697])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][37] ([i915#6335])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html
    - shard-dg2:          NOTRUN -> [ABORT][38] ([i915#9846])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#6335])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-tglu:         NOTRUN -> [SKIP][40] ([i915#6335]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg1:          NOTRUN -> [SKIP][41] ([i915#8555])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#8555])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#8555])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@hostile:
    - shard-dg2:          NOTRUN -> [FAIL][44] ([i915#11980])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_persistence@hostile.html
    - shard-dg1:          NOTRUN -> [FAIL][45] ([i915#11980])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_ctx_persistence@hostile.html
    - shard-snb:          NOTRUN -> [SKIP][46] ([i915#1099])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb6/igt@gem_ctx_persistence@hostile.html
    - shard-mtlp:         NOTRUN -> [FAIL][47] ([i915#11980])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][48] ([i915#280]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][49] ([i915#280]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#280])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#280])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#280])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [PASS][53] -> [FAIL][54] ([i915#5784])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-14/igt@gem_eio@reset-stress.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4812]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([i915#4525]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_capture@capture-invisible:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#6334]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_capture@capture-invisible.html
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#6334]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@gem_exec_capture@capture-invisible.html
    - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#6334]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_capture@capture-invisible.html

  * igt@gem_exec_capture@capture-invisible@smem0:
    - shard-glk:          NOTRUN -> [SKIP][60] ([i915#6334]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#6334]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-rkl:          NOTRUN -> [SKIP][62] ([i915#6344])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [PASS][63] -> [FAIL][64] ([i915#2846])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html
    - shard-dg1:          NOTRUN -> [SKIP][65] ([i915#3539] / [i915#4852]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> [FAIL][66] ([i915#2846])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#3539] / [i915#4852]) +7 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_exec_fair@basic-none-rrul.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][68] ([i915#2842]) +5 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][69] ([i915#2842]) +1 other test fail
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-rkl:          [PASS][70] -> [FAIL][71] ([i915#2842]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4473])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4473] / [i915#4771]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html
    - shard-rkl:          NOTRUN -> [FAIL][75] ([i915#2842]) +3 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@gem_exec_fair@basic-throttle.html
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3539]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4812])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_reloc@basic-active:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3281]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@gem_exec_reloc@basic-active.html

  * igt@gem_exec_reloc@basic-cpu-wc-active:
    - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3281]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-wc-active.html

  * igt@gem_exec_reloc@basic-scanout:
    - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3281]) +16 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html

  * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3281]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#4537] / [i915#4812])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4537] / [i915#4812]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#4860]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-threaded-none:
    - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4860]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-threaded-none.html
    - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4860]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_fence_thrash@bo-write-verify-threaded-none.html

  * igt@gem_huc_copy@huc-copy:
    - shard-rkl:          NOTRUN -> [SKIP][87] ([i915#2190])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_huc_copy@huc-copy.html
    - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#2190])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][89] ([i915#4613]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#4613])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify.html
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4613])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][92] ([i915#4613]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#12193])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_lmem_swapping@verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4565])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#3282]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_media_vme:
    - shard-tglu:         NOTRUN -> [SKIP][96] ([i915#284])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_media_vme.html

  * igt@gem_mmap@basic-small-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#4083]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_mmap@basic-small-bo.html

  * igt@gem_mmap_gtt@basic-small-copy-odd:
    - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#4077]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy-odd.html

  * igt@gem_mmap_wc@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4083]) +5 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_mmap_wc@bad-size.html

  * igt@gem_mmap_wc@write-prefaulted:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4083]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_mmap_wc@write-prefaulted.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3282]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][102] ([i915#2658])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk9/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3282]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#4270]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4270]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#4270]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#4270]) +6 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][108] ([i915#4270]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg1:          NOTRUN -> [SKIP][109] ([i915#3282]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#5190] / [i915#8428]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][111] ([i915#8428]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> [SKIP][112] ([i915#4079]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_render_tiled_blits@basic.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4885])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-19/igt@gem_softpin@evict-snoop.html
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4885])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_softpin@evict-snoop.html
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4885])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4077]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@gem_tiled_pread_basic:
    - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#4079]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_tiled_pread_basic.html
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#4079]) +1 other test skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_tiled_pread_basic.html

  * igt@gem_tiling_max_stride:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#4077]) +4 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3297]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3297] / [i915#3323])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][122] ([i915#3323])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#3282] / [i915#3297])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3297] / [i915#4880])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3297] / [i915#4880])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
    - shard-mtlp:         NOTRUN -> [SKIP][126] ([i915#3297]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3297])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#3297]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][129] +112 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#2856])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#2527]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglu:         NOTRUN -> [SKIP][132] ([i915#2527] / [i915#2856]) +8 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_module_load@load:
    - shard-snb:          NOTRUN -> [SKIP][133] ([i915#6227])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb7/igt@i915_module_load@load.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#6227])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@i915_module_load@load.html
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#6227])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@i915_module_load@load.html
    - shard-glk:          NOTRUN -> [SKIP][136] ([i915#6227])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@i915_module_load@load.html
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#6227])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@i915_module_load@load.html

  * igt@i915_module_load@reload-no-display:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][138] ([i915#12092])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#6412])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#8399])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([i915#8399])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#6590]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#6590]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][144] ([i915#6590]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@i915_pm_freq_mult@media-freq@gt1.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][145] -> [FAIL][146] ([i915#3591]) +2 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [PASS][147] -> [SKIP][148] ([i915#7984])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-3/igt@i915_power@sanity.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@i915_power@sanity.html

  * igt@i915_selftest@mock:
    - shard-snb:          NOTRUN -> [DMESG-WARN][149] ([i915#9311]) +1 other test dmesg-warn
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb1/igt@i915_selftest@mock.html
    - shard-tglu:         NOTRUN -> [DMESG-WARN][150] ([i915#9311]) +1 other test dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@i915_selftest@mock.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][151] ([i915#1982] / [i915#9311])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@i915_selftest@mock.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][152] ([i915#9311]) +1 other test dmesg-warn
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][153] ([i915#9311]) +1 other test dmesg-warn
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@i915_selftest@mock@memory_region.html
    - shard-rkl:          NOTRUN -> [DMESG-WARN][154] ([i915#9311]) +1 other test dmesg-warn
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@i915_selftest@mock@memory_region.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][155] ([i915#9311])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@i915_selftest@mock@memory_region.html

  * igt@intel_hwmon@hwmon-write:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#7707])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@intel_hwmon@hwmon-write.html
    - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#7707])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#4212])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#4212])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4212])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#3826])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8709]) +11 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#8709]) +11 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#8709]) +7 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
    - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#8709]) +3 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#8709]) +7 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][167] ([i915#3555])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#9531])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#9531])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_interruptible@atomic-setmode:
    - shard-dg2:          [PASS][170] -> [SKIP][171] ([i915#9197]) +37 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-5/igt@kms_atomic_interruptible@atomic-setmode.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_atomic_interruptible@atomic-setmode.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#1769] / [i915#3555])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][173] ([i915#1769] / [i915#3555])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][174] +16 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][175] ([i915#5286]) +6 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#4538] / [i915#5286]) +3 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([i915#5286]) +5 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3638]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3638]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#5190] / [i915#9197]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#4538] / [i915#5190]) +7 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#4538]) +4 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#6095]) +84 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#6095]) +49 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#12042]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#6095]) +106 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#10307] / [i915#6095]) +186 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#12042])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#12042])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#12042]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
    - shard-tglu:         NOTRUN -> [SKIP][192] ([i915#12042]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][193] +338 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#6095]) +105 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#3742])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#11616] / [i915#7213]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html

  * igt@kms_cdclk@plane-scaling:
    - shard-tglu:         NOTRUN -> [SKIP][197] ([i915#3742])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-c-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#4087]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-c-dp-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#7828]) +12 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#7828]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][201] +19 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#7828]) +13 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#7828]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#7828]) +14 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_color@ctm-max:
    - shard-dg2:          [PASS][205] -> [SKIP][206] ([i915#5354]) +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-5/igt@kms_color@ctm-max.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_color@ctm-max.html

  * igt@kms_content_protection@atomic:
    - shard-dg1:          NOTRUN -> [SKIP][207] ([i915#7116] / [i915#9424]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_content_protection@atomic.html
    - shard-dg2:          NOTRUN -> [TIMEOUT][208] ([i915#7173]) +1 other test timeout
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][209] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][210] ([i915#7118] / [i915#9424]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#6944] / [i915#9424])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#3116]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#3299])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3116] / [i915#3299])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3299])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_content_protection@dp-mst-type-1.html
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#3299])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#9424])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#9424]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_content_protection@mei-interface.html
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#9424])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#6944] / [i915#9424]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#8814])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][222] ([i915#11453])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#11453]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#3555]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-rkl:          NOTRUN -> [SKIP][225] ([i915#11453]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8814]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#9809])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][228] -> [FAIL][229] ([i915#2346])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#4103] / [i915#4213])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#4213])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#4103]) +1 other test skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#4103] / [i915#4213]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#4103]) +2 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#9723])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#9833])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#9723])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
    - shard-dg2:          NOTRUN -> [SKIP][238] ([i915#9833])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_aux_dev:
    - shard-dg2:          [PASS][239] -> [SKIP][240] ([i915#1257])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_dp_aux_dev.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([i915#3555] / [i915#3840]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#3840])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#3840])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#3840])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg1:          NOTRUN -> [SKIP][245] ([i915#3840])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3840])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-mtlp:         NOTRUN -> [SKIP][247] ([i915#3555] / [i915#3840])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_dsc@dsc-with-bpc.html
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#3555] / [i915#3840])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg1:          NOTRUN -> [SKIP][249] ([i915#3555] / [i915#3840]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#3840]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][251] ([i915#3840] / [i915#9053])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg1:          [PASS][252] -> [INCOMPLETE][253] ([i915#9878])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-13/igt@kms_fbcon_fbt@fbc-suspend.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#3955]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#4854])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#1839])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#658]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_feature_discovery@psr1.html
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#658])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#658]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_feature_discovery@psr1.html
    - shard-dg1:          NOTRUN -> [SKIP][260] ([i915#658])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][261] ([i915#3637] / [i915#3966])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][262] ([i915#3637]) +4 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#3637]) +11 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [FAIL][264] ([i915#2122]) +2 other tests fail
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-snb:          NOTRUN -> [FAIL][265] ([i915#2122]) +1 other test fail
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
    - shard-dg1:          NOTRUN -> [FAIL][266] ([i915#2122])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:
    - shard-mtlp:         NOTRUN -> [FAIL][267] ([i915#11989])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-rkl:          NOTRUN -> [FAIL][268] ([i915#2122]) +2 other tests fail
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [PASS][269] -> [FAIL][270] ([i915#2122]) +1 other test fail
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][271] -> [FAIL][272] ([i915#2122]) +4 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][273] ([i915#2672]) +3 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2672] / [i915#3555])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][276] ([i915#2587] / [i915#2672] / [i915#3555])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#2587] / [i915#2672] / [i915#3555])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#2672]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#2587] / [i915#2672]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg2:          [PASS][280] -> [SKIP][281] ([i915#3555]) +1 other test skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#3555] / [i915#8813]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][283] ([i915#3555] / [i915#8810]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#2672] / [i915#3555]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#2672] / [i915#3555])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][286] ([i915#2587] / [i915#2672]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][289] ([i915#2672] / [i915#3555]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#2672]) +5 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1825]) +55 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][292] +40 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#5354]) +43 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][294] +39 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#1825]) +20 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-tglu:         NOTRUN -> [SKIP][296] +117 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#3458]) +12 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#10433] / [i915#3458])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#3023]) +29 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#3458]) +15 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_hdr@bpc-switch:
    - shard-dg2:          [PASS][301] -> [SKIP][302] ([i915#3555] / [i915#8228])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_hdr@bpc-switch.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_hdr@bpc-switch.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#3555] / [i915#8228]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-swap:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8228]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_hdr@static-swap.html
    - shard-mtlp:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@kms_hdr@static-swap.html
    - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_hdr@static-swap.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#6301])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_panel_fitting@legacy.html
    - shard-rkl:          NOTRUN -> [SKIP][308] ([i915#6301])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4:
    - shard-dg1:          [PASS][309] -> [DMESG-WARN][310] ([i915#4423]) +1 other test dmesg-warn
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-16/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4.html

  * igt@kms_plane@pixel-format:
    - shard-dg2:          [PASS][311] -> [SKIP][312] ([i915#8825])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-3/igt@kms_plane@pixel-format.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane@pixel-format.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-dg2:          [PASS][313] -> [SKIP][314] ([i915#7294]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-11/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][315] ([i915#8806])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][316] ([i915#8292]) +1 other test fail
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2:          [PASS][317] -> [SKIP][318] ([i915#8152] / [i915#9423]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][319] ([i915#8152]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#3555]) +10 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
    - shard-dg1:          NOTRUN -> [SKIP][321] ([i915#3555]) +3 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [PASS][322] -> [SKIP][323] ([i915#8152]) +4 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#8152] / [i915#9423]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#6953]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2:          NOTRUN -> [SKIP][326] ([i915#9423])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#6953] / [i915#9423])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#6953]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#6953])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          [PASS][330] -> [SKIP][331] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-dg2:          [PASS][332] -> [SKIP][333] ([i915#6953] / [i915#8152] / [i915#9423])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#3555] / [i915#6953])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-tglu:         NOTRUN -> [SKIP][335] ([i915#9812]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][336] ([i915#5354]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][337] ([i915#5354]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#10139])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html
    - shard-dg2:          NOTRUN -> [SKIP][339] ([i915#5978])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [PASS][340] -> [SKIP][341] ([i915#1849])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-3/igt@kms_pm_rpm@cursor.html
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [PASS][342] -> [SKIP][343] ([i915#9519]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][344] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][345] ([i915#9519]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#9519])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglu:         NOTRUN -> [SKIP][347] ([i915#9519])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#6524])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg1:          NOTRUN -> [SKIP][349] ([i915#6524])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html
    - shard-tglu:         NOTRUN -> [SKIP][350] ([i915#6524]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#6524])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html
    - shard-dg2:          NOTRUN -> [SKIP][352] ([i915#6524] / [i915#6805])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#11521])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#9808]) +5 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([i915#9683])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#9688]) +19 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#9732]) +34 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#1072] / [i915#9732]) +34 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@pr-cursor-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#1072] / [i915#9732]) +20 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_psr@pr-cursor-mmap-gtt.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#1072] / [i915#9732]) +20 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#9685]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg1:          NOTRUN -> [SKIP][362] ([i915#9685]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#9685])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@exhaust-fences:
    - shard-dg1:          NOTRUN -> [SKIP][364] ([i915#4884])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][365] ([i915#4235])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2:          NOTRUN -> [SKIP][366] ([i915#5190]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#5289])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-tglu:         NOTRUN -> [SKIP][368] ([i915#5289])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#5289])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-tglu:         NOTRUN -> [ABORT][370] ([i915#12231]) +1 other test abort
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_sequence@queue-idle:
    - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#9197]) +19 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_sequence@queue-idle.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][372] ([IGT#2])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_sysfs_edid_timing.html
    - shard-dg1:          NOTRUN -> [FAIL][373] ([IGT#2] / [i915#6493])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][374] ([i915#8623]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#8623])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglu:         NOTRUN -> [SKIP][376] ([i915#3555]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_vrr@flip-suspend.html
    - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#3555] / [i915#8808])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-mtlp:         [PASS][378] -> [FAIL][379] ([i915#10393]) +1 other test fail
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-4/igt@kms_vrr@negative-basic.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#9906]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][381] ([i915#9906])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][382] ([i915#9906])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-dg1:          NOTRUN -> [SKIP][383] ([i915#9906])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#8808] / [i915#9906])
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-tglu:         NOTRUN -> [SKIP][385] ([i915#2437] / [i915#9412])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#2437] / [i915#9412])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#2437] / [i915#9412])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#8850])
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@basic-fence-mmap:
    - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#3708] / [i915#4077])
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#3708] / [i915#4077])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html
    - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#3708] / [i915#4077])
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@prime_vgem@basic-fence-mmap.html

  * igt@prime_vgem@basic-write:
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#3291] / [i915#3708])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@prime_vgem@basic-write.html
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#3291] / [i915#3708]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@prime_vgem@basic-write.html

  * igt@syncobj_timeline@invalid-wait-zero-handles:
    - shard-rkl:          NOTRUN -> [FAIL][394] ([i915#9781])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@syncobj_timeline@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-dg2:          [SKIP][395] ([i915#2582]) -> [PASS][396]
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@fbdev@unaligned-write.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [FAIL][397] ([i915#12027]) -> [PASS][398]
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          [ABORT][399] ([i915#10030] / [i915#7975] / [i915#8213]) -> [PASS][400]
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-4/igt@gem_eio@hibernate.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-mtlp:         [INCOMPLETE][401] -> [PASS][402] +2 other tests pass
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-2/igt@gem_eio@reset-stress.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][403] ([i915#5784]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-12/igt@gem_eio@unwedge-stress.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@nop:
    - shard-dg2:          [INCOMPLETE][405] -> [PASS][406] +1 other test pass
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-1/igt@gem_exec_balancer@nop.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_balancer@nop.html
    - shard-dg1:          [INCOMPLETE][407] -> [PASS][408]
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-16/igt@gem_exec_balancer@nop.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][409] ([i915#2842]) -> [PASS][410] +2 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace-share:
    - shard-tglu:         [FAIL][411] ([i915#2842]) -> [PASS][412] +1 other test pass
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-tglu-3/igt@gem_exec_fair@basic-pace-share.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [INCOMPLETE][413] ([i915#11441]) -> [PASS][414]
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][415] ([i915#5566]) -> [PASS][416]
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk6/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-rkl:          [ABORT][417] ([i915#9820]) -> [PASS][418]
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-dg1:          [INCOMPLETE][419] ([i915#2295]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-19/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-glk:          [FAIL][421] ([i915#12238]) -> [PASS][422] +1 other test pass
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition@2x-outputs:
    - shard-glk:          [FAIL][423] ([i915#11859]) -> [PASS][424] +1 other test pass
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@kms_atomic_transition@modeset-transition@2x-outputs.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_atomic_transition@modeset-transition@2x-outputs.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][425] ([i915#5138]) -> [PASS][426] +2 other tests pass
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-dg2:          [SKIP][427] ([i915#9197]) -> [PASS][428] +10 other tests pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][429] ([i915#2122]) -> [PASS][430] +1 other test pass
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2:          [SKIP][431] ([i915#5354]) -> [PASS][432] +2 other tests pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-vga1:
    - shard-snb:          [FAIL][433] ([i915#2122]) -> [PASS][434] +3 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2:          [SKIP][435] ([i915#3555]) -> [PASS][436]
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-snb:          [SKIP][437] -> [PASS][438] +1 other test pass
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          [SKIP][439] ([i915#3555] / [i915#8228]) -> [PASS][440]
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_hdr@static-toggle.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_hdr@static-toggle.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-dg2:          [SKIP][441] ([i915#8152] / [i915#9423]) -> [PASS][442]
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_plane_scaling@invalid-parameters.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/index.html

--===============7473233271605616122==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_fault_injection: Add new test for fault injection (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138923/">https://patchwork.freedesktop.org/series/138923/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15444_full -&gt; IGTPW_11786_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11786_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11786_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-glk-0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11786_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@gem_ctx_engines@invalid-engines.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-common:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@gem_exec_schedule@pi-common.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-c.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-b.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-b.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_15444_full and IGTPW_11786_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@gem_exec_fence:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11786_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-keep-cache:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@debugfs_test@basic-hwmon.html">SKIP</a> ([i915#9318])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@drm_fdinfo@busy@vcs1.html">SKIP</a> ([i915#8414]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all.html">FAIL</a> ([i915#12179])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> ([i915#8414]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#9846])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb6/igt@gem_ctx_persistence@hostile.html">SKIP</a> ([i915#1099])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_ctx_persistence@hostile.html">FAIL</a> ([i915#11980])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-14/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_capture@capture-invisible.html">SKIP</a> ([i915#6334]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@smem0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk1/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@gem_exec_capture@capture-invisible@smem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a> ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@gem_exec_fair@basic-deadline.html">SKIP</a> ([i915#3539] / [i915#4852]) +4 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@gem_exec_fair@basic-none-rrul.html">SKIP</a> ([i915#3539] / [i915#4852]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_exec_fair@basic-sync.html">SKIP</a> ([i915#4473] / [i915#4771]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@gem_exec_fair@basic-throttle.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@gem_exec_reloc@basic-active.html">SKIP</a> ([i915#3281]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-wc-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-wc-active.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-scanout:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_exec_reloc@basic-scanout.html">SKIP</a> ([i915#3281]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-threaded-none:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_fence_thrash@bo-write-verify-threaded-none.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk9/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@gem_madvise@dontneed-before-exec.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@basic-small-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_mmap@basic-small-bo.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy-odd:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy-odd.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_mmap_wc@bad-size.html">SKIP</a> ([i915#4083]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-prefaulted:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_mmap_wc@write-prefaulted.html">SKIP</a> ([i915#4083]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk9/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_pxp@create-regular-context-1.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#8428]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_render_tiled_blits@basic.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-19/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@writes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_tiled_partial_pwrite_pread@writes.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-7/igt@gem_tiled_pread_basic.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@gem_tiling_max_stride.html">SKIP</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3297] / [i915#3323])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> +112 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2527] / [i915#2856]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb7/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk8/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@i915_module_load@load.html">SKIP</a> ([i915#6227])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@i915_module_load@reload-no-display.html">DMESG-WARN</a> ([i915#12092])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@i915_pm_freq_mult@media-freq@gt1.html">SKIP</a> ([i915#6590]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> ([i915#3591]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-3/igt@i915_power@sanity.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@i915_power@sanity.html">SKIP</a> ([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb1/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#1982] / [i915#9311])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311]) +1 other test dmesg-warn</li>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@intel_hwmon@hwmon-write.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-3-4-mc-ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html">SKIP</a> ([i915#8709]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-5/igt@kms_atomic_interruptible@atomic-setmode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_atomic_interruptible@atomic-setmode.html">SKIP</a> ([i915#9197]) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([i915#4538] / [i915#5286]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5286]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#5190] / [i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#4538] / [i915#5190]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#6095]) +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-c-edp-1.html">SKIP</a> ([i915#6095]) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12042]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#6095]) +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#6095]) +186 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12042])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12042]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> +338 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-dp-3.html">SKIP</a> ([i915#11616] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-c-dp-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> ([i915#7828]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_chamelium_color@degamma.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> ([i915#7828]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-max:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-5/igt@kms_color@ctm-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_color@ctm-max.html">SKIP</a> ([i915#5354]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7116] / [i915#9424]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#7173]) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_content_protection@atomic-dpms.html">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_content_protection@content-type-change.html">SKIP</a> ([i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_content_protection@lic-type-0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#6944] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> ([i915#3555] / [i915#8814]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> ([i915#9809])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4213])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> ([i915#9833])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-8/igt@kms_dp_aux_dev.html">SKIP</a> ([i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_dsc@dsc-basic.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> ([i915#3840] / [i915#9053])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-13/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#9878])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> ([i915#3955]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_feature_discovery@psr1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> ([i915#3637] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([i915#3637]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-edp1.html">FAIL</a> ([i915#11989])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">FAIL</a> ([i915#2122]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb2/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb1/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-16/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#5354]) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> ([i915#1825]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> +117 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> ([i915#3023]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_hdr@bpc-switch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_hdr@bpc-switch.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-16/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d-hdmi-a-4.html">DMESG-WARN</a> ([i915#4423]) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-3/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane@pixel-format.html">SKIP</a> ([i915#8825])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-11/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> ([i915#7294]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_plane_multiple@tiling-y.html">SKIP</a> ([i915#8806])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-d.html">SKIP</a> ([i915#8152]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +10 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">SKIP</a> ([i915#8152]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#8152] / [i915#9423]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> ([i915#6953]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> ([i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#6953] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#6953]) +3 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_plane_scaling@planes-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> ([i915#9812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> ([i915#5354]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#10139])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-3/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_pm_rpm@cursor.html">SKIP</a> ([i915#1849])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805])</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_properties@plane-properties-legacy.html">SKIP</a> ([i915#11521])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-render.html">SKIP</a> ([i915#9688]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-3/igt@kms_psr@fbc-psr2-primary-mmap-gtt.html">SKIP</a> ([i915#9732]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> ([i915#1072] / [i915#9732]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_psr@pr-cursor-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_psr@psr2-primary-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@exhaust-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4884])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-5/igt@kms_rotation_crc@exhaust-fences.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5190]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@kms_selftest@drm_framebuffer.html">ABORT</a> ([i915#12231]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@kms_sequence@queue-idle.html">SKIP</a> ([i915#9197]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-18/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2] / [i915#6493])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-9/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-4/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-4/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-3/igt@kms_vrr@negative-basic.html">FAIL</a> ([i915#10393]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-7/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-5/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-mmap:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-8/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-2/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-15/igt@prime_vgem@basic-fence-mmap.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-3/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-wait-zero-handles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-5/igt@syncobj_timeline@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@fbdev@unaligned-write.html">SKIP</a> ([i915#2582]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-5/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-5/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-7/igt@gem_ctx_engines@invalid-engines.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-4/igt@gem_eio@hibernate.html">ABORT</a> ([i915#10030] / [i915#7975] / [i915#8213]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-11/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-2/igt@gem_eio@reset-stress.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-2/igt@gem_eio@reset-stress.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-12/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-14/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-1/igt@gem_exec_balancer@nop.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@gem_exec_balancer@nop.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-16/igt@gem_exec_balancer@nop.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-12/igt@gem_exec_balancer@nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-4/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-tglu-3/igt@gem_exec_fair@basic-pace-share.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-tglu-6/igt@gem_exec_fair@basic-pace-share.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a> ([i915#11441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk6/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk6/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#9820]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg1-19/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">INCOMPLETE</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg1-13/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> ([i915#12238]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition@2x-outputs:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk8/igt@kms_atomic_transition@modeset-transition@2x-outputs.html">FAIL</a> ([i915#11859]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk3/igt@kms_atomic_transition@modeset-transition@2x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_cursor_crc@cursor-alpha-opaque.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-glk6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-glk2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a1-hdmi-a2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb7/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb5/igt@kms_flip@plain-flip-fb-recreate@a-vga1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11786/shard-dg2-10/igt@kms_hdr@static-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15444/shard-dg2-2/igt@kms_plane_scaling@invalid-parameters.">SKIP</a> ([i915#8152] / [i915#9423]) -&gt; [PASS][442]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7473233271605616122==--
