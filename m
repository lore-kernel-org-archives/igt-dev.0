Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D135C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 11:58:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A3510E39E;
	Fri, 17 Jan 2025 11:58:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F26810E39E;
 Fri, 17 Jan 2025 11:58:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0853974781301859564=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Initial_PTL_support_=28r?=
 =?utf-8?q?ev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Clint Taylor" <clinton.a.taylor@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 17 Jan 2025 11:58:34 -0000
Message-ID: <173711511404.701978.14192991678396183767@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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

--===============0853974781301859564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Initial PTL support (rev6)
URL   : https://patchwork.freedesktop.org/series/141325/
State : failure

== Summary ==

CI Bug Log - changes from IGT_8183_full -> IGTPW_12418_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_12418_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_12418_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_12418_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@wide@vcs1:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_exec_schedule@wide@vcs1.html

  * igt@i915_module_load@load:
    - shard-dg2:          ([PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18]) -> ([PASS][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [DMESG-WARN][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36]) ([i915#13368])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-11/igt@i915_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-11/igt@i915_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@i915_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@i915_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@i915_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-1/igt@i915_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@i915_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-1/igt@i915_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@i915_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@i915_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-10/igt@i915_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-10/igt@i915_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@i915_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@i915_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@i915_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@i915_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@i915_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@i915_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@i915_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_module_load@load.html

  * igt@perf_pmu@module-unload:
    - shard-rkl:          [PASS][37] -> [INCOMPLETE][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-1/igt@perf_pmu@module-unload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-6/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@gem_tiled_swapping@non-threaded:
    - shard-rkl:          [FAIL][39] ([i915#12941]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
    - shard-tglu:         [FAIL][41] ([i915#12941]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@gem_tiled_swapping@non-threaded.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-mtlp:         [FAIL][43] ([i915#11989]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  
New tests
---------

  New tests have been introduced between IGT_8183_full and IGTPW_12418_full:

### New IGT tests (77) ###

  * igt@gem_ctx_engines@independent@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.05, 0.21] s

  * igt@gem_ctx_engines@independent@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.05, 0.19] s

  * igt@gem_ctx_engines@independent@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.05, 0.17] s

  * igt@gem_ctx_engines@independent@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.06, 0.16] s

  * igt@gem_ctx_engines@independent@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.05, 0.17] s

  * igt@gem_exec_async@forked-writes:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.33] s

  * igt@gem_exec_async@forked-writes@bcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_async@forked-writes@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_async@forked-writes@vcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.02, 0.07] s

  * igt@gem_exec_async@forked-writes@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_exec_async@forked-writes@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.08] s

  * igt@gem_exec_balancer@fairslice:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 5.23] s

  * igt@gem_exec_balancer@nohangcheck:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.91] s

  * igt@gem_exec_balancer@noheartbeat:
    - Statuses : 2 pass(s) 2 skip(s)
    - Exec time: [0.0, 1.08] s

  * igt@gem_exec_balancer@persistence:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.70] s

  * igt@gem_exec_balancer@sequential:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.82] s

  * igt@gem_exec_create@legacy:
    - Statuses : 6 pass(s)
    - Exec time: [2.06, 4.20] s

  * igt@gem_exec_schedule@fairslice:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 14.14] s

  * igt@gem_exec_schedule@fairslice-all:
    - Statuses : 3 pass(s)
    - Exec time: [2.04, 2.11] s

  * igt@gem_exec_schedule@fairslice@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@fairslice@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@fairslice@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.02] s

  * igt@gem_exec_schedule@preempt-user:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.24] s

  * igt@gem_exec_schedule@preempt-user@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@preempt-user@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.06] s

  * igt@gem_exec_schedule@preempt-user@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@preempt-user@vcs1:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@preempt-user@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-fairslice:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 12.10] s

  * igt@gem_exec_schedule@u-fairslice-all:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.09] s

  * igt@gem_exec_schedule@u-fairslice@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.96, 2.03] s

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [2.01, 2.04] s

  * igt@gem_exec_schedule@u-fairslice@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.97, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [1.99, 2.02] s

  * igt@gem_exec_schedule@u-fairslice@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [1.99, 2.02] s

  * igt@gem_exec_schedule@u-independent:
    - Statuses : 6 pass(s)
    - Exec time: [0.11, 9.75] s

  * igt@gem_exec_schedule@u-independent@rcs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 1.69] s

  * igt@gem_exec_schedule@u-independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.12, 2.08] s

  * igt@gem_exec_schedule@u-independent@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.10, 1.98] s

  * igt@gem_exec_schedule@u-independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.11, 2.06] s

  * igt@gem_exec_schedule@u-lateslice:
    - Statuses : 3 pass(s)
    - Exec time: [0.05, 0.10] s

  * igt@gem_exec_schedule@u-lateslice@bcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01] s

  * igt@gem_exec_schedule@u-lateslice@rcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_schedule@u-lateslice@vcs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_schedule@u-lateslice@vcs1:
    - Statuses : 2 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_schedule@u-lateslice@vecs0:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@gem_exec_schedule@u-semaphore-codependency:
    - Statuses : 4 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@u-semaphore-noskip:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.81] s

  * igt@gem_exec_schedule@u-semaphore-resolve:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.07] s

  * igt@gem_exec_schedule@u-semaphore-user:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.08] s

  * igt@gem_exec_schedule@u-submit-early-slice:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@gem_exec_schedule@u-submit-early-slice@bcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@rcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03, 0.04] s

  * igt@gem_exec_schedule@u-submit-early-slice@vecs0:
    - Statuses : 4 pass(s)
    - Exec time: [0.02, 0.04] s

  * igt@gem_exec_schedule@u-submit-golden-slice:
    - Statuses : 5 pass(s)
    - Exec time: [0.07, 0.20] s

  * igt@gem_exec_schedule@u-submit-golden-slice@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.03] s

  * igt@gem_exec_schedule@u-submit-golden-slice@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.02, 0.05] s

  * igt@gem_exec_schedule@u-submit-late-slice:
    - Statuses : 1 pass(s)
    - Exec time: [0.21] s

  * igt@gem_exec_schedule@u-submit-late-slice@bcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.04] s

  * igt@gem_exec_schedule@u-submit-late-slice@rcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@gem_exec_schedule@u-submit-late-slice@vcs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@gem_exec_schedule@u-submit-late-slice@vecs0:
    - Statuses : 1 pass(s)
    - Exec time: [0.05] s

  * igt@gem_softpin@32b-excludes-last-page:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@gem_softpin@full:
    - Statuses : 4 pass(s)
    - Exec time: [0.01] s

  * igt@gem_softpin@zero:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@gen9_exec_parse@shadow-peek:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@perf@non-zero-reason:
    - Statuses : 1 fail(s) 4 pass(s)
    - Exec time: [2.75, 11.06] s

  * igt@perf_pmu@gt-awake:
    - Statuses : 7 pass(s)
    - Exec time: [2.01, 9.13] s

  * igt@perf_pmu@invalid-open:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@perf_pmu@rc6-suspend:
    - Statuses : 7 pass(s)
    - Exec time: [6.91, 23.34] s

  

