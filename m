Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 29 Jan 2020 09:32:01 -0000
Message-ID: <158029032153.5461.11545319926218233144@emeril.freedesktop.org>
References: <20200127091910.14446-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20200127091910.14446-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5BCI=2Ci-g-t=2C1/2=5D_lib/i915=3A_Add_helper_fo?=
 =?utf-8?q?r_copying_engine_maps_from_one_context_to_another?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [CI,i-g-t,1/2] lib/i915: Add helper for copying engine maps from one context to another
URL   : https://patchwork.freedesktop.org/series/72608/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5387_full -> IGTPW_4001_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4001_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4001_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4001_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_suspend@basic-s0:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb8/igt@gem_exec_suspend@basic-s0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb7/igt@gem_exec_suspend@basic-s0.html

  
Known issues
------------

  Here are the changes found in IGTPW_4001_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][3] -> [FAIL][4] ([i915#694])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw1/igt@gem_caching@reads.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw1/igt@gem_caching@reads.html

  * igt@gem_ctx_persistence@vcs1-queued:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb2/igt@gem_ctx_persistence@vcs1-queued.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb5/igt@gem_ctx_persistence@vcs1-queued.html

  * igt@gem_eio@in-flight-10ms:
    - shard-snb:          [PASS][7] -> [FAIL][8] ([i915#490])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-snb4/igt@gem_eio@in-flight-10ms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-snb5/igt@gem_eio@in-flight-10ms.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#110854])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb1/igt@gem_exec_balancer@smoke.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +12 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +16 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb6/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +5 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][21] -> [FAIL][22] ([i915#413])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb7/igt@i915_pm_rps@waitboost.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][23] -> [TIMEOUT][24] ([fdo#112271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl4/igt@i915_selftest@live_gtt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl3/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][35] -> [FAIL][36] ([i915#831])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw8/igt@prime_mmap_coherency@ioctl-errors.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][37] ([fdo#112080]) -> [PASS][38] +11 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb5/igt@gem_busy@busy-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [fdo#112080]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb4/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-iclb:         [INCOMPLETE][41] ([i915#140]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb3/igt@gem_ctx_shared@q-smoketest-all.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb5/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_exec_schedule@promotion-bsd:
    - shard-iclb:         [SKIP][43] ([fdo#112146]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb4/igt@gem_exec_schedule@promotion-bsd.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb3/igt@gem_exec_schedule@promotion-bsd.html

  * igt@gem_linear_blits@normal:
    - shard-hsw:          [FAIL][45] ([i915#893]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw7/igt@gem_linear_blits@normal.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw2/igt@gem_linear_blits@normal.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][47] ([i915#644]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-hsw:          [FAIL][49] ([i915#694]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw1/igt@gen7_exec_parse@basic-offset.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw5/igt@gen7_exec_parse@basic-offset.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][51] ([i915#447]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb8/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_selftest@live_blt:
    - shard-hsw:          [DMESG-FAIL][53] ([i915#553] / [i915#725]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw2/igt@i915_selftest@live_blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw4/igt@i915_selftest@live_blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][55] ([i915#180]) -> [PASS][56] +10 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][59] ([fdo#109441]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb7/igt@kms_psr@psr2_dpms.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276]) -> [PASS][62] +19 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][63] ([fdo#109276] / [fdo#112080]) -> [FAIL][64] ([IGT#28])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb2/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][65] ([i915#818]) -> [FAIL][66] ([i915#694])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw6/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][67] ([i915#694]) -> [FAIL][68] ([i915#818])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-hsw6/igt@gem_tiled_blits@normal.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-hsw5/igt@gem_tiled_blits@normal.html

  * igt@kms_atomic_transition@3x-modeset-transitions:
    - shard-kbl:          [SKIP][69] ([fdo#109271] / [i915#439]) -> [SKIP][70] ([fdo#109271]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-kbl1/igt@kms_atomic_transition@3x-modeset-transitions.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-kbl1/igt@kms_atomic_transition@3x-modeset-transitions.html

  * igt@kms_atomic_transition@3x-modeset-transitions-fencing:
    - shard-iclb:         [SKIP][71] ([fdo#109278] / [i915#439]) -> [SKIP][72] ([fdo#109278]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-iclb5/igt@kms_atomic_transition@3x-modeset-transitions-fencing.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-iclb3/igt@kms_atomic_transition@3x-modeset-transitions-fencing.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:
    - shard-apl:          [SKIP][73] ([fdo#109271] / [i915#439]) -> [SKIP][74] ([fdo#109271]) +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-apl3/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-apl6/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing:
    - shard-snb:          [SKIP][75] ([fdo#109271] / [i915#439]) -> [SKIP][76] ([fdo#109271]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-snb1/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-snb4/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing.html
    - shard-tglb:         [SKIP][77] ([fdo#112041] / [i915#439]) -> [SKIP][78] ([fdo#112041]) +3 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5387/shard-tglb7/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/shard-tglb1/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking-fencing.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112041]: https://bugs.freedesktop.org/show_bug.cgi?id=112041
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#439]: https://gitlab.freedesktop.org/drm/intel/issues/439
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#490]: https://gitlab.freedesktop.org/drm/intel/issues/490
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#893]: https://gitlab.freedesktop.org/drm/intel/issues/893


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5387 -> IGTPW_4001

  CI-20190529: 20190529
  CI_DRM_7816: 713d2a22a63ee93c0afea9a83c332f52ef90e91a @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4001: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/index.html
  IGT_5387: 2e04a36cb5eba1a979bce80b58c35687f324f066 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4001/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
