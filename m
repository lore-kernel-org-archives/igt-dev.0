Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 16:54:04 -0000
Message-ID: <158239044470.32576.12637381960773287293@emeril.freedesktop.org>
References: <20200220130041.24141-1-anshuman.gupta@intel.com>
In-Reply-To: <20200220130041.24141-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgREMgc3Rh?=
 =?utf-8?q?tes_IGT_misc_=28rev3=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: DC states IGT misc (rev3)
URL   : https://patchwork.freedesktop.org/series/73509/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973_full -> IGTPW_4194_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4194_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4194_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4194_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][1] ([i915#588]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  
Known issues
------------

  Here are the changes found in IGTPW_4194_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#110841])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +6 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +14 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb8/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#694]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-hsw6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#454])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@fences:
    - shard-iclb:         [PASS][13] -> [INCOMPLETE][14] ([i915#189])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@i915_pm_rpm@fences.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb2/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#413])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@i915_pm_rps@waitboost.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb8/igt@i915_pm_rps@waitboost.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#79])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk6/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-modeset-vs-hang-interruptible:
    - shard-glk:          [PASS][23] -> [TIMEOUT][24] ([fdo#112271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk2/igt@kms_flip@flip-vs-modeset-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([fdo#112271] / [i915#561]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb2/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-tglb:         [PASS][27] -> [SKIP][28] ([i915#668]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#899])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk5/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][35] -> [TIMEOUT][36] ([fdo#112271] / [i915#1085])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb1/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +11 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb3/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][39] -> [INCOMPLETE][40] ([i915#1176] / [i915#61])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw1/igt@perf_pmu@cpu-hotplug.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][41] ([i915#1277]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_balancer@hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb2/igt@gem_exec_balancer@hang.html
    - shard-tglb:         [FAIL][43] ([i915#1277]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@gem_exec_balancer@hang.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb2/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][45] ([fdo#112080]) -> [PASS][46] +8 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd1}:
    - shard-iclb:         [SKIP][47] ([fdo#109276] / [i915#677]) -> [PASS][48] +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@in-order-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@gem_exec_schedule@in-order-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb8/igt@gem_exec_schedule@in-order-bsd.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +18 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@independent-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb1/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [FAIL][59] ([i915#694]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-hsw2/igt@gem_render_copy_redux@normal.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][61] ([fdo#103665]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-glk:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@i915_pm_dc@dc5-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk5/igt@i915_pm_dc@dc5-dpms.html
    - shard-apl:          [SKIP][65] ([fdo#109271]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@i915_pm_dc@dc5-dpms.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl3/igt@i915_pm_dc@dc5-dpms.html
    - shard-kbl:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@i915_pm_dc@dc5-dpms.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl2/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [FAIL][69] ([fdo#103375]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk3/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-tglb:         [FAIL][71] ([i915#413]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb7/igt@i915_pm_rps@reset.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb5/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][73] ([i915#129]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][75] ([i915#129]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][77] ([i915#54]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][81] ([i915#54]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][83] ([i915#61]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][85] -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_flip@flip-vs-panning.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl2/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl3/igt@kms_flip@flip-vs-panning.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl8/igt@kms_flip@flip-vs-panning.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][89] ([i915#49]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][91] ([i915#180]) -> [PASS][92] +6 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][93] ([i915#668]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][97] ([i915#899]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][99] ([fdo#109441]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@kms_psr@psr2_suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf_pmu@busy-idle-check-all-vcs0:
    - shard-glk:          [FAIL][101] -> [PASS][102] +7 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@busy-idle-check-all-vcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk8/igt@perf_pmu@busy-idle-check-all-vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-glk:          [TIMEOUT][103] ([fdo#111561] / [fdo#112271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@cpu-hotplug.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-glk9/igt@perf_pmu@cpu-hotplug.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [SKIP][105] ([fdo#112080]) -> [FAIL][106] ([IGT#28])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-iclb4/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [SKIP][107] ([fdo#109271]) -> [FAIL][108] ([i915#454])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][109] ([fdo#111012]) -> [FAIL][110] ([i915#1176])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/shard-hsw5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111012]: https://bugs.freedesktop.org/show_bug.cgi?id=111012
  [fdo#111561]: https://bugs.freedesktop.org/show_bug.cgi?id=111561
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#1197]: https://gitlab.freedesktop.org/drm/intel/issues/1197
  [i915#1239]: https://gitlab.freedesktop.org/drm/intel/issues/1239
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#679]: https://gitlab.freedesktop.org/drm/intel/issues/679
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4194
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4194: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4194/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