Known issues
------------

  Here are the changes found in IGTPW_12418_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#8411]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#11078])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@device_reset@cold-reset-bound.html

  * igt@drm_fdinfo@busy-check-all@ccs0:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#8414]) +6 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

  * igt@drm_fdinfo@busy@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#8414]) +17 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@drm_fdinfo@busy@rcs0.html

  * igt@drm_fdinfo@most-busy-check-all:
    - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#8414]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@drm_fdinfo@most-busy-check-all.html

  * igt@gem_basic@multigpu-create-close:
    - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#7697]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_basic@multigpu-create-close.html
    - shard-tglu:         NOTRUN -> [SKIP][51] ([i915#7697])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3555] / [i915#9323])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][53] ([i915#3555] / [i915#9323])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-dg2:          [PASS][54] -> [INCOMPLETE][55] ([i915#7297]) +1 other test incomplete
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@gem_ccs@suspend-resume.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#7697])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#8562])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][58] ([i915#1099]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb4/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_sseu@engines:
    - shard-rkl:          NOTRUN -> [SKIP][59] ([i915#280])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_ctx_sseu@engines.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#280])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_eio@unwedge-stress:
    - shard-snb:          NOTRUN -> [FAIL][61] ([i915#8898])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@full-pulse:
    - shard-mtlp:         [PASS][62] -> [FAIL][63] ([i915#13364])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-6/igt@gem_exec_balancer@full-pulse.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_exec_balancer@full-pulse.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4036])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_balancer@noheartbeat (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#8555]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
    - shard-tglu-1:       NOTRUN -> [SKIP][66] ([i915#4525])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#4525])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#4525]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@sliced:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#4812]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_balancer@sliced.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][70] +495 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb4/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3711])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-dg1:          NOTRUN -> [SKIP][72] ([i915#3539] / [i915#4852]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#3539])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539] / [i915#4852]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3281]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-gtt-read-noreloc:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3281]) +7 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-read-noreloc.html

  * igt@gem_exec_reloc@basic-write-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#3281]) +13 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.html

  * igt@gem_exec_reloc@basic-write-read:
    - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3281]) +9 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4812]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_exec_schedule@wide:
    - shard-tglu:         NOTRUN -> [INCOMPLETE][80] ([i915#13391])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_exec_schedule@wide.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#4860])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_fence_thrash@bo-write-verify-x:
    - shard-dg1:          NOTRUN -> [SKIP][82] ([i915#4860]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify-x.html
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#4860])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify-x.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglu-1:       NOTRUN -> [SKIP][84] ([i915#2190])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_evict@dontneed-evict-race:
    - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#4613] / [i915#7582])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-race.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#12193])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs.html

  * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4565])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#4613]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#4613]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-glk:          NOTRUN -> [SKIP][90] ([i915#4613]) +5 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][91] ([i915#4613]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#4613]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_madvise@dontneed-before-exec:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#3282]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@gem_madvise@dontneed-before-exec.html

  * igt@gem_mmap_gtt@basic-small-copy:
    - shard-dg1:          NOTRUN -> [SKIP][94] ([i915#4077]) +15 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#4077]) +9 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_mmap_offset@clear-via-pagefault:
    - shard-mtlp:         [PASS][96] -> [ABORT][97] ([i915#10729]) +1 other test abort
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#4083]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][99] ([i915#4083]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
    - shard-dg1:          NOTRUN -> [SKIP][100] ([i915#4083]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html

  * igt@gem_partial_pwrite_pread@write:
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3282]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_partial_pwrite_pread@write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([i915#3282]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#3282]) +8 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][104] ([i915#2658])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#4270]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_pxp@create-valid-protected-context.html
    - shard-rkl:          NOTRUN -> [TIMEOUT][106] ([i915#12964])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@hw-rejects-pxp-context:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([i915#13398])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#13398])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-context.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-rkl:          NOTRUN -> [TIMEOUT][109] ([i915#12917] / [i915#12964]) +2 other tests timeout
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_pxp@verify-pxp-stale-ctx-execution:
    - shard-dg1:          NOTRUN -> [SKIP][110] ([i915#4270]) +4 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-execution.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][111] +400 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8428]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5190] / [i915#8428]) +9 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg2:          NOTRUN -> [SKIP][114] ([i915#4079])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][115] ([i915#8411]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][116] ([i915#4079])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#4885])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][118] ([i915#13306])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#4079]) +2 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#3297]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3297] / [i915#3323])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglu-1:       NOTRUN -> [SKIP][122] ([i915#3297])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@forbidden-operations:
    - shard-rkl:          NOTRUN -> [SKIP][123] ([i915#3282] / [i915#3297])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_userptr_blits@forbidden-operations.html

  * igt@gem_userptr_blits@map-fixed-invalidate:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3297] / [i915#4880])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@gem_userptr_blits@map-fixed-invalidate.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#3297] / [i915#4880])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([i915#3297]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][127] ([i915#3297]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([i915#3297]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@relocations:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#3281] / [i915#3297])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_userptr_blits@relocations.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-rkl:          NOTRUN -> [SKIP][130] ([i915#3297]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][131] +11 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu-1:       NOTRUN -> [SKIP][132] ([i915#2527] / [i915#2856]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-oversize:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#2527]) +6 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#2527]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglu:         NOTRUN -> [SKIP][135] ([i915#2527] / [i915#2856]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@gen9_exec_parse@bb-secure.html
    - shard-mtlp:         NOTRUN -> [SKIP][136] ([i915#2856]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@unaligned-access:
    - shard-dg2:          NOTRUN -> [SKIP][137] ([i915#2856]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@gen9_exec_parse@unaligned-access.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#4881])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_fb_tiling.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          NOTRUN -> [ABORT][139] ([i915#9820])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-dg1:          [PASS][140] -> [ABORT][141] ([i915#13493] / [i915#9820])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#6412])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_freq_api@freq-basic-api:
    - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#8399])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api.html
    - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#8399])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-tglu-1:       NOTRUN -> [SKIP][145] ([i915#6590]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:
    - shard-dg1:          [PASS][146] -> [FAIL][147] ([i915#3591])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          NOTRUN -> [INCOMPLETE][148] ([i915#12797])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-mtlp:         NOTRUN -> [FAIL][149] ([i915#8346])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#11681])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_pm_rps@thresholds.html

  * igt@i915_pm_sseu@full-enable:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#4387])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@i915_pm_sseu@full-enable.html
    - shard-tglu:         NOTRUN -> [SKIP][152] ([i915#4387])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@i915_pm_sseu@full-enable.html

  * igt@i915_power@sanity:
    - shard-rkl:          NOTRUN -> [SKIP][153] ([i915#7984])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@i915_power@sanity.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#5723])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@i915_query@test-query-geometry-subslices.html
    - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#5723])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [PASS][156] -> [DMESG-FAIL][157] ([i915#12061]) +1 other test dmesg-fail
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@i915_selftest@live@workarounds.html

  * igt@i915_selftest@mock:
    - shard-glk:          NOTRUN -> [DMESG-WARN][158] ([i915#1982] / [i915#9311])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@i915_selftest@mock.html

  * igt@i915_selftest@mock@memory_region:
    - shard-glk:          NOTRUN -> [DMESG-WARN][159] ([i915#9311])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@i915_selftest@mock@memory_region.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#4212])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#4215] / [i915#5190])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#8709]) +3 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][163] ([i915#8709]) +7 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#3555])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#9531])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-snb:          NOTRUN -> [SKIP][166] ([i915#1769])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu-1:       NOTRUN -> [SKIP][167] ([i915#5286]) +4 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#5286])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#5286]) +10 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#5286]) +6 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#4538] / [i915#5286]) +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [PASS][172] -> [FAIL][173] ([i915#5138])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][174] ([i915#3638]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg1:          NOTRUN -> [SKIP][175] ([i915#3638]) +4 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg1:          NOTRUN -> [DMESG-WARN][176] ([i915#4423]) +3 other tests dmesg-warn
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#4538] / [i915#5190]) +15 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][178] +12 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4538]) +5 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#6095]) +49 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#12313])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#10307] / [i915#6095]) +103 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#12313])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][184] ([i915#12313])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#6095]) +74 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#12313]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#12805]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#6095]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#6095]) +108 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][190] ([i915#12796]) +3 other tests incomplete
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-rkl:          NOTRUN -> [SKIP][191] ([i915#12313]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#6095]) +29 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#12313])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#6095]) +144 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition:
    - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#7213] / [i915#9010]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_cdclk@mode-transition.html
    - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3742])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cdclk@mode-transition.html
    - shard-dg1:          NOTRUN -> [SKIP][198] ([i915#3742])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#4087]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#11151] / [i915#7828]) +6 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio.html
    - shard-mtlp:         NOTRUN -> [SKIP][201] ([i915#11151] / [i915#7828]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-tglu-1:       NOTRUN -> [SKIP][202] ([i915#11151] / [i915#7828]) +6 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#11151] / [i915#7828]) +8 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#11151] / [i915#7828]) +7 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#11151] / [i915#7828]) +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#7118] / [i915#9424]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3116])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_content_protection@dp-mst-type-0.html
    - shard-tglu:         NOTRUN -> [SKIP][208] ([i915#3116] / [i915#3299])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#7118] / [i915#9424]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#9424])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-tglu:         NOTRUN -> [SKIP][211] ([i915#3555]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#3555] / [i915#8814])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#13049]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#13049])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#13049])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][216] ([i915#13049]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-tglu-1:       NOTRUN -> [SKIP][217] ([i915#3555]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3555]) +4 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-tglu-1:       NOTRUN -> [SKIP][219] ([i915#13049])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-mtlp:         NOTRUN -> [SKIP][220] ([i915#8814])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#13049]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][222] ([i915#9809]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][223] ([i915#4103])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#4103]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - shard-dg1:          [PASS][225] -> [DMESG-WARN][226] ([i915#4423]) +8 other tests dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg1-17/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#13046] / [i915#5354]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
    - shard-tglu-1:       NOTRUN -> [SKIP][228] ([i915#9067])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#9067])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#4103] / [i915#4213]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-snb:          NOTRUN -> [FAIL][231] ([i915#12170])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][232] ([i915#11968])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#8588])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#1769] / [i915#3555] / [i915#3804])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#3804])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([i915#1257])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#12402])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#12402])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#3840])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#3555] / [i915#3840])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html
    - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#3555] / [i915#3840])
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#3555] / [i915#3840]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#3555] / [i915#3840])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][244] ([i915#9878])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr:
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#3469])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-tglu-1:       NOTRUN -> [SKIP][246] ([i915#3469])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#9337])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_feature_discovery@dp-mst.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#9337])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_feature_discovery@dp-mst.html
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#9337])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#658])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_feature_discovery@psr1.html
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#658]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_feature_discovery@psr1.html
    - shard-tglu-1:       NOTRUN -> [SKIP][252] ([i915#658])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3637]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
    - shard-dg1:          NOTRUN -> [SKIP][254] ([i915#9934]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-tglu:         NOTRUN -> [SKIP][255] ([i915#3637]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-plain-flip:
    - shard-rkl:          NOTRUN -> [SKIP][256] ([i915#9934]) +11 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#3637]) +5 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#9934]) +9 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:
    - shard-mtlp:         [PASS][259] -> [FAIL][260] ([i915#11989]) +5 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#8381])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip@flip-vs-fences@b-hdmi-a2:
    - shard-rkl:          NOTRUN -> [DMESG-WARN][262] ([i915#12964]) +25 other tests dmesg-warn
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_flip@flip-vs-fences@b-hdmi-a2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-tglu:         [PASS][263] -> [FAIL][264] ([i915#11989]) +3 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2:          [PASS][265] -> [FAIL][266] ([i915#11989])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-dp4:
    - shard-dg2:          NOTRUN -> [FAIL][267] ([i915#11989]) +2 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_flip@plain-flip-ts-check-interruptible@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-tglu-1:       NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][270] ([i915#2587] / [i915#2672]) +2 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#2672]) +4 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][272] ([i915#2672] / [i915#3555]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-tglu-1:       NOTRUN -> [SKIP][273] ([i915#2587] / [i915#2672]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2672]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-tglu:         NOTRUN -> [SKIP][275] ([i915#2587] / [i915#2672] / [i915#3555])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#2672] / [i915#3555]) +4 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][278] ([i915#2587] / [i915#2672]) +3 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][281] ([i915#2672] / [i915#8813]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][282] -> [FAIL][283] ([i915#6880])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#8708]) +4 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][285] ([i915#5354]) +26 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-snb:          [PASS][286] -> [SKIP][287] +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][288] ([i915#10056] / [i915#13353])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#3458]) +17 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][290] +39 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][291] ([i915#4423]) +1 other test skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][292] +37 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#8708]) +28 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][294] ([i915#3458]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-tglu-1:       NOTRUN -> [SKIP][295] +53 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#10433] / [i915#3458])
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-rkl:          NOTRUN -> [SKIP][297] ([i915#3023]) +37 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][298] ([i915#1825]) +14 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#1825]) +60 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> [SKIP][300] +84 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#8708]) +11 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#12713])
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-tglu:         NOTRUN -> [SKIP][304] ([i915#3555] / [i915#8228])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_hdr@static-toggle.html

  * igt@kms_histogram@algo-color:
    - shard-rkl:          NOTRUN -> [SKIP][305] ([i915#13389])
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_histogram@algo-color.html
    - shard-tglu:         NOTRUN -> [SKIP][306] ([i915#13389])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_histogram@algo-color.html

  * igt@kms_histogram@global-basic:
    - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#13388])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_histogram@global-basic.html

  * igt@kms_histogram@global-color:
    - shard-tglu:         NOTRUN -> [SKIP][308] ([i915#13388]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@kms_histogram@global-color.html
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#13388])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_histogram@global-color.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-rkl:          NOTRUN -> [SKIP][310] ([i915#12388])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([i915#12394] / [i915#13522])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#12394] / [i915#13522])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2:          NOTRUN -> [SKIP][313] ([i915#12339])
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg1:          NOTRUN -> [SKIP][314] ([i915#12394] / [i915#13522])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#6301])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-glk:          NOTRUN -> [INCOMPLETE][316] ([i915#13026]) +1 other test incomplete
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][317] ([i915#10647] / [i915#12169])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][318] ([i915#10647]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk4/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-mtlp:         NOTRUN -> [SKIP][319] ([i915#11614] / [i915#3582]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][320] ([i915#10226] / [i915#11614] / [i915#3582]) +2 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#3555]) +7 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-tglu:         NOTRUN -> [FAIL][322] ([i915#8292]) +1 other test fail
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#6953])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [FAIL][324] ([i915#8292])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
    - shard-tglu-1:       NOTRUN -> [SKIP][325] ([i915#12247]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-tglu:         NOTRUN -> [SKIP][326] ([i915#12247]) +8 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#12247] / [i915#6953]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2:          NOTRUN -> [SKIP][328] ([i915#12247] / [i915#6953] / [i915#9423])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a:
    - shard-dg2:          NOTRUN -> [SKIP][329] ([i915#12247]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#12247]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
    - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#6953])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-tglu:         NOTRUN -> [SKIP][332] ([i915#12247] / [i915#3555])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
    - shard-mtlp:         NOTRUN -> [SKIP][333] ([i915#12247] / [i915#3555])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#12247]) +7 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#5354])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#12343])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-tglu-1:       NOTRUN -> [SKIP][337] ([i915#9812])
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#3361])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#3361])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html
    - shard-tglu:         NOTRUN -> [SKIP][340] ([i915#4281])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9340])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html
    - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#3828])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_lpsp@screens-disabled:
    - shard-rkl:          NOTRUN -> [SKIP][343] ([i915#8430])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-rkl:          [PASS][344] -> [SKIP][345] ([i915#9519])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@pm-caching:
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#4077]) +4 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_pm_rpm@pm-caching.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#6524])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][348] ([i915#11520]) +4 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
    - shard-snb:          NOTRUN -> [SKIP][349] ([i915#11520]) +14 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-glk:          NOTRUN -> [SKIP][350] ([i915#11520]) +10 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][351] ([i915#11520]) +12 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#9808]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#11520]) +4 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#11520]) +5 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#11520]) +16 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-mtlp:         NOTRUN -> [SKIP][356] ([i915#12316]) +5 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#9683])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-rkl:          NOTRUN -> [SKIP][358] ([i915#9683]) +1 other test skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#9683]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-primary-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][360] ([i915#9688]) +13 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#1072] / [i915#9732]) +33 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-tglu-1:       NOTRUN -> [SKIP][362] ([i915#9732]) +11 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#1072] / [i915#9732]) +22 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.html

  * igt@kms_psr@psr2-primary-render:
    - shard-tglu:         NOTRUN -> [SKIP][364] ([i915#9732]) +22 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#1072] / [i915#9732]) +19 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglu-1:       NOTRUN -> [SKIP][366] ([i915#9685])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-rkl:          [PASS][367] -> [DMESG-WARN][368] ([i915#12964]) +15 other tests dmesg-warn
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-rkl:          NOTRUN -> [SKIP][369] ([i915#5289]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#5289]) +1 other test skip
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg1:          NOTRUN -> [SKIP][371] ([i915#5289])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#12755])
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_selftest@drm_framebuffer:
    - shard-snb:          NOTRUN -> [ABORT][373] ([i915#13179]) +1 other test abort
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-snb2/igt@kms_selftest@drm_framebuffer.html

  * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
    - shard-dg2:          NOTRUN -> [ABORT][374] ([i915#13179]) +1 other test abort
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][375] ([i915#3555] / [i915#8809])
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-7/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#3555]) +5 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-glk:          NOTRUN -> [FAIL][377] ([i915#10959])
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][378] ([i915#8623])
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#8623])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][380] ([i915#12276]) +1 other test incomplete
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-mtlp:         NOTRUN -> [SKIP][381] ([i915#8808] / [i915#9906])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_vrr@flip-basic-fastset.html
    - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#9906])
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-tglu:         NOTRUN -> [SKIP][383] ([i915#11920])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_vrr@lobf.html

  * igt@kms_vrr@max-min:
    - shard-dg1:          NOTRUN -> [SKIP][384] ([i915#9906]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_vrr@max-min.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2:          NOTRUN -> [SKIP][385] ([i915#3555] / [i915#9906])
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-rkl:          NOTRUN -> [SKIP][386] ([i915#9906])
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtual.html
    - shard-tglu:         NOTRUN -> [SKIP][387] ([i915#9906])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglu:         NOTRUN -> [SKIP][388] ([i915#2437]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_writeback@writeback-fb-id.html
    - shard-glk:          NOTRUN -> [SKIP][389] ([i915#2437]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-glk2/igt@kms_writeback@writeback-fb-id.html
    - shard-mtlp:         NOTRUN -> [SKIP][390] ([i915#2437])
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@kms_writeback@writeback-fb-id.html
    - shard-rkl:          NOTRUN -> [SKIP][391] ([i915#2437]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_writeback@writeback-fb-id.html
    - shard-dg1:          NOTRUN -> [SKIP][392] ([i915#2437])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#2437] / [i915#9412])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#2436])
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@global-sseu-config:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#7387])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@perf@global-sseu-config.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#2435])
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#2433])
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-mtlp:         [PASS][398] -> [FAIL][399] ([i915#4349])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@p

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html

--===============0853974781301859564==
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
<tr><td><b>Series:</b></td><td>Initial PTL support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/141325/">https://patchwork.freedesktop.org/series/141325/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_12418/index.html">https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12418/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8183_full -&gt; IGTPW_12418_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_12418_full absolutely need to =
be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_12418_full, please notify your bug team (I915-ci-infr=
a@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index=
.html</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_1241=
8_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@wide@vcs1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_exec_schedule@wide@vcs1.html=
">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-dg2:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_8183/shard-dg2-11/igt@i915_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-11/igt@i915=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt=
@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-=
3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard=
-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@i915_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/=
shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@i915_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_=
8183/shard-dg2-1/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGT_8183/shard-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-10/igt@i9=
15_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/=
shard-dg2-11/igt@i915_module_load@load.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_lo=
ad@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i=
915_module_load@load.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard=
-dg2-10/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12418/shard-dg2-7/igt@i915_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@i915_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/i=
gt@i915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html">D=
MESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
418/shard-dg2-3/igt@i915_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@i915_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_12418/shard-dg2-5/igt@i915_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@i=
915_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_module_load@load.html">PASS<=
/a>) ([i915#13368])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-rkl-1/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-6/igt@=
perf_pmu@module-unload.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html">FAIL</a> ([=
i915#12941]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12418/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html">FAIL</a></li>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html">FAIL</a> (=
[i915#12941]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_12418/shard-tglu-10/igt@gem_tiled_swapping@non-threaded.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@a-edp1.html">FAIL</a> ([i915#11989]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_flip@flip-vs-absolut=
e-wf_vblank-interruptible@a-edp1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8183_full and IGTPW_12418_ful=
l:</p>
<h3>New IGT tests (77)</h3>
<ul>
<li>
<p>igt@gem_ctx_engines@independent@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.05, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.05, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.05, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.06, 0.16] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vecs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.05, 0.17] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.33] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@bcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.02, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_async@forked-writes@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@fairslice:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 5.23] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@nohangcheck:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.91] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>Statuses : 2 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 1.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@persistence:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.70] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sequential:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.82] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@legacy:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [2.06, 4.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 14.14] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice-all:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.04, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@fairslice@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vcs1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-user@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 12.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice-all:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.96, 2.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [2.01, 2.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.97, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.99, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.99, 2.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.11, 9.75] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@rcs0:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 1.69] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.12, 2.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.10, 1.98] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.11, 2.06] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.05, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@bcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@rcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vcs1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-lateslice@vecs0:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-codependency:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-noskip:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.81] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-resolve:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.07] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-semaphore-user:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.08] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@bcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@rcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-early-slice@vecs0:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.02, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.07, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vcs1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-golden-slice@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.02, 0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.21] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@bcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@rcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vcs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-submit-late-slice@vecs0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@32b-excludes-last-page:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@full:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@zero:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason:</p>
<ul>
<li>Statuses : 1 fail(s) 4 pass(s)</li>
<li>Exec time: [2.75, 11.06] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@gt-awake:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [2.01, 9.13] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@invalid-open:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [6.91, 23.34] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12418_full that come from known issu=
es:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-c=
ache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@device_reset@cold-reset-bound.ht=
ml">SKIP</a> ([i915#11078])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.h=
tml">SKIP</a> ([i915#8414]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy@rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@drm_fdinfo@busy@rcs0.html">SKIP</=
a> ([i915#8414]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@drm_fdinfo@most-busy-check-all.h=
tml">SKIP</a> ([i915#8414]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_basic@multigpu-create-close.h=
tml">SKIP</a> ([i915#7697]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@gem_basic@multigpu-create-close.=
html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.h=
tml">SKIP</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_ccs@ctrl-surf-copy.html">SKI=
P</a> ([i915#3555] / [i915#9323])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg2-8/igt@gem_ccs@suspend-resume.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@=
gem_ccs@suspend-resume.html">INCOMPLETE</a> ([i915#7297]) +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@gem_close_race@multigpu-basic-th=
reads.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@gem_create@create-ext-set-pat.htm=
l">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb4/igt@gem_ctx_persistence@engines-queued=
.html">SKIP</a> ([i915#1099]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_ctx_sseu@engines.html">SKIP</=
a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_ctx_sseu@invalid-sseu.html">=
SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb7/igt@gem_eio@unwedge-stress.html">FAIL<=
/a> ([i915#8898])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@full-pulse:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-6/igt@gem_exec_balancer@full-pulse.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtl=
p-6/igt@gem_exec_balancer@full-pulse.html">FAIL</a> ([i915#13364])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_exec_balancer@invalid-bonds.=
html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_exec_balancer@noheartbeat.htm=
l">SKIP</a> ([i915#8555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabu=
f-import-out-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@gem_exec_balancer@parallel-keep-=
in-fence.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_exec_balancer@parallel-keep-s=
ubmit-fence.html">SKIP</a> ([i915#4525]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@sliced:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_balancer@sliced.html">SK=
IP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb4/igt@gem_exec_fence@syncobj-backward-ti=
meline-chain-engines.html">SKIP</a> +495 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kerne=
l-default-cmd.html">SKIP</a> ([i915#3711])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_exec_flush@basic-batch-kerne=
l-default-wb.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@gem_exec_flush@basic-uc-prw-defau=
lt.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_flush@basic-wb-pro-defau=
lt.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@gem_exec_reloc@basic-concurrent1=
6.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-read-no=
reloc.html">SKIP</a> ([i915#3281]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_exec_reloc@basic-write-gtt.ht=
ml">SKIP</a> ([i915#3281]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@gem_exec_reloc@basic-write-read.h=
tml">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.h=
tml">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@wide:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_exec_schedule@wide.html">INC=
OMPLETE</a> ([i915#13391])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_fence_thrash@bo-write-verify-=
none.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-x:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@gem_fence_thrash@bo-write-verify=
-x.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_huc_copy@huc-copy.html">SKIP=
</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_evict@dontneed-evict-race:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_lmem_evict@dontneed-evict-ra=
ce.html">SKIP</a> ([i915#4613] / [i915#7582])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs.html">SKIP</a> ([i915#12193])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-r=
andom-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_lmem_swapping@parallel-random=
-verify.html">SKIP</a> ([i915#4613]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@gem_lmem_swapping@parallel-rando=
m-verify-ccs.html">SKIP</a> ([i915#4613]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@gem_lmem_swapping@random-engines.h=
tml">SKIP</a> ([i915#4613]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@gem_lmem_swapping@verify-random-=
ccs.html">SKIP</a> ([i915#4613]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-exec:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@gem_madvise@dontneed-before-exec=
.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-small-copy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_mmap_gtt@basic-small-copy.ht=
ml">SKIP</a> ([i915#4077]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_mmap_gtt@cpuset-big-copy-odd.=
html">SKIP</a> ([i915#4077]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear-via-pagefault:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/sh=
ard-mtlp-5/igt@gem_mmap_offset@clear-via-pagefault.html">ABORT</a> ([i915#1=
0729]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@fault-concurrent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_mmap_wc@fault-concurrent.html=
">SKIP</a> ([i915#4083]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_mmap_wc@read-write.html">SKI=
P</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc-unflushed:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_mmap_wc@write-cpu-read-wc-un=
flushed.html">SKIP</a> ([i915#4083]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_partial_pwrite_pread@write.h=
tml">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_partial_pwrite_pread@writes-a=
fter-reads.html">SKIP</a> ([i915#3282]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_pread@snoop.html">SKIP</a> ([=
i915#3282]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@gem_pxp@create-valid-protected-co=
ntext.html">SKIP</a> ([i915#4270]) +1 other test skip</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@gem_pxp@create-valid-protected-co=
ntext.html">TIMEOUT</a> ([i915#12964])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@hw-rejects-pxp-context:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> ([i915#13398])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@gem_pxp@hw-rejects-pxp-context.h=
tml">SKIP</a> ([i915#13398])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@gem_pxp@reject-modify-context-pro=
tection-on.html">TIMEOUT</a> ([i915#12917] / [i915#12964]) +2 other tests t=
imeout</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-ctx-execution:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@gem_pxp@verify-pxp-stale-ctx-exe=
cution.html">SKIP</a> ([i915#4270]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> +400 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-y=
f-tiled.html">SKIP</a> ([i915#8428]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_render_copy@yf-tiled-mc-ccs-t=
o-vebox-y-tiled.html">SKIP</a> ([i915#5190] / [i915#8428]) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@gem_set_tiling_vs_blt@tiled-to-ti=
led.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@gem_set_tiling_vs_blt@tiled-to-un=
tiled.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_set_tiling_vs_blt@untiled-to=
-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@gem_softpin@evict-snoop.html">SK=
IP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk7/igt@gem_softpin@noreloc-s3.html">INCOM=
PLETE</a> ([i915#13306])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gem_tiled_pread_pwrite.html">SKI=
P</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@gem_userptr_blits@create-destroy-=
unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@gem_userptr_blits@dmabuf-sync.ht=
ml">SKIP</a> ([i915#3297] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.=
html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@forbidden-operations:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@gem_userptr_blits@forbidden-opera=
tions.html">SKIP</a> ([i915#3282] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@gem_userptr_blits@map-fixed-inval=
idate.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@gem_userptr_blits@map-fixed-inva=
lidate-overlap-busy.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> ([i915#3297]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@gem_userptr_blits@readonly-pwrit=
e-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@gem_userptr_blits@readonly-unsyn=
c.html">SKIP</a> ([i915#3297]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@relocations:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@gem_userptr_blits@relocations.ht=
ml">SKIP</a> ([i915#3281] / [i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-cy=
cles.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@gen7_exec_parse@bitmasks.html">SK=
IP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@gen9_exec_parse@bb-chained.html"=
>SKIP</a> ([i915#2527] / [i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-oversize:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@gen9_exec_parse@bb-oversize.html"=
>SKIP</a> ([i915#2527]) +6 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@gen9_exec_parse@bb-oversize.html=
">SKIP</a> ([i915#2527]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> ([i915#2527] / [i915#2856]) +2 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@gen9_exec_parse@bb-secure.html">=
SKIP</a> ([i915#2856]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-access:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@gen9_exec_parse@unaligned-access=
.html">SKIP</a> ([i915#2856]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_fb_tiling.html">SKIP</a> ([i=
915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb5/igt@i915_module_load@reload-with-fault=
-injection.html">ABORT</a> ([i915#9820])</li>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg1-18/igt@i915_module_load@reload-with-fault-injection.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_12418/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html">=
ABORT</a> ([i915#13493] / [i915#9820])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@i915_module_load@resize-bar.html"=
>SKIP</a> ([i915#6412])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@i915_pm_freq_api@freq-basic-api=
.html">SKIP</a> ([i915#8399])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@i915_pm_freq_api@freq-basic-api.h=
tml">SKIP</a> ([i915#8399])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0=
.html">SKIP</a> ([i915#6590]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_1241=
8/shard-dg1-12/igt@i915_pm_rc6_residency@rc6-idle@gt0-vcs0.html">FAIL</a> (=
[i915#3591])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf=
.html">INCOMPLETE</a> ([i915#12797])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@i915_pm_rps@reset.html">FAIL</a>=
 ([i915#8346])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_pm_rps@thresholds.html">SKIP=
</a> ([i915#11681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">SK=
IP</a> ([i915#4387])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@i915_pm_sseu@full-enable.html">S=
KIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_power@sanity:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@i915_power@sanity.html">SKIP</a> =
([i915#7984])</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@i915_query@test-query-geometry-su=
bslices.html">SKIP</a> ([i915#5723])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@i915_query@test-query-geometry-s=
ubslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-6/igt@i915_selftest@live@workarounds.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-m=
tlp-8/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#12061]=
) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@i915_selftest@mock.html">DMESG-WAR=
N</a> ([i915#1982] / [i915#9311])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@i915_selftest@mock@memory_region.h=
tml">DMESG-WARN</a> ([i915#9311])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_addfb_basic@addfb25-x-tiled-m=
ismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_addfb_basic@basic-y-tiled-leg=
acy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-2-y-rc-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_async_flips@async-flip-with-p=
age-flip-events-atomic@pipe-b-hdmi-a-2-y-rc-ccs.html">SKIP</a> ([i915#8709]=
) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-d-hdmi-=
a-1-y-rc-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_async_flips@async-flip-with-=
page-flip-events-atomic@pipe-d-hdmi-a-1-y-rc-ccs.html">SKIP</a> ([i915#8709=
]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-5/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> ([i915#3555])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_atomic@plane-primary-overlay=
-mutable-zpos.html">SKIP</a> ([i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing-internal-panels.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-1=
80.html">SKIP</a> ([i915#5286]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_big_fb@4-tiled-addfb-size-ov=
erflow.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_big_fb@4-tiled-max-hw-stride-=
32bpp-rotate-0-hflip.html">SKIP</a> ([i915#5286]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-async-flip.html">SKIP</a> ([i915#5286]) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride=
-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5286=
]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-=
hflip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_12418/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rot=
ate-0-hflip.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_big_fb@linear-32bpp-rotate-90=
.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_big_fb@y-tiled-64bpp-rotate-=
270.html">SKIP</a> ([i915#3638]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_big_fb@y-tiled-max-hw-stride=
-64bpp-rotate-0-hflip.html">DMESG-WARN</a> ([i915#4423]) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]=
) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_big_fb@yf-tiled-16bpp-rotate=
-0.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-64bpp-rotate-180-async-flip.html">SKIP</a> ([i915#4538]) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_ccs@bad-aux-stride-4-tiled-m=
tl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +49 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_ccs@bad-rotation-90-4-tiled-l=
nl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_ccs@ccs-on-another-bo-4-tiled=
-mtl-mc-ccs.html">SKIP</a> ([i915#10307] / [i915#6095]) +103 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-4-tile=
d-bmg-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_ccs@crc-primary-basic-yf-til=
ed-ccs@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#6095]) +74 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180=
-4-tiled-bmg-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-til=
ed-lnl-ccs.html">SKIP</a> ([i915#12805]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</=
p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-til=
ed-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#6095]) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-yf-ti=
led-ccs.html">SKIP</a> ([i915#6095]) +108 other tests skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk7/igt@kms_ccs@crc-primary-suspend-yf-til=
ed-ccs.html">INCOMPLETE</a> ([i915#12796]) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_ccs@crc-sprite-planes-basic-4=
-tiled-lnl-ccs.html">SKIP</a> ([i915#12313]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@kms_ccs@missing-ccs-buffer-yf-ti=
led-ccs@pipe-a-edp-1.html">SKIP</a> ([i915#6095]) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_ccs@random-ccs-data-4-tiled-=
lnl-ccs.html">SKIP</a> ([i915#12313])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled=
-ccs@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#6095]) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-=
ccs@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#10307] / [i915#10434] / [i915#609=
5]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_cdclk@mode-transition.html">=
SKIP</a> ([i915#7213] / [i915#9010]) +4 other tests skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cdclk@mode-transition.html">=
SKIP</a> ([i915#3742])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cdclk@mode-transition.html">=
SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_cdclk@plane-scaling@pipe-b-hd=
mi-a-3.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_chamelium_audio@hdmi-audio.h=
tml">SKIP</a> ([i915#11151] / [i915#7828]) +6 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-7/igt@kms_chamelium_audio@hdmi-audio.h=
tml">SKIP</a> ([i915#11151] / [i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stres=
s-resolution-4k.html">SKIP</a> ([i915#11151] / [i915#7828]) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html">SKIP</a> ([i915#11151] / [i915#7828]) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_chamelium_hpd@dp-hpd-fast.ht=
ml">SKIP</a> ([i915#11151] / [i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml">SKIP</a> ([i915#11151] / [i915#7828]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_content_protection@atomic-dpm=
s.html">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_content_protection@dp-mst-typ=
e-0.html">SKIP</a> ([i915#3116])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_content_protection@dp-mst-ty=
pe-0.html">SKIP</a> ([i915#3116] / [i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_content_protection@legacy.htm=
l">SKIP</a> ([i915#7118] / [i915#9424]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_content_protection@lic-type-=
0.html">SKIP</a> ([i915#9424])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_cursor_crc@cursor-offscreen-=
32x32.html">SKIP</a> ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_cursor_crc@cursor-offscreen-5=
12x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_cursor_crc@cursor-onscreen-51=
2x170.html">SKIP</a> ([i915#13049])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-5=
12x170.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-5=
12x512.html">SKIP</a> ([i915#13049]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> ([i915#3555]) +2 other tests skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cursor_crc@cursor-random-32x=
32.html">SKIP</a> ([i915#3555]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_crc@cursor-random-512=
x512.html">SKIP</a> ([i915#13049])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_cursor_crc@cursor-sliding-25=
6x85.html">SKIP</a> ([i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-51=
2x170.html">SKIP</a> ([i915#13049]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_cursor_legacy@2x-long-cursor=
-vs-flip-atomic.html">SKIP</a> ([i915#9809]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@kms_cursor_legacy@basic-busy-fli=
p-before-cursor-atomic.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip=
-before-cursor-varying-size.html">SKIP</a> ([i915#4103]) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>shard-dg1:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg1-17/igt@kms_cursor_legacy@basic-flip-after-cursor-varyin=
g-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_12418/shard-dg1-13/igt@kms_cursor_legacy@basic-flip-after-cursor=
-varying-size.html">DMESG-WARN</a> ([i915#4423]) +8 other tests dmesg-warn<=
/li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flip=
b-atomic-transitions.html">SKIP</a> ([i915#13046] / [i915#5354]) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_cursor_legacy@modeset-atomic=
-cursor-hotspot.html">SKIP</a> ([i915#9067])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_cursor_legacy@short-busy-flip=
-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213]=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html=
">FAIL</a> ([i915#12170])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hd=
mi-a-1.html">FAIL</a> ([i915#11968])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@kms_display_modes@mst-extended-mo=
de-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
.html">SKIP</a> ([i915#1769] / [i915#3555] / [i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc=
@pipe-a-hdmi-a-1.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_dp_aux_dev.html">SKIP</a> ([=
i915#1257])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> ([i915#12402])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_dp_linktrain_fallback@dp-fal=
lback.html">SKIP</a> ([i915#12402])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_dsc@dsc-fractional-bpp.html"=
>SKIP</a> ([i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_dsc@dsc-with-bpc.html">SKIP<=
/a> ([i915#3555] / [i915#3840])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</=
a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_dsc@dsc-with-bpc-formats.html=
">SKIP</a> ([i915#3555] / [i915#3840]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_dsc@dsc-with-output-formats.=
html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">IN=
COMPLETE</a> ([i915#9878])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_fbcon_fbt@psr.html">SKIP</a>=
 ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_fbcon_fbt@psr-suspend.html">=
SKIP</a> ([i915#3469])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> ([i915#9337])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> ([i915#9337])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_feature_discovery@dp-mst.htm=
l">SKIP</a> ([i915#9337])</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_feature_discovery@psr1.html">=
SKIP</a> ([i915#658])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_feature_discovery@psr1.html">=
SKIP</a> ([i915#658]) +1 other test skip</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_feature_discovery@psr1.html"=
>SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> ([i915#3637]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip@2x-absolute-wf_vblank-i=
nterruptible.html">SKIP</a> ([i915#9934]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_flip@2x-flip-vs-modeset-vs-h=
ang.html">SKIP</a> ([i915#3637]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_flip@2x-plain-flip.html">SKIP=
</a> ([i915#9934]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recrea=
te-interruptible.html">SKIP</a> ([i915#3637]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset.html">SKIP</a> ([i915#9934]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptibl=
e@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-int=
erruptible@c-edp1.html">FAIL</a> ([i915#11989]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip@flip-vs-fences-interrupt=
ible.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@b-hdmi-a2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_flip@flip-vs-fences@b-hdmi-a2=
.html">DMESG-WARN</a> ([i915#12964]) +25 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-tglu-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_12418/shard-tglu-7/igt@kms_flip@plain-flip-fb-recreate-interruptible.html=
">FAIL</a> ([i915#11989]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg2-5/igt@kms_flip@plain-flip-ts-check-interruptible.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12=
418/shard-dg2-10/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL<=
/a> ([i915#11989])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_flip@plain-flip-ts-check-int=
erruptible@d-dp4.html">FAIL</a> ([i915#11989]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-=
4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i91=
5#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> ([i915#2672] / [i915#3=
555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-4=
tile-to-64bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915=
#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-y=
ftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#258=
7] / [i915#2672]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2=
672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-upscaling.html">SKIP</a> ([i915#2587] / [i915#2672] =
/ [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-64bpp-ytile-downscaling.html">SKIP</a> ([i915#2672] / [i915#3555] /=
 [i915#8813]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-16bpp-4tile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555]) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587]=
 / [i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-4=
tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> ([i915#2672] / [i915=
#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_flip_scaled_crc@flip-64bpp-yt=
ile-to-16bpp-ytile-upscaling.html">SKIP</a> ([i915#2672] / [i915#3555] / [i=
915#5190]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a=
-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-y=
tile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#267=
2] / [i915#8813]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indf=
b-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-pri-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-1p-=
primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-2p-r=
te.html">SKIP</a> ([i915#5354]) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-snb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-mmap-wc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_12418/shard-snb1/igt@kms_frontbuffer_tracking@fbc-2p-scnd=
scrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk9/igt@kms_frontbuffer_tracking@fbc-suspe=
nd.html">INCOMPLETE</a> ([i915#10056] / [i915#13353])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([i915#3458]) +17 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-indfb-fliptrack-mmap-gtt.html">SKIP</a> +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-shrfb-plflip-blt.html">SKIP</a> ([i915#4423]) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-=
2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2=
p-shrfb-fliptrack-mmap-gtt.html">SKIP</a> ([i915#8708]) +28 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-=
rgb101010-draw-render.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([i915#10433] / [i915#3458])</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#3023]) +37 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-spr-indfb-draw-pwrite.html">SKIP</a> ([i915#1825]) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-indfb-msflip-blt.html">SKIP</a> ([i915#1825]) +60 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_frontbuffer_tracking@psr-2p-=
scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> +84 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-rgb=
565-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html">SKI=
P</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_hdr@brightness-with-hdr.html"=
>SKIP</a> ([i915#12713])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_hdr@static-toggle.html">SKIP=
</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@algo-color:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_histogram@algo-color.html">SK=
IP</a> ([i915#13389])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@kms_histogram@algo-color.html">S=
KIP</a> ([i915#13389])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-basic:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_histogram@global-basic.html">=
SKIP</a> ([i915#13388])</li>
</ul>
</li>
<li>
<p>igt@kms_histogram@global-color:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-9/igt@kms_histogram@global-color.html"=
>SKIP</a> ([i915#13388]) +1 other test skip</li>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_histogram@global-color.html"=
>SKIP</a> ([i915#13388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_joiner@basic-force-big-joiner=
.html">SKIP</a> ([i915#12388])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_joiner@basic-force-ultra-joi=
ner.html">SKIP</a> ([i915#12394] / [i915#13522])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_joiner@basic-force-ultra-join=
er.html">SKIP</a> ([i915#12394] / [i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.htm=
l">SKIP</a> ([i915#12339])</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_joiner@invalid-modeset-force=
-ultra-joiner.html">SKIP</a> ([i915#12394] / [i915#13522])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_panel_fitting@atomic-fastset.=
html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk6/igt@kms_plane@plane-panning-bottom-rig=
ht-suspend.html">INCOMPLETE</a> ([i915#13026]) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk4/igt@kms_plane_alpha_blend@constant-alp=
ha-max.html">FAIL</a> ([i915#10647] / [i915#12169])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk4/igt@kms_plane_alpha_blend@constant-alp=
ha-max@pipe-c-hdmi-a-1.html">FAIL</a> ([i915#10647]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_plane_lowres@tiling-x.html">=
SKIP</a> ([i915#11614] / [i915#3582]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_plane_lowres@tiling-x@pipe-a=
-edp-1.html">SKIP</a> ([i915#10226] / [i915#11614] / [i915#3582]) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_lowres@tiling-yf.html">=
SKIP</a> ([i915#3555]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-=
size.html">FAIL</a> ([i915#8292]) +1 other test fail</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-s=
ize.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_plane_scaling@intel-max-src-=
size@pipe-a-dp-4.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:=
</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-modifiers@pipe-a.html">SKIP</a> ([i915#12247]) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:<=
/p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-rotation@pipe-c.html">SKIP</a> ([i915#12247]) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953]) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#6953=
] / [i915#9423])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-a:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25-upscale-factor-0-25@pipe-a.html">SKIP</a> ([i915#12247]) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_plane_scaling@planes-downscal=
e-factor-0-25@pipe-b.html">SKIP</a> ([i915#12247]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:</=
p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@kms_plane_scaling@planes-downsca=
le-factor-0-5-upscale-factor-0-25.html">SKIP</a> ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</l=
i>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25.html">SKIP</a> ([i915#12247] / [i915#3555])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c:=
</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_plane_scaling@planes-upscale=
-20x20-downscale-factor-0-25@pipe-c.html">SKIP</a> ([i915#12247]) +7 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_pm_backlight@basic-brightnes=
s.html">SKIP</a> ([i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_pm_backlight@brightness-with-=
dpms.html">SKIP</a> ([i915#12343])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_pm_backlight@fade.html">SKIP=
</a> ([i915#9812])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_pm_dc@dc6-dpms.html">SKIP</a=
> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>=
 ([i915#3361])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-7/igt@kms_pm_dc@dc9-dpms.html">SKIP</a=
> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</=
a> ([i915#9340])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-5/igt@kms_pm_lpsp@kms-lpsp.html">SKIP<=
/a> ([i915#3828])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@kms_pm_lpsp@screens-disabled.html=
">SKIP</a> ([i915#8430])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt=
@kms_pm_rpm@modeset-lpsp.html">SKIP</a> ([i915#9519])</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@pm-caching:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_pm_rpm@pm-caching.html">SKIP=
</a> ([i915#4077]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.ht=
ml">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-=
update-sf.html">SKIP</a> ([i915#11520]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb4/igt@kms_psr2_sf@fbc-pr-overlay-plane-m=
ove-continuous-exceed-sf.html">SKIP</a> ([i915#11520]) +14 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk9/igt@kms_psr2_sf@fbc-pr-overlay-plane-m=
ove-continuous-sf.html">SKIP</a> ([i915#11520]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane=
-update-sf.html">SKIP</a> ([i915#11520]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plan=
e-update-sf@pipe-a-edp-1.html">SKIP</a> ([i915#9808]) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_psr2_sf@fbc-psr2-overlay-pri=
mary-update-sf-dmg-area.html">SKIP</a> ([i915#11520]) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr2_sf@pr-cursor-plane-move=
-continuous-exceed-fully-sf.html">SKIP</a> ([i915#11520]) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_psr2_sf@pr-overlay-plane-upda=
te-sf-dmg-area.html">SKIP</a> ([i915#11520]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg=
-area.html">SKIP</a> ([i915#12316]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-17/igt@kms_psr2_su@page_flip-nv12.html"=
>SKIP</a> ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_psr2_su@page_flip-xrgb8888.ht=
ml">SKIP</a> ([i915#9683]) +1 other test skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_psr2_su@page_flip-xrgb8888.h=
tml">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-8/igt@kms_psr@fbc-pr-primary-blt.html"=
>SKIP</a> ([i915#9688]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_psr@psr-sprite-plane-move.htm=
l">SKIP</a> ([i915#1072] / [i915#9732]) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr@psr-sprite-plane-onoff.h=
tml">SKIP</a> ([i915#9732]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_psr@psr2-primary-mmap-gtt.ht=
ml">SKIP</a> ([i915#1072] / [i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@kms_psr@psr2-primary-render.htm=
l">SKIP</a> ([i915#9732]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-13/igt@kms_psr@psr2-sprite-mmap-gtt.htm=
l">SKIP</a> ([i915#1072] / [i915#9732]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_psr_stress_test@invalidate-p=
rimary-flip-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-rkl-4/igt@kms_rotation_crc@primary-rotation-90.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/sh=
ard-rkl-5/igt@kms_rotation_crc@primary-rotation-90.html">DMESG-WARN</a> ([i=
915#12964]) +15 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@kms_rotation_crc@primary-yf-tiled=
-reflect-x-0.html">SKIP</a> ([i915#5289]) +2 other tests skip</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-8/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-0.html">SKIP</a> ([i915#5289]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tile=
d-reflect-x-90.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_rotation_crc@sprite-rotation=
-90-pos-100-0.html">SKIP</a> ([i915#12755])</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-snb2/igt@kms_selftest@drm_framebuffer.html"=
>ABORT</a> ([i915#13179]) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@kms_selftest@drm_framebuffer@drm=
_test_framebuffer_free.html">ABORT</a> ([i915#13179]) +1 other test abort</=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-7/igt@kms_setmode@clone-exclusive-crtc=
.html">SKIP</a> ([i915#3555] / [i915#8809])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@kms_setmode@invalid-clone-single-=
crtc.html">SKIP</a> ([i915#3555]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@kms_tiled_display@basic-test-patte=
rn.html">FAIL</a> ([i915#10959])</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-4/igt@kms_tiled_display@basic-test-pat=
tern.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@kms_tiled_display@basic-test-patt=
ern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk8/igt@kms_vblank@ts-continuation-dpms-su=
spend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> ([i915#12276]) +1 other test inc=
omplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-3/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> ([i915#8808] / [i915#9906])</li>
<li>shard-tglu-1:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@kms_vrr@flip-basic-fastset.html"=
>SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_vrr@lobf.html">SKIP</a> ([i9=
15#11920])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-12/igt@kms_vrr@max-min.html">SKIP</a> (=
[i915#9906]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@kms_vrr@negative-basic.html">SKIP=
</a> ([i915#3555] / [i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-1/igt@kms_vrr@seamless-rr-switch-virtua=
l.html">SKIP</a> ([i915#9906])</li>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-virtu=
al.html">SKIP</a> ([i915#9906])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-tglu-2/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-glk2/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-mtlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-mtlp-1/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> ([i915#2437])</li>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-3/igt@kms_writeback@writeback-fb-id.htm=
l">SKIP</a> ([i915#2437]) +1 other test skip</li>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-14/igt@kms_writeback@writeback-fb-id.ht=
ml">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@kms_writeback@writeback-pixel-for=
mats.html">SKIP</a> ([i915#2437] / [i915#9412])</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx=
-counters.html">SKIP</a> ([i915#2436])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@perf@global-sseu-config.html">SKI=
P</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-rkl-2/igt@perf@per-context-mode-unprivilege=
d.html">SKIP</a> ([i915#2435])</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_12418/shard-dg1-18/igt@perf@unprivileged-single-ctx-cou=
nters.html">SKIP</a> ([i915#2433])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8183/shard-mtlp-5/igt@perf_pmu@busy-double-start@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-=
mtlp-8/igt@p">FAIL</a> ([i915#4349])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============0853974781301859564==--
