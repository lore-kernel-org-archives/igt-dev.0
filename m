Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6780877909646731195=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Sun, 06 Aug 2023 19:02:15 -0000
Message-ID: <169134853530.23662.8321014403304570146@emeril.freedesktop.org>
References: <20230806164729.1016167-1-swati2.sharma@intel.com>
In-Reply-To: <20230806164729.1016167-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZHAtbXN0?=
 =?utf-8?q?_helpers?=
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

--===============6780877909646731195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dp-mst helpers
URL   : https://patchwork.freedesktop.org/series/122070/
State : failure

== Summary ==

CI Bug Log - changes from IGT_7416_full -> IGTPW_9522_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9522_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9522_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9522_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-dg2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@i915_pm_rpm@system-suspend-execbuf.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-glk:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk3/igt@kms_display_modes@extended-mode-basic.html

  
#### Warnings ####

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglu:         [SKIP][4] ([i915#3116] / [i915#3299]) -> [FAIL][5] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-mtlp:         [SKIP][6] ([i915#3299]) -> [FAIL][7] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2:          [SKIP][8] ([i915#3299]) -> [FAIL][9] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-rkl:          [SKIP][10] ([i915#3116]) -> [FAIL][11] +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-dg1:          [SKIP][12] ([i915#3299]) -> [FAIL][13] +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-1.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-apl:          [SKIP][14] ([fdo#109271]) -> [FAIL][15] +5 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl3/igt@kms_content_protection@dp-mst-type-1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@kms_content_protection@dp-mst-type-1.html
    - shard-glk:          [SKIP][16] ([fdo#109271]) -> [FAIL][17] +4 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk7/igt@kms_content_protection@dp-mst-type-1.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-dg2:          [SKIP][18] ([i915#3555]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html
    - shard-rkl:          [SKIP][20] ([i915#3555]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html
    - shard-dg1:          [SKIP][22] ([i915#3555]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-14/igt@kms_display_modes@extended-mode-basic.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_display_modes@extended-mode-basic.html
    - shard-tglu:         [SKIP][24] ([i915#3555]) -> [FAIL][25]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2:          [SKIP][26] ([i915#8588]) -> [FAIL][27]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-rkl:          [SKIP][28] ([i915#8588]) -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-snb:          [SKIP][30] ([fdo#109271]) -> [FAIL][31] +4 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-snb5/igt@kms_display_modes@mst-extended-mode-negative.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb6/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-dg1:          [SKIP][32] ([i915#8588]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-tglu:         [SKIP][34] ([i915#8588]) -> [FAIL][35]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@kms_display_modes@mst-extended-mode-negative.html
    - shard-mtlp:         [SKIP][36] ([i915#8588]) -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@kms_display_modes@mst-extended-mode-negative.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html

  
Known issues
------------

  Here are the changes found in IGTPW_9522_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][38] ([i915#8411])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html
    - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#8411])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@debugfs_test@basic-hwmon:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#7456])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@debugfs_test@basic-hwmon.html

  * igt@drm_fdinfo@virtual-busy-idle:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#8414])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html

  * igt@drm_mm@drm_mm_test:
    - shard-dg1:          NOTRUN -> [SKIP][42] ([i915#8661])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@drm_mm@drm_mm_test.html

  * igt@feature_discovery@display-4x:
    - shard-rkl:          NOTRUN -> [SKIP][43] ([i915#1839])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@feature_discovery@display-4x.html

  * igt@gem_barrier_race@remote-request@rcs0:
    - shard-glk:          [PASS][44] -> [ABORT][45] ([i915#7461] / [i915#8190])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk8/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-tglu:         NOTRUN -> [SKIP][46] ([i915#3555] / [i915#5325])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_ccs@suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][47] ([i915#5325])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ccs@suspend-resume.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#7697])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html
    - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#7697])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-mtlp:         [PASS][50] -> [FAIL][51] ([i915#6121])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_freq@sysfs@gt0:
    - shard-dg2:          [PASS][52] -> [FAIL][53] ([i915#6786])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - shard-mtlp:         [PASS][54] -> [FAIL][55] ([i915#2410])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@heartbeat-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#8555])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#8555])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
    - shard-mtlp:         NOTRUN -> [SKIP][58] ([i915#5882]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#280])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html
    - shard-rkl:          NOTRUN -> [SKIP][60] ([i915#280])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#280])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@reset-stress:
    - shard-snb:          NOTRUN -> [FAIL][62] ([i915#8898])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb6/igt@gem_eio@reset-stress.html
    - shard-dg1:          [PASS][63] -> [FAIL][64] ([i915#5784]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-12/igt@gem_eio@reset-stress.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4525])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-none:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4473] / [i915#4771])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_exec_fair@basic-none.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#2842])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][69] -> [FAIL][70] ([i915#2842]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-rkl:          [PASS][71] -> [FAIL][72] ([i915#2842]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fence@submit3:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4812])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_exec_fence@submit3.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#3539])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#3539] / [i915#4852]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#3539] / [i915#4852]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([fdo#109283])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-cpu-gtt-active:
    - shard-dg1:          NOTRUN -> [SKIP][78] ([i915#3281])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gem_exec_reloc@basic-cpu-gtt-active.html

  * igt@gem_exec_reloc@basic-gtt-wc:
    - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3281]) +6 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-wc.html
    - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#3281])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-wc.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][81] ([i915#3281]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_suspend@basic-s4-devices@lmem0:
    - shard-dg2:          NOTRUN -> [ABORT][82] ([i915#7975] / [i915#8213])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-mtlp:         [PASS][83] -> [ABORT][84] ([i915#7392] / [i915#8131])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_fence_thrash@bo-write-verify-none:
    - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4860])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-none.html
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4860])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-none.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#4613])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-rkl:          NOTRUN -> [SKIP][88] ([i915#4613])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg2:          [PASS][89] -> [TIMEOUT][90] ([i915#5493])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_madvise@dontneed-before-pwrite:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#3282]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_madvise@dontneed-before-pwrite.html
    - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#3282]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_madvise@dontneed-before-pwrite.html

  * igt@gem_mmap_gtt@basic-short:
    - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#4077]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@gem_mmap_gtt@basic-short.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4077]) +7 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@flink-race:
    - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4077]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html

  * igt@gem_mmap_wc@read:
    - shard-dg2:          NOTRUN -> [SKIP][96] ([i915#4083])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@gem_mmap_wc@read.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg1:          NOTRUN -> [SKIP][97] ([i915#4083]) +3 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_partial_pwrite_pread@write-uncached:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3282])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gem_partial_pwrite_pread@write-uncached.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#4270]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_pxp@display-protected-crc.html
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#4270]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4270])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#4270])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_set_tiling_vs_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][103] ([i915#4079])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4079])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@gem_set_tiling_vs_gtt.html

  * igt@gem_spin_batch@user-each:
    - shard-apl:          [PASS][105] -> [FAIL][106] ([i915#2898])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl3/igt@gem_spin_batch@user-each.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl3/igt@gem_spin_batch@user-each.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#3297]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#3297]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html
    - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#3297])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-tglu:         NOTRUN -> [SKIP][110] ([i915#3297])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@sd-probe:
    - shard-dg1:          NOTRUN -> [SKIP][111] ([i915#3297] / [i915#4958])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          NOTRUN -> [FAIL][112] ([i915#3318])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html
    - shard-mtlp:         NOTRUN -> [FAIL][113] ([i915#3318])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_render_tiledy_blits:
    - shard-mtlp:         NOTRUN -> [SKIP][114] ([fdo#109289])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          NOTRUN -> [SKIP][115] ([fdo#109289]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gen7_exec_parse@bitmasks.html
    - shard-rkl:          NOTRUN -> [SKIP][116] ([fdo#109289]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-tglu:         NOTRUN -> [SKIP][117] ([i915#2527] / [i915#2856])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#2856])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gen9_exec_parse@bb-start-far.html
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([i915#2856])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][120] ([i915#2527])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_hwmon@hwmon-read:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#7707])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@i915_hwmon@hwmon-read.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-mtlp:         [PASS][122] -> [ABORT][123] ([i915#8489] / [i915#8668])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#7091])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#5354] / [i915#7561])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#658])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][127] ([i915#3361])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [PASS][128] -> [SKIP][129] ([fdo#109271])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_freq_api@freq-reset:
    - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#8399])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@i915_pm_freq_api@freq-reset.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-mtlp:         [PASS][131] -> [SKIP][132] ([fdo#109289] / [i915#8403])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - shard-dg1:          [PASS][133] -> [FAIL][134] ([i915#7691])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@i915_pm_rpm@basic-pci-d3-state.html

  * igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:
    - shard-dg1:          [PASS][135] -> [FAIL][136] ([i915#7940])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html

  * igt@i915_pm_rpm@i2c:
    - shard-dg2:          [PASS][137] -> [FAIL][138] ([i915#8717])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-6/igt@i915_pm_rpm@i2c.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#1397]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          [PASS][140] -> [SKIP][141] ([i915#1397])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][142] -> [SKIP][143] ([i915#1397]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [PASS][144] -> [SKIP][145] ([i915#1397]) +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg1:          NOTRUN -> [SKIP][146] ([i915#6621])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@reset:
    - shard-tglu:         [PASS][147] -> [INCOMPLETE][148] ([i915#8320])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-7/igt@i915_pm_rps@reset.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@i915_pm_rps@reset.html

  * igt@i915_pm_rps@thresholds-idle@gt1:
    - shard-mtlp:         NOTRUN -> [SKIP][149] ([i915#8925]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle@gt1.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#8925])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [PASS][151] -> [DMESG-FAIL][152] ([i915#5334])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@live@migrate:
    - shard-mtlp:         NOTRUN -> [DMESG-FAIL][153] ([i915#7699])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@i915_selftest@live@migrate.html

  * igt@i915_selftest@live@slpc:
    - shard-mtlp:         NOTRUN -> [DMESG-WARN][154] ([i915#6367])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@i915_selftest@live@slpc.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#4215])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@clobberred-modifier:
    - shard-dg1:          NOTRUN -> [SKIP][156] ([i915#4212])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [PASS][157] -> [FAIL][158] ([i915#2521])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#8502] / [i915#8709]) +11 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#8502]) +7 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [FAIL][161] ([i915#8247]) +3 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
    - shard-rkl:          NOTRUN -> [FAIL][162] ([i915#8247]) +1 similar issue
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
    - shard-snb:          NOTRUN -> [FAIL][163] ([i915#8247]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#404])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][165] ([fdo#111614]) +2 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#5286]) +2 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#4538] / [i915#5286])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-mtlp:         [PASS][168] -> [FAIL][169] ([i915#5138])
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-tglu:         NOTRUN -> [SKIP][170] ([fdo#111615] / [i915#5286])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([fdo#111614] / [i915#3638]) +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [FAIL][172] ([i915#3743])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#5190]) +5 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-tglu:         NOTRUN -> [SKIP][174] ([fdo#111615])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#4538] / [i915#5190]) +4 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-mtlp:         NOTRUN -> [SKIP][176] ([fdo#111615]) +4 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][177] ([fdo#110723]) +1 similar issue
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg1:          NOTRUN -> [SKIP][178] ([i915#4538])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#3689] / [i915#5354]) +20 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3886] / [i915#6095]) +2 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#5354]) +31 similar issues
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][182] ([i915#3689] / [i915#5354] / [i915#6095]) +4 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#3734] / [i915#5354] / [i915#6095]) +7 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][187] ([i915#5354] / [i915#6095]) +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][188] ([i915#5354] / [i915#6095]) +5 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#5354]) +14 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#6095]) +10 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3689] / [i915#3886] / [i915#5354]) +6 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][193] ([i915#5354] / [i915#6095]) +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#4087] / [i915#7213]) +2 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#7213])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#4087]) +3 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([fdo#111827]) +1 similar issue
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-rkl:          NOTRUN -> [SKIP][198] ([fdo#111827])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg1:          NOTRUN -> [SKIP][199] ([i915#7828]) +2 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@vga-frame-dump:
    - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#7828]) +1 similar issue
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_chamelium_frames@vga-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#7828])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-mtlp:         NOTRUN -> [SKIP][202] ([i915#7828]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][203] ([i915#7173])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@mei_interface:
    - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#8063])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#7118])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_content_protection@srm.html
    - shard-rkl:          NOTRUN -> [SKIP][206] ([i915#7118])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#8814]) +1 similar issue
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3555]) +3 similar issues
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#3555]) +1 similar issue
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][210] ([i915#8841]) +2 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#3546])
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-mtlp:         NOTRUN -> [SKIP][212] ([i915#4213])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][213] ([fdo#109274])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][214] ([fdo#109274] / [i915#5354]) +1 similar issue
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][215] ([fdo#111767] / [fdo#111825])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#8812])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#3840])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3840])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#3637])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-dg2:          NOTRUN -> [SKIP][220] ([fdo#109274]) +3 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
    - shard-rkl:          NOTRUN -> [SKIP][221] ([fdo#111825]) +3 similar issues
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-tglu:         NOTRUN -> [SKIP][222] ([fdo#109274] / [i915#3637]) +1 similar issue
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:
    - shard-apl:          [PASS][223] -> [FAIL][224] ([i915#79])
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#2672]) +4 similar issues
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#2672]) +2 similar issues
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][227] ([i915#2672])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][228] ([i915#2587] / [i915#2672])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#2587] / [i915#2672])
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-dg2:          [PASS][230] -> [FAIL][231] ([i915#6880]) +2 similar issues
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#8708]) +7 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][233] ([fdo#109280]) +3 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-mtlp:         NOTRUN -> [SKIP][234] ([i915#1825]) +8 similar issues
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-dg1:          NOTRUN -> [SKIP][235] ([fdo#111825]) +6 similar issues
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-dg2:          NOTRUN -> [FAIL][236] ([i915#6880])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][237] ([i915#3023]) +7 similar issues
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-rkl:          NOTRUN -> [SKIP][238] ([fdo#111825] / [i915#1825]) +15 similar issues
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][239] ([i915#8708]) +1 similar issue
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][240] ([i915#8708]) +6 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#3458]) +11 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#3458]) +1 similar issue
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][243] ([i915#6118])
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#3555] / [i915#8228]) +2 similar issues
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][245] ([i915#6403]) +3 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:
    - shard-dg2:          [PASS][246] -> [FAIL][247] ([fdo#103375])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#8806])
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][249] ([i915#8292])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#5176]) +3 similar issues
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#5176]) +27 similar issues
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][252] ([i915#5176]) +1 similar issue
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][253] ([i915#5176]) +9 similar issues
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#5235]) +5 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][255] ([fdo#109271]) +190 similar issues
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][256] ([i915#5235]) +7 similar issues
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#5235]) +3 similar issues
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][258] ([i915#5235]) +15 similar issues
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglu:         NOTRUN -> [SKIP][259] ([fdo#111068] / [i915#658])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#658])
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-rkl:          NOTRUN -> [SKIP][261] ([fdo#111068] / [i915#658])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@cursor_plane_move:
    - shard-tglu:         NOTRUN -> [SKIP][262] ([fdo#110189]) +3 similar issues
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_render:
    - shard-dg1:          NOTRUN -> [SKIP][263] ([i915#1072]) +2 similar issues
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#1072]) +1 similar issue
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#1072]) +2 similar issues
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#5461] / [i915#658])
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#4235])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_selftest@drm_cmdline:
    - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#8661])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_selftest@drm_cmdline.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-mtlp:         NOTRUN -> [SKIP][269] ([fdo#109309])
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html
    - shard-dg2:          NOTRUN -> [SKIP][270] ([fdo#109309])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-c-wait-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][271] ([i915#4070] / [i915#6768])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html

  * igt@kms_vblank@pipe-d-query-forked-busy-hang:
    - shard-rkl:          NOTRUN -> [SKIP][272] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_vblank@pipe-d-query-forked-busy-hang.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2:          NOTRUN -> [SKIP][273] ([i915#2437])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_writeback@writeback-check-output.html
    - shard-rkl:          NOTRUN -> [SKIP][274] ([i915#2437])
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#2437])
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][276] ([i915#7484])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#2433])
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html

  * igt@perf_pmu@busy-idle-check-all@bcs0:
    - shard-mtlp:         [PASS][278] -> [FAIL][279] ([i915#4521]) +3 similar issues
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html

  * igt@perf_pmu@busy-idle-check-all@vcs0:
    - shard-dg2:          [PASS][280] -> [FAIL][281] ([i915#4521]) +6 similar issues
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vcs0.html
    - shard-dg1:          [PASS][282] -> [FAIL][283] ([i915#4521]) +1 similar issue
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vcs0.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vcs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][284] ([i915#6806])
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@perf_pmu@frequency@gt0.html

  * igt@prime_vgem@basic-fence-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][285] ([i915#8445])
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@prime_vgem@basic-fence-blt.html

  * igt@prime_vgem@basic-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3708] / [i915#4077])
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@prime_vgem@basic-gtt.html

  * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
    - shard-mtlp:         [PASS][287] -> [FAIL][288] ([i915#6015]) +2 similar issues
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [PASS][289] -> [FAIL][290] ([i915#8332])
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][291] -> [TIMEOUT][292] ([i915#6950])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html

  * igt@v3d/v3d_job_submission@array-job-submission:
    - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#2575]) +6 similar issues
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@v3d/v3d_job_submission@array-job-submission.html

  * igt@v3d/v3d_submit_csd@valid-multisync-submission:
    - shard-rkl:          NOTRUN -> [SKIP][294] ([fdo#109315]) +3 similar issues
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@v3d/v3d_submit_csd@valid-multisync-submission.html

  * igt@v3d/v3d_wait_bo@bad-bo:
    - shard-tglu:         NOTRUN -> [SKIP][295] ([fdo#109315] / [i915#2575])
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@v3d/v3d_wait_bo@bad-bo.html

  * igt@v3d/v3d_wait_bo@map-bo-0ns:
    - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#2575]) +3 similar issues
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@v3d/v3d_wait_bo@map-bo-0ns.html

  * igt@v3d/v3d_wait_bo@unused-bo-0ns:
    - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#2575]) +2 similar issues
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@v3d/v3d_wait_bo@unused-bo-0ns.html

  * igt@vc4/vc4_purgeable_bo@mark-willneed:
    - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#2575]) +1 similar issue
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-3/igt@vc4/vc4_purgeable_bo@mark-willneed.html

  * igt@vc4/vc4_tiling@get-bad-flags:
    - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#7711])
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@vc4/vc4_tiling@get-bad-flags.html

  * igt@vc4/vc4_tiling@set-get:
    - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#7711]) +2 similar issues
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@vc4/vc4_tiling@set-get.html

  * igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
    - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#7711]) +5 similar issues
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html
    - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#7711]) +2 similar issues
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - shard-rkl:          [FAIL][303] ([i915#7742]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [FAIL][305] ([i915#6268]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-dg1:          [FAIL][307] ([fdo#103375]) -> [PASS][308] +5 similar issues
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_eio@reset-stress:
    - shard-dg2:          [FAIL][309] ([i915#5784]) -> [PASS][310]
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@gem_eio@reset-stress.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@gem_eio@reset-stress.html

  * igt@gem_eio@unwedge-stress:
    - shard-dg1:          [FAIL][311] ([i915#5784]) -> [PASS][312]
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-17/igt@gem_eio@unwedge-stress.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-12/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][313] ([i915#2842]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-rkl:          [FAIL][315] ([i915#2842]) -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][317] -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-mtlp:         [TIMEOUT][319] ([i915#7392] / [i915#8628]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_hangman@detector@vcs0:
    - shard-mtlp:         [FAIL][321] ([i915#8456]) -> [PASS][322] +2 similar issues
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html

  * igt@i915_hangman@gt-engine-error@vcs0:
    - shard-mtlp:         [FAIL][323] ([i915#7069]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@i915_hangman@gt-engine-error@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [FAIL][325] ([i915#3591]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][327] ([i915#1397]) -> [PASS][328]
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-dg2:          [FAIL][329] ([fdo#103375]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-dg1:          [FAIL][331] ([i915#7940]) -> [PASS][332] +2 similar issues
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-18/igt@i915_pm_rpm@system-suspend-modeset.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-mtlp:         [FAIL][333] ([i915#5138]) -> [PASS][334]
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][335] ([i915#3743]) -> [PASS][336] +2 similar issues
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:
    - shard-glk:          [FAIL][337] ([i915#79]) -> [PASS][338]
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:
    - shard-dg2:          [FAIL][339] ([i915#6880]) -> [PASS][340]
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglu:         [SKIP][341] ([i915#433]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-WARN][343] ([i915#2017]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][345] ([i915#8292]) -> [PASS][346]
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@perf_pmu@busy-double-start@ccs3:
    - shard-dg2:          [FAIL][347] ([i915#4349]) -> [PASS][348] +3 similar issues
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs3.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs3.html

  * igt@perf_pmu@busy-double-start@vcs1:
    - shard-dg1:          [FAIL][349] ([i915#4349]) -> [PASS][350] +1 similar issue
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@perf_pmu@busy-double-start@vcs1.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html

  * igt@perf_pmu@rc6-suspend:
    - shard-rkl:          [FAIL][351] ([fdo#103375]) -> [PASS][352]
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@perf_pmu@rc6-suspend.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@perf_pmu@rc6-suspend.html

  * igt@syncobj_timeline@multi-wait-available-signaled:
    - shard-mtlp:         [DMESG-WARN][353] -> [PASS][354]
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@syncobj_timeline@multi-wait-available-signaled.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@syncobj_timeline@multi-wait-available-signaled.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-snb:          [DMESG-FAIL][355] ([fdo#103375]) -> [DMESG-WARN][356] ([i915#8841])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-snb7/igt@gem_softpin@noreloc-s3.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_async_flips@crc@pipe-a-edp-1:
    - shard-mtlp:         [DMESG-FAIL][357] ([i915#1982] / [i915#8561]) -> [DMESG-FAIL][358] ([i915#8561])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][359] ([i915#7118]) -> [SKIP][360] ([i915#7118] / [i915#7162])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@kms_content_protection@mei_interface.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-mtlp:         [FAIL][361] ([i915#2346]) -> [DMESG-FAIL][362] ([i915#2017] / [i915#5954])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][363] ([i915#3955]) -> [SKIP][364] ([fdo#110189] / [i915#3955])
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][365] ([i915#4070] / [i915#4816]) -> [SKIP][366] ([i915#4816])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_psr@cursor_plane_move:
    - shard-dg1:          [SKIP][367] ([i915#1072]) -> [SKIP][368] ([i915#1072] / [i915#4078])
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@kms_psr@cursor_plane_move.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_psr@cursor_plane_move.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][369] ([i915#5493]) -> [CRASH][370] ([i915#7331])
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2898]: https://gitlab.freedesktop.org/drm/intel/issues/2898
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4473]: https://gitlab.freedesktop.org/drm/intel/issues/4473
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5882]: https://gitlab.freedesktop.org/drm/intel/issues/5882
  [i915#5954]: https://gitlab.freedesktop.org/drm/intel/issues/5954
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6121]: https://gitlab.freedesktop.org/drm/intel/issues/6121
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6367]: https://gitlab.freedesktop.org/drm/intel/issues/6367
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6786]: https://gitlab.freedesktop.org/drm/intel/issues/6786
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6950]: https://gitlab.freedesktop.org/drm/intel/issues/6950
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7392]: https://gitlab.freedesktop.org/drm/intel/issues/7392
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7461]: https://gitlab.freedesktop.org/drm/intel/issues/7461
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7691]: https://gitlab.freedesktop.org/drm/intel/issues/7691
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7699]: https://gitlab.freedesktop.org/drm/intel/issues/7699
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7940]: https://gitlab.freedesktop.org/drm/intel/issues/7940
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8063]: https://gitlab.freedesktop.org/drm/intel/issues/8063
  [i915#8131]: https://gitlab.freedesktop.org/drm/intel/issues/8131
  [i915#8190]: https://gitlab.freedesktop.org/drm/intel/issues/8190
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8320]: https://gitlab.freedesktop.org/drm/intel/issues/8320
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8399]: https://gitlab.freedesktop.org/drm/intel/issues/8399
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8445]: https://gitlab.freedesktop.org/drm/intel/issues/8445
  [i915#8456]: https://gitlab.freedesktop.org/drm/intel/issues/8456
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8561]: https://gitlab.freedesktop.org/drm/intel/issues/8561
  [i915#8588]: https://gitlab.freedesktop.org/drm/intel/issues/8588
  [i915#8628]: https://gitlab.freedesktop.org/drm/intel/issues/8628
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8709]: https://gitlab.freedesktop.org/drm/intel/issues/8709
  [i915#8717]: https://gitlab.freedesktop.org/drm/intel/issues/8717
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8812]: https://gitlab.freedesktop.org/drm/intel/issues/8812
  [i915#8814]: https://gitlab.freedesktop.org/drm/intel/issues/8814
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8898]: https://gitlab.freedesktop.org/drm/intel/issues/8898
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7416 -> IGTPW_9522

  CI-20190529: 20190529
  CI_DRM_13479: acb67613848e89e954f68be8621678cb5827e816 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9522: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html
  IGT_7416: 7416

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html

--===============6780877909646731195==
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
<tr><td><b>Series:</b></td><td>dp-mst helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122070/">https://patchwork.freedesktop.org/series/122070/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7416_full -&gt; IGTPW_9522_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9522_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9522_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9522_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk3/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-3/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@kms_content_protection@dp-mst-lic-type-0.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@kms_content_protection@dp-mst-lic-type-0.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3116">i915#3116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> +3 similar issues</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-15/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_content_protection@dp-mst-lic-type-1.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@kms_content_protection@dp-mst-type-1.html">FAIL</a> +5 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk3/igt@kms_content_protection@dp-mst-type-1.html">FAIL</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-14/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_display_modes@extended-mode-basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a></p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-snb5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb6/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a> +4 similar issues</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-13/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a></p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a></p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8588">i915#8588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_display_modes@mst-extended-mode-negative.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9522_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@debugfs_test@basic-hwmon:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@debugfs_test@basic-hwmon.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7456">i915#7456</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@drm_fdinfo@virtual-busy-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm_test:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@drm_mm@drm_mm_test.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_barrier_race@remote-request@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk9/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk8/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7461">i915#7461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8190">i915#8190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6121">i915#6121</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_freq@sysfs@gt0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6786">i915#6786</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_ctx_persistence@engines-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5882">i915#5882</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb6/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8898">i915#8898</a>)</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-12/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_exec_fair@basic-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4473">i915#4473</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl4/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_exec_fence@submit3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@gem_exec_flush@basic-uc-rw-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gem_exec_reloc@basic-cpu-gtt-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +6 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_reloc@basic-gtt-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@gem_exec_suspend@basic-s4-devices@lmem0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_exec_whisper@basic-contexts-priority-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8131">i915#8131</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-none:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@gem_fence_thrash@bo-write-verify-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_lmem_swapping@massive-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@gem_lmem_swapping@parallel-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_madvise@dontneed-before-pwrite:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +2 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_madvise@dontneed-before-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@basic-short:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@gem_mmap_gtt@basic-short.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@flink-race:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gem_mmap_gtt@flink-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@gem_mmap_wc@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-uncached:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gem_partial_pwrite_pread@write-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@gem_pxp@display-protected-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@gem_pxp@reject-modify-context-protection-off-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_gtt:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@gem_set_tiling_vs_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4079">i915#4079</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl3/igt@gem_spin_batch@user-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl3/igt@gem_spin_batch@user-each.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2898">i915#2898</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +2 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@sd-probe:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@gem_userptr_blits@sd-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4958">i915#4958</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@gem_userptr_blits@vma-merge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3318">i915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@gen3_render_tiledy_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@gen7_exec_parse@bitmasks.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hwmon@hwmon-read:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@i915_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7707">i915#7707</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-reset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@i915_pm_freq_api@freq-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8399">i915#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@i915_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@i915_pm_rpm@basic-pci-d3-state.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7691">i915#7691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@i915_pm_rpm@gem-execbuf-stress@extra-wait-smem0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-6/igt@i915_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@i915_pm_rpm@i2c.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8717">i915#8717</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-7/igt@i915_pm_rps@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8320">i915#8320</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-idle@gt1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-7/igt@i915_pm_rps@thresholds-idle@gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@migrate:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@i915_selftest@live@migrate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7699">i915#7699</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@slpc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@i915_selftest@live@slpc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6367">i915#6367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4215">i915#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@kms_addfb_basic@clobberred-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8709">i915#8709</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb1/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_ccs@pipe-b-bad-aux-stride-yf_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_ccs@pipe-b-crc-primary-basic-4_tiled_mtl_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_ccs@pipe-c-bad-aux-stride-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@kms_ccs@pipe-d-ccs-on-another-bo-4_tiled_mtl_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_cdclk@plane-scaling@pipe-c-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@vga-frame-dump:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_chamelium_frames@vga-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8063">i915#8063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8814">i915#8814</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3546">i915#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8812">i915#8812</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3840">i915#3840</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +3 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-apl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +4 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-badstride.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-25@pipe-b-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-b-vga-1.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +190 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-15/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-8/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-4/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5461">i915#5461</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@kms_selftest@drm_cmdline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@kms_vblank@pipe-c-wait-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-forked-busy-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_vblank@pipe-d-query-forked-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-12/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2433">i915#2433</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vcs0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-10/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +6 similar issues</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@perf_pmu@busy-idle-check-all@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-6/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-1/igt@prime_vgem@basic-fence-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8445">i915#8445</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@prime_vgem@basic-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@sysfs_timeslice_duration@timeout@vecs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6950">i915#6950</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_job_submission@array-job-submission:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@v3d/v3d_job_submission@array-job-submission.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@valid-multisync-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@v3d/v3d_submit_csd@valid-multisync-submission.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@bad-bo:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-7/igt@v3d/v3d_wait_bo@bad-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@map-bo-0ns:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@v3d/v3d_wait_bo@map-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_wait_bo@unused-bo-0ns:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-18/igt@v3d/v3d_wait_bo@unused-bo-0ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_purgeable_bo@mark-willneed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-3/igt@vc4/vc4_purgeable_bo@mark-willneed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@get-bad-flags:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-16/igt@vc4/vc4_tiling@get-bad-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>)</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_tiling@set-get:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@vc4/vc4_tiling@set-get.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_wait_seqno@bad-seqno-1ns:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-1/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +5 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-8/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-2/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-1/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-16/igt@gem_ctx_isolation@preservation-s3@vcs0.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-14/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-17/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-12/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@gem_exec_whisper@basic-contexts-forked-all.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7392">i915#7392</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8628">i915#8628</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_hangman@detector@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@i915_hangman@detector@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8456">i915#8456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@i915_hangman@detector@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@i915_hangman@gt-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@i915_hangman@gt-engine-error@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-15/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-5/igt@i915_pm_rpm@system-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@i915_pm_rpm@system-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-18/igt@i915_pm_rpm@system-suspend-modeset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7940">i915#7940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-19/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-4/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-10/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-tglu-4/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@ccs3:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-6/igt@perf_pmu@busy-double-start@ccs3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-8/igt@perf_pmu@busy-double-start@ccs3.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs1:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@perf_pmu@busy-double-start@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-6/igt@perf_pmu@rc6-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-7/igt@perf_pmu@rc6-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@multi-wait-available-signaled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@syncobj_timeline@multi-wait-available-signaled.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-6/igt@syncobj_timeline@multi-wait-available-signaled.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-snb7/igt@gem_softpin@noreloc-s3.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-snb4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-6/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-3/igt@kms_async_flips@crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8561">i915#8561</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-mtlp-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-mtlp-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5954">i915#5954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-rkl-4/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg1-19/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg1-13/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7416/shard-dg2-1/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/shard-dg2-2/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7416 -&gt; IGTPW_9522</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13479: acb67613848e89e954f68be8621678cb5827e816 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9522: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9522/index.html<br />
  IGT_7416: 7416</p>

</body>
</html>

--===============6780877909646731195==--
