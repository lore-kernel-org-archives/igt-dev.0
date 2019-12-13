Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 13 Dec 2019 03:36:28 -0000
Message-ID: <157620818827.23798.10665639326851469082@emeril.freedesktop.org>
References: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
In-Reply-To: <20191212123301.23827-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaWd0L3Rl?=
 =?utf-8?q?sts=3A_kms=5Fplane=5Fstress=3A_Add_plane_stress_test_=28rev21?=
 =?utf-8?q?=29?=
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: igt/tests: kms_plane_stress: Add plane stress test (rev21)
URL   : https://patchwork.freedesktop.org/series/58524/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7549_full -> IGTPW_3856_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3856_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pipe_stress@stress-xrgb8888-untiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-hsw4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl1/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-apl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
    - shard-glk:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-glk4/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7549_full and IGTPW_3856_full:

### New IGT tests (1) ###

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_3856_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-kbl:          [PASS][6] -> [DMESG-WARN][7] ([i915#180]) +4 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl3/igt@gem_ctx_isolation@bcs0-s3.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl7/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-clean:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([fdo#109276] / [fdo#112080])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_ctx_isolation@vcs1-clean.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb8/igt@gem_ctx_isolation@vcs1-clean.html

  * igt@gem_exec_balancer@bonded-slice:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#800])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@gem_exec_balancer@bonded-slice.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl7/igt@gem_exec_balancer@bonded-slice.html

  * igt@gem_exec_schedule@preempt-queue-chain-render:
    - shard-tglb:         [PASS][12] -> [INCOMPLETE][13] ([fdo#111606] / [fdo#111677])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@gem_exec_schedule@preempt-queue-chain-render.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb6/igt@gem_exec_schedule@preempt-queue-chain-render.html

  * igt@gem_exec_schedule@preempt-queue-contexts-bsd:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([fdo#112146]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb3/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-bsd.html

  * igt@gem_exec_schedule@preempt-queue-vebox:
    - shard-tglb:         [PASS][16] -> [INCOMPLETE][17] ([fdo#111677])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb8/igt@gem_exec_schedule@preempt-queue-vebox.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb6/igt@gem_exec_schedule@preempt-queue-vebox.html

  * igt@gem_persistent_relocs@forked-thrash-inactive:
    - shard-iclb:         [PASS][18] -> [TIMEOUT][19] ([i915#530])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_persistent_relocs@forked-thrash-inactive.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb3/igt@gem_persistent_relocs@forked-thrash-inactive.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-snb:          [PASS][20] -> [DMESG-WARN][21] ([fdo#110789] / [fdo#111870])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-tglb:         [PASS][22] -> [INCOMPLETE][23] ([i915#456] / [i915#460])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@gem_workarounds@suspend-resume-fd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb8/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][24] -> [FAIL][25] ([i915#454])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-stress-extra-wait:
    - shard-glk:          [PASS][26] -> [DMESG-WARN][27] ([i915#118] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-glk5/igt@i915_pm_rpm@modeset-stress-extra-wait.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-glk8/igt@i915_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][28] -> [FAIL][29] ([i915#96])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-hsw4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [PASS][30] -> [DMESG-WARN][31] ([i915#180]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-apl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite:
    - shard-tglb:         [PASS][32] -> [FAIL][33] ([i915#49]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-pwrite.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         [PASS][34] -> [DMESG-WARN][35] ([i915#402])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb2/igt@kms_psr@psr2_suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([i915#31])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@kms_setmode@basic.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-apl2/igt@kms_setmode@basic.html

  * igt@perf_pmu@init-sema-vcs1:
    - shard-iclb:         [PASS][38] -> [SKIP][39] ([fdo#112080])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@perf_pmu@init-sema-vcs1.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb3/igt@perf_pmu@init-sema-vcs1.html

  * igt@prime_busy@after-bsd2:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([fdo#109276]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb2/igt@prime_busy@after-bsd2.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb3/igt@prime_busy@after-bsd2.html

  
#### Possible fixes ####

  * igt@gem_eio@reset-stress:
    - shard-snb:          [FAIL][42] ([i915#232]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@gem_eio@reset-stress.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb4/igt@gem_eio@reset-stress.html

  * igt@gem_exec_parallel@vcs1:
    - shard-tglb:         [INCOMPLETE][44] ([fdo#111593]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@gem_exec_parallel@vcs1.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb2/igt@gem_exec_parallel@vcs1.html

  * {igt@gem_exec_schedule@pi-common-bsd}:
    - shard-iclb:         [SKIP][46] ([i915#677]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][48] ([fdo#112146]) -> [PASS][49] +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive:
    - shard-snb:          [TIMEOUT][50] ([i915#530]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb6/igt@gem_persistent_relocs@forked-faulting-reloc-thrash-inactive.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [FAIL][52] ([i915#644]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][54] ([fdo#111870]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@i915_selftest@mock_sanitycheck:
    - shard-snb:          [DMESG-WARN][56] ([i915#747]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb1/igt@i915_selftest@mock_sanitycheck.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb7/igt@i915_selftest@mock_sanitycheck.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [FAIL][58] ([i915#71]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@kms_color@pipe-a-gamma.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb8/igt@kms_color@pipe-a-gamma.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-snb:          [DMESG-WARN][62] ([i915#42]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-kbl:          [INCOMPLETE][64] ([fdo#103665]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl7/igt@kms_flip@plain-flip-interruptible.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl3/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         [INCOMPLETE][66] ([i915#474] / [i915#667]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][68] ([i915#31]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-hsw7/igt@kms_setmode@basic.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-hsw5/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][70] ([i915#180]) -> [PASS][71] +5 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [INCOMPLETE][72] ([i915#460]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-tglb3/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [SKIP][74] ([fdo#112080]) -> [PASS][75] +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb5/igt@perf_pmu@busy-check-all-vcs1.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb4/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][76] ([fdo#109276]) -> [PASS][77] +4 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7549/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111593]: https://bugs.freedesktop.org/show_bug.cgi?id=111593
  [fdo#111606]: https://bugs.freedesktop.org/show_bug.cgi?id=111606
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#474]: https://gitlab.freedesktop.org/drm/intel/issues/474
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#667]: https://gitlab.freedesktop.org/drm/intel/issues/667
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#747]: https://gitlab.freedesktop.org/drm/intel/issues/747
  [i915#800]: https://gitlab.freedesktop.org/drm/intel/issues/800
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5346 -> IGTPW_3856
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7549: 9573e1b7d1cb54cc984cf5c4f93a743641d868da @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3856: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html
  IGT_5346: 466b0e6cbcbaccff012b484d1fd7676364b37b93 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3856/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
