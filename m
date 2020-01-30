Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jan 2020 03:33:24 -0000
Message-ID: <158035520477.21032.11903092414151946369@emeril.freedesktop.org>
References: <20200128152307.3477-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200128152307.3477-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev6=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev6)
URL   : https://patchwork.freedesktop.org/series/72334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7833_full -> IGTPW_4020_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/index.html

Known issues
------------

  Here are the changes found in IGTPW_4020_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@vecs0-s3:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl1/igt@gem_ctx_isolation@vecs0-s3.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl6/igt@gem_ctx_isolation@vecs0-s3.html

  * igt@gem_ctx_persistence@vcs1-mixed-process:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [fdo#112080]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_ctx_persistence@vcs1-mixed-process.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb5/igt@gem_ctx_persistence@vcs1-mixed-process.html

  * igt@gem_exec_reuse@single:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk9/igt@gem_exec_reuse@single.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-glk2/igt@gem_exec_reuse@single.html

  * igt@gem_exec_schedule@independent-bsd2:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@gem_exec_schedule@independent-bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb7/igt@gem_exec_schedule@independent-bsd2.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb1/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_store@cachelines-vcs1:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +9 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_store@cachelines-vcs1.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb7/igt@gem_exec_store@cachelines-vcs1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][13] -> [DMESG-WARN][14] ([i915#180]) +8 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl3/igt@gem_exec_suspend@basic-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#644])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#644])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([fdo#109100])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb7/igt@gem_softpin@noreloc-s3.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb6/igt@gem_softpin@noreloc-s3.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#818])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@gem_tiled_blits@interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw8/igt@gem_tiled_blits@interruptible.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#454])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#61])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#49])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#49])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([fdo#103665]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb5/igt@kms_psr@psr2_sprite_render.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [PASS][37] -> [FAIL][38] ([i915#831])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw4/igt@prime_mmap_coherency@ioctl-errors.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Possible fixes ####

  * igt@gem_caching@reads:
    - shard-hsw:          [FAIL][39] ([i915#694]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw5/igt@gem_caching@reads.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw2/igt@gem_caching@reads.html

  * {igt@gem_ctx_persistence@hostile}:
    - shard-iclb:         [FAIL][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_ctx_persistence@hostile.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb8/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@vcs0-queued:
    - shard-tglb:         [INCOMPLETE][43] ([i915#472]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb6/igt@gem_ctx_persistence@vcs0-queued.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-tglb6/igt@gem_ctx_persistence@vcs0-queued.html

  * igt@gem_ctx_persistence@vcs1-mixed:
    - shard-iclb:         [SKIP][45] ([fdo#109276] / [fdo#112080]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@gem_ctx_persistence@vcs1-mixed.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb2/igt@gem_ctx_persistence@vcs1-mixed.html

  * igt@gem_ctx_shared@exec-single-timeline-bsd:
    - shard-iclb:         [SKIP][47] ([fdo#110841]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@gem_ctx_shared@exec-single-timeline-bsd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb3/igt@gem_ctx_shared@exec-single-timeline-bsd.html

  * igt@gem_ctx_shared@q-independent-default:
    - shard-kbl:          [FAIL][49] -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl6/igt@gem_ctx_shared@q-independent-default.html

  * igt@gem_ctx_shared@q-promotion-vebox:
    - shard-kbl:          [FAIL][51] ([fdo#112118]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@gem_ctx_shared@q-promotion-vebox.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl7/igt@gem_ctx_shared@q-promotion-vebox.html

  * igt@gem_exec_schedule@pi-userfault-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb2/igt@gem_exec_schedule@pi-userfault-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb3/igt@gem_exec_schedule@pi-userfault-bsd.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb5/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw2/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw1/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][61] ([i915#54]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][63] ([IGT#5]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [FAIL][65] ([i915#79]) -> [PASS][66] +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang-interruptible:
    - shard-iclb:         [SKIP][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb7/igt@kms_flip@flip-vs-panning-vs-hang-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [DMESG-WARN][69] ([i915#180]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-glk8/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-apl:          [FAIL][73] ([i915#49]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-apl4/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-apl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [FAIL][75] ([i915#49]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-tglb:         [SKIP][77] ([i915#668]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][79] ([fdo#109642] / [fdo#111068]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb4/igt@kms_psr2_su@page_flip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-hsw8/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-hsw7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +5 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-a-wait-busy-hang:
    - shard-kbl:          [SKIP][87] ([fdo#109271]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@kms_vblank@pipe-a-wait-busy-hang.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl6/igt@kms_vblank@pipe-a-wait-busy-hang.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [TIMEOUT][89] ([fdo#112271] / [i915#472]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb6/igt@perf@gen12-mi-rpc.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-tglb3/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@busy-hang-vcs1:
    - shard-kbl:          [SKIP][91] ([fdo#109271] / [fdo#112080]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl6/igt@perf_pmu@busy-hang-vcs1.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl7/igt@perf_pmu@busy-hang-vcs1.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][93] ([fdo#112080]) -> [PASS][94] +11 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb1/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][95] ([fdo#109276]) -> [PASS][96] +23 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb8/igt@prime_busy@hang-bsd2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][97] ([IGT#28]) -> [SKIP][98] ([fdo#109276] / [fdo#112080]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb5/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_eio@kms:
    - shard-kbl:          [INCOMPLETE][99] ([CI#80] / [fdo#103665]) -> [TIMEOUT][100] ([fdo#112271])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-kbl4/igt@gem_eio@kms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-kbl2/igt@gem_eio@kms.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][101] ([i915#468]) -> [FAIL][102] ([i915#454])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][103] ([fdo#109349]) -> [DMESG-WARN][104] ([fdo#107724])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7833/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [IGT#5]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/5
  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#107724]: https://bugs.freedesktop.org/show_bug.cgi?id=107724
  [fdo#109100]: https://bugs.freedesktop.org/show_bug.cgi?id=109100
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110841]: https://bugs.freedesktop.org/show_bug.cgi?id=110841
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112118]: https://bugs.freedesktop.org/show_bug.cgi?id=112118
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#472]: https://gitlab.freedesktop.org/drm/intel/issues/472
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5394 -> IGTPW_4020
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7833: 8210f0f999e2d396a8611e0cabc2f6c6a52468de @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4020: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/index.html
  IGT_5394: 991fd07bcd7add7a5beca2c95b72a994e62fbb75 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4020/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
