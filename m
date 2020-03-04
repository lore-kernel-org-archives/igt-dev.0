Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 02:52:41 -0000
Message-ID: <158329036119.430.9305793257090718782@emeril.freedesktop.org>
References: <20200303140327.1535286-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200303140327.1535286-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fparallel=3A_Try_to_trim_runtime?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_parallel: Try to trim runtime
URL   : https://patchwork.freedesktop.org/series/74206/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8055_full -> IGTPW_4249_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/index.html

Known issues
------------

  Here are the changes found in IGTPW_4249_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#110841])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb1/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +18 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@gem_exec_schedule@wide-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb1/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#447])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#1316]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@i915_pm_rpm@system-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-hsw8/igt@i915_pm_rpm@system-suspend.html
    - shard-tglb:         [PASS][17] -> [SKIP][18] ([i915#1316]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb8/igt@i915_pm_rpm@system-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-tglb6/igt@i915_pm_rpm@system-suspend.html
    - shard-glk:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk6/igt@i915_pm_rpm@system-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-glk2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103665] / [i915#435])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl1/igt@i915_suspend@sysfs-reader.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +7 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-apl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl7/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#72])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#899])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_plane_scaling@pipe-a-plane-scaling:
    - shard-glk:          [PASS][33] -> [DMESG-WARN][34] ([i915#118] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk7/igt@kms_plane_scaling@pipe-a-plane-scaling.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-glk3/igt@kms_plane_scaling@pipe-a-plane-scaling.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#31])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-accuracy-98-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb1/igt@perf_pmu@busy-accuracy-98-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb6/igt@perf_pmu@busy-accuracy-98-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb4/igt@gem_busy@busy-vcs1.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][43] ([i915#1291]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-apl:          [INCOMPLETE][45] ([fdo#103927] / [i915#1197] / [i915#1239]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-apl:          [FAIL][47] ([i915#679]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][49] ([i915#679]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl1/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +6 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][59] ([i915#413]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@i915_pm_rps@reset.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb6/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [DMESG-WARN][61] ([i915#478]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
    - shard-hsw:          [DMESG-WARN][63] ([i915#478]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-hsw7/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-snb:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-snb5/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][67] ([i915#1297]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl6/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][69] ([i915#1297]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl1/igt@kms_flip@flip-vs-dpms-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-kbl3/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@kms_psr@psr2_suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][75] ([fdo#109276]) -> [PASS][76] +15 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@prime_vgem@fence-wait-bsd2.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-iclb1/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][77] ([i915#468]) -> [FAIL][78] ([i915#454])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#435]: https://gitlab.freedesktop.org/drm/intel/issues/435
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4249
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8055: df5c59f81df63a983b7490968e16c3255adc196b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4249: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4249/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
