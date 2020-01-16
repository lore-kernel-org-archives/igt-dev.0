Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Jan 2020 10:36:11 -0000
Message-ID: <157917097188.12914.4743159334330268907@emeril.freedesktop.org>
References: <20200114091745.4555-1-petri.latvala@intel.com>
In-Reply-To: <20200114091745.4555-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/4=5D_lib=3A_Don=27t_dump_log_buffer?=
 =?utf-8?q?_when_dynamic_subtest_failure_is_inherited?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/4] lib: Don't dump log buffer when dynamic subtest failure is inherited
URL   : https://patchwork.freedesktop.org/series/71997/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7737_full -> IGTPW_3921_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/index.html

Known issues
------------

  Here are the changes found in IGTPW_3921_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb6/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb6/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_await@wide-contexts:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] ([fdo#111736] / [i915#472])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb4/igt@gem_exec_await@wide-contexts.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb3/igt@gem_exec_await@wide-contexts.html

  * igt@gem_exec_parallel@fds:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([fdo#112271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-hsw2/igt@gem_exec_parallel@fds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-hsw5/igt@gem_exec_parallel@fds.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112080]) +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb5/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb5/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +20 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-queue-contexts-vebox:
    - shard-tglb:         [PASS][15] -> [INCOMPLETE][16] ([fdo#111677] / [i915#472])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb1/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb3/igt@gem_exec_schedule@preempt-queue-contexts-vebox.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([fdo#112146]) +5 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_exec_schedule@smoketest-blt:
    - shard-tglb:         [PASS][19] -> [INCOMPLETE][20] ([i915#470] / [i915#472])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb4/igt@gem_exec_schedule@smoketest-blt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb6/igt@gem_exec_schedule@smoketest-blt.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([fdo#110789] / [i915#478])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb4/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@gem_persistent_relocs@forked-faulting-reloc-thrashing:
    - shard-iclb:         [PASS][23] -> [TIMEOUT][24] ([fdo#112271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb2/igt@gem_persistent_relocs@forked-faulting-reloc-thrashing.html

  * igt@gem_ppgtt@blt-vs-render-ctxn:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#470] / [i915#475])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb2/igt@gem_ppgtt@blt-vs-render-ctxn.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb3/igt@gem_ppgtt@blt-vs-render-ctxn.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#644])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl3/igt@gem_softpin@noreloc-s3.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-apl8/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#454])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([fdo#111764])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#79])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-glk1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-tglb:         [PASS][43] -> [SKIP][44] ([i915#668]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@pixel-format-pipe-a-planes-source-clamping:
    - shard-snb:          [PASS][45] -> [DMESG-WARN][46] ([i915#478])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb1/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb6/igt@kms_plane@pixel-format-pipe-a-planes-source-clamping.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109642] / [fdo#111068])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][49] -> [FAIL][50] ([i915#173])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb5/igt@kms_psr@no_drrs.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][51] -> [SKIP][52] ([fdo#109441])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#31])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl1/igt@kms_setmode@basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-apl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][55] -> [INCOMPLETE][56] ([fdo#103665])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][57] ([fdo#112080]) -> [PASS][58] +13 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@gem_busy@busy-vcs1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_isolation@bcs0-s3:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-apl1/igt@gem_ctx_isolation@bcs0-s3.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-apl4/igt@gem_ctx_isolation@bcs0-s3.html

  * igt@gem_ctx_isolation@vcs1-dirty-create:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [fdo#112080]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@gem_ctx_isolation@vcs1-dirty-create.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb1/igt@gem_ctx_isolation@vcs1-dirty-create.html

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-iclb:         [DMESG-WARN][63] ([fdo#111764]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@gem_ctx_isolation@vecs0-s3.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb5/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_exec_create@madvise:
    - shard-tglb:         [INCOMPLETE][65] ([i915#472]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb8/igt@gem_exec_create@madvise.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb1/igt@gem_exec_create@madvise.html

  * igt@gem_exec_parallel@basic:
    - shard-tglb:         [INCOMPLETE][67] ([i915#472] / [i915#476]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb3/igt@gem_exec_parallel@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb1/igt@gem_exec_parallel@basic.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][69] ([i915#677]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb5/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][71] ([fdo#109276]) -> [PASS][72] +17 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [SKIP][73] ([fdo#112146]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@gem_exec_schedule@preempt-self-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb3/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@gem_exec_schedule@smoketest-bsd1:
    - shard-tglb:         [INCOMPLETE][75] ([i915#463] / [i915#472]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb6/igt@gem_exec_schedule@smoketest-bsd1.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb8/igt@gem_exec_schedule@smoketest-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [INCOMPLETE][77] ([fdo#111736] / [i915#460] / [i915#472]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb3/igt@gem_exec_suspend@basic-s3.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive:
    - shard-glk:          [TIMEOUT][79] ([fdo#112271] / [i915#530]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-glk9/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-glk3/igt@gem_persistent_relocs@forked-interruptible-faulting-reloc-thrash-inactive.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-tglb:         [INCOMPLETE][81] ([i915#707] / [i915#796]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb8/igt@gem_pipe_control_store_loop@reused-buffer.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb8/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_pwrite@self:
    - shard-snb:          [DMESG-WARN][83] ([i915#478]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb1/igt@gem_pwrite@self.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb1/igt@gem_pwrite@self.html

  * igt@gem_sync@basic-all:
    - shard-tglb:         [INCOMPLETE][85] ([i915#470] / [i915#472]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb6/igt@gem_sync@basic-all.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb7/igt@gem_sync@basic-all.html

  * igt@gem_tiled_blits@normal:
    - shard-tglb:         [INCOMPLETE][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb2/igt@gem_tiled_blits@normal.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb8/igt@gem_tiled_blits@normal.html

  * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup:
    - shard-snb:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy-gup.html

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][91] ([fdo#111870]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][93] ([i915#447]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][95] ([i915#413]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb3/igt@i915_pm_rps@waitboost.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb2/igt@i915_pm_rps@waitboost.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite:
    - shard-tglb:         [FAIL][97] ([i915#49]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-tglb:         [DMESG-FAIL][99] ([i915#402]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b:
    - shard-snb:          [SKIP][101] ([fdo#109271]) -> [PASS][102] +3 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [INCOMPLETE][103] ([fdo#103665]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@primary_blt:
    - shard-tglb:         [DMESG-WARN][105] ([i915#402]) -> [PASS][106] +11 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@kms_psr@primary_blt.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb1/igt@kms_psr@primary_blt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][107] ([fdo#109441]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][109] ([i915#180]) -> [PASS][110] +8 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][111] ([IGT#28]) -> [SKIP][112] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-snb:          [DMESG-WARN][113] ([i915#444]) -> [FAIL][114] ([i915#436])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb5/igt@gem_eio@kms.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb6/igt@gem_eio@kms.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-snb:          [DMESG-WARN][115] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][116] ([fdo#111870])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb1/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-hsw:          [FAIL][117] ([i915#694]) -> [INCOMPLETE][118] ([i915#61])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-hsw2/igt@gen7_exec_parse@basic-allocation.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-hsw7/igt@gen7_exec_parse@basic-allocation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][119] ([i915#454]) -> [SKIP][120] ([i915#468])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_atomic_transition@3x-modeset-transitions-nonblocking:
    - shard-snb:          [SKIP][121] ([fdo#109271]) -> [SKIP][122] ([fdo#109271] / [i915#439])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb2/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb2/igt@kms_atomic_transition@3x-modeset-transitions-nonblocking.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [DMESG-WARN][123] ([i915#402]) -> [FAIL][124] ([IGT#5])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][125] ([i915#180]) -> [DMESG-WARN][126] ([i915#56])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][127], [FAIL][128], [FAIL][129]) ([fdo#110275] / [fdo#111093]) -> ([FAIL][130], [FAIL][131], [FAIL][132]) ([fdo#108654] / [fdo#111093])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb8/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-iclb2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-iclb1/igt@runner@aborted.html
    - shard-snb:          ([FAIL][133], [FAIL][134]) ([i915#436] / [i915#974]) -> [FAIL][135] ([i915#974])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7737/shard-snb5/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/shard-snb2/igt@runner@aborted.html

  
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#108654]: https://bugs.freedesktop.org/show_bug.cgi?id=108654
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110275]: https://bugs.freedesktop.org/show_bug.cgi?id=110275
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111093]: https://bugs.freedesktop.org/show_bug.cgi?id=111093
  [fdo#111677]: https://bugs.freedesktop.org/show_bug.cgi?id=111677
  [fdo#111736]: https://bugs.freedesktop.org/show_bug.cgi?id=111736
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#436]: https://gitlab.freedesktop.org/drm/intel/issues/436
  [i915#439]: https://gitlab.freedesktop.org/drm/intel/issues/439
  [i915#444]: https://gitlab.freedesktop.org/drm/intel/issues/444
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#460]: https://gitlab.freedesktop.org/drm/intel/issues/460
  [i915#463]: https://gitlab.freedesktop.org/drm/intel/issues/463
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#470]: https://gitlab.freedesktop.org/drm/intel/issues/470
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#475]: https://gitlab.freedesktop.org/drm/intel/issues/475
  [i915#476]: https://gitlab.freedesktop.org/drm/intel/issues/476
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#530]: https://gitlab.freedesktop.org/drm/intel/issues/530
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#707]: https://gitlab.freedesktop.org/drm/intel/issues/707
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#796]: https://gitlab.freedesktop.org/drm/intel/issues/796
  [i915#974]: https://gitlab.freedesktop.org/drm/intel/issues/974


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-hsw-4770r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5364 -> IGTPW_3921
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7737: 2a331333791d2e499ac843e1dc25cd8ea5bdc81f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3921: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/index.html
  IGT_5364: b7cb6ffdb65cbd233f5ddee2f2dabf97b34fa640 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3921/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
