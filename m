Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 01 Mar 2020 15:42:47 -0000
Message-ID: <158307736778.22450.7580604103859506344@emeril.freedesktop.org>
References: <20200228182229.1860-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20200228182229.1860-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/i915=5Fpm=5Fdc=3A_Move_P?=
 =?utf-8?q?SR_checks_back_to_individual_subtests?=
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/i915_pm_dc: Move PSR checks back to individual subtests
URL   : https://patchwork.freedesktop.org/series/74091/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8032_full -> IGTPW_4240_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4240_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4240_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4240_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb3/igt@gem_exec_whisper@basic-fds-forked.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb2/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-glk:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk9/igt@i915_pm_rpm@basic-rte.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk6/igt@i915_pm_rpm@basic-rte.html
    - shard-iclb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb6/igt@i915_pm_rpm@basic-rte.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb8/igt@i915_pm_rpm@basic-rte.html
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb7/igt@i915_pm_rpm@basic-rte.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb6/igt@i915_pm_rpm@basic-rte.html
    - shard-hsw:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw5/igt@i915_pm_rpm@basic-rte.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - shard-hsw:          [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw1/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          NOTRUN -> [TIMEOUT][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-iclb:         [PASS][13] -> [TIMEOUT][14] +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][15] ([fdo#109271]) -> [TIMEOUT][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-iclb:         [SKIP][17] ([fdo#109280]) -> [TIMEOUT][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@stress-open-close}:
    - shard-hsw:          [INCOMPLETE][19] ([i915#61]) -> [TIMEOUT][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw6/igt@perf@stress-open-close.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw1/igt@perf@stress-open-close.html
    - shard-iclb:         [INCOMPLETE][21] -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@perf@stress-open-close.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb7/igt@perf@stress-open-close.html

  
Known issues
------------

  Here are the changes found in IGTPW_4240_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@extended-semaphore-vcs1:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#112080]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb1/igt@gem_busy@extended-semaphore-vcs1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb6/igt@gem_busy@extended-semaphore-vcs1.html

  * igt@gem_eio@in-flight-internal-10ms:
    - shard-hsw:          [PASS][25] -> [TIMEOUT][26] ([i915#1084])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw4/igt@gem_eio@in-flight-internal-10ms.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw1/igt@gem_eio@in-flight-internal-10ms.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#110854])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@gem_exec_balancer@smoke.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb5/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109276] / [i915#677])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#677]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112146]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb3/igt@gem_exec_schedule@reorder-wide-bsd.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb4/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#644])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-apl8/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@sync-unmap:
    - shard-snb:          [PASS][37] -> [DMESG-WARN][38] ([fdo#111870] / [i915#478])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-snb6/igt@gem_userptr_blits@sync-unmap.html
    - shard-hsw:          [PASS][39] -> [DMESG-WARN][40] ([fdo#111870])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw1/igt@gem_userptr_blits@sync-unmap.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw7/igt@gem_userptr_blits@sync-unmap.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-hsw:          [PASS][41] -> [SKIP][42] ([fdo#109271])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-glk:          [PASS][43] -> [SKIP][44] ([fdo#109271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl3/igt@i915_suspend@forcewake.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_atomic@plane_overlay_legacy:
    - shard-snb:          [PASS][47] -> [SKIP][48] ([fdo#109271]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-snb4/igt@kms_atomic@plane_overlay_legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-snb6/igt@kms_atomic@plane_overlay_legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][49] -> [DMESG-WARN][50] ([i915#180]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#49])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-apl:          [PASS][53] -> [FAIL][54] ([i915#49])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#49])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#899])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109642] / [fdo#111068])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][63] -> [SKIP][64] ([fdo#109276]) +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html

  * igt@prime_vgem@sync-blt:
    - shard-tglb:         [PASS][65] -> [INCOMPLETE][66] ([i915#409])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb2/igt@prime_vgem@sync-blt.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb7/igt@prime_vgem@sync-blt.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [INCOMPLETE][67] ([i915#1291]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][69] ([fdo#112080]) -> [PASS][70] +11 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][71] ([fdo#109276] / [i915#677]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [SKIP][73] ([i915#677]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][75] ([fdo#112146]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][77] ([i915#644]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk8/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][79] ([i915#644]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-glk:          [SKIP][81] ([fdo#109271]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-glk2/igt@i915_pm_dc@dc5-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-glk2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [SKIP][83] ([fdo#109271]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw7/igt@i915_pm_rpm@gem-pread.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw6/igt@i915_pm_rpm@gem-pread.html
    - shard-tglb:         [SKIP][85] ([i915#1316]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb3/igt@i915_pm_rpm@gem-pread.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb6/igt@i915_pm_rpm@gem-pread.html
    - shard-iclb:         [SKIP][87] ([i915#1316]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb7/igt@i915_pm_rpm@gem-pread.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb2/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][89] ([i915#413]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb3/igt@i915_pm_rps@reset.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb5/igt@i915_pm_rps@reset.html
    - shard-iclb:         [FAIL][91] ([i915#413]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb7/igt@i915_pm_rps@reset.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb1/igt@i915_pm_rps@reset.html

  * igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
    - shard-hsw:          [TIMEOUT][93] -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-hsw7/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-hsw6/igt@kms_atomic_transition@2x-modeset-transitions-nonblocking.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-apl:          [DMESG-WARN][95] ([i915#1297]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-apl8/igt@kms_flip@basic-flip-vs-modeset.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-apl1/igt@kms_flip@basic-flip-vs-modeset.html
    - shard-kbl:          [DMESG-WARN][97] ([i915#1297]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl6/igt@kms_flip@basic-flip-vs-modeset.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [INCOMPLETE][99] ([fdo#103665]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][103] ([fdo#109441]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb6/igt@kms_psr@psr2_cursor_plane_move.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [FAIL][105] ([i915#1085]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb2/igt@perf@gen12-mi-rpc.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf@invalid-create-userspace-config:
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [PASS][108] +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl2/igt@perf@invalid-create-userspace-config.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl1/igt@perf@invalid-create-userspace-config.html
    - shard-apl:          [SKIP][109] ([fdo#109271]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-apl8/igt@perf@invalid-create-userspace-config.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-apl4/igt@perf@invalid-create-userspace-config.html
    - shard-iclb:         [SKIP][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb1/igt@perf@invalid-create-userspace-config.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb6/igt@perf@invalid-create-userspace-config.html
    - shard-tglb:         [SKIP][113] -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb2/igt@perf@invalid-create-userspace-config.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb1/igt@perf@invalid-create-userspace-config.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][115] ([fdo#109276]) -> [PASS][116] +17 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb2/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv-switch:
    - shard-iclb:         [FAIL][117] ([IGT#28]) -> [SKIP][118] ([fdo#112080])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv-switch.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [SKIP][119] ([fdo#109271]) -> [FAIL][120] ([i915#454])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-kbl4/igt@i915_pm_dc@dc6-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         [SKIP][121] ([fdo#111644]) -> [SKIP][122] ([i915#1316])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-iclb:         [SKIP][123] ([fdo#110892]) -> [SKIP][124] ([i915#1316])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8032/shard-iclb4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/shard-iclb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1084]: https://gitlab.freedesktop.org/drm/intel/issues/1084
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#409]: https://gitlab.freedesktop.org/drm/intel/issues/409
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5477 -> IGTPW_4240
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8032: e61f34133ad908d4b455344daa7b4edb9fcf680c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4240: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/index.html
  IGT_5477: 3fe5828f45fc533ba4d9ee84dbb5aea320ce61bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4240/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
