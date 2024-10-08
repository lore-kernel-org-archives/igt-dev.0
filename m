Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D877CF042C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 23:29:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD9B10E264;
	Tue,  8 Oct 2024 23:29:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201810E264;
 Tue,  8 Oct 2024 23:29:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0671104006361303647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Fi=2ECI=2EIGT=3A_failure_for_tests/intel/xe=5Foa=3A_Prev?=
 =?utf-8?q?enting_test_failures_by_omitting_rc6_disable_test_if_=27gtidle=27?=
 =?utf-8?q?_node_is_missing_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Soham Purkait" <soham.purkait@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 08 Oct 2024 23:29:28 -0000
Message-ID: <172843016818.1206493.7596979428523017141@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007190541.141470-1-soham.purkait@intel.com>
In-Reply-To: <20241007190541.141470-1-soham.purkait@intel.com>
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

--===============0671104006361303647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/xe_oa: Preventing test failures by omitting rc6 disable test if 'gtidle' node is missing (rev2)
URL   : https://patchwork.freedesktop.org/series/139608/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_15487_full -> IGTPW_11883_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_11883_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_11883_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/index.html

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): shard-glk 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_11883_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg1:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-tglu:         NOTRUN -> [FAIL][2] +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_flip@modeset-vs-vblank-race.html

  
#### Warnings ####

  * igt@i915_selftest@mock:
    - shard-snb:          [DMESG-WARN][3] ([i915#9311]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_selftest@mock.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@i915_selftest@mock.html

  
Known issues
------------

  Here are the changes found in IGTPW_11883_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg1:          NOTRUN -> [SKIP][5] ([i915#8411])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@crc32:
    - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#6230])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@api_intel_bb@crc32.html
    - shard-dg1:          NOTRUN -> [SKIP][7] ([i915#6230])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@api_intel_bb@crc32.html

  * igt@drm_fdinfo@busy-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#8414]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@drm_fdinfo@busy-check-all@vecs1.html

  * igt@drm_fdinfo@isolation:
    - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#8414]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@drm_fdinfo@isolation.html

  * igt@drm_fdinfo@virtual-busy-idle-all:
    - shard-mtlp:         NOTRUN -> [SKIP][10] ([i915#8414])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-idle-all.html

  * igt@gem_busy@semaphore:
    - shard-dg1:          NOTRUN -> [SKIP][11] ([i915#3936])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_busy@semaphore.html
    - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3936])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gem_busy@semaphore.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#9323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#9323]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][16] -> [INCOMPLETE][17] ([i915#7297]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@gem_ccs@suspend-resume.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_ccs@suspend-resume.html

  * igt@gem_compute@compute-square:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#9310])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_compute@compute-square.html

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-mtlp:         NOTRUN -> [SKIP][19] ([i915#6335])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html
    - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#6335])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html

  * igt@gem_create@create-ext-set-pat:
    - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#8562])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_engines@invalid-engines:
    - shard-rkl:          [PASS][22] -> [FAIL][23] ([i915#12027])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_ctx_engines@invalid-engines.html
    - shard-tglu:         [PASS][24] -> [FAIL][25] ([i915#12027])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#8555])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
    - shard-mtlp:         NOTRUN -> [SKIP][27] ([i915#8555])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][28] ([i915#8555])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][29] ([i915#1099])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglu:         [PASS][30] -> [FAIL][31] ([i915#11837])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-4/igt@gem_ctx_persistence@smoketest.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#280])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@gem_ctx_sseu@engines.html
    - shard-tglu:         NOTRUN -> [SKIP][33] ([i915#280])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-rkl:          NOTRUN -> [SKIP][34] ([i915#4525]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4473] / [i915#4771])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         NOTRUN -> [FAIL][36] ([i915#2842]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          NOTRUN -> [FAIL][37] ([i915#2842]) +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_fair@basic-pace:
    - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#3539])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_exec_fair@basic-pace.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [PASS][39] -> [FAIL][40] ([i915#2842]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html
    - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#3539] / [i915#4852]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_reloc@basic-gtt-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#3281]) +12 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281]) +5 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_exec_reloc@basic-write-read.html
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#3281]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3281]) +9 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@deep@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][48] ([i915#4537])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@gem_exec_schedule@deep@rcs0.html

  * igt@gem_exec_schedule@pi-ringfull@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][49] ([i915#12296]) +5 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_exec_schedule@pi-ringfull@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html

  * igt@gem_exec_schedule@semaphore-power:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#7276])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html
    - shard-dg1:          NOTRUN -> [SKIP][52] ([i915#4812])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html
    - shard-mtlp:         NOTRUN -> [SKIP][53] ([i915#4537] / [i915#4812]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_exec_schedule@u-fairslice-all:
    - shard-dg2:          [PASS][54] -> [INCOMPLETE][55] ([i915#11896])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_exec_schedule@u-fairslice-all.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_exec_schedule@u-fairslice-all.html

  * igt@gem_exec_suspend@basic-s4-devices:
    - shard-dg2:          [PASS][56] -> [ABORT][57] ([i915#7975] / [i915#8213]) +1 other test abort
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-rkl:          NOTRUN -> [ABORT][58] ([i915#7975] / [i915#8213]) +1 other test abort
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html
    - shard-dg1:          [PASS][59] -> [ABORT][60] ([i915#7975] / [i915#8213]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices.html

  * igt@gem_fenced_exec_thrash@no-spare-fences:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4860])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-mtlp:         NOTRUN -> [SKIP][62] ([i915#4860]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#4860]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@gem_lmem_swapping@massive-random.html
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#4613]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4613]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4077]) +8 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4077]) +6 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@hang-busy:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4077]) +6 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_mmap_gtt@hang-busy.html

  * igt@gem_mmap_wc@read:
    - shard-mtlp:         NOTRUN -> [SKIP][70] ([i915#4083]) +3 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@write-read:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#4083]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_mmap_wc@write-read.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4083]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#3282]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pread@exhaustion:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#3282]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_pread@exhaustion.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3282]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_pread@snoop.html
    - shard-rkl:          NOTRUN -> [SKIP][76] ([i915#3282]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@gem_pread@snoop.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         NOTRUN -> [SKIP][77] ([i915#4270]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#4270]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4270]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-mtlp:         NOTRUN -> [SKIP][81] ([i915#4270]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8428]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +8 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([i915#4885])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4885])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4885])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#3297]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#3282] / [i915#3297])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@gem_userptr_blits@forbidden-operations.html
    - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#3282] / [i915#3297])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#3282] / [i915#3297])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#3282] / [i915#3297])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3297])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4880]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4880])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#3297])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3297])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html
    - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#3297])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#2527] / [i915#2856]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527]) +4 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#2527]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#2856])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][104] -> [ABORT][105] ([i915#10131] / [i915#10887] / [i915#9820])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-tglu:         NOTRUN -> [SKIP][106] ([i915#6412])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@i915_module_load@resize-bar.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#7091])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#8436])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#8399])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_freq_api@freq-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#8399])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglu:         NOTRUN -> [WARN][111] ([i915#2681]) +1 other test warn
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-snb:          [PASS][112] -> [ABORT][113] ([i915#11703])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_selftest@mock@sanitycheck.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@i915_selftest@mock@sanitycheck.html

  * igt@intel_hwmon@hwmon-read:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#7707])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@intel_hwmon@hwmon-read.html
    - shard-tglu:         NOTRUN -> [SKIP][115] ([i915#7707])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-6/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4215] / [i915#5190])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4215])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#8709]) +7 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#6228])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][120] ([i915#6228])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_interruptible@legacy-setmode:
    - shard-dg2:          NOTRUN -> [SKIP][121] ([i915#9197]) +15 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic_interruptible@legacy-setmode.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#1769] / [i915#3555])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#1769] / [i915#3555])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-mtlp:         [PASS][124] -> [FAIL][125] ([i915#11808] / [i915#5956]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#5286]) +7 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> [SKIP][127] +15 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-tglu:         NOTRUN -> [SKIP][128] ([i915#5286]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][129] -> [FAIL][130] ([i915#5138])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#4538] / [i915#5286]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#5286])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3638])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#5190] / [i915#9197]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4538] / [i915#5190]) +8 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][136] ([i915#3638]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#5190])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#4538]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#4423] / [i915#6095])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][140] ([i915#12313])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +34 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][142] ([i915#6095]) +34 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
    - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#10307] / [i915#6095]) +164 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#12313]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#12313]) +2 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][146] ([i915#12313])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#6095]) +103 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#12313])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#6095]) +120 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3742])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_cdclk@plane-scaling.html
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#3742])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][153] +19 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7828]) +5 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#7828]) +8 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-tglu:         NOTRUN -> [SKIP][156] ([i915#7828]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#7828]) +9 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#7828]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#3299])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#3116])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          NOTRUN -> [SKIP][161] ([i915#3299]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglu:         NOTRUN -> [SKIP][162] ([i915#3116] / [i915#3299])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-mtlp:         NOTRUN -> [SKIP][163] ([i915#3299])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#7118])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_content_protection@srm.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7116])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_content_protection@srm.html
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6944])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#7118] / [i915#9424])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_content_protection@type1.html
    - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#7118] / [i915#9424])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_content_protection@type1.html
    - shard-dg1:          NOTRUN -> [SKIP][169] ([i915#7116] / [i915#9424])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_content_protection@type1.html
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_content_protection@type1.html
    - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#3555] / [i915#6944] / [i915#9424])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][172] ([i915#8814])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#11453]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#11453])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#3555] / [i915#8814]) +2 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#3555]) +7 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#3555]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#11453])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][179] ([i915#9809]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][180] +38 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-snb:          [PASS][181] -> [SKIP][182] +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#4103]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#4103]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][185] ([i915#4103] / [i915#4213])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-mtlp:         NOTRUN -> [SKIP][186] ([i915#4213])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#9723])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#3555] / [i915#3804])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#3804])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#8812])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3840])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#3555] / [i915#3840])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3555] / [i915#3840])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#1839])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_feature_discovery@display-4x.html
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#1839])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_feature_discovery@display-4x.html
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#1839])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#658])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-dg2:          NOTRUN -> [SKIP][198] ([i915#8381])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences.html
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#8381])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#9934]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#3637]) +6 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#3637]) +4 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-dg1:          [PASS][203] -> [DMESG-WARN][204] ([i915#4423])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-14/igt@kms_flip@plain-flip-interruptible.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-mtlp:         [PASS][205] -> [FAIL][206] ([i915#10826])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-dg2:          NOTRUN -> [FAIL][207] ([i915#2122])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4:
    - shard-dg1:          [PASS][208] -> [FAIL][209] ([i915#2122]) +1 other test fail
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:
    - shard-mtlp:         [PASS][210] -> [FAIL][211] ([i915#2122]) +3 other tests fail
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:
    - shard-snb:          [PASS][212] -> [FAIL][213] ([i915#2122]) +7 other tests fail
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:
    - shard-tglu:         [PASS][214] -> [FAIL][215] ([i915#2122]) +5 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#2672] / [i915#3555]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#2587] / [i915#2672]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2672] / [i915#3555]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][219] ([i915#2672]) +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#2587] / [i915#2672] / [i915#3555])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-tglu:         NOTRUN -> [SKIP][222] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#2587] / [i915#2672]) +4 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#2672]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#2672] / [i915#3555]) +2 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
    - shard-mtlp:         NOTRUN -> [SKIP][226] ([i915#3555] / [i915#8813])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#8810])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([i915#2672]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#2672] / [i915#3555]) +5 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#2672] / [i915#3555]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][232] -> [SKIP][233] ([i915#5354]) +15 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#5354]) +36 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#8708]) +18 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#1825]) +41 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#5439])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3023]) +23 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#3458]) +5 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-dg1:          NOTRUN -> [SKIP][240] +35 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#8708]) +6 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#8708]) +21 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3458]) +10 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#10433] / [i915#3458])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#1825]) +18 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:
    - shard-tglu:         NOTRUN -> [SKIP][246] +59 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#6118])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          [PASS][248] -> [SKIP][249] ([i915#3555] / [i915#8228])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@invalid-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#3555] / [i915#8228])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-dg2:          [PASS][251] -> [SKIP][252] ([i915#3555]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-8/igt@kms_invalid_mode@int-max-clock.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][253] ([i915#10656]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#10656])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg1:          NOTRUN -> [SKIP][255] ([i915#10656]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#10656]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#10656]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#6301])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#6301])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#7294])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-dg2:          [PASS][261] -> [SKIP][262] ([i915#7294])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#8821])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8821])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#3555] / [i915#8821])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#3555]) +7 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html
    - shard-tglu:         NOTRUN -> [SKIP][267] ([i915#3555]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#12247]) +16 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
    - shard-dg2:          [PASS][269] -> [SKIP][270] ([i915#3555] / [i915#8152] / [i915#9423])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:
    - shard-dg2:          [PASS][271] -> [SKIP][272] ([i915#12247] / [i915#8152])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:
    - shard-dg2:          [PASS][273] -> [SKIP][274] ([i915#8152]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-dg2:          [PASS][275] -> [SKIP][276] ([i915#8152] / [i915#9423]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:
    - shard-dg2:          [PASS][277] -> [SKIP][278] ([i915#12247]) +11 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#12247] / [i915#6953]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][280] ([i915#12247] / [i915#6953])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-tglu:         NOTRUN -> [SKIP][281] ([i915#12247]) +7 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#12247] / [i915#6953] / [i915#9423])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
    - shard-rkl:          NOTRUN -> [SKIP][283] ([i915#12247] / [i915#6953])
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#12247]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#6953])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:
    - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#12247] / [i915#8152])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-dg2:          [PASS][288] -> [SKIP][289] ([i915#6953] / [i915#8152] / [i915#9423])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#12247] / [i915#3555] / [i915#9423])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#12247] / [i915#3555])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#12247]) +10 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#12247] / [i915#6953])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#12247]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
    - shard-snb:          NOTRUN -> [SKIP][295] +89 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg1:          NOTRUN -> [SKIP][296] ([i915#9685])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#5978])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_pm_dc@dc6-dpms.html
    - shard-rkl:          NOTRUN -> [SKIP][298] ([i915#3361])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-tglu:         [PASS][299] -> [SKIP][300] ([i915#4281])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#8430])
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][302] ([i915#9519]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#9519])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [PASS][304] -> [SKIP][305] ([i915#9519]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2:          [PASS][306] -> [SKIP][307] ([i915#9519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2:          [PASS][308] -> [SKIP][309] +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_pm_rpm@i2c.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][310] ([i915#9519])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][311] ([i915#9519])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-tglu:         NOTRUN -> [SKIP][312] ([i915#6524])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#6524] / [i915#6805]) +1 other test skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_prime@d3hot:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#6524])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_prime@d3hot.html
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#6524])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#11520]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-rkl:          NOTRUN -> [SKIP][317] ([i915#11520]) +7 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
    - shard-snb:          NOTRUN -> [SKIP][318] ([i915#11520])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#12316]) +6 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#9808]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-tglu:         NOTRUN -> [SKIP][321] ([i915#11520]) +5 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-dg1:          NOTRUN -> [SKIP][322] ([i915#11520]) +5 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#9683]) +1 other test skip
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#9683])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_psr2_su@page_flip-nv12.html
    - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#4348])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][326] ([i915#1072] / [i915#9732]) +17 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#9688]) +19 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9732]) +12 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#1072] / [i915#9732]) +20 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#1072] / [i915#9732]) +21 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_psr@psr2-sprite-mmap-cpu.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#5289])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#5289])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#5289]) +1 other test skip
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][334] ([i915#11131])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-mtlp:         NOTRUN -> [SKIP][335] ([i915#11131])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][336] ([i915#3555] / [i915#8809] / [i915#8823])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][337] ([i915#3555] / [i915#8809]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> [FAIL][338] ([IGT#2])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2:          [PASS][339] -> [SKIP][340] ([i915#9197]) +35 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#3555] / [i915#9906])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#8808] / [i915#9906])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([i915#9906]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-rkl:          NOTRUN -> [SKIP][344] ([i915#9906]) +3 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-tglu:         NOTRUN -> [SKIP][345] ([i915#9906])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][346] ([i915#2437])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#2437])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#2437] / [i915#9412])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][349] ([i915#2437] / [i915#9412])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@global-sseu-config-invalid:
    - shard-mtlp:         NOTRUN -> [SKIP][350] ([i915#7387])
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@perf@global-sseu-config-invalid.html
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#7387])
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@perf@global-sseu-config-invalid.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#2433])
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][353] -> [FAIL][354] ([i915#4349]) +3 other tests fail
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html
    - shard-mtlp:         [PASS][355] -> [FAIL][356] ([i915#4349]) +4 other tests fail
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [PASS][357] -> [FAIL][358] ([i915#4349]) +5 other tests fail
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-dg2:          NOTRUN -> [WARN][359] ([i915#9351])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_mmap@test_aperture_limit.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          NOTRUN -> [CRASH][360] ([i915#9351])
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][361] ([i915#3291] / [i915#3708])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@coherency-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][362] ([i915#3708] / [i915#4077])
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_vgem@coherency-gtt.html
    - shard-dg1:          NOTRUN -> [SKIP][363] ([i915#3708] / [i915#4077])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@prime_vgem@coherency-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#3708] / [i915#4077])
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@prime_vgem@coherency-gtt.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> [SKIP][365] ([i915#3708])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@prime_vgem@fence-flip-hang.html
    - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#3708])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][367] ([i915#3708])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@prime_vgem@fence-flip-hang.html

  * igt@sriov_basic@bind-unbind-vf:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#9917])
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@sriov_basic@bind-unbind-vf.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-tglu:         NOTRUN -> [SKIP][369] ([i915#9917])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-dg1:          NOTRUN -> [FAIL][370] ([i915#9781])
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-dg1:          [INCOMPLETE][371] -> [PASS][372] +1 other test pass
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-15/igt@gem_ctx_persistence@legacy-engines-persistence.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_eio@suspend:
    - shard-dg2:          [DMESG-FAIL][373] -> [PASS][374]
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@gem_eio@suspend.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@nop:
    - shard-mtlp:         [DMESG-WARN][375] -> [PASS][376]
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-3/igt@gem_exec_balancer@nop.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_exec_balancer@nop.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-rkl:          [FAIL][377] ([i915#2846]) -> [PASS][378]
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [ABORT][379] ([i915#11703]) -> [PASS][380]
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_module_load@reload-no-display.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb7/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-dg1:          [FAIL][381] ([i915#3591]) -> [PASS][382] +1 other test pass
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rps@waitboost:
    - shard-dg2:          [FAIL][383] -> [PASS][384] +1 other test pass
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@i915_pm_rps@waitboost.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@i915_pm_rps@waitboost.html
    - shard-dg1:          [FAIL][385] -> [PASS][386]
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@i915_pm_rps@waitboost.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@i915_pm_rps@waitboost.html

  * igt@i915_power@sanity:
    - shard-mtlp:         [SKIP][387] ([i915#7984]) -> [PASS][388]
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-8/igt@i915_power@sanity.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@i915_power@sanity.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [INCOMPLETE][389] ([i915#4817]) -> [PASS][390]
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@i915_suspend@forcewake.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@i915_suspend@forcewake.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-dg2:          [SKIP][391] ([i915#9197]) -> [PASS][392] +32 other tests pass
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_cursor_crc@cursor-random-256x256.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-snb:          [SKIP][393] -> [PASS][394] +2 other tests pass
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-snb:          [FAIL][395] ([i915#2122]) -> [PASS][396] +5 other tests pass
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2:          [SKIP][397] ([i915#5354]) -> [PASS][398] +12 other tests pass
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_flip@flip-vs-suspend.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
    - shard-dg2:          [SKIP][399] ([i915#3555]) -> [PASS][400] +3 other tests pass
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          [FAIL][401] ([i915#6880]) -> [PASS][402]
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          [SKIP][403] ([i915#3555] / [i915#8228]) -> [PASS][404]
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-dg2:          [SKIP][405] ([i915#7294]) -> [PASS][406]
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:
    - shard-dg2:          [SKIP][407] ([i915#8152] / [i915#9423]) -> [PASS][408] +1 other test pass
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:
    - shard-dg2:          [SKIP][409] ([i915#12247]) -> [PASS][410] +17 other tests pass
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-dg2:          [SKIP][411] ([i915#3555] / [i915#8152] / [i915#9423]) -> [PASS][412]
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:
    - shard-dg2:          [SKIP][413] ([i915#8152]) -> [PASS][414] +2 other tests pass
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
    - shard-dg2:          [SKIP][415] ([i915#12247] / [i915#8152]) -> [PASS][416] +2 other tests pass
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2:          [SKIP][417] ([i915#12247] / [i915#8152] / [i915#9423]) -> [PASS][418] +1 other test pass
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-dg2:          [SKIP][419] ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -> [PASS][420]
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2:          [SKIP][421] ([i915#9340]) -> [PASS][422]
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2:          [SKIP][423] ([i915#1849]) -> [PASS][424]
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_pm_rpm@cursor.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2:          [SKIP][425] ([i915#9519]) -> [PASS][426]
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [SKIP][427] ([i915#9519]) -> [PASS][428] +1 other test pass
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-dg2:          [SKIP][429] ([i915#11521]) -> [PASS][430]
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_properties@crtc-properties-legacy.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_setmode@basic:
    - shard-tglu:         [FAIL][431] ([i915#5465]) -> [PASS][432] +2 other tests pass
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-5/igt@kms_setmode@basic.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][433] ([i915#5465]) -> [PASS][434] +2 other tests pass
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  
#### Warnings ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg1:          [ABORT][435] ([i915#11814]) -> [ABORT][436] ([i915#11814] / [i915#11815])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html

  * igt@gem_eio@kms:
    - shard-dg2:          [FAIL][437] ([i915#5784]) -> [SKIP][438] ([i915#9197])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_eio@kms.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_eio@kms.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          [SKIP][439] ([i915#9531]) -> [SKIP][440] ([i915#9197])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          [SKIP][441] ([i915#1769] / [i915#3555]) -> [SKIP][442] ([i915#9197])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2:          [SKIP][443] -> [SKIP][444] ([i915#9197]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2:          [SKIP][445] ([i915#9197]) -> [SKIP][446] +1 other test skip
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-90.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/index.html

--===============0671104006361303647==
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
<tr><td><b>Series:</b></td><td>tests/intel/xe_oa: Preventing test failures by omitting rc6 disable test if &#x27;gtidle&#x27; node is missing (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139608/">https://patchwork.freedesktop.org/series/139608/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_15487_full -&gt; IGTPW_11883_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_11883_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_11883_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/index.html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): shard-glk </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_11883_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_flip@modeset-vs-vblank-race.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@i915_selftest@mock:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_selftest@mock.html">DMESG-WARN</a> ([i915#9311]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@i915_selftest@mock.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11883_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411])</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@api_intel_bb@crc32.html">SKIP</a> ([i915#6230])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@drm_fdinfo@busy-check-all@vecs1.html">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@drm_fdinfo@isolation.html">SKIP</a> ([i915#8414]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle-all:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@drm_fdinfo@virtual-busy-idle-all.html">SKIP</a> ([i915#8414])</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> ([i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@gem_compute@compute-square:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_compute@compute-square.html">SKIP</a> ([i915#9310])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_create@create-ext-cpu-access-big.html">SKIP</a> ([i915#6335])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@invalid-engines:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-4/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-3/igt@gem_ctx_engines@invalid-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@gem_ctx_engines@invalid-engines.html">FAIL</a> ([i915#12027])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb7/igt@gem_ctx_persistence@legacy-engines-hostile.html">SKIP</a> ([i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-4/igt@gem_ctx_persistence@smoketest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@gem_ctx_persistence@smoketest.html">FAIL</a> ([i915#11837])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_exec_fair@basic-none.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> ([i915#2842]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_exec_fair@basic-pace.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-cpu.html">SKIP</a> ([i915#3281]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gem_exec_reloc@basic-write-read.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@deep@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@gem_exec_schedule@deep@rcs0.html">SKIP</a> ([i915#4537])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@pi-ringfull@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_exec_schedule@pi-ringfull@rcs0.html">FAIL</a> ([i915#12296]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#7276])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4812])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_exec_schedule@u-fairslice-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_exec_schedule@u-fairslice-all.html">INCOMPLETE</a> ([i915#11896])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@gem_exec_suspend@basic-s4-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@gem_exec_suspend@basic-s4-devices.html">ABORT</a> ([i915#7975] / [i915#8213]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +2 other tests skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@gem_fenced_exec_thrash@no-spare-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@gem_lmem_swapping@massive-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_mmap_gtt@hang-busy.html">SKIP</a> ([i915#4077]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_mmap_wc@read.html">SKIP</a> ([i915#4083]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gem_mmap_wc@write-read.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_pread@exhaustion.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +4 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@gem_pxp@verify-pxp-stale-ctx-execution.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_render_copy@y-tiled.html">SKIP</a> ([i915#8428]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@gem_userptr_blits@forbidden-operations.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> ([i915#3297] / [i915#4880]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@gen9_exec_parse@bb-oversize.html">SKIP</a> ([i915#2527]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@gen9_exec_parse@unaligned-access.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> ([i915#10131] / [i915#10887] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#8436])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-10/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@i915_pm_freq_api@freq-suspend.html">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_selftest@mock@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@i915_selftest@mock@sanitycheck.html">ABORT</a> ([i915#11703])</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-6/igt@intel_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-4-y-rc-ccs.html">SKIP</a> ([i915#8709]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic_interruptible@legacy-setmode.html">SKIP</a> ([i915#9197]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> ([i915#11808] / [i915#5956]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5286]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> ([i915#5190] / [i915#9197]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> ([i915#3638]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> ([i915#4538]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#4423] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html">SKIP</a> ([i915#10307] / [i915#6095]) +164 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#6095]) +103 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-4.html">SKIP</a> ([i915#6095]) +120 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_chamelium_color@degamma.html">SKIP</a> +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7118])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_content_protection@srm.html">SKIP</a> ([i915#7116])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118] / [i915#9424])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7116] / [i915#9424])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_content_protection@type1.html">SKIP</a> ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_content_protection@type1.html">SKIP</a> ([i915#3555] / [i915#6944] / [i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-17/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> ([i915#11453])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#9809]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> ([i915#9723])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> ([i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_dsc@dsc-with-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@kms_feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> ([i915#9934]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([i915#3637]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-14/igt@kms_flip@plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_flip@plain-flip-interruptible.html">DMESG-WARN</a> ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> ([i915#10826])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-16/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html">FAIL</a> ([i915#2122]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip@wf_vblank-ts-check-interruptible@b-edp1.html">FAIL</a> ([i915#2122]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@kms_flip@wf_vblank-ts-check-interruptible@b-vga1.html">FAIL</a> ([i915#2122]) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip@wf_vblank-ts-check-interruptible@c-hdmi-a1.html">FAIL</a> ([i915#2122]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> ([i915#3555] / [i915#8813])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#5354]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([i915#5354]) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#1825]) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> ([i915#5439])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3023]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> ([i915#10433] / [i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#1825]) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-gtt.html">SKIP</a> +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> ([i915#10656]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> ([i915#7294])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555]) +7 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html">SKIP</a> ([i915#12247]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers@pipe-d.html">SKIP</a> ([i915#8152]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">SKIP</a> ([i915#8152] / [i915#9423]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-c.html">SKIP</a> ([i915#12247]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> ([i915#12247]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953] / [i915#9423])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">SKIP</a> ([i915#3555] / [i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-1/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_plane_scaling@planes-upscale-20x20.html">SKIP</a> ([i915#6953] / [i915#8152] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555] / [i915#9423])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb1/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#5978])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-8/igt@kms_pm_lpsp@screens-disabled.html">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#9519]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-7/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_pm_rpm@i2c.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-5/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +8 other tests skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +7 other tests skip</li>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#11520])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> ([i915#12316]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-9/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> ([i915#11520]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#9683])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> ([i915#4348])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-mmap-gtt.html">SKIP</a> ([i915#1072] / [i915#9732]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> ([i915#9688]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-3/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> ([i915#9732]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> ([i915#1072] / [i915#9732]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-2/igt@kms_psr@psr2-sprite-mmap-cpu.html">SKIP</a> ([i915#1072] / [i915#9732]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-12/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#11131])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> ([i915#11131])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> ([i915#3555] / [i915#8809] / [i915#8823])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">SKIP</a> ([i915#9197]) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_vrr@negative-basic.html">SKIP</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> ([i915#8808] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906]) +3 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-15/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config-invalid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-1/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387])</li>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@perf@global-sseu-config-invalid.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> ([i915#4349]) +3 other tests fail</li>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> ([i915#4349]) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-8/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_mmap@test_aperture_limit.html">WARN</a> ([i915#9351])</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> ([i915#9351])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([i915#3708] / [i915#4077])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-1/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-3/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@bind-unbind-vf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@sriov_basic@bind-unbind-vf.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> ([i915#9917])</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@invalid-wait-zero-handles:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@syncobj_wait@invalid-wait-zero-handles.html">FAIL</a> ([i915#9781])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-15/igt@gem_ctx_persistence@legacy-engines-persistence.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-18/igt@gem_ctx_persistence@legacy-engines-persistence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@gem_eio@suspend.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nop:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-3/igt@gem_exec_balancer@nop.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-2/igt@gem_exec_balancer@nop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-5/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb7/igt@i915_module_load@reload-no-display.html">ABORT</a> ([i915#11703]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb7/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@waitboost:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@i915_pm_rps@waitboost.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@i915_pm_rps@waitboost.html">PASS</a> +1 other test pass</li>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-13/igt@i915_pm_rps@waitboost.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-19/igt@i915_pm_rps@waitboost.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-8/igt@i915_power@sanity.html">SKIP</a> ([i915#7984]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-8/igt@i915_power@sanity.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#4817]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@i915_suspend@forcewake.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> ([i915#9197]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_cursor_crc@cursor-random-256x256.html">PASS</a> +32 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-snb6/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_flip@flip-vs-suspend.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_flip@flip-vs-suspend.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">SKIP</a> ([i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-4/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-10/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">SKIP</a> ([i915#7294]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">SKIP</a> ([i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html">SKIP</a> ([i915#12247]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-c.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> ([i915#3555] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">SKIP</a> ([i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">SKIP</a> ([i915#12247] / [i915#8152]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> ([i915#12247] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-11/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">SKIP</a> ([i915#12247] / [i915#3558] / [i915#8152] / [i915#9423]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-1/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> ([i915#9340]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_pm_rpm@cursor.html">SKIP</a> ([i915#1849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_pm_rpm@cursor.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-7/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#9519]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> ([i915#11521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-4/igt@kms_properties@crtc-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-tglu-5/igt@kms_setmode@basic.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-tglu-7/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-mtlp-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> ([i915#5465]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg1-18/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg1-16/igt@device_reset@unbind-reset-rebind.html">ABORT</a> ([i915#11814] / [i915#11815])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@gem_eio@kms.html">FAIL</a> ([i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@gem_eio@kms.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9531]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#1769] / [i915#3555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> ([i915#9197])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-11/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11883/shard-dg2-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([i915#9197]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15487/shard-dg2-2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([i915#9197]) -&gt; [SKIP][446] +1 other test skip</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0671104006361303647==--
