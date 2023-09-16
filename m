Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3688605789027424303=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Sat, 16 Sep 2023 08:57:42 -0000
Message-ID: <169485466256.10846.722800621114647629@emeril.freedesktop.org>
References: <20230915173439.49405-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230915173439.49405-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Ry?=
 =?utf-8?q?mtest=3A_allow_out_of_order_device_opening?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============3688605789027424303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/drmtest: allow out of order device opening
URL   : https://patchwork.freedesktop.org/series/123785/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13643_full -> IGTPW_9806_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9806_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9806_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9806_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_schedule@noreorder@bcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@bcs0.html

  * igt@gem_exec_suspend@basic-s0@smem:
    - shard-dg2:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled:
    - shard-glk:          [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk6/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk7/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html

  * igt@kms_prime@basic-crc-vgem@second-to-first:
    - shard-apl:          [PASS][6] -> [WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl4/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl6/igt@kms_prime@basic-crc-vgem@second-to-first.html
    - shard-glk:          [PASS][8] -> [WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk1/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk1/igt@kms_prime@basic-crc-vgem@second-to-first.html
    - shard-rkl:          [PASS][10] -> [WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-1/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_prime@basic-crc-vgem@second-to-first.html
    - shard-snb:          [PASS][12] -> [WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-snb6/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb1/igt@kms_prime@basic-crc-vgem@second-to-first.html
    - shard-tglu:         [PASS][14] -> [WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-8/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@kms_prime@basic-crc-vgem@second-to-first.html
    - shard-mtlp:         [PASS][16] -> [WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-7/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_prime@basic-crc-vgem@second-to-first.html

  * igt@kms_prime@basic-modeset-hybrid:
    - shard-mtlp:         NOTRUN -> [SKIP][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_prime@basic-modeset-hybrid.html

  
#### Warnings ####

  * igt@kms_prime@basic-crc-hybrid:
    - shard-rkl:          [SKIP][19] ([i915#6524]) -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html
    - shard-dg1:          [SKIP][21] ([i915#6524]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_prime@basic-crc-hybrid.html
    - shard-tglu:         [SKIP][23] ([i915#6524]) -> [SKIP][24] +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html
    - shard-mtlp:         [SKIP][25] ([i915#6524]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pm_dc@dc5-dpms-negative}:
    - shard-dg1:          [PASS][27] -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-14/igt@kms_pm_dc@dc5-dpms-negative.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@kms_pm_dc@dc5-dpms-negative.html

  
Known issues
------------

  Here are the changes found in IGTPW_9806_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#8411]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> [SKIP][30] ([i915#8411]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][31] ([i915#8411])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@cold-reset-bound:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([i915#7701]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@device_reset@cold-reset-bound.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#7701])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_buddy@drm_buddy_test:
    - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#8661])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@drm_buddy@drm_buddy_test.html

  * igt@drm_fdinfo@busy-hang@rcs0:
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#8414]) +16 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html

  * igt@drm_fdinfo@virtual-busy:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#8414]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@drm_fdinfo@virtual-busy.html

  * igt@drm_mm@drm_mm_test:
    - shard-snb:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#8661])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb5/igt@drm_mm@drm_mm_test.html
    - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#8661]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@drm_mm@drm_mm_test.html
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#8661])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl1/igt@drm_mm@drm_mm_test.html
    - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#8661])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@drm_mm@drm_mm_test.html

  * igt@gem_bad_reloc@negative-reloc-lut:
    - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#3281]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_basic@multigpu-create-close:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#7697]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_basic@multigpu-create-close.html

  * igt@gem_busy@semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3936])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_busy@semaphore.html

  * igt@gem_caching@writes:
    - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4873]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_caching@writes.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][45] ([i915#3555])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-mtlp:         NOTRUN -> [SKIP][46] ([i915#9323]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#6335]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#8562])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-dg2:          NOTRUN -> [SKIP][49] ([fdo#109314])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-rkl:          NOTRUN -> [SKIP][50] ([fdo#109314])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][51] ([i915#2410])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@hang:
    - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#8555]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#1099])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#5882]) +5 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglu:         [PASS][55] -> [FAIL][56] ([i915#5099])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#280])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-snb:          NOTRUN -> [DMESG-WARN][58] ([i915#8841]) +2 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [PASS][59] -> [FAIL][60] ([i915#5784])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-5/igt@gem_eio@reset-stress.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [PASS][61] -> [FAIL][62] ([i915#5784]) +2 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-14/igt@gem_eio@unwedge-stress.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4771]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_balancer@bonded-dual.html
    - shard-dg1:          NOTRUN -> [SKIP][64] ([i915#4771])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-sync:
    - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4771])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_exec_balancer@bonded-sync.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#8555])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#2842])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo:
    - shard-mtlp:         NOTRUN -> [SKIP][69] ([i915#4473])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_exec_fair@basic-none-solo.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][70] ([i915#2842]) +2 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-dg1:          NOTRUN -> [SKIP][71] ([i915#3539])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-rkl:          [PASS][72] -> [FAIL][73] ([i915#2842])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4473] / [i915#4771]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4812]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_exec_fence@submit.html

  * igt@gem_exec_fence@submit3:
    - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4812]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#3711])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3539])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3539] / [i915#4852]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-tglu:         NOTRUN -> [SKIP][80] ([i915#7697])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg2:          NOTRUN -> [SKIP][81] ([fdo#109283] / [i915#5107])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_params@secure-non-master:
    - shard-mtlp:         NOTRUN -> [SKIP][82] ([fdo#112283]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_exec_params@secure-non-master.html

  * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
    - shard-mtlp:         NOTRUN -> [SKIP][83] ([i915#3281]) +15 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3281]) +9 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@noreorder@ccs0:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][85] ([i915#8962] / [i915#9121])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@ccs0.html

  * igt@gem_exec_schedule@noreorder@rcs0:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][86] ([i915#9121])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg1:          NOTRUN -> [SKIP][87] ([i915#4812])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#4537] / [i915#4812]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_fence_thrash@bo-copy:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#4860]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_fence_thrash@bo-copy.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][90] ([i915#4860]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_gtt_cpu_tlb:
    - shard-dg1:          NOTRUN -> [SKIP][91] ([i915#4077]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@gem_gtt_cpu_tlb.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#4613]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@massive:
    - shard-tglu:         NOTRUN -> [SKIP][93] ([i915#4613])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-3/igt@gem_lmem_swapping@massive.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          NOTRUN -> [TIMEOUT][94] ([i915#5493])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][95] ([i915#4613]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_fill@media-fill:
    - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#8289])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_media_fill@media-fill.html
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#8289])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#284])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@coherency:
    - shard-rkl:          NOTRUN -> [SKIP][99] ([fdo#111656])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@gem_mmap_gtt@coherency.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-mtlp:         NOTRUN -> [SKIP][100] ([i915#4077]) +22 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][101] ([i915#4083]) +6 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@read:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4083]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#4083]) +10 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_mmap_wc@read-write.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#3282]) +6 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_pread@snoop:
    - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#3282]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@gem_pread@snoop.html

  * igt@gem_pwrite@basic-random:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#3282]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#4270]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#4270]) +9 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-tglu:         NOTRUN -> [SKIP][109] ([i915#4270])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#4270]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#4270])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#8428]) +11 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#4079])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#4079]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#4885])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#4079]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@gem_tiled_pread_pwrite.html

  * igt@gem_tiling_max_stride:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#4077]) +7 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_tiling_max_stride.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-rkl:          NOTRUN -> [SKIP][118] ([fdo#110542])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][119] ([i915#3297]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#3297]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#3297]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][122] ([i915#3297] / [i915#4958])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-dg1:          NOTRUN -> [SKIP][123] ([i915#3297])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#3297])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][125] ([i915#2724])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb4/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-tglu:         NOTRUN -> [SKIP][126] ([fdo#109289])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-2/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([fdo#109289]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg1:          NOTRUN -> [SKIP][128] ([fdo#109289])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@gen7_exec_parse@bitmasks.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-mtlp:         NOTRUN -> [SKIP][129] ([fdo#109289]) +8 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gen7_exec_parse@cmd-crossing-page.html
    - shard-dg2:          NOTRUN -> [SKIP][130] ([fdo#109289]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#2856]) +5 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#2527])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-mtlp:         NOTRUN -> [SKIP][133] ([i915#2856]) +5 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_hangman@gt-engine-hang@vcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][134] ([i915#7069])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html

  * igt@i915_hwmon@hwmon-read:
    - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#7707])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_hwmon@hwmon-read.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [PASS][136] -> [DMESG-WARN][137] ([i915#8617])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#7091])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-mtlp:         NOTRUN -> [SKIP][139] ([i915#8436])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#6590])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#8403])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:
    - shard-mtlp:         NOTRUN -> [SKIP][142] ([i915#8431])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html

  * igt@i915_pm_rpm@i2c:
    - shard-dg2:          [PASS][143] -> [FAIL][144] ([i915#8717])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@i915_pm_rpm@i2c.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          [PASS][145] -> [SKIP][146] ([i915#1397])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][147] -> [SKIP][148] ([i915#1397])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#1397])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][150] -> [SKIP][151] ([i915#1397]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-tglu:         NOTRUN -> [SKIP][152] ([fdo#109506])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-mtlp:         NOTRUN -> [SKIP][153] ([fdo#109293])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rps@basic-api:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#6621]) +2 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_pm_rps@basic-api.html

  * igt@i915_pm_rps@reset:
    - shard-dg2:          [PASS][155] -> [FAIL][156] ([i915#8229])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-3/igt@i915_pm_rps@reset.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pm_rps@reset.html
    - shard-dg1:          [PASS][157] -> [FAIL][158] ([i915#8229])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-18/igt@i915_pm_rps@reset.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][159] ([i915#8925]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_pm_rps@thresholds@gt1.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4387])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@i915_pm_sseu@full-enable.html
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8437])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-rkl:          NOTRUN -> [SKIP][162] ([i915#5723])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_selftest@mock@memory_region:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][163] ([i915#9311] / [i915#9312])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@i915_selftest@mock@memory_region.html
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][164] ([i915#9311] / [i915#9312])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@debugfs-reader:
    - shard-mtlp:         NOTRUN -> [ABORT][165] ([i915#7461] / [i915#9262])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#4212])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4212])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_addfb_basic@tile-pitch-mismatch.html
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#4212]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#8709]) +11 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#8502]) +11 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#8502]) +3 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][172] ([i915#8561])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][173] ([i915#8247]) +3 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [FAIL][174] ([i915#8247]) +2 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#6228])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#1769] / [i915#3555])
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#1769] / [i915#3555])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#1769] / [i915#3555])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#4538] / [i915#5286])
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][180] ([fdo#111615] / [i915#5286]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#5286]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#5286])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([fdo#111614]) +6 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
    - shard-rkl:          NOTRUN -> [SKIP][184] ([fdo#111614] / [i915#3638])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([fdo#111614]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglu:         NOTRUN -> [FAIL][186] ([i915#3743])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#5190]) +13 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-mtlp:         NOTRUN -> [SKIP][188] ([i915#6187]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][189] -> [FAIL][190] ([i915#3743])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#4538]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-rkl:          NOTRUN -> [SKIP][192] ([fdo#110723]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#4538] / [i915#5190]) +4 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([fdo#111615])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][195] ([fdo#111615]) +26 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#2705])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@basic:
    - shard-mtlp:         NOTRUN -> [SKIP][197] ([i915#2705])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#3886] / [i915#6095]) +16 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#3886] / [i915#5354] / [i915#6095]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][200] ([i915#5354] / [i915#6095]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][201] ([fdo#109271] / [i915#3886])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#3734] / [i915#5354] / [i915#6095]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][203] ([i915#5354] / [i915#6095]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#6095]) +63 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#5354] / [i915#6095]) +4 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#3689] / [i915#3886] / [i915#5354]) +10 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3689] / [i915#5354] / [i915#6095]) +3 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#5354]) +17 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#3689] / [i915#5354] / [i915#6095])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][210] ([fdo#111615] / [i915#3689] / [i915#5354] / [i915#6095])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3689] / [i915#5354]) +20 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:
    - shard-mtlp:         [PASS][212] -> [ABORT][213] ([i915#9262])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-4/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3742]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4087] / [i915#7213]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#7213] / [i915#9010]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#7213])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-dg1:          NOTRUN -> [SKIP][218] ([i915#3742])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([fdo#111827]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([fdo#111827])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-tglu:         NOTRUN -> [SKIP][221] ([i915#7828]) +2 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#7828]) +7 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][223] ([i915#7828])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#7828]) +6 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][225] ([i915#7828]) +21 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html

  * igt@kms_color@degamma@pipe-a:
    - shard-mtlp:         NOTRUN -> [FAIL][226] ([i915#9257]) +3 other tests fail
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_color@degamma@pipe-a.html

  * igt@kms_concurrent@pipe-d:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#4070] / [i915#533] / [i915#6768]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_concurrent@pipe-d.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][228] ([i915#7173])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#3116])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#3299])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-mtlp:         NOTRUN -> [SKIP][231] ([i915#6944]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#7118])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#3555]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#3359]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#3359]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html
    - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3359])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-mtlp:         NOTRUN -> [SKIP][237] ([i915#3555] / [i915#8814]) +4 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-snb:          NOTRUN -> [SKIP][238] ([fdo#109271]) +177 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#3555]) +6 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([fdo#109274] / [i915#5354]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][241] ([i915#3546]) +9 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][242] ([fdo#111825]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([fdo#111767] / [i915#3546]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
    - shard-rkl:          NOTRUN -> [SKIP][244] ([fdo#111767] / [fdo#111825])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([fdo#109274] / [fdo#111767] / [i915#5354])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#4213])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#4103])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#9226] / [i915#9261]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#9227])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#9227])
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#9226] / [i915#9261]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-rkl:          NOTRUN -> [SKIP][252] ([i915#8588])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3555] / [i915#3840])
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#4881])
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][255] ([fdo#109274] / [fdo#111767])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#3637]) +13 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([fdo#111767] / [i915#3637])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-fences-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][258] ([fdo#109274] / [i915#3637])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html
    - shard-mtlp:         NOTRUN -> [SKIP][259] ([i915#8381]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([fdo#109274]) +6 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg1:          NOTRUN -> [SKIP][261] ([fdo#111825]) +6 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-fences:
    - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#8381])
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#8810])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672])
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#2672]) +9 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#2672]) +3 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672]) +4 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#3555] / [i915#8810]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([i915#2672] / [i915#3555]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][270] ([i915#5274])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html
    - shard-dg1:          [PASS][271] -> [DMESG-WARN][272] ([i915#4423])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_force_connector_basic@prune-stale-modes.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-dg2:          [PASS][273] -> [FAIL][274] ([i915#6880])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][275] ([i915#8708]) +19 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([i915#5354]) +55 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-tglu:         NOTRUN -> [SKIP][277] ([fdo#109280]) +6 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#3458]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#3023]) +14 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][280] ([fdo#111825] / [i915#1825]) +29 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#8708]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][282] ([i915#5460])
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3458]) +16 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#8708]) +21 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#1825]) +70 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#3555] / [i915#8228])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-mtlp:         NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#6301])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_panel_fitting@legacy:
    - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#6301])
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#3582]) +7 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#8821])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#3555] / [i915#8821])
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html
    - shard-mtlp:         NOTRUN -> [SKIP][294] ([i915#3555] / [i915#8821])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [FAIL][295] ([i915#8292])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][296] ([i915#5176]) +11 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][297] ([i915#5176]) +7 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#5176]) +3 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][299] ([i915#5176]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][300] ([i915#5176]) +7 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][301] ([i915#5235]) +3 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#5235]) +11 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#5235]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][304] ([i915#5235]) +15 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html
    - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#5235]) +7 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-rkl:          NOTRUN -> [SKIP][306] ([i915#658]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#658])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-apl:          NOTRUN -> [SKIP][308] ([fdo#109271] / [i915#658]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl6/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2:          NOTRUN -> [SKIP][309] ([i915#658]) +4 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-mtlp:         NOTRUN -> [SKIP][310] ([i915#4348]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@cursor_plane_move:
    - shard-tglu:         NOTRUN -> [SKIP][311] ([fdo#110189]) +6 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_render:
    - shard-rkl:          NOTRUN -> [SKIP][312] ([i915#1072]) +5 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-dg1:          NOTRUN -> [SKIP][313] ([i915#1072]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][314] ([i915#1072]) +8 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#4235]) +5 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#4235])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#5289])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][318] ([i915#4235] / [i915#5190])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-rkl:          NOTRUN -> [SKIP][319] ([fdo#111615] / [i915#5289])
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-rkl:          [PASS][320] -> [INCOMPLETE][321] ([i915#8875])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-mtlp:         NOTRUN -> [SKIP][322] ([i915#3555] / [i915#8809]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-rkl:          NOTRUN -> [SKIP][323] ([i915#3555] / [i915#4098])
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-mtlp:         NOTRUN -> [SKIP][324] ([i915#8623])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2:          NOTRUN -> [SKIP][325] ([fdo#109309])
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - shard-rkl:          NOTRUN -> [FAIL][326] ([i915#9196])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-rkl:          NOTRUN -> [SKIP][327] ([i915#4070] / [i915#6768]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-mtlp:         NOTRUN -> [ABORT][328] ([i915#9262]) +5 other tests abort
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#3555] / [i915#8808])
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#2437])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#2437])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][332] ([i915#2437])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][333] ([i915#8724])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@global-sseu-config:
    - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#7387])
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@perf@global-sseu-config.html

  * igt@perf@polling@0-rcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][335] ([i915#9259]) +1 other test fail
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@perf@polling@0-rcs0.html

  * igt@perf_pmu@busy-double-start@rcs0:
    - shard-dg1:          NOTRUN -> [FAIL][336] ([i915#4349])
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@perf_pmu@busy-double-start@rcs0.html

  * igt@perf_pmu@busy-idle@bcs0:
    - shard-mtlp:         NOTRUN -> [FAIL][337] ([i915#4349]) +5 other tests fail
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@perf_pmu@busy-idle@bcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#8850])
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@perf_pmu@cpu-hotplug.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][339] ([fdo#112283])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          NOTRUN -> [SKIP][340] ([fdo#112283])
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html
    - shard-mtlp:         NOTRUN -> [SKIP][341] ([i915#8807])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@faulting-read@gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][342] ([i915#8440])
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@perf_pmu@faulting-read@gtt.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][343] ([fdo#109291])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@prime_udl.html

  * igt@prime_vgem@basic-fence-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][344] ([i915#8445])
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@prime_vgem@basic-fence-blt.html

  * igt@prime_vgem@basic-fence-read:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#3291] / [i915#3708]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@prime_vgem@basic-fence-read.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#3708] / [i915#4077]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@prime_vgem@basic-gtt.html

  * igt@prime_vgem@fence-write-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][347] ([i915#3708]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@prime_vgem@fence-write-hang.html

  * igt@runner@aborted:
    - shard-mtlp:         NOTRUN -> [FAIL][348] ([i915#7812])
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@runner@aborted.html

  * igt@sysfs_preempt_timeout@timeout@vecs0:
    - shard-mtlp:         NOTRUN -> [TIMEOUT][349] ([i915#8521])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html

  * igt@sysfs_timeslice_duration@duration@vecs0:
    - shard-mtlp:         NOTRUN -> [FAIL][350] ([i915#9258]) +2 other tests fail
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@sysfs_timeslice_duration@duration@vecs0.html

  * igt@v3d/v3d_mmap@mmap-bo:
    - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#2575]) +19 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-rkl:          NOTRUN -> [SKIP][352] ([fdo#109315]) +7 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_cl@bad-multisync-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#2575]) +12 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html

  * igt@v3d/v3d_submit_csd@bad-multisync-extension:
    - shard-dg1:          NOTRUN -> [SKIP][354] ([i915#2575]) +2 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@v3d/v3d_submit_csd@bad-multisync-extension.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-tglu:         NOTRUN -> [SKIP][355] ([fdo#109315] / [i915#2575]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@v3d/v3d_wait_bo@unused-bo-1ns:
    - shard-apl:          NOTRUN -> [SKIP][356] ([fdo#109271]) +53 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl4/igt@v3d/v3d_wait_bo@unused-bo-1ns.html

  * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
    - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#2575]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html

  * igt@vc4/vc4_perfmon@create-perfmon-exceed:
    - shard-mtlp:         NOTRUN -> [SKIP][358] ([i915#7711]) +19 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@vc4/vc4_perfmon@create-perfmon-exceed.html

  * igt@vc4/vc4_tiling@get-after-free:
    - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#7711])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@vc4/vc4_tiling@get-after-free.html

  * igt@vc4/vc4_tiling@get-bad-modifier:
    - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#7711]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-modifier.html
    - shard-rkl:          NOTRUN -> [SKIP][361] ([i915#7711]) +5 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@vc4/vc4_tiling@get-bad-modifier.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][362] ([i915#7742]) -> [PASS][363]
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][364] ([i915#2410]) -> [PASS][365] +2 other tests pass
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][366] ([i915#2842]) -> [PASS][367]
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][368] ([i915#2842]) -> [PASS][369]
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][370] ([i915#2842]) -> [PASS][371]
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@i915_hangman@engine-error-state-capture@vcs1:
    - shard-mtlp:         [DMESG-WARN][372] ([i915#9262]) -> [PASS][373]
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-1/igt@i915_hangman@engine-error-state-capture@vcs1.html
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@i915_hangman@engine-error-state-capture@vcs1.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - shard-dg1:          [FAIL][374] ([i915#3591]) -> [PASS][375]
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][376] ([i915#1397]) -> [PASS][377] +1 other test pass
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg2:          [SKIP][378] ([i915#1397]) -> [PASS][379]
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][380] ([i915#1397]) -> [PASS][381] +1 other test pass
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@debugfs-reader:
    - shard-dg2:          [FAIL][382] ([fdo#103375]) -> [PASS][383]
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-5/igt@i915_suspend@debugfs-reader.html
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         [FAIL][384] ([i915#3743]) -> [PASS][385]
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [FAIL][386] ([i915#2346]) -> [PASS][387]
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][388] ([i915#2346]) -> [PASS][389]
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2:          [INCOMPLETE][390] -> [PASS][391]
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][392] -> [PASS][393]
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html

  * {igt@kms_pm_dc@dc6-dpms}:
    - shard-tglu:         [FAIL][394] ([i915#9295]) -> [PASS][395]
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html

  * {igt@kms_pm_dc@dc9-dpms}:
    - shard-tglu:         [SKIP][396] ([i915#4281]) -> [PASS][397]
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html

  * {igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a}:
    - shard-rkl:          [SKIP][398] ([i915#1937]) -> [PASS][399]
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-rkl:          [INCOMPLETE][400] ([i915#8875]) -> [PASS][401]
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-a:
    - shard-tglu:         [FAIL][402] ([i915#9196]) -> [PASS][403]
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html

  * igt@kms_universal_plane@cursor-fb-leak-pipe-d:
    - shard-dg1:          [FAIL][404] ([i915#9196]) -> [PASS][405]
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html

  * igt@kms_vblank@pipe-d-ts-continuation-suspend:
    - shard-mtlp:         [ABORT][406] ([i915#9262]) -> [PASS][407] +1 other test pass
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-6/igt@kms_vblank@pipe-d-ts-continuation-suspend.html
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html

  * igt@sysfs_heartbeat_interval@mixed@ccs0:
    - shard-mtlp:         [ABORT][408] ([i915#8552]) -> [PASS][409]
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@ccs0.html
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@ccs0.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-mtlp:         [FAIL][410] ([i915#1731]) -> [PASS][411]
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  
#### Warnings ####

  * igt@gem_create@create-ext-cpu-access-big:
    - shard-dg2:          [ABORT][412] ([i915#7461]) -> [INCOMPLETE][413] ([i915#9283])
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-tglu:         [FAIL][414] ([i915#2681] / [i915#3591]) -> [WARN][415] ([i915#2681])
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [WARN][416] ([i915#2681]) -> [FAIL][417] ([i915#2681] / [i915#3591])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-dg1:          [SKIP][418] ([i915#7828]) -> [SKIP][419] ([i915#4423] / [i915#7828])
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][420] ([i915#3955]) -> [SKIP][421] ([fdo#110189] / [i915#3955])
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-6/igt@kms_fbcon_fbt@psr.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:
    - shard-snb:          [DMESG-WARN][422] ([i915#8841]) -> [INCOMPLETE][423] ([i915#4839] / [i915#8841])
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg1:          [SKIP][424] ([i915#8708]) -> [SKIP][425] ([i915#4423] / [i915#8708])
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          [SKIP][426] ([i915#6524] / [i915#6805]) -> [SKIP][427] ([i915#6805]) +3 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          [SKIP][428] ([i915#1072] / [i915#4078]) -> [SKIP][429] ([i915#1072]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-12/igt@kms_psr@cursor_plane_move.html
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@sprite_plane_onoff:
    - shard-dg1:          [SKIP][430] ([i915#1072]) -> [SKIP][431] ([i915#1072] / [i915#4078]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_psr@sprite_plane_onoff.html
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@kms_psr@sprite_plane_onoff.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html

--===============3688605789027424303==
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
<tr><td><b>Series:</b></td><td>lib/drmtest: allow out of order device opening</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123785/">https://patchwork.freedesktop.org/series/123785/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13643_full -&gt; IGTPW_9806_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9806_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9806_full, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9806_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_schedule@noreorder@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@bcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@gem_exec_suspend@basic-s0@smem.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@gem_exec_suspend@basic-s0@smem.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk6/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk7/igt@kms_draw_crc@draw-method-blt@xrgb2101010-ytiled.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem@second-to-first:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl4/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl6/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk1/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk1/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-1/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-snb6/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb1/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-8/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-7/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_prime@basic-crc-vgem@second-to-first.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-modeset-hybrid:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_prime@basic-modeset-hybrid.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> +3 other tests skip</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-9/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> +2 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_prime@basic-crc-hybrid.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pm_dc@dc5-dpms-negative}:<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-14/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@kms_pm_dc@dc5-dpms-negative.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9806_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> ([i915#8411]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +2 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@device_reset@cold-reset-bound:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@device_reset@cold-reset-bound.html">SKIP</a> ([i915#7701]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy_test:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@drm_buddy@drm_buddy_test.html">SKIP</a> ([i915#8661])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-hang@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@drm_fdinfo@busy-hang@rcs0.html">SKIP</a> ([i915#8414]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@drm_fdinfo@virtual-busy.html">SKIP</a> ([i915#8414]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm_test:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb5/igt@drm_mm@drm_mm_test.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#8661])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@drm_mm@drm_mm_test.html">SKIP</a> ([i915#8661]) +3 other tests skip</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl1/igt@drm_mm@drm_mm_test.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#8661])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@drm_mm@drm_mm_test.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</a> ([i915#3281]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_basic@multigpu-create-close:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_basic@multigpu-create-close.html">SKIP</a> ([i915#7697]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_busy@semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_busy@semaphore.html">SKIP</a> ([i915#3936])</li>
</ul>
</li>
<li>
<p>igt@gem_caching@writes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_caching@writes.html">SKIP</a> ([i915#4873]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_ccs@ctrl-surf-copy.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> ([i915#9323]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_create@create-ext-cpu-access-sanity-check.html">SKIP</a> ([i915#6335]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109314">fdo#109314</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> ([i915#5882]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@gem_ctx_persistence@smoketest.html">FAIL</a> ([i915#5099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb2/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#8841]) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-5/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-14/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#5784]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771]) +1 other test skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> ([i915#4771])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_exec_balancer@bonded-sync.html">SKIP</a> ([i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@gem_exec_balancer@noheartbeat.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_exec_fair@basic-none-solo.html">SKIP</a> ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#4473] / [i915#4771]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_exec_fence@submit3.html">SKIP</a> ([i915#4812]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([i915#3711])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a> / [i915#5107])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_exec_params@secure-non-master.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html">SKIP</a> ([i915#3281]) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@ccs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@ccs0.html">DMESG-WARN</a> ([i915#8962] / [i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@noreorder@rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_exec_schedule@noreorder@rcs0.html">DMESG-FAIL</a> ([i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_fence_thrash@bo-copy.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_gtt_cpu_tlb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@gem_gtt_cpu_tlb.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> ([i915#4613]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-3/igt@gem_lmem_swapping@massive.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#4613]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_mmap_gtt@cpuset-medium-copy.html">SKIP</a> ([i915#4077]) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@gem_mmap_wc@copy.html">SKIP</a> ([i915#4083]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@gem_mmap_wc@read.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@gem_mmap_wc@read-write.html">SKIP</a> ([i915#4083]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a> ([i915#3282]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pread@snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@gem_pread@snoop.html">SKIP</a> ([i915#3282]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_pwrite@basic-random.html">SKIP</a> ([i915#3282]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-17/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html">SKIP</a> ([i915#4079]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_tiling_max_stride:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_tiling_max_stride.html">SKIP</a> ([i915#4077]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110542">fdo#110542</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb4/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-2/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@gen7_exec_parse@basic-offset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +8 other tests skip</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> ([i915#2856]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_hangman@gt-engine-hang@vcs0.html">FAIL</a> ([i915#7069])</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_hwmon@hwmon-read.html">SKIP</a> ([i915#7707])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#8617])</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#8436])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([i915#8403])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-mmap-type@gtt-smem0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_pm_rpm@gem-mmap-type@gtt-smem0.html">SKIP</a> ([i915#8431])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@i915_pm_rpm@i2c.html">FAIL</a> ([i915#8717])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-3/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@i915_pm_rps@reset.html">FAIL</a> ([i915#8229])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-18/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@i915_pm_rps@reset.html">FAIL</a> ([i915#8229])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@i915_pm_rps@thresholds@gt1.html">SKIP</a> ([i915#8925]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#8437])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@i915_query@test-query-geometry-subslices.html">SKIP</a> ([i915#5723])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311] / [i915#9312])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a> ([i915#9311] / [i915#9312])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@i915_suspend@debugfs-reader.html">ABORT</a> ([i915#7461] / [i915#9262])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-dp-4-4-mc_ccs.html">SKIP</a> ([i915#8709]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-4-rc_ccs.html">SKIP</a> ([i915#8502]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-2-y-rc_ccs.html">SKIP</a> ([i915#8502]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_async_flips@crc@pipe-b-edp-1.html">DMESG-FAIL</a> ([i915#8561])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_async_flips@crc@pipe-d-edp-1.html">FAIL</a> ([i915#8247]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / [i915#3555])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a> / [i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#5286]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> ([i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +6 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / [i915#3638])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5190]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#6187]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> ([i915#4538]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([i915#4538] / [i915#5190]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#5354] / [i915#6095]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_ccs@pipe-a-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([i915#3734] / [i915#5354] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#6095]) +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_ccs@pipe-b-random-ccs-data-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_ccs@pipe-c-random-ccs-data-yf_tiled_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-4/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_mtl_rc_ccs_cc.html">ABORT</a> ([i915#9262])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> ([i915#7213] / [i915#9010]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> ([i915#7213])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> ([i915#7828]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html">SKIP</a> ([i915#7828]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_color@degamma@pipe-a.html">FAIL</a> ([i915#9257]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_concurrent@pipe-d.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_content_protection@srm.html">SKIP</a> ([i915#6944]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_content_protection@uevent.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> ([i915#3555]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> ([i915#3359]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359]) +5 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> ([i915#3555] / [i915#8814]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb2/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +177 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([i915#3546]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / [i915#3546]) +1 other test skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2.html">SKIP</a> ([i915#9227])</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> ([i915#9226] / [i915#9261]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> ([i915#3555] / [i915#3840])</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_fence_pin_leak.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> ([i915#3637]) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / [i915#3637])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip@2x-flip-vs-fences-interruptible.html">SKIP</a> ([i915#8381]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_flip@flip-vs-fences.html">SKIP</a> ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> ([i915#3555] / [i915#8810]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672] / [i915#3555]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> ([i915#4423])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">FAIL</a> ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([i915#5354]) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#3458]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> ([i915#3023]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html">SKIP</a> ([i915#3458]) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> ([i915#8708]) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-10/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> ([i915#3582]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> ([i915#8821])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555] / [i915#8821])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html">SKIP</a> ([i915#5176]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-d-edp-1.html">SKIP</a> ([i915#5176]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5176]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#5176]) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#5176]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-3/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-b-edp-1.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +15 other tests skip</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-12/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +7 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> ([i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl6/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#658]) +4 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> ([i915#4348]) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> ([i915#4235]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> ([i915#5289])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / [i915#5289])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@kms_rotation_crc@sprite-rotation-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_rotation_crc@sprite-rotation-90.html">INCOMPLETE</a> ([i915#8875])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> ([i915#3555] / [i915#8809]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#8623])</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">FAIL</a> ([i915#9196])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@kms_vblank@pipe-c-query-forked-hang.html">SKIP</a> ([i915#4070] / [i915#6768]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">ABORT</a> ([i915#9262]) +5 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@kms_vrr@flip-basic.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724])</li>
</ul>
</li>
<li>
<p>igt@perf@global-sseu-config:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@perf@global-sseu-config.html">SKIP</a> ([i915#7387])</li>
</ul>
</li>
<li>
<p>igt@perf@polling@0-rcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@perf@polling@0-rcs0.html">FAIL</a> ([i915#9259]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@rcs0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@perf_pmu@busy-double-start@rcs0.html">FAIL</a> ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle@bcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@perf_pmu@busy-idle@bcs0.html">FAIL</a> ([i915#4349]) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@perf_pmu@cpu-hotplug.html">SKIP</a> ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([i915#8807])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@faulting-read@gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@perf_pmu@faulting-read@gtt.html">SKIP</a> ([i915#8440])</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@prime_vgem@basic-fence-blt.html">FAIL</a> ([i915#8445])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-1/igt@prime_vgem@basic-fence-read.html">SKIP</a> ([i915#3291] / [i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@prime_vgem@basic-gtt.html">SKIP</a> ([i915#3708] / [i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([i915#3708]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-6/igt@runner@aborted.html">FAIL</a> ([i915#7812])</li>
</ul>
</li>
<li>
<p>igt@sysfs_preempt_timeout@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@sysfs_preempt_timeout@timeout@vecs0.html">TIMEOUT</a> ([i915#8521])</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@duration@vecs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-3/igt@sysfs_timeslice_duration@duration@vecs0.html">FAIL</a> ([i915#9258]) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_mmap@mmap-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@v3d/v3d_mmap@mmap-bo.html">SKIP</a> ([i915#2575]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-3/igt@v3d/v3d_submit_cl@bad-multisync-out-sync.html">SKIP</a> ([i915#2575]) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-multisync-extension:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@v3d/v3d_submit_csd@bad-multisync-extension.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / [i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-1ns:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl4/igt@v3d/v3d_wait_bo@unused-bo-1ns.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-perfmon-exceed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@vc4/vc4_perfmon@create-perfmon-exceed.html">SKIP</a> ([i915#7711]) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-after-free:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@vc4/vc4_tiling@get-after-free.html">SKIP</a> ([i915#7711])</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-modifier:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-11/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +7 other tests skip</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-1/igt@vc4/vc4_tiling@get-bad-modifier.html">SKIP</a> ([i915#7711]) +5 other tests skip</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> ([i915#7742]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-2/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-error-state-capture@vcs1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-1/igt@i915_hangman@engine-error-state-capture@vcs1.html">DMESG-WARN</a> ([i915#9262]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-8/igt@i915_hangman@engine-error-state-capture@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">FAIL</a> ([i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-5/igt@i915_suspend@debugfs-reader.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-2/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc6-dpms}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-3/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> ([i915#9295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_dc@dc9-dpms}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-3/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-4/igt@kms_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a}:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-6/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">INCOMPLETE</a> ([i915#8875]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak-pipe-d:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-15/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-18/igt@kms_universal_plane@cursor-fb-leak-pipe-d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-suspend:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-6/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">ABORT</a> ([i915#9262]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-7/igt@kms_vblank@pipe-d-ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@ccs0.html">ABORT</a> ([i915#8552]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-mtlp-2/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-mtlp-5/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_create@create-ext-cpu-access-big:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-7/igt@gem_create@create-ext-cpu-access-big.html">ABORT</a> ([i915#7461]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-5/igt@gem_create@create-ext-cpu-access-big.html">INCOMPLETE</a> ([i915#9283])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> ([i915#2681] / [i915#3591]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> ([i915#2681] / [i915#3591])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#4423] / [i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-rkl-6/igt@kms_fbcon_fbt@psr.html">SKIP</a> ([i915#3955]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-rkl-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / [i915#3955])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-vga1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html">DMESG-WARN</a> ([i915#8841]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-snb6/igt@kms_flip@flip-vs-suspend-interruptible@b-vga1.html">INCOMPLETE</a> ([i915#4839] / [i915#8841])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#4423] / [i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg2-6/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg2-10/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6805]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-12/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#4078]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-14/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13643/shard-dg1-17/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9806/shard-dg1-16/igt@kms_psr@sprite_plane_onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / [i915#4078]) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<p>[i915#2437]</p>

</body>
</html>

--===============3688605789027424303==--
