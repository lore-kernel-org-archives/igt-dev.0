Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============7117133433988187857=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Date: Wed, 16 Aug 2023 13:44:17 -0000
Message-ID: <169219345710.10287.3691587184166074433@emeril.freedesktop.org>
References: <20230816083536.1093139-1-swati2.sharma@intel.com>
In-Reply-To: <20230816083536.1093139-1-swati2.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?intel-ci=3A_chamelium_specific_fast-feedback_=28rev3=29?=
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

--===============7117133433988187857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel-ci: chamelium specific fast-feedback (rev3)
URL   : https://patchwork.freedesktop.org/series/122278/
State : success

== Summary ==

CI Bug Log - changes from IGT_7437_full -> IGTPW_9595_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in IGTPW_9595_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_allocator@gem-pool:
    - shard-dg2:          NOTRUN -> [SKIP][1] ([fdo#109315]) +43 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@api_intel_allocator@gem-pool.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-dg2:          [PASS][2] -> [FAIL][3] ([i915#9027])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@device_reset@unbind-reset-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html

  * igt@drm_fdinfo@busy-idle-check-all@vcs1:
    - shard-dg1:          NOTRUN -> [SKIP][4] ([i915#8414]) +4 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][5] ([i915#7742])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8414]) +19 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html

  * igt@drm_mm@drm_mm_test:
    - shard-glk:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#8661])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk2/igt@drm_mm@drm_mm_test.html

  * igt@fbdev@eof:
    - shard-dg2:          [PASS][8] -> [SKIP][9] ([i915#2582]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@fbdev@eof.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@fbdev@eof.html

  * igt@feature_discovery@display-2x:
    - shard-rkl:          NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@feature_discovery@display-2x.html
    - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#1839])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-4/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-4x:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#1839])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@feature_discovery@display-4x.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#3555] / [i915#5325])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html
    - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#5325])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ctx_persistence@engines-hang:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@gem_ctx_persistence@engines-hang.html

  * igt@gem_ctx_persistence@hang:
    - shard-dg2:          NOTRUN -> [SKIP][16] ([i915#8555])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8555])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-mtlp:         [PASS][18] -> [FAIL][19] ([i915#2410]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@gem_ctx_persistence@saturated-hostile-nopreempt:
    - shard-dg2:          NOTRUN -> [SKIP][20] ([i915#2575]) +257 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [PASS][21] -> [FAIL][22] ([i915#7816]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-mtlp:         [PASS][23] -> [ABORT][24] ([i915#8503])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_eio@kms:
    - shard-dg1:          [PASS][25] -> [FAIL][26] ([i915#5784])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-18/igt@gem_eio@kms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_eio@kms.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          NOTRUN -> [FAIL][27] ([i915#5784])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@bonded-false-hang:
    - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#4812])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html

  * igt@gem_exec_balancer@hog:
    - shard-dg1:          NOTRUN -> [SKIP][29] ([i915#4812])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@gem_exec_balancer@hog.html

  * igt@gem_exec_capture@pi@vcs0:
    - shard-mtlp:         [PASS][30] -> [FAIL][31] ([i915#4475])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglu:         [PASS][32] -> [FAIL][33] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4473] / [i915#4771])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#2842])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][37] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-rkl:          [PASS][38] -> [FAIL][39] ([i915#2842]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-dg1:          NOTRUN -> [SKIP][40] ([i915#3539])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_flush@basic-wb-rw-default:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#3281]) +4 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][43] ([i915#3281]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#3281]) +4 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_exec_reloc@basic-write-read-active:
    - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gem_exec_reloc@basic-write-read-active.html

  * igt@gem_exec_schedule@preempt-engines@ccs0:
    - shard-mtlp:         [PASS][46] -> [FAIL][47] ([i915#9119]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@ccs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html

  * igt@gem_exec_schedule@preempt-engines@rcs0:
    - shard-mtlp:         [PASS][48] -> [DMESG-FAIL][49] ([i915#8962] / [i915#9121])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html

  * igt@gem_exec_schedule@preempt-queue-chain:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-chain.html

  * igt@gem_exec_suspend@basic-s3@lmem0:
    - shard-dg2:          [PASS][51] -> [FAIL][52] ([fdo#103375])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_exec_suspend@basic-s3@lmem0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_suspend@basic-s3@lmem0.html

  * igt@gem_fence_thrash@bo-write-verify-y:
    - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#4860])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-y.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4860]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#4613])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#5775]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-rkl:          NOTRUN -> [SKIP][57] ([i915#4613]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_lmem_swapping@random.html
    - shard-tglu:         NOTRUN -> [SKIP][58] ([i915#4613]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [PASS][59] -> [TIMEOUT][60] ([i915#5493])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_lmem_swapping@verify-random-ccs@lmem0:
    - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html

  * igt@gem_media_fill@media-fill:
    - shard-dg2:          NOTRUN -> [SKIP][63] ([i915#8289])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_media_fill@media-fill.html

  * igt@gem_media_vme:
    - shard-rkl:          NOTRUN -> [SKIP][64] ([i915#284])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_media_vme.html
    - shard-tglu:         NOTRUN -> [SKIP][65] ([i915#284])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@gem_media_vme.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +4 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_wc@read-write-distinct:
    - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4083]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_mmap_wc@read-write-distinct.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][68] ([i915#4083]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#3282]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_partial_pwrite_pread@write-snoop.html
    - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#3282]) +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#3282]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-dg2:          NOTRUN -> [SKIP][73] ([i915#4270])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4270])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_readwrite@new-obj:
    - shard-mtlp:         NOTRUN -> [SKIP][75] ([i915#3282])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@gem_readwrite@new-obj.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#2575] / [i915#5190]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
    - shard-dg1:          NOTRUN -> [SKIP][77] ([i915#4079])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html

  * igt@gem_spin_batch@user-each:
    - shard-mtlp:         [PASS][78] -> [DMESG-FAIL][79] ([i915#9121])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-3/igt@gem_spin_batch@user-each.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_spin_batch@user-each.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3297]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@nohangcheck:
    - shard-mtlp:         [PASS][81] -> [FAIL][82] ([i915#6268])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-dg1:          NOTRUN -> [SKIP][83] ([i915#3297])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_mixed_blits:
    - shard-dg1:          NOTRUN -> [SKIP][84] ([fdo#109289]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gen3_mixed_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-rkl:          NOTRUN -> [SKIP][85] ([fdo#109289]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglu:         NOTRUN -> [SKIP][86] ([fdo#109289])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-5/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([fdo#109289]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][88] -> [ABORT][89] ([i915#5566])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#2856]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-zero-length:
    - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#2856]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gen9_exec_parse@batch-zero-length.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-rkl:          NOTRUN -> [SKIP][92] ([i915#2527])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@bb-start-param:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#2527]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_fb_tiling:
    - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#4881])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_fb_tiling.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [PASS][95] -> [FAIL][96] ([i915#7069]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#3361])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_freq_api@freq-basic-api@gt0:
    - shard-mtlp:         [PASS][98] -> [FAIL][99] ([i915#8670])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-7/igt@i915_pm_freq_api@freq-basic-api@gt0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-2/igt@i915_pm_freq_api@freq-basic-api@gt0.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#6590])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#6590])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglu:         [PASS][102] -> [WARN][103] ([i915#2681])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#4077]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-dg1:          NOTRUN -> [SKIP][105] ([i915#1397])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [PASS][106] -> [SKIP][107] ([i915#1397])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-rkl:          [PASS][108] -> [SKIP][109] ([i915#1397]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-mtlp:         NOTRUN -> [SKIP][110] ([i915#1397])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-dg1:          [PASS][111] -> [SKIP][112] ([i915#1397])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-dg2:          NOTRUN -> [SKIP][113] ([i915#5174])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-dg2:          [PASS][114] -> [SKIP][115] ([i915#5174]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@i915_pm_rpm@sysfs-read.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-dg1:          NOTRUN -> [SKIP][116] ([i915#6621])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#8925]) +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_pm_sseu@full-enable:
    - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#4387])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-mtlp:         NOTRUN -> [SKIP][119] ([fdo#109303])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@requests:
    - shard-mtlp:         [PASS][120] -> [DMESG-FAIL][121] ([i915#8497])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@live@requests.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_selftest@live@requests.html

  * igt@i915_selftest@perf@request:
    - shard-mtlp:         [PASS][122] -> [DMESG-FAIL][123] ([i915#8573])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@perf@request.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@i915_selftest@perf@request.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4077]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4212])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2:          [PASS][126] -> [SKIP][127] ([i915#2575] / [i915#5190])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#4212])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:
    - shard-dg2:          NOTRUN -> [SKIP][129] ([i915#8502] / [i915#8709]) +11 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#6228])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#5286]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [PASS][132] -> [FAIL][133] ([i915#5138])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5286]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [PASS][135] -> [FAIL][136] ([i915#3743]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2:          [PASS][137] -> [SKIP][138] ([fdo#109315]) +24 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([fdo#111614]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#5190]) +8 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2:          NOTRUN -> [SKIP][141] ([fdo#109315] / [i915#5190]) +4 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg1:          NOTRUN -> [SKIP][142] ([i915#4538]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-mtlp:         NOTRUN -> [SKIP][143] ([fdo#111615]) +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-glk:          NOTRUN -> [SKIP][144] ([fdo#109271]) +103 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
    - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#4538] / [i915#5190]) +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-rkl:          NOTRUN -> [SKIP][146] ([fdo#110723])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#2705])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#3689] / [i915#3886] / [i915#5354]) +5 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#5354] / [i915#6095]) +6 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#6095]) +9 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][151] ([i915#5354]) +22 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#5354] / [i915#6095]) +9 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][154] ([i915#3886] / [i915#6095]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][155] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:
    - shard-snb:          NOTRUN -> [SKIP][156] ([fdo#109271]) +202 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb1/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][157] ([fdo#109271] / [i915#3886]) +5 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk9/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3689] / [i915#5354] / [i915#6095]) +12 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#5354]) +12 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#3689] / [i915#5354]) +11 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-tglu:         NOTRUN -> [SKIP][161] ([i915#3689] / [i915#5354] / [i915#6095])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#4087] / [i915#7213]) +3 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2:          NOTRUN -> [SKIP][163] ([fdo#111827])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@degamma:
    - shard-rkl:          NOTRUN -> [SKIP][164] ([fdo#111827])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#7828]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2:          NOTRUN -> [SKIP][166] ([i915#7828]) +2 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#7828]) +1 similar issue
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#7828]) +2 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_color@ctm-0-50@pipe-a:
    - shard-mtlp:         [PASS][169] -> [FAIL][170] ([i915#3546]) +3 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-8/igt@kms_color@ctm-0-50@pipe-a.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@kms_color@ctm-0-50@pipe-a.html

  * igt@kms_concurrent@pipe-d:
    - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_concurrent@pipe-d.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2:          NOTRUN -> [SKIP][172] ([i915#3299])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2:          NOTRUN -> [TIMEOUT][173] ([i915#7173])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@type1:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#7118]) +1 similar issue
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#3359])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg1:          NOTRUN -> [SKIP][176] ([i915#3359]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#3555]) +2 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#3555])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
    - shard-dg1:          NOTRUN -> [SKIP][179] ([i915#3555]) +4 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#3546])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [PASS][181] -> [FAIL][182] ([i915#8248])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-rkl:          NOTRUN -> [SKIP][183] ([fdo#111825]) +2 similar issues
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([fdo#109274] / [i915#5354]) +3 similar issues
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-tglu:         NOTRUN -> [SKIP][185] ([fdo#109274])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg1:          NOTRUN -> [SKIP][186] ([fdo#111825]) +13 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][187] -> [FAIL][188] ([i915#2346])
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][189] -> [FAIL][190] ([i915#2346])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#4103] / [i915#4213]) +2 similar issues
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][192] ([i915#4103] / [i915#4213])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#3804])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_draw_crc@draw-method-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][194] ([i915#8812])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-snb:          NOTRUN -> [SKIP][195] ([fdo#109271] / [fdo#111767]) +1 similar issue
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-tglu:         NOTRUN -> [SKIP][196] ([fdo#109274] / [i915#3637])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-dg2:          NOTRUN -> [SKIP][197] ([fdo#109274]) +3 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][198] -> [FAIL][199] ([i915#79])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          NOTRUN -> [DMESG-WARN][200] ([i915#8841]) +5 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#2672])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
    - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#2587] / [i915#2672])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][203] ([i915#2672]) +5 similar issues
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#2587] / [i915#2672]) +1 similar issue
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#2672])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#5274])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][207] ([i915#8708]) +9 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#1825]) +7 similar issues
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
    - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8708]) +9 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
    - shard-mtlp:         NOTRUN -> [SKIP][210] ([i915#8708]) +1 similar issue
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#3458]) +15 similar issues
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3458]) +7 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][213] ([fdo#111825] / [i915#1825]) +11 similar issues
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-rkl:          NOTRUN -> [SKIP][214] ([i915#3023]) +10 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-tglu:         NOTRUN -> [SKIP][215] ([fdo#109280]) +1 similar issue
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][216] ([i915#6118])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg1:          NOTRUN -> [SKIP][217] ([i915#433])
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][219] ([i915#3555] / [i915#8228]) +2 similar issues
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_hdr@static-toggle.html
    - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#3555] / [i915#8228])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@kms_hdr@static-toggle.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg1:          NOTRUN -> [SKIP][221] ([i915#6301])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:
    - shard-mtlp:         [PASS][222] -> [FAIL][223] ([i915#1623])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - shard-glk:          NOTRUN -> [FAIL][224] ([i915#7862]) +1 similar issue
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [FAIL][225] ([i915#8292])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
    - shard-dg1:          NOTRUN -> [FAIL][226] ([i915#8292])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#5176]) +7 similar issues
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#5176]) +7 similar issues
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:
    - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#5235]) +5 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][230] ([i915#5235]) +11 similar issues
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#5235]) +15 similar issues
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][232] ([i915#5235]) +3 similar issues
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html

  * igt@kms_prime@d3hot:
    - shard-mtlp:         NOTRUN -> [SKIP][233] ([i915#6524])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_prime@d3hot.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#658]) +1 similar issue
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-rkl:          NOTRUN -> [SKIP][235] ([i915#658]) +1 similar issue
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg1:          NOTRUN -> [SKIP][236] ([fdo#111068] / [i915#658])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg1:          NOTRUN -> [SKIP][237] ([i915#658]) +1 similar issue
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-glk:          NOTRUN -> [SKIP][238] ([fdo#109271] / [i915#658])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@primary_page_flip:
    - shard-dg2:          NOTRUN -> [SKIP][239] ([i915#1072]) +3 similar issues
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_psr@primary_page_flip.html

  * igt@kms_psr@primary_render:
    - shard-rkl:          NOTRUN -> [SKIP][240] ([i915#1072]) +4 similar issues
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-tglu:         NOTRUN -> [SKIP][241] ([fdo#110189]) +5 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@suspend:
    - shard-dg1:          NOTRUN -> [SKIP][242] ([i915#1072])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_psr@suspend.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#5030]) +3 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html

  * igt@kms_selftest@drm_cmdline:
    - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#8661])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_selftest@drm_cmdline.html
    - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#8661])
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-7/igt@kms_selftest@drm_cmdline.html

  * igt@kms_selftest@drm_damage:
    - shard-snb:          NOTRUN -> [SKIP][246] ([fdo#109271] / [i915#8661]) +1 similar issue
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@kms_selftest@drm_damage.html

  * igt@kms_selftest@drm_plane:
    - shard-dg2:          NOTRUN -> [SKIP][247] ([i915#8661]) +1 similar issue
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_selftest@drm_plane.html
    - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8661]) +1 similar issue
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_selftest@drm_plane.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][249] ([i915#5465]) +1 similar issue
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#4070] / [i915#6768]) +1 similar issue
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg1:          NOTRUN -> [SKIP][251] ([i915#2437])
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html

  * igt@perf@create-destroy-userspace-config:
    - shard-dg2:          [PASS][252] -> [SKIP][253] ([i915#5608]) +4 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@perf@create-destroy-userspace-config.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@perf@create-destroy-userspace-config.html

  * igt@perf@stress-open-close:
    - shard-dg2:          NOTRUN -> [SKIP][254] ([i915#5608]) +15 similar issues
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@perf@stress-open-close.html

  * igt@perf_pmu@busy-double-start@vecs1:
    - shard-dg2:          [PASS][255] -> [FAIL][256] ([i915#4349]) +3 similar issues
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html

  * igt@perf_pmu@event-wait@rcs0:
    - shard-dg2:          NOTRUN -> [SKIP][257] ([fdo#112283])
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html
    - shard-rkl:          NOTRUN -> [SKIP][258] ([fdo#112283])
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html

  * igt@perf_pmu@most-busy-idle-check-all@rcs0:
    - shard-dg2:          [PASS][259] -> [FAIL][260] ([i915#5234])
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-dg1:          [PASS][261] -> [FAIL][262] ([i915#5234])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
    - shard-mtlp:         [PASS][263] -> [FAIL][264] ([i915#5234])
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][265] ([i915#8516])
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@prime_vgem@basic-blt:
    - shard-mtlp:         NOTRUN -> [FAIL][266] ([i915#8445]) +1 similar issue
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@prime_vgem@basic-blt.html

  * igt@prime_vgem@basic-write:
    - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#3708])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@prime_vgem@basic-write.html

  * igt@prime_vgem@fence-write-hang:
    - shard-rkl:          NOTRUN -> [SKIP][268] ([fdo#109295] / [i915#3708])
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@prime_vgem@fence-write-hang.html

  * igt@syncobj_timeline@wait-all-for-submit-delayed-submit:
    - shard-dg2:          [PASS][269] -> [SKIP][270] ([i915#2575]) +146 similar issues
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html

  * igt@sysfs_heartbeat_interval@nopreempt@ccs0:
    - shard-mtlp:         [PASS][271] -> [FAIL][272] ([i915#6015])
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html

  * igt@v3d/v3d_get_bo_offset@create-get-offsets:
    - shard-tglu:         NOTRUN -> [SKIP][273] ([fdo#109315] / [i915#2575]) +1 similar issue
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@v3d/v3d_get_bo_offset@create-get-offsets.html

  * igt@v3d/v3d_submit_cl@simple-flush-cache:
    - shard-dg1:          NOTRUN -> [SKIP][274] ([i915#2575]) +4 similar issues
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@v3d/v3d_submit_cl@simple-flush-cache.html

  * igt@v3d/v3d_submit_csd@multiple-job-submission:
    - shard-rkl:          NOTRUN -> [SKIP][275] ([fdo#109315]) +2 similar issues
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@v3d/v3d_submit_csd@multiple-job-submission.html

  * igt@vc4/vc4_create_bo@create-bo-0:
    - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#7711]) +3 similar issues
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@vc4/vc4_create_bo@create-bo-0.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#7711]) +5 similar issues
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_label_bo@set-bad-handle:
    - shard-mtlp:         NOTRUN -> [SKIP][278] ([i915#7711]) +1 similar issue
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@vc4/vc4_label_bo@set-bad-handle.html

  * igt@vc4/vc4_label_bo@set-bad-name:
    - shard-dg1:          NOTRUN -> [SKIP][279] ([i915#7711]) +5 similar issues
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@vc4/vc4_label_bo@set-bad-name.html

  * igt@vc4/vc4_lookup_fail@bad-color-write:
    - shard-tglu:         NOTRUN -> [SKIP][280] ([i915#2575])
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-9/igt@vc4/vc4_lookup_fail@bad-color-write.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2:          [FAIL][281] -> [PASS][282]
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2:          [SKIP][283] ([i915#9057]) -> [PASS][284]
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglu:         [FAIL][285] ([i915#6268]) -> [PASS][286]
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][287] ([i915#2410]) -> [PASS][288] +3 similar issues
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][289] ([i915#2842]) -> [PASS][290]
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-rkl:          [FAIL][291] ([i915#2842]) -> [PASS][292] +1 similar issue
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-dg2:          [SKIP][293] ([fdo#109283] / [i915#2575]) -> [PASS][294] +1 similar issue
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_params@no-bsd.html
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][295] ([i915#9051]) -> [PASS][296]
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_exec_schedule@semaphore-noskip:
    - shard-dg2:          [SKIP][297] ([i915#2575]) -> [PASS][298] +158 similar issues
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_schedule@semaphore-noskip.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_schedule@semaphore-noskip.html

  * igt@gem_spin_batch@spin-each:
    - shard-mtlp:         [DMESG-FAIL][299] ([i915#8962] / [i915#9121]) -> [PASS][300]
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@gem_spin_batch@spin-each.html
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@gem_spin_batch@spin-each.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][301] ([i915#5566]) -> [PASS][302]
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk1/igt@gen9_exec_parse@allowed-single.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk6/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          [DMESG-WARN][303] ([i915#7061] / [i915#8617]) -> [PASS][304]
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_module_load@resize-bar:
    - shard-dg2:          [SKIP][305] ([i915#5775]) -> [PASS][306]
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_module_load@resize-bar.html
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@i915_module_load@resize-bar.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-dg1:          [SKIP][307] ([i915#1397]) -> [PASS][308] +1 similar issue
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-rkl:          [SKIP][309] ([i915#1397]) -> [PASS][310] +3 similar issues
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-dg2:          [SKIP][311] ([i915#5174]) -> [PASS][312] +2 similar issues
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_rpm@system-suspend-modeset.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@i915_selftest@live@workarounds:
    - shard-mtlp:         [DMESG-FAIL][313] ([i915#6763]) -> [PASS][314]
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@live@workarounds.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_selftest@live@workarounds.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-dg2:          [WARN][315] -> [PASS][316]
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:
    - shard-mtlp:         [FAIL][317] ([i915#2521]) -> [PASS][318]
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [FAIL][319] ([i915#3743]) -> [PASS][320]
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - shard-mtlp:         [DMESG-WARN][321] ([i915#2017]) -> [PASS][322]
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_cursor_legacy@single-move@all-pipes.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
    - shard-dg2:          [SKIP][323] ([fdo#109315]) -> [PASS][324] +21 similar issues
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg1:          [DMESG-WARN][325] ([i915#1982]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-14/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf@non-system-wide-paranoid:
    - shard-dg2:          [SKIP][327] ([i915#5608]) -> [PASS][328] +3 similar issues
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@perf@non-system-wide-paranoid.html
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@perf@non-system-wide-paranoid.html

  * igt@tools_test@tools_test:
    - shard-dg2:          [FAIL][329] ([i915#9030]) -> [PASS][330]
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@tools_test@tools_test.html
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@tools_test@tools_test.html

  
#### Warnings ####

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - shard-dg2:          [SKIP][331] ([i915#2575]) -> [SKIP][332] ([i915#8411]) +1 similar issue
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          [SKIP][333] ([i915#2575]) -> [FAIL][334] ([i915#6122])
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@api_intel_bb@render-ccs.html
   [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@api_intel_bb@render-ccs.html

  * igt@device_reset@unbind-cold-reset-rebind:
    - shard-dg2:          [FAIL][335] ([i915#6121] / [i915#9027]) -> [SKIP][336] ([i915#7701])
   [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html
   [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html

  * igt@drm_fdinfo@virtual-busy-hang:
    - shard-dg2:          [SKIP][337] ([i915#5608]) -> [SKIP][338] ([i915#8414]) +2 similar issues
   [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html
   [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@drm_fdinfo@virtual-busy-hang.html

  * igt@feature_discovery@chamelium:
    - shard-dg2:          [SKIP][339] ([i915#2575]) -> [SKIP][340] ([i915#4854])
   [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@chamelium.html
   [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          [SKIP][341] ([i915#2575]) -> [SKIP][342] ([i915#1839])
   [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@display-2x.html
   [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-3x:
    - shard-dg2:          [SKIP][343] ([i915#1839]) -> [SKIP][344] ([i915#2575])
   [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@feature_discovery@display-3x.html
   [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@psr1:
    - shard-dg2:          [SKIP][345] ([i915#2575]) -> [SKIP][346] ([i915#658]) +2 similar issues
   [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@psr1.html
   [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@feature_discovery@psr1.html

  * igt@gem_create@create-ext-set-pat:
    - shard-dg2:          [SKIP][347] ([i915#2575]) -> [SKIP][348] ([i915#8562])
   [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_create@create-ext-set-pat.html
   [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_create@create-ext-set-pat.html

  * igt@gem_ctx_persistence@heartbeat-many:
    - shard-dg2:          [SKIP][349] ([i915#2575]) -> [SKIP][350] ([i915#8555])
   [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html
   [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-many.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-dg2:          [SKIP][351] ([i915#8555]) -> [SKIP][352] ([i915#2575]) +1 similar issue
   [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_ctx_persistence@heartbeat-stop.html
   [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-dg2:          [SKIP][353] ([i915#2575]) -> [SKIP][354] ([i915#280])
   [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html
   [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-dg2:          [SKIP][355] ([i915#280]) -> [SKIP][356] ([i915#2575])
   [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_ctx_sseu@mmap-args.html
   [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-suspend:
    - shard-snb:          [DMESG-WARN][357] ([i915#8841]) -> [DMESG-FAIL][358] ([fdo#103375])
   [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-snb5/igt@gem_eio@in-flight-suspend.html
   [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          [SKIP][359] ([i915#4812]) -> [SKIP][360] ([i915#2575])
   [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_exec_balancer@bonded-semaphore.html
   [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@invalid-bonds:
    - shard-dg2:          [SKIP][361] ([i915#2575]) -> [SKIP][362] ([i915#4036])
   [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html
   [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html

  * igt@gem_exec_fair@basic-throttle:
    - shard-dg2:          [SKIP][363] ([i915#2575]) -> [SKIP][364] ([i915#3539]) +2 similar issues
   [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html
   [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html

  * igt@gem_exec_fence@submit:
    - shard-dg2:          [SKIP][365] ([i915#2575]) -> [SKIP][366] ([i915#4812])
   [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_fence@submit.html
   [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_fence@submit.html

  * igt@gem_exec_flush@basic-uc-pro-default:
    - shard-dg2:          [SKIP][367] ([i915#3539] / [i915#4852]) -> [SKIP][368] ([i915#2575]) +2 similar issues
   [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_exec_flush@basic-uc-pro-default.html
   [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html

  * igt@gem_exec_flush@basic-uc-ro-default:
    - shard-dg2:          [SKIP][369] ([i915#2575]) -> [SKIP][370] ([i915#3539] / [i915#4852]) +5 similar issues
   [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html
   [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_exec_flush@basic-uc-ro-default.html

  * igt@gem_exec_gttfill@multigpu-basic:
    - shard-dg2:          [SKIP][371] ([i915#2575]) -> [SKIP][372] ([i915#7697])
   [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html
   [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_gttfill@multigpu-basic.html

  * igt@gem_exec_params@secure-non-root:
    - shard-dg2:          [SKIP][373] ([i915#2575]) -> [SKIP][374] ([fdo#112283])
   [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_params@secure-non-root.html
   [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-dg2:          [SKIP][375] ([i915#3281]) -> [SKIP][376] ([i915#2575]) +7 similar issues
   [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt.html
   [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-read:
    - shard-dg2:          [SKIP][377] ([i915#2575]) -> [SKIP][378] ([i915#3281]) +12 similar issues
   [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html
   [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read.html

  * igt@gem_exec_schedule@reorder-wide:
    - shard-dg2:          [SKIP][379] ([i915#4537] / [i915#4812]) -> [SKIP][380] ([i915#2575]) +1 similar issue
   [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html
   [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html

  * igt@gem_fenced_exec_thrash@2-spare-fences:
    - shard-dg2:          [SKIP][381] ([i915#2575]) -> [SKIP][382] ([i915#4860]) +1 similar issue
   [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html
   [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare-fences.html

  * igt@gem_media_vme:
    - shard-dg2:          [SKIP][383] ([i915#2575]) -> [SKIP][384] ([i915#284])
   [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_media_vme.html
   [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_media_vme.html

  * igt@gem_mmap@big-bo:
    - shard-dg2:          [SKIP][385] ([i915#2575]) -> [SKIP][386] ([i915#4083]) +2 similar issues
   [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_mmap@big-bo.html
   [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_mmap@big-bo.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-dg2:          [SKIP][387] ([i915#2575]) -> [SKIP][388] ([i915#4077]) +9 similar issues
   [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html
   [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_wc@write-read-distinct:
    - shard-dg2:          [SKIP][389] ([i915#4083]) -> [SKIP][390] ([i915#2575]) +6 similar issues
   [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_mmap_wc@write-read-distinct.html
   [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-dg2:          [SKIP][391] ([i915#3282]) -> [SKIP][392] ([i915#2575]) +8 similar issues
   [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html
   [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_pxp@display-protected-crc:
    - shard-dg2:          [SKIP][393] ([i915#4270]) -> [SKIP][394] ([i915#2575]) +2 similar issues
   [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_pxp@display-protected-crc.html
   [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_pxp@display-protected-crc.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-dg2:          [SKIP][395] ([i915#2575]) -> [SKIP][396] ([i915#4270]) +5 similar issues
   [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html
   [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_readwrite@beyond-eob:
    - shard-dg2:          [SKIP][397] ([i915#2575]) -> [SKIP][398] ([i915#3282]) +6 similar issues
   [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_readwrite@beyond-eob.html
   [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_readwrite@beyond-eob.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
    - shard-dg2:          [SKIP][399] ([i915#2575] / [i915#5190]) -> [SKIP][400] ([i915#5190]) +5 similar issues
   [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
   [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-dg2:          [SKIP][401] ([i915#5190]) -> [SKIP][402] ([i915#2575] / [i915#5190]) +4 similar issues
   [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
   [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-dg2:          [SKIP][403] ([i915#2575]) -> [SKIP][404] ([i915#4079]) +3 similar issues
   [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_set_tiling_vs_pwrite:
    - shard-dg2:          [SKIP][405] ([i915#4079]) -> [SKIP][406] ([i915#2575])
   [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@gem_set_tiling_vs_pwrite.html
   [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_set_tiling_vs_pwrite.html

  * igt@gem_spin_batch@spin-all-new:
    - shard-dg2:          [FAIL][407] ([i915#5889]) -> [SKIP][408] ([i915#2575])
   [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html
   [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html

  * igt@gem_tiled_swapping@non-threaded:
    - shard-dg2:          [SKIP][409] ([i915#4077]) -> [SKIP][410] ([i915#2575]) +12 similar issues
   [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html
   [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_tiled_swapping@non-threaded.html

  * igt@gem_unfence_active_buffers:
    - shard-dg2:          [SKIP][411] ([i915#2575]) -> [SKIP][412] ([i915#4879])
   [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_unfence_active_buffers.html
   [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_unfence_active_buffers.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-dg2:          [SKIP][413] ([i915#2575]) -> [SKIP][414] ([i915#3297]) +3 similar issues
   [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html
   [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-dg2:          [SKIP][415] ([i915#3297]) -> [SKIP][416] ([i915#2575])
   [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html
   [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-dg2:          [SKIP][417] ([i915#2575]) -> [FAIL][418] ([i915#3318])
   [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html
   [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-dg2:          [SKIP][419] ([fdo#109289]) -> [SKIP][420] ([i915#2575]) +2 similar issues
   [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gen7_exec_parse@basic-offset.html
   [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-dg2:          [SKIP][421] ([i915#2575]) -> [SKIP][422] ([fdo#109289]) +4 similar issues
   [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html
   [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-dg2:          [SKIP][423] ([i915#2856]) -> [SKIP][424] ([i915#2575]) +3 similar issues
   [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@gen9_exec_parse@bb-start-far.html
   [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-dg2:          [SKIP][425] ([i915#2575]) -> [SKIP][426] ([i915#2856]) +2 similar issues
   [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html
   [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          [SKIP][427] ([i915#2575]) -> [SKIP][428] ([i915#7091])
   [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html
   [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@bad-brightness:
    - shard-dg2:          [SKIP][429] ([i915#5354] / [i915#7561]) -> [SKIP][430] ([i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@i915_pm_backlight@bad-brightness.html
   [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html

  * igt@i915_pm_backlight@basic-brightness:
    - shard-dg2:          [SKIP][431] ([i915#2575]) -> [SKIP][432] ([i915#5354] / [i915#7561])
   [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html
   [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2:          [SKIP][433] ([i915#1397]) -> [SKIP][434] ([i915#5174]) +2 similar issues
   [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@fences:
    - shard-dg2:          [SKIP][435] ([i915#5174]) -> [SKIP][436] ([i915#4077])
   [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_rpm@fences.html
   [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-dg2:          [SKIP][437] ([i915#4077]) -> [SKIP][438] ([i915#5174])
   [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@i915_pm_rpm@pm-caching.html
   [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rps@basic-api:
    - shard-dg2:          [SKIP][439] ([i915#6621]) -> [SKIP][440] ([i915#2575])
   [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@i915_pm_rps@basic-api.html
   [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rps@basic-api.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          [SKIP][441] ([i915#2575]) -> [SKIP][442] ([i915#6188])
   [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html
   [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          [SKIP][443] ([fdo#109303]) -> [SKIP][444] ([i915#2575])
   [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html
   [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - shard-dg2:          [SKIP][445] ([i915#4212]) -> [SKIP][446] ([i915#2575]) +1 similar issue
   [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
   [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          [SKIP][447] ([i915#2575]) -> [SKIP][448] ([i915#4212]) +1 similar issue
   [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html
   [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - shard-dg2:          [SKIP][449] ([i915#2575] / [i915#5190]) -> [SKIP][450] ([i915#4215] / [i915#5190])
   [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2:          [SKIP][451] ([fdo#111614]) -> [SKIP][452] ([fdo#109315]) +4 similar issues
   [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          [SKIP][453] ([fdo#109315]) -> [SKIP][454] ([fdo#111614]) +3 similar issues
   [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2:          [SKIP][455] ([i915#5190]) -> [SKIP][456] ([fdo#109315] / [i915#5190]) +4 similar issues
   [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2:          [SKIP][457] ([fdo#109315] / [i915#5190]) -> [SKIP][458] ([i915#5190]) +5 similar issues
   [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2:          [SKIP][459] ([i915#4538] / [i915#5190]) -> [SKIP][460] ([fdo#109315] / [i915#5190]) +3 similar issues
   [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-dg2:          [SKIP][461] ([fdo#109315] / [i915#5190]) -> [SKIP][462] ([i915#4538] / [i915#5190]) +6 similar issues
   [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-dg2:          [SKIP][463] ([i915#2705]) -> [SKIP][464] ([fdo#109315])
   [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_big_joiner@2x-modeset.html
   [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-dg2:          [SKIP][465] ([fdo#109315]) -> [SKIP][466] ([i915#2705])
   [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_joiner@invalid-modeset.html
   [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][467] ([i915#2575]) -> [SKIP][468] ([i915#3689] / [i915#3886] / [i915#5354]) +8 similar issues
   [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html
   [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:
    - shard-dg2:          [SKIP][469] ([i915#2575]) -> [SKIP][470] ([i915#5354]) +15 similar issues
   [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html
   [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          [SKIP][471] ([i915#3689] / [i915#3886] / [i915#5354]) -> [SKIP][472] ([i915#2575]) +8 similar issues
   [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
   [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:
    - shard-dg2:          [SKIP][473] ([i915#2575]) -> [SKIP][474] ([i915#3689] / [i915#5354]) +22 similar issues
   [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html
   [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:
    - shard-dg2:          [SKIP][475] ([i915#3689] / [i915#5354]) -> [SKIP][476] ([i915#2575]) +17 similar issues
   [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html
   [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:
    - shard-dg2:          [SKIP][477] ([i915#5354]) -> [SKIP][478] ([i915#2575]) +19 similar issues
   [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html
   [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2:          [SKIP][479] ([fdo#111827]) -> [SKIP][480] ([i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_chamelium_color@ctm-0-25.html
   [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_chamelium_color@ctm-0-25.html

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/index.html

--===============7117133433988187857==
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
<tr><td><b>Series:</b></td><td>tests/intel-ci: chamelium specific fast-feedback (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122278/">https://patchwork.freedesktop.org/series/122278/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7437_full -&gt; IGTPW_9595_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9595_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_allocator@gem-pool:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@api_intel_allocator@gem-pool.html">SKIP</a> ([fdo#109315]) +43 similar issues</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@device_reset@unbind-reset-rebind.html">FAIL</a> ([i915#9027])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@busy-idle-check-all@vcs1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@drm_fdinfo@busy-idle-check-all@vcs1.html">SKIP</a> ([i915#8414]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#7742])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@vecs1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html">SKIP</a> ([i915#8414]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_mm@drm_mm_test:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk2/igt@drm_mm@drm_mm_test.html">SKIP</a> ([fdo#109271] / [i915#8661])</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@fbdev@eof.html">SKIP</a> ([i915#2582]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-4/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#5325])</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#5325])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@gem_ctx_persistence@engines-hang.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_ctx_persistence@hang.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a> ([i915#2410]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html">SKIP</a> ([i915#2575]) +257 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> ([i915#7816]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@gem_eio@in-flight-contexts-1us.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@gem_eio@in-flight-contexts-1us.html">ABORT</a> ([i915#8503])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-18/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_eio@kms.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_eio@reset-stress.html">FAIL</a> ([i915#5784])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-false-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_balancer@bonded-false-hang.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hog:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@gem_exec_balancer@hog.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_capture@pi@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_capture@pi@vcs0.html">FAIL</a> ([i915#4475])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-2/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_exec_fair@basic-none-share.html">SKIP</a> ([i915#4473] / [i915#4771])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> ([i915#3539])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-default:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_exec_flush@basic-wb-rw-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gem_exec_reloc@basic-concurrent16.html">SKIP</a> ([i915#3281]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#3281]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> ([i915#3281]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-active:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gem_exec_reloc@basic-write-read-active.html">SKIP</a> ([i915#3281]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@ccs0.html">FAIL</a> ([i915#9119]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-engines@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preempt-engines@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_exec_schedule@preempt-engines@rcs0.html">DMESG-FAIL</a> ([i915#8962] / [i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preempt-queue-chain:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_schedule@preempt-queue-chain.html">SKIP</a> ([i915#4537] / [i915#4812]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_exec_suspend@basic-s3@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_suspend@basic-s3@lmem0.html">FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_fence_thrash@bo-write-verify-y:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@gem_fence_thrash@bo-write-verify-y.html">SKIP</a> ([i915#4860])</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> ([i915#4860]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([i915#5775]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@gem_lmem_swapping@random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> ([i915#5493])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> ([i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs@lmem0:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_lmem_swapping@verify-random-ccs@lmem0.html">SKIP</a> ([i915#4565])</li>
</ul>
</li>
<li>
<p>igt@gem_media_fill@media-fill:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_media_fill@media-fill.html">SKIP</a> ([i915#8289])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@gem_media_vme.html">SKIP</a> ([i915#284])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_mmap_gtt@fault-concurrent.html">SKIP</a> ([i915#4077]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@read-write-distinct:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_mmap_wc@read-write-distinct.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-wc-read-gtt:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_mmap_wc@write-wc-read-gtt.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> ([i915#3282]) +3 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> ([i915#3282]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads-snoop:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html">SKIP</a> ([i915#3282]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@new-obj:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@gem_readwrite@new-obj.html">SKIP</a> ([i915#3282])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html">SKIP</a> ([i915#2575] / [i915#5190]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-tiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html">SKIP</a> ([i915#4079])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@user-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-3/igt@gem_spin_batch@user-each.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gem_spin_batch@user-each.html">DMESG-FAIL</a> ([i915#9121])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@nohangcheck:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_userptr_blits@nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@gem_userptr_blits@nohangcheck.html">FAIL</a> ([i915#6268])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk9/igt@gen9_exec_parse@allowed-all.html">ABORT</a> ([i915#5566])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gen9_exec_parse@allowed-single.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-zero-length:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@gen9_exec_parse@batch-zero-length.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@gen9_exec_parse@bb-start-param.html">SKIP</a> ([i915#2527]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_fb_tiling:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_fb_tiling.html">SKIP</a> ([i915#4881])</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-6/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> ([i915#7069]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@i915_pm_dc@dc6-dpms.html">SKIP</a> ([i915#3361])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_api@freq-basic-api@gt0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-7/igt@i915_pm_freq_api@freq-basic-api@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-2/igt@i915_pm_freq_api@freq-basic-api@gt0.html">FAIL</a> ([i915#8670])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@i915_pm_freq_mult@media-freq@gt0.html">SKIP</a> ([i915#6590])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-7/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">WARN</a> ([i915#2681])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> ([i915#4077]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#1397]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-17/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@i915_pm_rps@min-max-config-loaded.html">SKIP</a> ([i915#6621])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> ([i915#8925]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_selftest@live@requests.html">DMESG-FAIL</a> ([i915#8497])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@perf@request.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@i915_selftest@perf@request.html">DMESG-FAIL</a> ([i915#8573])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@i915_suspend@fence-restore-untiled.html">SKIP</a> ([i915#4077]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> ([i915#4212])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-4-rc_ccs-cc.html">SKIP</a> ([i915#8502] / [i915#8709]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> ([i915#6228])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> ([i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> ([i915#5138])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#109315]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> ([i915#5190]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#109271]) +103 similar issues</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#4538] / [i915#5190]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354] / [i915#6095]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([i915#6095]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#5354] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#5354] / [i915#6095]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3886] / [i915#6095]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb1/igt@kms_ccs@pipe-c-missing-ccs-buffer-4_tiled_mtl_rc_ccs.html">SKIP</a> ([fdo#109271]) +202 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk9/igt@kms_ccs@pipe-c-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_ccs@pipe-d-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#5354]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_gen12_rc_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_ccs@pipe-d-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#5354] / [i915#6095])</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> ([i915#4087] / [i915#7213]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_chamelium_color@degamma.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> ([i915#7828]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> ([i915#7828]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_chamelium_hpd@vga-hpd-fast.html">SKIP</a> ([i915#7828]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50@pipe-a:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-8/igt@kms_color@ctm-0-50@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@kms_color@ctm-0-50@pipe-a.html">FAIL</a> ([i915#3546]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-d:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_concurrent@pipe-d.html">SKIP</a> ([i915#4070] / [i915#533] / [i915#6768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3299])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_content_protection@srm@pipe-a-dp-2.html">TIMEOUT</a> ([i915#7173])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_content_protection@type1.html">SKIP</a> ([i915#7118]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +2 similar issues</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> ([i915#3555]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> ([i915#3546])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#8248])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> ([fdo#111825]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [i915#5354]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#111825]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> ([i915#2346])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> ([i915#4103] / [i915#4213]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> ([i915#4103] / [i915#4213])</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#3804])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html">SKIP</a> ([i915#8812])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb2/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> ([fdo#109271] / [fdo#111767]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> ([fdo#109274] / [i915#3637])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">DMESG-WARN</a> ([i915#8841]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2672]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> ([i915#2587] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> ([i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> ([i915#5274])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([i915#1825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:</p>
<ul>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +9 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html">SKIP</a> ([i915#8708]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> ([i915#3458]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> ([i915#3458]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825] / [i915#1825]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> ([i915#3023]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> ([i915#6118])</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#3555] / [i915#8228])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228]) +2 similar issues</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#3555] / [i915#8228])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@kms_panel_fitting@legacy.html">SKIP</a> ([i915#6301])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-planes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-planes.html">FAIL</a> ([i915#1623])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk3/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#7862]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#8292])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_plane_scaling@plane-upscale-with-rotation-20x20@pipe-b-hdmi-a-4.html">SKIP</a> ([i915#5176]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-hdmi-a-1.html">SKIP</a> ([i915#5235]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-4.html">SKIP</a> ([i915#5235]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c-hdmi-a-1.html">SKIP</a> ([i915#5235]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-c-edp-1.html">SKIP</a> ([i915#5235]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_prime@d3hot:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_prime@d3hot.html">SKIP</a> ([i915#6524])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-1/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-15/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_psr@primary_page_flip.html">SKIP</a> ([i915#1072]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_psr@primary_render.html">SKIP</a> ([i915#1072]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-10/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#110189]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_psr@suspend.html">SKIP</a> ([i915#1072])</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-d.html">SKIP</a> ([i915#5030]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_cmdline:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-2/igt@kms_selftest@drm_cmdline.html">SKIP</a> ([i915#8661])</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-7/igt@kms_selftest@drm_cmdline.html">SKIP</a> ([i915#8661])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_damage:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb4/igt@kms_selftest@drm_damage.html">SKIP</a> ([fdo#109271] / [i915#8661]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +1 similar issue</p>
</li>
<li>
<p>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-17/igt@kms_selftest@drm_plane.html">SKIP</a> ([i915#8661]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> ([i915#5465]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-c-functional:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html">SKIP</a> ([i915#4070] / [i915#6768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@perf@create-destroy-userspace-config.html">SKIP</a> ([i915#5608]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@perf@stress-open-close.html">SKIP</a> ([i915#5608]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vecs1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@perf_pmu@busy-double-start@vecs1.html">FAIL</a> ([i915#4349]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@event-wait@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@perf_pmu@event-wait@rcs0.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#5234])</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-15/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#5234])</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-6/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html">FAIL</a> ([i915#5234])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> ([i915#8516])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-4/igt@prime_vgem@basic-blt.html">FAIL</a> ([i915#8445]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-14/igt@prime_vgem@basic-write.html">SKIP</a> ([i915#3708])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@prime_vgem@fence-write-hang.html">SKIP</a> ([fdo#109295] / [i915#3708])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@wait-all-for-submit-delayed-submit:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@syncobj_timeline@wait-all-for-submit-delayed-submit.html">SKIP</a> ([i915#2575]) +146 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@ccs0.html">FAIL</a> ([i915#6015])</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_get_bo_offset@create-get-offsets:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@v3d/v3d_get_bo_offset@create-get-offsets.html">SKIP</a> ([fdo#109315] / [i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@simple-flush-cache:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-16/igt@v3d/v3d_submit_cl@simple-flush-cache.html">SKIP</a> ([i915#2575]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multiple-job-submission:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@v3d/v3d_submit_csd@multiple-job-submission.html">SKIP</a> ([fdo#109315]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_create_bo@create-bo-0:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-7/igt@vc4/vc4_create_bo@create-bo-0.html">SKIP</a> ([i915#7711]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> ([i915#7711]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-handle:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@vc4/vc4_label_bo@set-bad-handle.html">SKIP</a> ([i915#7711]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_label_bo@set-bad-name:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@vc4/vc4_label_bo@set-bad-name.html">SKIP</a> ([i915#7711]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_lookup_fail@bad-color-write:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-9/igt@vc4/vc4_lookup_fail@bad-color-write.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> ([i915#9057]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-tglu-10/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> ([i915#6268]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-tglu-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> ([i915#2410]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283] / [i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_exec_params@no-bsd.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-2/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> ([i915#9051]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-noskip:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_schedule@semaphore-noskip.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_schedule@semaphore-noskip.html">PASS</a> +158 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-each:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@gem_spin_batch@spin-each.html">DMESG-FAIL</a> ([i915#8962] / [i915#9121]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@gem_spin_batch@spin-each.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-glk1/igt@gen9_exec_parse@allowed-single.html">ABORT</a> ([i915#5566]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-glk6/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#7061] / [i915#8617]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_module_load@resize-bar.html">SKIP</a> ([i915#5775]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@i915_module_load@resize-bar.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-1/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> ([i915#6763]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-7/igt@i915_selftest@live@workarounds.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_suspend@basic-s3-without-i915.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@i915_suspend@basic-s3-without-i915.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> ([i915#3743]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-mtlp-4/igt@kms_cursor_legacy@single-move@all-pipes.html">DMESG-WARN</a> ([i915#2017]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-mtlp-3/igt@kms_cursor_legacy@single-move@all-pipes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html">PASS</a> +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg1-14/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">DMESG-WARN</a> ([i915#1982]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg1-19/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@perf@non-system-wide-paranoid.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@perf@non-system-wide-paranoid.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@tools_test@tools_test:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@tools_test@tools_test.html">FAIL</a> ([i915#9030]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@tools_test@tools_test.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-purge-cache:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@api_intel_bb@blit-reloc-purge-cache.html">SKIP</a> ([i915#8411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@api_intel_bb@render-ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@api_intel_bb@render-ccs.html">FAIL</a> ([i915#6122])</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-cold-reset-rebind:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html">FAIL</a> ([i915#6121] / [i915#9027]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html">SKIP</a> ([i915#7701])</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@virtual-busy-hang:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#5608]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@drm_fdinfo@virtual-busy-hang.html">SKIP</a> ([i915#8414]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@feature_discovery@chamelium.html">SKIP</a> ([i915#4854])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@feature_discovery@psr1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@feature_discovery@psr1.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-set-pat:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_create@create-ext-set-pat.html">SKIP</a> ([i915#8562])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-many:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-many.html">SKIP</a> ([i915#8555])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#8555]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-snb5/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#8841]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-snb7/igt@gem_eio@in-flight-suspend.html">DMESG-FAIL</a> ([fdo#103375])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@invalid-bonds:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_balancer@invalid-bonds.html">SKIP</a> ([i915#4036])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_exec_fair@basic-throttle.html">SKIP</a> ([i915#3539]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_fence@submit.html">SKIP</a> ([i915#4812])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-pro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_flush@basic-uc-pro-default.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-ro-default:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_exec_flush@basic-uc-ro-default.html">SKIP</a> ([i915#3539] / [i915#4852]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@multigpu-basic:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_exec_gttfill@multigpu-basic.html">SKIP</a> ([i915#7697])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#3281]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> ([i915#2575]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-read:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_exec_reloc@basic-gtt-read.html">SKIP</a> ([i915#3281]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@reorder-wide:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#4537] / [i915#4812]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_exec_schedule@reorder-wide.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_fenced_exec_thrash@2-spare-fences.html">SKIP</a> ([i915#4860]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_media_vme.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap@big-bo:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@gem_mmap@big-bo.html">SKIP</a> ([i915#4083]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html">SKIP</a> ([i915#4077]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-read-distinct:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#4083]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_mmap_wc@write-read-distinct.html">SKIP</a> ([i915#2575]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#3282]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_partial_pwrite_pread@reads.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@display-protected-crc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#4270]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_pxp@display-protected-crc.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_pxp@reject-modify-context-protection-off-1.html">SKIP</a> ([i915#4270]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_readwrite@beyond-eob.html">SKIP</a> ([i915#3282]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html">SKIP</a> ([i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#2575] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> ([i915#4079]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_pwrite:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#4079]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_set_tiling_vs_pwrite.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@spin-all-new:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_spin_batch@spin-all-new.html">FAIL</a> ([i915#5889]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_spin_batch@spin-all-new.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_tiled_swapping@non-threaded:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_tiled_swapping@non-threaded.html">SKIP</a> ([i915#2575]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_unfence_active_buffers:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gem_unfence_active_buffers.html">SKIP</a> ([i915#4879])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([i915#3297]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gem_userptr_blits@vma-merge.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([i915#2575]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2575]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> ([i915#7091])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#5354] / [i915#7561]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_backlight@bad-brightness.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@i915_pm_backlight@basic-brightness.html">SKIP</a> ([i915#5354] / [i915#7561])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-10/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#1397]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#5174]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#5174]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#4077])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@i915_pm_rpm@pm-caching.html">SKIP</a> ([i915#4077]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rpm@pm-caching.html">SKIP</a> ([i915#5174])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@basic-api:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#6621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_pm_rps@basic-api.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> ([i915#6188])</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#4212]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> ([i915#2575]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> ([i915#4212]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#2575] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> ([i915#4215] / [i915#5190])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#109315]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> ([i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> ([fdo#109315] / [i915#5190]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5190]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109315] / [i915#5190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> ([i915#4538] / [i915#5190]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([fdo#109315])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([fdo#109315]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-12/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-2/igt@kms_ccs@pipe-b-crc-primary-basic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_ccs@pipe-c-bad-rotation-90-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-12/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#3689] / [i915#3886] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([i915#2575]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-11/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#2575]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-6/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([i915#3689] / [i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-d-crc-primary-basic-yf_tiled_ccs.html">SKIP</a> ([i915#2575]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-2/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#5354]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_mtl_mc_ccs.html">SKIP</a> ([i915#2575]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7437/shard-dg2-6/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([fdo#111827]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9595/shard-dg2-11/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> ([i915#2575])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============7117133433988187857==--
