Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 22 Feb 2020 19:09:40 -0000
Message-ID: <158239858017.32578.7920386972839258377@emeril.freedesktop.org>
References: <20200220133416.1194071-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200220133416.1194071-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHMv?=
 =?utf-8?q?i915-perf=3A_workaround_overzelous_compiler_warnings_=28rev2=29?=
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

Series: tools/i915-perf: workaround overzelous compiler warnings (rev2)
URL   : https://patchwork.freedesktop.org/series/73709/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7973_full -> IGTPW_4196_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/index.html

Known issues
------------

  Here are the changes found in IGTPW_4196_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_caching@reads:
    - shard-hsw:          [PASS][1] -> [FAIL][2] ([i915#694])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw7/igt@gem_caching@reads.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw2/igt@gem_caching@reads.html

  * igt@gem_create@create-clear:
    - shard-hsw:          [PASS][3] -> [TIMEOUT][4] ([fdo#112271])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw2/igt@gem_create@create-clear.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw5/igt@gem_create@create-clear.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#110841])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_exec_schedule@pi-distinct-iova-render:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#859])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@gem_exec_schedule@pi-distinct-iova-render.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk9/igt@gem_exec_schedule@pi-distinct-iova-render.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276]) +15 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb6/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preempt-self-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112146]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb3/igt@gem_exec_schedule@preempt-self-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb1/igt@gem_exec_schedule@preempt-self-bsd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#454])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180]) +9 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#72])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#34])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#407])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk8/igt@kms_flip@modeset-vs-vblank-race.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk8/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#668]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#173])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb5/igt@kms_psr@no_drrs.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@perf@disabled-read-error:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([i915#645])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@perf@disabled-read-error.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb8/igt@perf@disabled-read-error.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][33] -> [TIMEOUT][34] ([fdo#112271] / [i915#1085])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@perf@gen12-mi-rpc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-tglb5/igt@perf@gen12-mi-rpc.html

  * igt@perf@oa-exponents:
    - shard-tglb:         [PASS][35] -> [INCOMPLETE][36] ([i915#807])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@perf@oa-exponents.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-tglb6/igt@perf@oa-exponents.html

  * igt@perf_pmu@busy-accuracy-2-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +13 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@perf_pmu@busy-accuracy-2-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb3/igt@perf_pmu@busy-accuracy-2-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#831])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [SKIP][41] ([fdo#112080]) -> [PASS][42] +7 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb6/igt@gem_busy@busy-vcs1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb2/igt@gem_busy@busy-vcs1.html

  * {igt@gem_ctx_persistence@close-replace-race}:
    - shard-kbl:          [INCOMPLETE][43] ([fdo#103665]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [FAIL][45] ([i915#1277]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_balancer@hang.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb2/igt@gem_exec_balancer@hang.html
    - shard-tglb:         [FAIL][47] ([i915#1277]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb8/igt@gem_exec_balancer@hang.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-tglb3/igt@gem_exec_balancer@hang.html

  * {igt@gem_exec_schedule@implicit-both-bsd1}:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb7/igt@gem_exec_schedule@implicit-both-bsd1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb4/igt@gem_exec_schedule@implicit-both-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][51] ([i915#677]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb6/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][53] ([fdo#112146]) -> [PASS][54] +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][55] ([i915#644]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk3/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-kbl:          [FAIL][59] ([i915#644]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl3/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy_redux@normal:
    - shard-hsw:          [FAIL][61] ([i915#694]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@gem_render_copy_redux@normal.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw7/igt@gem_render_copy_redux@normal.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-glk:          [FAIL][63] ([fdo#103375]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk9/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [FAIL][65] ([i915#129]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
    - shard-apl:          [FAIL][67] ([i915#129]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl8/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-apl:          [FAIL][69] ([i915#54]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
    - shard-glk:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
    - shard-kbl:          [FAIL][73] ([i915#54]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-hsw:          [INCOMPLETE][75] ([i915#61]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw5/igt@kms_flip@2x-flip-vs-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-panning:
    - shard-kbl:          [DMESG-WARN][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl4/igt@kms_flip@flip-vs-panning.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl2/igt@kms_flip@flip-vs-panning.html
    - shard-apl:          [DMESG-WARN][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl3/igt@kms_flip@flip-vs-panning.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl1/igt@kms_flip@flip-vs-panning.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][81] ([i915#49]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl3/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-tglb:         [SKIP][85] ([i915#668]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][87] ([i915#180]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][89] ([fdo#109441]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-glk:          [TIMEOUT][91] ([fdo#112271]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk9/igt@kms_rotation_crc@primary-rotation-270.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][93] ([i915#31]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-apl6/igt@kms_setmode@basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-apl4/igt@kms_setmode@basic.html

  * igt@perf_pmu@busy-idle-check-all-vcs0:
    - shard-glk:          [FAIL][95] -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@busy-idle-check-all-vcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk1/igt@perf_pmu@busy-idle-check-all-vcs0.html

  * igt@perf_pmu@cpu-hotplug:
    - shard-glk:          [TIMEOUT][97] ([fdo#111561] / [fdo#112271]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-glk6/igt@perf_pmu@cpu-hotplug.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-glk9/igt@perf_pmu@cpu-hotplug.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [SKIP][99] ([fdo#109276]) -> [PASS][100] +23 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-iclb8/igt@prime_vgem@fence-wait-bsd2.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-iclb4/igt@prime_vgem@fence-wait-bsd2.html

  
#### Warnings ####

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][101] ([i915#694]) -> [FAIL][102] ([i915#818])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-hsw6/igt@gem_tiled_blits@interruptible.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-hsw7/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-snb:          [INCOMPLETE][103] ([i915#82]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7973/shard-snb5/igt@i915_pm_rpm@pm-caching.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/shard-snb1/igt@i915_pm_rpm@pm-caching.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111561]: https://bugs.freedesktop.org/show_bug.cgi?id=111561
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1277]: https://gitlab.freedesktop.org/drm/intel/issues/1277
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1291]: https://gitlab.freedesktop.org/drm/intel/issues/1291
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#34]: https://gitlab.freedesktop.org/drm/intel/issues/34
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#645]: https://gitlab.freedesktop.org/drm/intel/issues/645
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#807]: https://gitlab.freedesktop.org/drm/intel/issues/807
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#859]: https://gitlab.freedesktop.org/drm/intel/issues/859


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5453 -> IGTPW_4196
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7973: 07350317e4b2be54b1de7f1e73f77875df5e43f3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4196: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/index.html
  IGT_5453: cae9a5881ed2c5be2c2518a255740b612a927f9a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4196/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
