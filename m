Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 04 Mar 2020 03:39:40 -0000
Message-ID: <158329318082.426.12956114222742324143@emeril.freedesktop.org>
References: <20200303141842.1575190-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200303141842.1575190-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Trim_loop_counters?=
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

Series: i915/gem_exec_create: Trim loop counters
URL   : https://patchwork.freedesktop.org/series/74207/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8055_full -> IGTPW_4250_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/index.html

Known issues
------------

  Here are the changes found in IGTPW_4250_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd:
    - shard-tglb:         [PASS][1] -> [FAIL][2] ([i915#679])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4] ([i915#1239])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd1.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb2/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@implicit-write-read-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276] / [i915#677])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb5/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +20 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb5/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#112146]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_exec_schedule@preempt-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb2/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk3/igt@gem_exec_whisper@basic-queues-forked.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-glk9/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([i915#1316]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb8/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@i915_pm_rpm@system-suspend-devices.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw5/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk5/igt@i915_pm_rpm@system-suspend-devices.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_concurrent@pipe-a:
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#478])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@kms_concurrent@pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw8/igt@kms_concurrent@pipe-a.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-snb:          [PASS][33] -> [DMESG-WARN][34] ([i915#478])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb2/igt@kms_fbcon_fbt@fbc-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-snb5/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_plane@plane-position-covered-pipe-c-planes:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#247])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl2/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#247])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-glk7/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-glk9/igt@kms_plane@plane-position-covered-pipe-c-planes.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#247])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl3/igt@kms_plane@plane-position-covered-pipe-c-planes.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109441]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#31])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl4/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#112080]) +14 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb1/igt@perf_pmu@busy-vcs1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][49] ([i915#1291]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb7/igt@gem_ctx_persistence@close-replace-race.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb5/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_ctx_persistence@engines-mixed-process@bcs0:
    - shard-apl:          [INCOMPLETE][51] ([fdo#103927] / [i915#1197] / [i915#1239]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl6/igt@gem_ctx_persistence@engines-mixed-process@bcs0.html

  * igt@gem_ctx_persistence@engines-mixed-process@rcs0:
    - shard-apl:          [FAIL][53] ([i915#679]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl8/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl6/igt@gem_ctx_persistence@engines-mixed-process@rcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-kbl:          [FAIL][55] ([i915#679]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl2/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][57] ([fdo#112146]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb4/igt@gem_exec_async@concurrent-writes-bsd.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb5/igt@gem_exec_async@concurrent-writes-bsd.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][59] ([fdo#112080]) -> [PASS][60] +17 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-both-bsd2:
    - shard-iclb:         [SKIP][61] ([fdo#109276] / [i915#677]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd2.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][63] ([fdo#109276]) -> [PASS][64] +16 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][65] ([i915#677]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][67] ([i915#644]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb7/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][69] ([i915#413]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@i915_pm_rps@reset.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb3/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-snb:          [DMESG-WARN][71] ([i915#478]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
    - shard-hsw:          [DMESG-WARN][73] ([i915#478]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw2/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled:
    - shard-snb:          [SKIP][75] ([fdo#109271]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-snb2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-untiled.html

  * igt@kms_flip@flip-vs-dpms-interruptible:
    - shard-apl:          [DMESG-WARN][77] ([i915#1297]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl6/igt@kms_flip@flip-vs-dpms-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl1/igt@kms_flip@flip-vs-dpms-interruptible.html
    - shard-kbl:          [DMESG-WARN][79] ([i915#1297]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl1/igt@kms_flip@flip-vs-dpms-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl1/igt@kms_flip@flip-vs-dpms-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][81] ([i915#180]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
#### Warnings ####

  * igt@gem_userptr_blits@sync-unmap-cycles:
    - shard-snb:          [DMESG-WARN][89] ([fdo#111870] / [i915#478]) -> [DMESG-WARN][90] ([fdo#110789] / [fdo#111870] / [i915#478])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb4/igt@gem_userptr_blits@sync-unmap-cycles.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-snb5/igt@gem_userptr_blits@sync-unmap-cycles.html
    - shard-hsw:          [DMESG-WARN][91] ([fdo#111870]) -> [DMESG-WARN][92] ([fdo#110789] / [fdo#111870])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw8/igt@gem_userptr_blits@sync-unmap-cycles.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw6/igt@gem_userptr_blits@sync-unmap-cycles.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [SKIP][93] ([fdo#109271]) -> [INCOMPLETE][94] ([i915#82])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-snb2/igt@i915_pm_dc@dc6-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-snb6/igt@i915_pm_dc@dc6-psr.html
    - shard-tglb:         [SKIP][95] ([i915#468]) -> [FAIL][96] ([i915#454])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-tglb2/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][97] ([i915#1319]) -> [FAIL][98] ([fdo#110321] / [fdo#110336])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@runner@aborted:
    - shard-hsw:          ([FAIL][99], [FAIL][100], [FAIL][101], [FAIL][102], [FAIL][103], [FAIL][104], [FAIL][105], [FAIL][106]) ([fdo#111870]) -> ([FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112], [FAIL][113]) ([fdo#111870] / [i915#478])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw6/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw6/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw8/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw1/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw2/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw7/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8055/shard-hsw8/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw8/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw8/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw8/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/shard-hsw1/igt@runner@aborted.html

  
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5484 -> IGTPW_4250
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8055: df5c59f81df63a983b7490968e16c3255adc196b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4250: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/index.html
  IGT_5484: 91b36b61e76901a2bd09fe93ac7bf7b8a60f258c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4250/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
