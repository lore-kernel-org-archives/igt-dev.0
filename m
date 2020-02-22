Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 20:19:55 -0000
Message-ID: <158240279593.32575.10488581814881170467@emeril.freedesktop.org>
References: <20200220153203.29571-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200220153203.29571-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2k5?=
 =?utf-8?q?15=3A_Restrict_mmap_types_to_GTT_if_no_MMAP=5FOFFSET_support?=
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
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/i915: Restrict mmap types to GTT if no MMAP_OFFSET support
URL   : https://patchwork.freedesktop.org/series/73719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973_full -> IGTPW_4198_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html

Known issues
------------

  Here are the changes found in IGTPW_4198_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reuse@baggage:
    - shard-apl:          [PASS][1] -> [TIMEOUT][2] ([fdo#112271])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@gem_exec_reuse@baggage.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl7/igt@gem_exec_reuse@baggage.html

  * igt@gem_exec_schedule@promotion-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276]) +17 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@gem_exec_schedule@promotion-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb3/igt@gem_exec_schedule@promotion-bsd1.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_exec_schedule@wide-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_tiled_partial_pwrite_pread@writes:
    - shard-hsw:          [PASS][7] -> [FAIL][8] ([i915#817])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw1/igt@gem_tiled_partial_pwrite_pread@writes.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-hsw7/igt@gem_tiled_partial_pwrite_pread@writes.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#454])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#413])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@i915_pm_rps@reset.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +9 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#72])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-tglb:         [PASS][17] -> [TIMEOUT][18] ([fdo#112271] / [i915#561]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@kms_flip@flip-vs-panning-vs-hang.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-tglb7/igt@kms_flip@flip-vs-panning-vs-hang.html
    - shard-glk:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk3/igt@kms_flip@flip-vs-panning-vs-hang.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk2/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [PASS][21] -> [SKIP][22] ([i915#668]) +9 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#173])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb5/igt@kms_psr@no_drrs.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][29] -> [TIMEOUT][30] ([fdo#112271] / [i915#1085])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-tglb8/igt@perf@gen12-mi-rpc.html

  * igt@perf@short-reads:
    - shard-kbl:          [PASS][31] -> [TIMEOUT][32] ([fdo#112271] / [i915#51])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@perf@short-reads.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl1/igt@perf@short-reads.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#112080]) +11 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@perf_pmu@busy-vcs1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb6/igt@perf_pmu@busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][35] ([fdo#112080]) -> [PASS][36] +12 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-kbl:          [INCOMPLETE][37] ([fdo#103665]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][39] ([i915#1277]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_balancer@hang.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb1/igt@gem_exec_balancer@hang.html
    - shard-tglb:         [FAIL][41] ([i915#1277]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@gem_exec_balancer@hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-tglb1/igt@gem_exec_balancer@hang.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd1}:
    - shard-iclb:         [SKIP][43] ([fdo#109276] / [i915#677]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb1/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][45] ([i915#677]) -> [PASS][46] +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb3/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#112146]) -> [PASS][48] +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@gem_exec_schedule@preempt-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb3/igt@gem_exec_schedule@preempt-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276]) -> [PASS][50] +16 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][51] ([i915#644]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][53] ([i915#644]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [FAIL][57] ([i915#694]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-hsw5/igt@gem_render_copy_redux@normal.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [FAIL][59] ([fdo#103375]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][61] ([i915#129]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][63] ([i915#129]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][65] ([i915#54]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][69] ([i915#54]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][71] ([i915#61]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_flip@flip-vs-panning.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl6/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][75] -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl3/igt@kms_flip@flip-vs-panning.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl3/igt@kms_flip@flip-vs-panning.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][77] ([i915#49]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][79] ([i915#180]) -> [PASS][80] +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][81] ([i915#668]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][85] ([fdo#109642] / [fdo#111068]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][87] ([fdo#109441]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb5/igt@kms_psr@psr2_primary_mmap_gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-glk:          [TIMEOUT][89] ([fdo#112271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@kms_rotation_crc@primary-rotation-90.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk4/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@perf_pmu@busy-idle-check-all-vcs0:
    - shard-glk:          [FAIL][91] -> [PASS][92] +7 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@busy-idle-check-all-vcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk3/igt@perf_pmu@busy-idle-check-all-vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-glk:          [TIMEOUT][93] ([fdo#111561] / [fdo#112271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@cpu-hotplug.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-glk3/igt@perf_pmu@cpu-hotplug.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#694]) -> [FAIL][96] ([i915#818])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-hsw1/igt@gem_tiled_blits@interruptible.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [INCOMPLETE][97] ([fdo#103665]) -> [DMESG-WARN][98] ([i915#180])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_workarounds@suspend-resume-context.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-snb:          [SKIP][99] ([fdo#109271]) -> [INCOMPLETE][100] ([i915#82])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-snb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/shard-snb6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111561]: https://bugs.freedesktop.org/show_bug.cgi?id=111561
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#561]: https://gitlab.freedesktop.org/drm/intel/issues/561
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#817]: https://gitlab.freedesktop.org/drm/intel/issues/817
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4198
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4198: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4198/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
