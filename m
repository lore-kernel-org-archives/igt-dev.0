Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 15:40:12 -0000
Message-ID: <158238601252.32577.16192112478102830803@emeril.freedesktop.org>
References: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200220125152.1188880-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?i915-perf=3A_workaround_overzelous_compiler_warnings?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tools/i915-perf: workaround overzelous compiler warnings
URL   : https://patchwork.freedesktop.org/series/73709/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973_full -> IGTPW_4192_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html

Known issues
------------

  Here are the changes found in IGTPW_4192_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@gem_exec_reuse@baggage.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl6/igt@gem_exec_reuse@baggage.html

  * igt@gem_exec_schedule@preempt-queue-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#112146]) +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#109276]) +15 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#694])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw6/igt@gem_partial_pwrite_pread@reads-display.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@gem_pwrite@huge-cpu-fbr:
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([fdo#112271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_pwrite@huge-cpu-fbr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw5/igt@gem_pwrite@huge-cpu-fbr.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][11] -> [TIMEOUT][12] ([fdo#112271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#447])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@i915_pm_dc@dc5-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb3/igt@i915_pm_dc@dc5-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-tglb:         [PASS][15] -> [SKIP][16] ([i915#668]) +6 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([fdo#109441]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103665])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][25] -> [TIMEOUT][26] ([fdo#112271] / [i915#1085])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#112080]) +13 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb8/igt@perf_pmu@busy-vcs1.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#1176] / [i915#61])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw1/igt@perf_pmu@cpu-hotplug.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw5/igt@perf_pmu@cpu-hotplug.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][31] ([fdo#112080]) -> [PASS][32] +16 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb1/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][33] ([i915#1277]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_balancer@hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb1/igt@gem_exec_balancer@hang.html
    - shard-tglb:         [FAIL][35] ([i915#1277]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@gem_exec_balancer@hang.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb5/igt@gem_exec_balancer@hang.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][37] ([fdo#109276] / [i915#677]) -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb2/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][39] ([i915#677]) -> [PASS][40] +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd:
    - shard-iclb:         [SKIP][41] ([fdo#112146]) -> [PASS][42] +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb7/igt@gem_exec_schedule@preempt-queue-contexts-chain-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [FAIL][43] ([i915#644]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [FAIL][47] ([i915#694]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw1/igt@gem_render_copy_redux@normal.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][49] ([fdo#103665]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [FAIL][51] ([fdo#103375]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][53] ([i915#129]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][55] ([i915#129]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl4/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][57] ([i915#54]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][61] ([i915#54]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][63] ([i915#61]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_flip@flip-vs-panning.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl7/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl3/igt@kms_flip@flip-vs-panning.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl6/igt@kms_flip@flip-vs-panning.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-tglb:         [TIMEOUT][69] ([fdo#112271] / [i915#561]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb6/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb7/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
    - shard-glk:          [TIMEOUT][71] ([fdo#112271]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk9/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk3/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][77] ([i915#668]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][81] ([i915#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk2/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk3/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][85] ([i915#31]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_setmode@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl1/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-idle-check-all-vcs0:
    - shard-glk:          [FAIL][87] -> [PASS][88] +7 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@busy-idle-check-all-vcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk1/igt@perf_pmu@busy-idle-check-all-vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-glk:          [TIMEOUT][89] ([fdo#111561] / [fdo#112271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@cpu-hotplug.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-glk1/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][91] ([fdo#109276]) -> [PASS][92] +19 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb3/igt@prime_busy@hang-bsd2.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-iclb4/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-apl:          [DMESG-WARN][93] ([i915#180]) -> [TIMEOUT][94] ([fdo#112271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl1/igt@gem_softpin@noreloc-s3.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-apl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#694]) -> [FAIL][96] ([i915#818])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][97] ([i915#454]) -> [SKIP][98] ([i915#468])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@i915_pm_dc@dc6-psr.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          [INCOMPLETE][99] ([i915#82]) -> [SKIP][100] ([fdo#109271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-snb5/igt@i915_pm_rpm@pm-caching.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-snb4/igt@i915_pm_rpm@pm-caching.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][101] ([fdo#111012]) -> [FAIL][102] ([i915#1176])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/shard-hsw5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111012]: https://bugs.freedesktop.org/show_bug.cgi?id=111012
  [fdo#111561]: https://bugs.freedesktop.org/show_bug.cgi?id=111561
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1176]: https://gitlab.freedesktop.org/drm/intel/issues/1176
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#447]: https://gitlab.freedesktop.org/drm/intel/issues/447
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4192
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4192: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4192/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
