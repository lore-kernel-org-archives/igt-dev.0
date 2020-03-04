Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 04:22:01 -0000
Message-ID: <158329572188.430.17213106453932844604@emeril.freedesktop.org>
References: <20200303143137.1615349-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200303143137.1615349-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fcreate=3A_Fix_=27files=27?=
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

Series: i915/gem_ctx_create: Fix 'files'
URL   : https://patchwork.freedesktop.org/series/74209/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8055_full -> IGTPW_4251_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/index.html

Known issues
------------

  Here are the changes found in IGTPW_4251_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@rcs0-s3:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl6/igt@gem_ctx_isolation@rcs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl4/igt@gem_ctx_isolation@rcs0-s3.html

  * igt@gem_exec_schedule@implicit-both-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_exec_schedule@implicit-both-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb1/igt@gem_exec_schedule@implicit-both-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276] / [i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +6 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-hsw:          [PASS][11] -> [DMESG-WARN][12] ([fdo#111870])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@gem_userptr_blits@dmabuf-unsync.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-hsw8/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-snb:          [PASS][13] -> [DMESG-WARN][14] ([fdo#111870] / [i915#478])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-snb6/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl2/igt@gem_workarounds@suspend-resume-context.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#716])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk2/igt@gen9_exec_parse@allowed-all.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#447])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#899])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb6/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#31])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@kms_setmode@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#43])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-glk4/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@kms_vblank@pipe-b-wait-idle:
    - shard-hsw:          [PASS][33] -> [INCOMPLETE][34] ([i915#61])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@kms_vblank@pipe-b-wait-idle.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-hsw5/igt@kms_vblank@pipe-b-wait-idle.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm:
    - shard-glk:          [PASS][35] -> [SKIP][36] ([fdo#109271]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109278])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb8/igt@kms_vblank@pipe-c-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#112080]) +10 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@perf_pmu@busy-check-all-vcs1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb6/igt@perf_pmu@busy-check-all-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +14 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb6/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][43] ([i915#1291]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-tglb6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-apl:          [INCOMPLETE][45] ([fdo#103927] / [i915#1197] / [i915#1239]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-apl1/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-apl:          [FAIL][47] ([i915#679]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-apl1/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][49] ([i915#679]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][51] ([fdo#110854]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_exec_balancer@smoke.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [SKIP][53] ([fdo#109276] / [i915#677]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@gem_exec_schedule@in-order-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@in-order-bsd2:
    - shard-iclb:         [SKIP][57] ([fdo#109276]) -> [PASS][58] +17 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_exec_schedule@in-order-bsd2.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb4/igt@gem_exec_schedule@in-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][59] ([i915#677]) -> [PASS][60] +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb3/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][61] ([i915#644]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-tglb5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][63] ([i915#413]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@i915_pm_rps@waitboost.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb1/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [DMESG-WARN][65] ([i915#478]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
    - shard-hsw:          [DMESG-WARN][67] ([i915#478]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - shard-snb:          [SKIP][69] ([fdo#109271]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-snb4/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][71] ([i915#1297]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-apl1/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][73] ([i915#1297]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl1/igt@kms_flip@flip-vs-dpms-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl6/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78] +5 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb1/igt@kms_psr@psr2_primary_page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [SKIP][81] ([fdo#112080]) -> [PASS][82] +11 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@perf_pmu@init-busy-vcs1.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-iclb2/igt@perf_pmu@init-busy-vcs1.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [SKIP][83] ([i915#468]) -> [FAIL][84] ([i915#454])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/shard-tglb6/igt@i915_pm_dc@dc6-psr.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4251
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8055: df5c59f81df63a983b7490968e16c3255adc196b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4251: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4251/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
