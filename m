Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1022946249537141044=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jagmeet Randhawa" <jagmeet.randhawa@intel.com>
Date: Sat, 25 Nov 2023 06:44:51 -0000
Message-ID: <170089469157.14411.18227514286722737898@emeril.freedesktop.org>
References: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
In-Reply-To: <20231107205932.701351-1-jagmeet.randhawa@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2dw?=
 =?utf-8?q?gpu=5Ffill=3A_Add_support_for_Xe2_platforms_=28rev4=29?=
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

--===============1022946249537141044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/gpgpu_fill: Add support for Xe2 platforms (rev4)
URL   : https://patchwork.freedesktop.org/series/126096/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_13908_full -> IGTPW_10233_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_10233_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_10233_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/index.html

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_10233_full:

### IGT changes ###

#### Warnings ####

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [FAIL][1] ([i915#2842]) -> ([FAIL][2], [INCOMPLETE][3]) ([i915#2842])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk5/igt@gem_exec_fair@basic-none@vecs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:
    - shard-tglu:         [FAIL][4] ([i915#3591]) -> ([WARN][5], [WARN][6]) +2 other tests ( 2 warn )
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html

  * {igt@kms_dirtyfb@drrs-dirtyfb-ioctl}:
    - shard-dg1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * {igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4}:
    - shard-dg1:          NOTRUN -> ([SKIP][8], [SKIP][9])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html

  * {igt@kms_psr@psr2_sprite_render@edp-1}:
    - shard-mtlp:         [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@kms_psr@psr2_sprite_render@edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_psr@psr2_sprite_render@edp-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_10233_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - shard-mtlp:         NOTRUN -> ([SKIP][12], [SKIP][13]) ([i915#8411])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@api_intel_bb@object-reloc-purge-cache.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@api_intel_bb@object-reloc-purge-cache.html
    - shard-dg2:          NOTRUN -> [SKIP][14] ([i915#8411])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-tglu:         NOTRUN -> ([SKIP][15], [SKIP][16]) ([i915#7701])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@device_reset@unbind-cold-reset-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@all-busy-check-all:
    - shard-mtlp:         NOTRUN -> [SKIP][17] ([i915#8414])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@drm_fdinfo@all-busy-check-all.html
    - shard-dg2:          NOTRUN -> ([SKIP][18], [SKIP][19]) ([i915#8414]) +1 other test ( 2 skip )
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@drm_fdinfo@all-busy-check-all.html

  * igt@drm_fdinfo@isolation@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#8414]) +10 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@drm_fdinfo@isolation@bcs0.html

  * igt@drm_fdinfo@most-busy-check-all@vcs0:
    - shard-mtlp:         NOTRUN -> ([SKIP][21], [SKIP][22]) ([i915#8414]) +13 other tests ( 2 skip )
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@drm_fdinfo@most-busy-check-all@vcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@drm_fdinfo@most-busy-check-all@vcs0.html

  * igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:
    - shard-dg2:          [PASS][23] -> [INCOMPLETE][24] ([i915#7297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-2/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html

  * igt@gem_close_race@multigpu-basic-process:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#7697])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_close_race@multigpu-basic-process.html

  * igt@gem_ctx_exec@basic-norecovery:
    - shard-mtlp:         [PASS][26] -> ([PASS][27], [ABORT][28]) ([i915#9414]) +1 other test ( 1 abort, 1 pass )
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_exec@basic-norecovery.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_ctx_exec@basic-norecovery.html

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-dg1:          [PASS][29] -> ([PASS][30], [DMESG-WARN][31]) ([i915#4423])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-12/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-mtlp:         NOTRUN -> [SKIP][32] ([fdo#109314])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-dg2:          NOTRUN -> ([SKIP][33], [SKIP][34]) ([i915#8555]) +1 other test ( 2 skip )
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html
    - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#8555])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#4812])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@hog:
    - shard-mtlp:         NOTRUN -> ([SKIP][37], [SKIP][38]) ([i915#4812])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_balancer@hog.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_balancer@noheartbeat:
    - shard-mtlp:         NOTRUN -> ([SKIP][39], [SKIP][40]) ([i915#8555])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_exec_balancer@noheartbeat.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglu:         NOTRUN -> [FAIL][41] ([i915#6117])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#6334]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@capture-recoverable:
    - shard-tglu:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([i915#6344])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@gem_exec_capture@many-4k-zero:
    - shard-dg2:          NOTRUN -> ([FAIL][45], [FAIL][46]) ([i915#9606])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_exec_capture@many-4k-zero.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html
    - shard-mtlp:         NOTRUN -> ([FAIL][47], [FAIL][48]) ([i915#9606])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_capture@many-4k-zero.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_exec_capture@many-4k-zero.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglu:         [PASS][49] -> ([FAIL][50], [FAIL][51]) ([i915#2842]) +1 other test ( 2 fail )
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo:
    - shard-mtlp:         NOTRUN -> ([SKIP][52], [SKIP][53]) ([i915#4473])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_exec_fair@basic-pace-solo.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][54] -> ([FAIL][55], [FAIL][56]) ([i915#2842]) +1 other test ( 2 fail )
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fence@submit67:
    - shard-dg2:          NOTRUN -> ([SKIP][57], [SKIP][58]) ([i915#4812])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_exec_fence@submit67.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@gem_exec_fence@submit67.html
    - shard-mtlp:         NOTRUN -> [SKIP][59] ([i915#4812])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_fence@submit67.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-dg1:          NOTRUN -> ([SKIP][60], [SKIP][61]) ([i915#3539])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#3539] / [i915#4852]) +2 other tests ( 2 skip )
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_exec_flush@basic-wb-rw-default.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#3281]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html
    - shard-mtlp:         NOTRUN -> ([SKIP][65], [SKIP][66]) ([i915#3281]) +2 other tests ( 2 skip )
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-read.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg1:          NOTRUN -> ([SKIP][67], [SKIP][68]) ([i915#3281])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([i915#3281]) +6 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_reloc@basic-wc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt-active:
    - shard-mtlp:         NOTRUN -> [SKIP][71] ([i915#3281]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-gtt-active.html

  * igt@gem_exec_schedule@preempt-queue-contexts:
    - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4537] / [i915#4812])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4537] / [i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          [PASS][74] -> [ABORT][75] ([i915#7975] / [i915#8213])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-mtlp:         NOTRUN -> ([SKIP][76], [SKIP][77]) ([i915#4860]) +1 other test ( 2 skip )
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> ([SKIP][78], [SKIP][79]) ([i915#4860]) +2 other tests ( 2 skip )
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_fenced_exec_thrash@too-many-fences:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#4860]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_fenced_exec_thrash@too-many-fences.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglu:         NOTRUN -> ([SKIP][81], [SKIP][82]) ([i915#4613]) +1 other test ( 2 skip )
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random.html
    - shard-glk:          NOTRUN -> ([SKIP][83], [SKIP][84]) ([fdo#109271] / [i915#4613])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk6/igt@gem_lmem_swapping@heavy-verify-random.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk3/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
    - shard-dg1:          NOTRUN -> ([SKIP][85], [SKIP][86]) ([i915#4565])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][87] -> ([TIMEOUT][88], [DMESG-WARN][89]) ([i915#4936] / [i915#5493])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-mtlp:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#4613])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_lmem_swapping@verify-ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_mmap@bad-size:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4083]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_mmap@bad-size.html

  * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
    - shard-mtlp:         NOTRUN -> ([SKIP][93], [SKIP][94]) ([i915#4077]) +8 other tests ( 2 skip )
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-dg1:          NOTRUN -> ([SKIP][95], [SKIP][96]) ([i915#4077]) +1 other test ( 2 skip )
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][97] ([i915#4077]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@bad-object:
    - shard-mtlp:         NOTRUN -> ([SKIP][98], [SKIP][99]) ([i915#4083]) +1 other test ( 2 skip )
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_mmap_wc@bad-object.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_mmap_wc@bad-object.html

  * igt@gem_mmap_wc@bad-offset:
    - shard-dg1:          NOTRUN -> ([SKIP][100], [SKIP][101]) ([i915#4083])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_mmap_wc@bad-offset.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_mmap_wc@bad-offset.html

  * igt@gem_mmap_wc@read-write:
    - shard-mtlp:         NOTRUN -> [SKIP][102] ([i915#4083])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_mmap_wc@read-write.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg2:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([i915#4083]) +3 other tests ( 2 skip )
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-dg1:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([i915#3282])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-display:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3282]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([i915#3282])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-dg2:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([i915#3282]) +4 other tests ( 2 skip )
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_pwrite@basic-exhaustion.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#4270])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglu:         NOTRUN -> ([SKIP][112], [SKIP][113]) ([i915#4270]) +2 other tests ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@regular-baseline-src-copy-readible:
    - shard-dg2:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([i915#4270]) +1 other test ( 2 skip )
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_pxp@regular-baseline-src-copy-readible.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_pxp@regular-baseline-src-copy-readible.html

  * igt@gem_readwrite@write-bad-handle:
    - shard-mtlp:         NOTRUN -> ([SKIP][116], [SKIP][117]) ([i915#3282]) +2 other tests ( 2 skip )
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_readwrite@write-bad-handle.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#8428])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-snb:          NOTRUN -> [SKIP][119] ([fdo#109271]) +23 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
    - shard-mtlp:         NOTRUN -> ([SKIP][120], [SKIP][121]) ([i915#8428]) +2 other tests ( 2 skip )
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html

  * igt@gem_render_tiled_blits@basic:
    - shard-dg1:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([i915#4079]) +1 other test ( 2 skip )
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_render_tiled_blits@basic.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_render_tiled_blits@basic.html

  * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
    - shard-mtlp:         NOTRUN -> [SKIP][124] ([i915#4079])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-mtlp:         NOTRUN -> ([SKIP][125], [SKIP][126]) ([i915#4079])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_softpin@evict-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#4885])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_softpin@evict-snoop.html

  * igt@gem_tiled_blits@basic:
    - shard-dg2:          NOTRUN -> ([SKIP][128], [SKIP][129]) ([i915#4077]) +6 other tests ( 2 skip )
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_tiled_blits@basic.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_tiled_blits@basic.html

  * igt@gem_tiled_pread_basic:
    - shard-dg2:          NOTRUN -> ([SKIP][130], [SKIP][131]) ([i915#4079])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_tiled_pread_basic.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_tiled_pread_basic.html

  * igt@gem_tiled_pread_pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][132] ([i915#4079])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_tiled_pread_pwrite.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglu:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([i915#3297])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gem_userptr_blits@coherency-unsync.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3297]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-dg2:          NOTRUN -> ([SKIP][136], [SKIP][137]) ([i915#3297])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3297] / [i915#4880])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
    - shard-mtlp:         NOTRUN -> ([SKIP][139], [SKIP][140]) ([i915#3297])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([i915#3297] / [i915#4958])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> ([FAIL][142], [FAIL][143]) ([i915#3318])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@gem_userptr_blits@vma-merge.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_linear_blits:
    - shard-tglu:         NOTRUN -> ([SKIP][144], [SKIP][145]) ([fdo#109289]) +1 other test ( 2 skip )
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@gen3_render_linear_blits.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gen3_render_linear_blits.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> ([SKIP][146], [SKIP][147]) ([fdo#109289])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gen3_render_tiledy_blits.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-dg2:          NOTRUN -> ([SKIP][148], [SKIP][149]) ([fdo#109289]) +3 other tests ( 2 skip )
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gen7_exec_parse@chained-batch.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@gen7_exec_parse@chained-batch.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([fdo#109289])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#2856])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglu:         NOTRUN -> ([SKIP][152], [SKIP][153]) ([i915#2527] / [i915#2856]) +1 other test ( 2 skip )
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-mtlp:         NOTRUN -> ([SKIP][154], [SKIP][155]) ([i915#2856])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gen9_exec_parse@bb-start-out.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg2:          NOTRUN -> ([SKIP][156], [SKIP][157]) ([i915#2856]) +2 other tests ( 2 skip )
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gen9_exec_parse@bb-start-param.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg1:          NOTRUN -> ([SKIP][158], [SKIP][159]) ([i915#2527])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gen9_exec_parse@valid-registers.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_freq_api@freq-reset-multiple@gt0:
    - shard-mtlp:         [PASS][160] -> ([ABORT][161], [ABORT][162]) ([i915#9414])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-8/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html

  * igt@i915_pm_freq_api@freq-suspend@gt0:
    - shard-dg2:          [PASS][163] -> ([INCOMPLETE][164], [PASS][165]) ([i915#9407])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg1:          NOTRUN -> [SKIP][166] ([fdo#109303])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@mock@memory_region:
    - shard-tglu:         NOTRUN -> ([DMESG-WARN][167], [DMESG-WARN][168]) ([i915#9311])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@i915_selftest@mock@memory_region.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@i915_selftest@mock@memory_region.html
    - shard-mtlp:         NOTRUN -> ([DMESG-WARN][169], [DMESG-WARN][170]) ([i915#9311])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@i915_selftest@mock@memory_region.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@i915_selftest@mock@memory_region.html

  * igt@i915_suspend@forcewake:
    - shard-dg2:          [PASS][171] -> ([ABORT][172], [PASS][173]) ([i915#9702])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-5/igt@i915_suspend@forcewake.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@i915_suspend@forcewake.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg1:          NOTRUN -> ([SKIP][174], [SKIP][175]) ([i915#4212])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> ([SKIP][176], [SKIP][177]) ([i915#4212]) +1 other test ( 2 skip )
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html
    - shard-mtlp:         NOTRUN -> ([SKIP][178], [SKIP][179]) ([i915#4212])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#4215] / [i915#5190])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglu:         NOTRUN -> ([SKIP][181], [SKIP][182]) ([i915#3826])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-mtlp:         NOTRUN -> ([SKIP][183], [SKIP][184]) ([i915#3826])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [FAIL][185] ([i915#8247]) +3 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-mtlp:         NOTRUN -> ([SKIP][186], [SKIP][187]) ([i915#6228])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_async_flips@invalid-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#4098] / [i915#9531])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-mtlp:         NOTRUN -> ([SKIP][189], [SKIP][190]) ([i915#1769] / [i915#3555]) +1 other test ( 2 skip )
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-glk:          NOTRUN -> [SKIP][191] ([fdo#109271]) +3 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([fdo#111614])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> ([SKIP][193], [SKIP][194]) ([fdo#111615] / [i915#5286]) +3 other tests ( 2 skip )
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-mtlp:         [PASS][195] -> ([FAIL][196], [PASS][197]) ([i915#5138])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg1:          NOTRUN -> ([SKIP][198], [SKIP][199]) ([i915#4538] / [i915#5286])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         NOTRUN -> ([FAIL][200], [FAIL][201]) ([i915#5138])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-mtlp:         NOTRUN -> ([SKIP][202], [SKIP][203]) ([fdo#111614])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglu:         NOTRUN -> ([SKIP][204], [SKIP][205]) ([fdo#111614])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([fdo#111614])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([fdo#111614]) +1 other test ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         [PASS][209] -> ([FAIL][210], [FAIL][211]) ([i915#3743])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-tglu:         [PASS][212] -> ([PASS][213], [FAIL][214]) ([i915#3743]) +1 other test ( 1 fail, 1 pass )
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglu:         NOTRUN -> ([PASS][215], [FAIL][216]) ([i915#3743])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#5190]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> ([SKIP][218], [SKIP][219]) ([i915#5190]) +9 other tests ( 2 skip )
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg1:          NOTRUN -> ([SKIP][220], [SKIP][221]) ([i915#3638])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#111615]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          NOTRUN -> ([SKIP][223], [SKIP][224]) ([i915#4538] / [i915#5190]) +3 other tests ( 2 skip )
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg1:          NOTRUN -> ([SKIP][225], [SKIP][226]) ([i915#4538]) +1 other test ( 2 skip )
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#4538] / [i915#5190]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][228] ([fdo#111615]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> ([SKIP][229], [SKIP][230]) ([fdo#111615]) +5 other tests ( 2 skip )
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglu:         NOTRUN -> ([SKIP][231], [SKIP][232]) ([i915#2705])
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:
    - shard-dg2:          NOTRUN -> [SKIP][233] ([i915#7213]) +3 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#4087] / [i915#7213]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([i915#4087]) +7 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#4087]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-mtlp:         NOTRUN -> ([SKIP][237], [SKIP][238]) ([fdo#111827])
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_chamelium_color@ctm-0-50.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([fdo#111827])
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-dg2:          NOTRUN -> ([SKIP][240], [SKIP][241]) ([fdo#111827])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_chamelium_color@ctm-blue-to-red.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2:          NOTRUN -> [SKIP][242] ([fdo#111827])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-tglu:         NOTRUN -> ([SKIP][243], [SKIP][244]) ([fdo#111827])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_chamelium_color@gamma.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> ([SKIP][245], [SKIP][246]) ([i915#7828]) +1 other test ( 2 skip )
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - shard-tglu:         NOTRUN -> [SKIP][247] ([i915#7828])
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-frame-dump:
    - shard-tglu:         NOTRUN -> ([SKIP][248], [SKIP][249]) ([i915#7828]) +1 other test ( 2 skip )
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_chamelium_frames@dp-frame-dump.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_chamelium_frames@dp-frame-dump.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#7828]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#7828]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-mtlp:         NOTRUN -> ([SKIP][252], [SKIP][253]) ([i915#7828]) +1 other test ( 2 skip )
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2:          NOTRUN -> ([SKIP][254], [SKIP][255]) ([i915#7828]) +4 other tests ( 2 skip )
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#7118])
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-tglu:         NOTRUN -> ([SKIP][257], [SKIP][258]) ([i915#6944] / [i915#7116] / [i915#7118])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][259] ([i915#7173])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#3299])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-mtlp:         NOTRUN -> ([SKIP][261], [SKIP][262]) ([i915#6944]) +1 other test ( 2 skip )
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_content_protection@uevent.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-tglu:         NOTRUN -> ([SKIP][263], [SKIP][264]) ([i915#3359]) +1 other test ( 2 skip )
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2:          NOTRUN -> ([SKIP][265], [SKIP][266]) ([i915#3359]) +1 other test ( 2 skip )
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#3359])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2:          NOTRUN -> [SKIP][268] ([i915#3555]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-mtlp:         NOTRUN -> ([SKIP][269], [SKIP][270]) ([i915#3555] / [i915#8814])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-32x32.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-mtlp:         NOTRUN -> ([SKIP][271], [SKIP][272]) ([i915#3359]) +1 other test ( 2 skip )
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#3359])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2:          NOTRUN -> ([SKIP][274], [SKIP][275]) ([i915#3555]) +2 other tests ( 2 skip )
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2:          NOTRUN -> [SKIP][276] ([fdo#109274] / [i915#5354]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg1:          NOTRUN -> ([SKIP][277], [SKIP][278]) ([i915#4103] / [i915#4213])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-tglu:         NOTRUN -> ([SKIP][279], [SKIP][280]) ([fdo#109274]) +1 other test ( 2 skip )
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2:          NOTRUN -> ([SKIP][281], [SKIP][282]) ([fdo#109274] / [i915#5354]) +3 other tests ( 2 skip )
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
    - shard-mtlp:         NOTRUN -> ([SKIP][283], [SKIP][284]) ([i915#3546]) +3 other tests ( 2 skip )
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2:          NOTRUN -> ([SKIP][285], [SKIP][286]) ([fdo#109274] / [fdo#111767] / [i915#5354])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-snb:          NOTRUN -> [SKIP][287] ([fdo#109271] / [fdo#111767])
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#4103] / [i915#4213])
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         NOTRUN -> ([SKIP][289], [SKIP][290]) ([i915#4213])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          NOTRUN -> [SKIP][291] ([i915#8588])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-mtlp:         NOTRUN -> ([SKIP][292], [SKIP][293]) ([i915#3555] / [i915#8812])
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3555] / [i915#3840] / [i915#4098])
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-mtlp:         NOTRUN -> [SKIP][295] ([i915#3637])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-dg1:          NOTRUN -> ([SKIP][296], [SKIP][297]) ([fdo#111825]) +3 other tests ( 2 skip )
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][298] ([fdo#109274] / [fdo#111767])
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-tglu:         NOTRUN -> ([SKIP][299], [SKIP][300]) ([fdo#109274] / [fdo#111767] / [i915#3637])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-dg2:          NOTRUN -> ([SKIP][301], [SKIP][302]) ([fdo#109274]) +2 other tests ( 2 skip )
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2:          NOTRUN -> [SKIP][303] ([fdo#109274]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-mtlp:         NOTRUN -> ([SKIP][304], [SKIP][305]) ([i915#3637])
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][306] ([fdo#109274] / [i915#3637]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-fences-interruptible:
    - shard-mtlp:         NOTRUN -> ([SKIP][307], [SKIP][308]) ([i915#8381])
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_flip@flip-vs-fences-interruptible.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> ([SKIP][309], [SKIP][310]) ([i915#2672])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> ([SKIP][311], [SKIP][312]) ([i915#2587] / [i915#2672]) +1 other test ( 2 skip )
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> ([SKIP][313], [SKIP][314]) ([i915#2672]) +2 other tests ( 2 skip )
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> ([SKIP][315], [SKIP][316]) ([i915#8810])
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][317] ([i915#2587] / [i915#2672])
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> ([SKIP][318], [SKIP][319]) ([i915#3555] / [i915#8810])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][320] ([i915#2672]) +4 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2:          [PASS][321] -> ([FAIL][322], [FAIL][323]) ([i915#6880])
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2:          NOTRUN -> ([SKIP][324], [SKIP][325]) ([i915#5354]) +27 other tests ( 2 skip )
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#1825]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][327] ([i915#8708])
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-dg2:          NOTRUN -> ([SKIP][328], [SKIP][329]) ([i915#3458]) +10 other tests ( 2 skip )
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][330] ([i915#3458]) +7 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][331] ([i915#3458])
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglu:         NOTRUN -> ([SKIP][332], [SKIP][333]) ([fdo#110189]) +5 other tests ( 2 skip )
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg1:          NOTRUN -> [SKIP][334] ([fdo#111825]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> ([SKIP][335], [SKIP][336]) ([i915#8708]) +10 other tests ( 2 skip )
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglu:         NOTRUN -> [SKIP][337] ([fdo#109280]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][338] ([i915#8708]) +7 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglu:         NOTRUN -> ([SKIP][339], [SKIP][340]) ([fdo#109280]) +17 other tests ( 2 skip )
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
    - shard-mtlp:         NOTRUN -> ([SKIP][341], [SKIP][342]) ([i915#1825]) +18 other tests ( 2 skip )
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> ([SKIP][343], [SKIP][344]) ([i915#8708]) +2 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][345] ([i915#5460])
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#5460])
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> ([SKIP][347], [SKIP][348]) ([i915#8708]) +4 other tests ( 2 skip )
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-dg2:          NOTRUN -> [SKIP][349] ([i915#5354]) +14 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg1:          NOTRUN -> ([SKIP][350], [SKIP][351]) ([i915#3458]) +2 other tests ( 2 skip )
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-tglu:         NOTRUN -> [SKIP][352] ([fdo#110189]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#3555] / [i915#8228])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle:
    - shard-dg2:          NOTRUN -> ([SKIP][354], [SKIP][355]) ([i915#3555] / [i915#8228]) +1 other test ( 2 skip )
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_hdr@static-toggle.html
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg1:          NOTRUN -> ([SKIP][356], [SKIP][357]) ([i915#3555] / [i915#8228])
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.html
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#4816])
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-tglu:         NOTRUN -> ([SKIP][359], [SKIP][360]) ([i915#6301])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_panel_fitting@legacy.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> ([SKIP][361], [SKIP][362]) ([i915#3582]) +3 other tests ( 2 skip )
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#3555])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg1:          NOTRUN -> ([SKIP][364], [SKIP][365]) ([i915#3555]) +2 other tests ( 2 skip )
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2:          NOTRUN -> ([SKIP][366], [SKIP][367]) ([i915#6953])
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][368] ([i915#5176] / [i915#9423]) +3 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#5235]) +11 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:
    - shard-tglu:         NOTRUN -> ([SKIP][370], [SKIP][371]) ([i915#5235]) +3 other tests ( 2 skip )
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#5235]) +27 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> ([SKIP][373], [SKIP][374]) ([i915#5235]) +3 other tests ( 2 skip )
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html

  * igt@kms_prime@basic-crc-hybrid:
    - shard-dg2:          NOTRUN -> [SKIP][375] ([i915#6524] / [i915#6805]) +3 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_prime@basic-crc-hybrid.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg1:          NOTRUN -> ([SKIP][376], [SKIP][377]) ([i915#9683])
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2:          NOTRUN -> [SKIP][378] ([i915#9683]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-tglu:         NOTRUN -> ([SKIP][379], [SKIP][380]) ([i915#9683])
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-tglu:         NOTRUN -> ([SKIP][381], [SKIP][382]) ([fdo#111068] / [i915#9683])
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2:          NOTRUN -> ([SKIP][383], [SKIP][384]) ([i915#9683])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-dg2:          NOTRUN -> ([SKIP][385], [SKIP][386]) ([i915#9681]) +4 other tests ( 2 skip )
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_psr@psr2_cursor_plane_move.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-dg2:          NOTRUN -> [SKIP][387] ([i915#9681])
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-dg1:          NOTRUN -> ([SKIP][388], [SKIP][389]) ([i915#9673]) +1 other test ( 2 skip )
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglu:         NOTRUN -> ([SKIP][390], [SKIP][391]) ([i915#9673]) +1 other test ( 2 skip )
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_psr@psr2_sprite_render.html
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#9685])
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-mtlp:         NOTRUN -> ([SKIP][393], [SKIP][394]) ([i915#4235])
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][395] ([i915#4235] / [i915#5190])
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-mtlp:         NOTRUN -> [SKIP][396] ([i915#4235]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][397] ([i915#5465]) +1 other test fail
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-dg2:          NOTRUN -> [SKIP][398] ([i915#3555] / [i915#4098])
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2:          NOTRUN -> ([FAIL][399], [FAIL][400]) ([IGT#2])
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_sysfs_edid_timing.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#8623])
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html
    - shard-mtlp:         NOTRUN -> [SKIP][402] ([i915#8623])
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-tglu:         [PASS][403] -> ([PASS][404], [FAIL][405]) ([i915#9196]) +1 other test ( 1 fail, 1 pass )
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vrr@flip-suspend:
    - shard-mtlp:         NOTRUN -> [SKIP][406] ([i915#3555] / [i915#8808])
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@negative-basic:
    - shard-glk:          NOTRUN -> ([SKIP][407], [SKIP][408]) ([fdo#109271]) +41 other tests ( 2 skip )
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk9/igt@kms_vrr@negative-basic.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-mtlp:         NOTRUN -> ([SKIP][409], [SKIP][410]) ([i915#2437])
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2:          NOTRUN -> ([SKIP][411], [SKIP][412]) ([i915#2437]) +1 other test ( 2 skip )
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html

  * igt@perf@enable-disable@0-rcs0:
    - shard-dg2:          [PASS][413] -> [FAIL][414] ([i915#8724])
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-6/igt@perf@enable-disable@0-rcs0.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#2434])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@perf@mi-rpc.html
    - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#2434])
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          [PASS][417] -> ([PASS][418], [FAIL][419]) ([i915#7484])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-double-start@bcs0:
    - shard-mtlp:         [PASS][420] -> ([PASS][421], [FAIL][422]) ([i915#4349]) +2 other tests ( 1 fail, 1 pass )
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html

  * igt@perf_pmu@busy-double-start@ccs0:
    - shard-mtlp:         [PASS][423] -> ([FAIL][424], [FAIL][425]) ([i915#4349])
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-dg1:          NOTRUN -> ([SKIP][426], [SKIP][427]) ([i915#8850])
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@perf_pmu@cpu-hotplug.html
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][428] ([i915#3708])
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-dg2:          NOTRUN -> ([SKIP][429], [SKIP][430]) ([i915#3708])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html

  * igt@v3d/v3d_get_param@base-params:
    - shard-dg2:          NOTRUN -> ([SKIP][431], [SKIP][432]) ([i915#2575]) +5 other tests ( 2 skip )
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@v3d/v3d_get_param@base-params.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@v3d/v3d_get_param@base-params.html

  * igt@v3d/v3d_perfmon@create-perfmon-0:
    - shard-tglu:         NOTRUN -> [SKIP][433] ([fdo#109315] / [i915#2575]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-0.html

  * igt@v3d/v3d_perfmon@get-values-valid-perfmon:
    - shard-dg1:          NOTRUN -> ([SKIP][434], [SKIP][435]) ([i915#2575])
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html

  * igt@v3d/v3d_submit_cl@bad-bo:
    - shard-dg2:          NOTRUN -> [SKIP][436] ([i915#2575]) +10 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-bo.html

  * igt@v3d/v3d_submit_cl@bad-multisync-in-sync:
    - shard-mtlp:         NOTRUN -> [SKIP][437] ([i915#2575]) +2 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html

  * igt@v3d/v3d_submit_cl@valid-submission:
    - shard-tglu:         NOTRUN -> ([SKIP][438], [SKIP][439]) ([fdo#109315] / [i915#2575]) +3 other tests ( 2 skip )
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@v3d/v3d_submit_cl@valid-submission.html
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@v3d/v3d_submit_cl@valid-submission.html
    - shard-mtlp:         NOTRUN -> ([SKIP][440], [SKIP][441]) ([i915#2575]) +6 other tests ( 2 skip )
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@v3d/v3d_submit_cl@valid-submission.html
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@v3d/v3d_submit_cl@valid-submission.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-tglu:         NOTRUN -> [SKIP][442] ([i915#2575]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_lookup_fail@bad-color-write:
    - shard-dg2:          NOTRUN -> ([SKIP][443], [SKIP][444]) ([i915#7711]) +4 other tests ( 2 skip )
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@vc4/vc4_lookup_fail@bad-color-write.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@vc4/vc4_lookup_fail@bad-color-write.html

  * igt@vc4/vc4_perfmon@create-single-perfmon:
    - shard-snb:          NOTRUN -> ([SKIP][445], [SKIP][446]) ([fdo#109271]) +29 other tests ( 2 skip )
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@vc4/vc4_perfmon@create-single-perfmon.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb5/igt@vc4/vc4_perfmon@create-single-perfmon.html

  * igt@vc4/vc4_perfmon@create-two-perfmon:
    - shard-dg2:          NOTRUN -> [SKIP][447] ([i915#7711]) +2 other tests skip
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@vc4/vc4_perfmon@create-two-perfmon.html

  * igt@vc4/vc4_purgeable_bo@free-purged-bo:
    - shard-mtlp:         NOTRUN -> ([SKIP][448], [SKIP][449]) ([i915#7711]) +3 other tests ( 2 skip )
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@vc4/vc4_purgeable_bo@free-purged-bo.html
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@vc4/vc4_purgeable_bo@free-purged-bo.html

  * igt@vc4/vc4_wait_bo@bad-bo:
    - shard-dg1:          NOTRUN -> ([SKIP][450], [SKIP][451]) ([i915#7711]) +1 other test ( 2 skip )
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@vc4/vc4_wait_bo@bad-bo.html
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@vc4/vc4_wait_bo@bad-bo.html

  * igt@vc4/vc4_wait_bo@unused-bo-0ns:
    - shard-mtlp:         NOTRUN -> [SKIP][452] ([i915#7711]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@vc4/vc4_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-0ns:
    - shard-tglu:         NOTRUN -> ([SKIP][453], [SKIP][454]) ([i915#2575]) +1 other test ( 2 skip )
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html

  
#### Possible fixes ####

  * igt@gem_eio@banned:
    - shard-mtlp:         [ABORT][455] ([i915#9414]) -> ([PASS][456], [PASS][457]) +1 other test ( 2 pass )
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-2/igt@gem_eio@banned.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_eio@banned.html
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_eio@banned.html

  * igt@gem_eio@in-flight-internal-1us:
    - shard-mtlp:         [ABORT][458] ([i915#9414]) -> [PASS][459]
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@gem_eio@in-flight-internal-1us.html
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_eio@in-flight-internal-1us.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][460] ([i915#5784]) -> ([PASS][461], [PASS][462])
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-17/igt@gem_eio@reset-stress.html
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@gem_eio@reset-stress.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@gem_eio@reset-stress.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [INCOMPLETE][463] -> ([PASS][464], [PASS][465])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb5/igt@i915_module_load@reload-no-display.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@i915_module_load@reload-no-display.html
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@i915_module_load@reload-no-display.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [INCOMPLETE][466] ([i915#9200]) -> [PASS][467]
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][468] ([i915#7790]) -> [PASS][469]
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb4/igt@i915_pm_rps@reset.html
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][470] ([i915#5138]) -> ([PASS][471], [PASS][472])
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-a:
    - shard-tglu:         [ABORT][473] -> ([PASS][474], [PASS][475])
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-10/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2:          [FAIL][476] ([i915#6880]) -> ([PASS][477], [PASS][478]) +1 other test ( 2 pass )
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-dg2:          [FAIL][479] ([i915#6880]) -> [PASS][480]
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:
    - shard-snb:          [FAIL][481] ([i915#9196]) -> [PASS][482]
   [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html
   [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-mtlp:         [FAIL][483] ([i915#9196]) -> [PASS][484]
   [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-tglu:         [FAIL][485] ([i915#9196]) -> ([PASS][486], [PASS][487])
   [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@perf_pmu@render-node-busy@vcs0:
    - shard-mtlp:         [FAIL][488] ([i915#4349]) -> ([PASS][489], [PASS][490])
   [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@perf_pmu@render-node-busy@vcs0.html
   [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@perf_pmu@render-node-busy@vcs0.html
   [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@perf_pmu@render-node-busy@vcs0.html

  
#### Warnings ####

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/index.html

--===============1022946249537141044==
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
<tr><td><b>Series:</b></td><td>lib/gpgpu_fill: Add support for Xe2 platforms (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126096/">https://patchwork.freedesktop.org/series/126096/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13908_full -&gt; IGTPW_10233_full</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_10233_full need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_10233_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/index.html</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_10233_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@gem_exec_fair@basic-none@vecs0:<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk5/igt@gem_exec_fair@basic-none@vecs0.html">INCOMPLETE</a>) ([i915#2842])</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0}:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-10/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">FAIL</a> ([i915#3591]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html">WARN</a>) +2 other tests ( 2 warn )</li>
</ul>
</li>
<li>
<p>{igt@kms_dirtyfb@drrs-dirtyfb-ioctl}:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4}:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-4.html">SKIP</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_psr@psr2_sprite_render@edp-1}:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@kms_psr@psr2_sprite_render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_psr@psr2_sprite_render@edp-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10233_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a>) ([i915#8411])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> ([i915#8411])</p>
</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a>) ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@all-busy-check-all:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a> ([i915#8414])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@drm_fdinfo@all-busy-check-all.html">SKIP</a>) ([i915#8414]) +1 other test ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@isolation@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@drm_fdinfo@isolation@bcs0.html">SKIP</a> ([i915#8414]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@vcs0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@drm_fdinfo@most-busy-check-all@vcs0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@drm_fdinfo@most-busy-check-all@vcs0.html">SKIP</a>) ([i915#8414]) +13 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-2/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-lmem0-lmem0.html">INCOMPLETE</a> ([i915#7297])</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-process:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_close_race@multigpu-basic-process.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-norecovery:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_exec@basic-norecovery.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_ctx_exec@basic-norecovery.html">ABORT</a>) ([i915#9414]) +1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vecs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-12/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3@vecs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_ctx_isolation@preservation-s3@vecs0.html">DMESG-WARN</a>) ([i915#4423])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a>) ([i915#8555]) +1 other test ( 2 skip )</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> ([i915#8555])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_balancer@hog.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_exec_balancer@hog.html">SKIP</a>) ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@noheartbeat:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_exec_balancer@noheartbeat.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_exec_balancer@noheartbeat.html">SKIP</a>) ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> ([i915#6117])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> ([i915#6334]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-recoverable:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@gem_exec_capture@capture-recoverable.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@gem_exec_capture@capture-recoverable.html">SKIP</a>) ([i915#6344])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@many-4k-zero:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_exec_capture@many-4k-zero.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_capture@many-4k-zero.html">FAIL</a>) ([i915#9606])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_capture@many-4k-zero.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_exec_capture@many-4k-zero.html">FAIL</a>) ([i915#9606])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>) ([i915#2842]) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_exec_fair@basic-pace-solo.html">SKIP</a>) ([i915#4473])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>) ([i915#2842]) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit67:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_exec_fence@submit67.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@gem_exec_fence@submit67.html">SKIP</a>) ([i915#4812])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_fence@submit67.html">SKIP</a> ([i915#4812])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_exec_flush@basic-uc-set-default.html">SKIP</a>) ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a>) ([i915#3539] / [i915#4852]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +3 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a>) ([i915#3281]) +2 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a>) ([i915#3281])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_exec_reloc@basic-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_exec_reloc@basic-wc.html">SKIP</a>) ([i915#3281]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt-active:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_exec_reloc@basic-wc-gtt-active.html">SKIP</a> ([i915#3281]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-contexts:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-contexts.html">SKIP</a> ([i915#4537] / [i915#4812])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> ([i915#7975] / [i915#8213])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a>) ([i915#4860]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a>) ([i915#4860]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_fenced_exec_thrash@too-many-fences.html">SKIP</a> ([i915#4860]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>) ([i915#4613]) +1 other test ( 2 skip )</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk6/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk3/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a>) ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html">SKIP</a>) ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a>) ([i915#4936] / [i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html">SKIP</a>) ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@bad-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_mmap@bad-size.html">SKIP</a> ([i915#4083]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-write-cpu-read-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html">SKIP</a>) ([i915#4077]) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">SKIP</a>) ([i915#4077]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> ([i915#4077]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-object:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gem_mmap_wc@bad-object.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_mmap_wc@bad-object.html">SKIP</a>) ([i915#4083]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@bad-offset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_mmap_wc@bad-offset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_mmap_wc@bad-offset.html">SKIP</a>) ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_mmap_wc@read-write.html">SKIP</a> ([i915#4083])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a>) ([i915#4083]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@gem_partial_pwrite_pread@writes-after-reads.html">SKIP</a>) ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_partial_pwrite_pread@writes-after-reads-display.html">SKIP</a> ([i915#3282]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_pwrite@basic-exhaustion.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_pwrite@basic-exhaustion.html">SKIP</a>) ([i915#3282]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a>) ([i915#4270]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_pxp@regular-baseline-src-copy-readible.html">SKIP</a>) ([i915#4270]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@write-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_readwrite@write-bad-handle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_readwrite@write-bad-handle.html">SKIP</a>) ([i915#3282]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#8428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html">SKIP</a>) ([i915#8428]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gem_render_tiled_blits@basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gem_render_tiled_blits@basic.html">SKIP</a>) ([i915#4079]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@untiled-to-tiled:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_set_tiling_vs_pwrite.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_set_tiling_vs_pwrite.html">SKIP</a>) ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_softpin@evict-snoop.html">SKIP</a> ([i915#4885])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_blits@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_tiled_blits@basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_tiled_blits@basic.html">SKIP</a>) ([i915#4077]) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_tiled_pread_basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_tiled_pread_basic.html">SKIP</a>) ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_pread_pwrite:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_tiled_pread_pwrite.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a>) ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a>) ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html">SKIP</a> ([i915#3297] / [i915#4880])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html">SKIP</a>) ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gem_userptr_blits@sd-probe.html">SKIP</a> ([i915#3297] / [i915#4958])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@gem_userptr_blits@vma-merge.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gem_userptr_blits@vma-merge.html">FAIL</a>) ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@gen3_render_linear_blits.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@gen3_render_linear_blits.html">SKIP</a>) ([fdo#109289]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@gen3_render_tiledy_blits.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gen3_render_tiledy_blits.html">SKIP</a>) ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@gen7_exec_parse@chained-batch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@gen7_exec_parse@chained-batch.html">SKIP</a>) ([fdo#109289]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@gen9_exec_parse@bb-chained.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@gen9_exec_parse@bb-chained.html">SKIP</a>) ([i915#2527] / [i915#2856]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@gen9_exec_parse@bb-start-out.html">SKIP</a>) ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>) ([i915#2856]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@gen9_exec_parse@valid-registers.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@gen9_exec_parse@valid-registers.html">SKIP</a>) ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset-multiple@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-8/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@i915_pm_freq_api@freq-reset-multiple@gt0.html">ABORT</a>) ([i915#9414])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@i915_pm_freq_api@freq-suspend@gt0.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@i915_pm_freq_api@freq-suspend@gt0.html">PASS</a>) ([i915#9407])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@memory_region:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>) ([i915#9311])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@i915_selftest@mock@memory_region.html">DMESG-WARN</a>) ([i915#9311])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-5/igt@i915_suspend@forcewake.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@i915_suspend@forcewake.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@i915_suspend@forcewake.html">PASS</a>) ([i915#9702])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a>) ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>) ([i915#4212]) +1 other test ( 2 skip )</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a>) ([i915#4212])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_async_flips@crc@pipe-d-hdmi-a-4.html">FAIL</a> ([i915#8247]) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a>) ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#4098] / [i915#9531])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a>) ([i915#1769] / [i915#3555]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109271]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>) ([fdo#111615] / [i915#5286]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a>) ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a>) ([i915#4538] / [i915#5286])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a>) ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a>) ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a>) ([fdo#111614])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a>) ([fdo#111614]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a>) ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a>) ([i915#3743]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a>) ([i915#3743])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> ([i915#5190]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a>) ([i915#5190]) +9 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a>) ([i915#3638])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#111615]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a>) ([i915#4538] / [i915#5190]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>) ([i915#4538]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([i915#4538] / [i915#5190]) +3 other tests skip</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a>) ([fdo#111615]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_big_joiner@invalid-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a>) ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-2.html">SKIP</a> ([i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> ([i915#4087]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html">SKIP</a> ([i915#4087]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a>) ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_chamelium_color@gamma.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_chamelium_color@gamma.html">SKIP</a>) ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-14/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a>) ([i915#7828]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> ([i915#7828])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-frame-dump:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_chamelium_frames@dp-frame-dump.html">SKIP</a>) ([i915#7828]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> ([i915#7828]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> ([i915#7828]) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a>) ([i915#7828]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a>) ([i915#7828]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_content_protection@atomic.html">SKIP</a> ([i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_content_protection@atomic-dpms.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a>) ([i915#6944] / [i915#7116] / [i915#7118])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_content_protection@uevent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_content_protection@uevent.html">SKIP</a>) ([i915#6944]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) ([i915#3359]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>) ([i915#3359]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> ([i915#3555]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a>) ([i915#3555] / [i915#8814])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a>) ([i915#3359]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a>) ([i915#3555]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [i915#5354]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a>) ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a>) ([fdo#109274]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a>) ([fdo#109274] / [i915#5354]) +3 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a>) ([i915#3546]) +3 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a>) ([fdo#109274] / [fdo#111767] / [i915#5354])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109271] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>) ([i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> ([i915#8588])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a>) ([i915#3555] / [i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> ([i915#3555] / [i915#3840] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a>) ([fdo#111825]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> ([fdo#109274] / [fdo#111767])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a>) ([fdo#109274] / [fdo#111767] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a>) ([fdo#109274]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> ([fdo#109274]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a>) ([i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> ([fdo#109274] / [i915#3637]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences-interruptible:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_flip@flip-vs-fences-interruptible.html">SKIP</a>) ([i915#8381])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a>) ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a>) ([i915#2587] / [i915#2672]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>) ([i915#2672]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a>) ([i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a>) ([i915#3555] / [i915#8810])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a>) ([i915#6880])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a>) ([i915#5354]) +27 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> ([i915#1825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt.html">SKIP</a> ([i915#8708])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html">SKIP</a>) ([i915#3458]) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> ([i915#3458]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([i915#3458])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a>) ([fdo#110189]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#111825]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) ([i915#8708]) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) ([fdo#109280]) +17 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) ([i915#1825]) +18 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a>) ([i915#8708]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> ([i915#5460])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a>) ([i915#8708]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([i915#5354]) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a>) ([i915#3458]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> ([fdo#110189]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_hdr@static-toggle.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_hdr@static-toggle.html">SKIP</a>) ([i915#3555] / [i915#8228]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>) ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#4816])</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_panel_fitting@legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_panel_fitting@legacy.html">SKIP</a>) ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_plane_lowres@tiling-x@pipe-c-edp-1.html">SKIP</a>) ([i915#3582]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> ([i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_plane_multiple@tiling-yf.html">SKIP</a>) ([i915#3555]) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) ([i915#6953])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5176] / [i915#9423]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-3.html">SKIP</a> ([i915#5235]) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-1.html">SKIP</a>) ([i915#5235]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-3.html">SKIP</a>) ([i915#5235]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-hybrid:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@kms_prime@basic-crc-hybrid.html">SKIP</a> ([i915#6524] / [i915#6805]) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a>) ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#9683]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html">SKIP</a>) ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a>) ([fdo#111068] / [i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a>) ([i915#9683])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>) ([i915#9681]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([i915#9681])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-16/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a>) ([i915#9673]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-8/igt@kms_psr@psr2_sprite_render.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@kms_psr@psr2_sprite_render.html">SKIP</a>) ([i915#9673]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> ([i915#9685])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>) ([i915#4235])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> ([i915#4235] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> ([i915#4235]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> ([i915#3555] / [i915#4098])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_sysfs_edid_timing.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@kms_sysfs_edid_timing.html">FAIL</a>) ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#8623])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a>) ([i915#9196]) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@kms_vrr@flip-suspend.html">SKIP</a> ([i915#3555] / [i915#8808])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk9/igt@kms_vrr@negative-basic.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-glk2/igt@kms_vrr@negative-basic.html">SKIP</a>) ([fdo#109271]) +41 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a>) ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a>) ([i915#2437]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@perf@enable-disable@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-6/igt@perf@enable-disable@0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@perf@enable-disable@0-rcs0.html">FAIL</a> ([i915#8724])</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf@mi-rpc.html">SKIP</a> ([i915#2434])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@perf@non-zero-reason@0-rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a>) ([i915#7484])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf_pmu@busy-double-start@bcs0.html">FAIL</a>) ([i915#4349]) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-1/igt@perf_pmu@busy-double-start@ccs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@perf_pmu@busy-double-start@ccs0.html">FAIL</a>) ([i915#4349])</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@cpu-hotplug:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@perf_pmu@cpu-hotplug.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@perf_pmu@cpu-hotplug.html">SKIP</a>) ([i915#8850])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-17/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@prime_vgem@fence-flip-hang.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@prime_vgem@fence-flip-hang.html">SKIP</a>) ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_param@base-params:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-3/igt@v3d/v3d_get_param@base-params.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@v3d/v3d_get_param@base-params.html">SKIP</a>) ([i915#2575]) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@create-perfmon-0:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@v3d/v3d_perfmon@create-perfmon-0.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_perfmon@get-values-valid-perfmon:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-19/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html">SKIP</a>) ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-bo:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> ([i915#2575]) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-multisync-in-sync:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@v3d/v3d_submit_cl@bad-multisync-in-sync.html">SKIP</a> ([i915#2575]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@valid-submission:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-3/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a>) ([fdo#109315] / [i915#2575]) +3 other tests ( 2 skip )</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-1/igt@v3d/v3d_submit_cl@valid-submission.html">SKIP</a>) ([i915#2575]) +6 other tests ( 2 skip )</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> ([i915#2575]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_lookup_fail@bad-color-write:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-6/igt@vc4/vc4_lookup_fail@bad-color-write.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-7/igt@vc4/vc4_lookup_fail@bad-color-write.html">SKIP</a>) ([i915#7711]) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-single-perfmon:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb5/igt@vc4/vc4_perfmon@create-single-perfmon.html">SKIP</a>) ([fdo#109271]) +29 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_perfmon@create-two-perfmon:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-5/igt@vc4/vc4_perfmon@create-two-perfmon.html">SKIP</a> ([i915#7711]) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@free-purged-bo:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-6/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-8/igt@vc4/vc4_purgeable_bo@free-purged-bo.html">SKIP</a>) ([i915#7711]) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@bad-bo:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-13/igt@vc4/vc4_wait_bo@bad-bo.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-12/igt@vc4/vc4_wait_bo@bad-bo.html">SKIP</a>) ([i915#7711]) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@vc4/vc4_wait_bo@unused-bo-0ns.html">SKIP</a> ([i915#7711]) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-0ns:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-2/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-9/igt@vc4/vc4_wait_seqno@bad-seqno-0ns.html">SKIP</a>) ([i915#2575]) +1 other test ( 2 skip )</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-2/igt@gem_eio@banned.html">ABORT</a> ([i915#9414]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@gem_eio@banned.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-5/igt@gem_eio@banned.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-internal-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@gem_eio@in-flight-internal-1us.html">ABORT</a> ([i915#9414]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@gem_eio@in-flight-internal-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg1-15/igt@gem_eio@reset-stress.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb5/igt@i915_module_load@reload-no-display.html">INCOMPLETE</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@i915_module_load@reload-no-display.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb1/igt@i915_module_load@reload-no-display.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#9200]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb4/igt@i915_pm_rps@reset.html">INCOMPLETE</a> ([i915#7790]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-a:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-10/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html">ABORT</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_busy@extended-modeset-hang-newfb@pipe-a.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#6880]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">FAIL</a> ([i915#6880]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-snb5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-snb2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> ([i915#9196]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-tglu-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> ([i915#9196]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-tglu-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@render-node-busy@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13908/shard-mtlp-7/igt@perf_pmu@render-node-busy@vcs0.html">FAIL</a> ([i915#4349]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-7/igt@perf_pmu@render-node-busy@vcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10233/shard-mtlp-4/igt@perf_pmu@render-node-busy@vcs0.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_ctx_exec@basic-nohangcheck:<ul>
<li>shard-tglu:         [FAIL]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1022946249537141044==--
