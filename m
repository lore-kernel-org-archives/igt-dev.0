Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 14 Feb 2020 01:39:30 -0000
Message-ID: <158164437098.9929.10218122619440487140@emeril.freedesktop.org>
References: <20200211192253.1120964-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200211192253.1120964-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fpersistence=3A_Race_context_closure_with_replace-eng?=
 =?utf-8?q?ines?=
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

Series: i915/gem_ctx_persistence: Race context closure with replace-engines
URL   : https://patchwork.freedesktop.org/series/73336/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7918_full -> IGTPW_4133_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4133_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4133_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4133_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_persistence@close-replace-race} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb1/igt@gem_ctx_persistence@close-replace-race.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@kms_prime@basic-crc:
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb8/igt@kms_prime@basic-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb5/igt@kms_prime@basic-crc.html

  
New tests
---------

  New tests have been introduced between CI_DRM_7918_full and IGTPW_4133_full:

### New IGT tests (1) ###

  * igt@gem_ctx_persistence@close-replace-race:
    - Statuses : 5 incomplete(s) 2 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4133_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112080]) +7 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb6/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@wide-bsd:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112146]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb5/igt@gem_exec_schedule@wide-bsd.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb4/igt@gem_exec_schedule@wide-bsd.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#644])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-glk2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_vm_create@isolation:
    - shard-apl:          [PASS][11] -> [FAIL][12] ([i915#314])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl8/igt@gem_vm_create@isolation.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl4/igt@gem_vm_create@isolation.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-glk7/igt@gen9_exec_parse@allowed-all.html
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#716])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl4/igt@gen9_exec_parse@allowed-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live_gtt:
    - shard-apl:          [PASS][19] -> [TIMEOUT][20] ([fdo#112271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl3/igt@i915_selftest@live_gtt.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl8/igt@i915_selftest@live_gtt.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([fdo#111703]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#70])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb1/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb5/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-varying-size:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl1/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl2/igt@kms_cursor_legacy@cursora-vs-flipa-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled:
    - shard-tglb:         [PASS][27] -> [DMESG-FAIL][28] ([i915#402]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-ytiled.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#61])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-tglb:         [PASS][31] -> [FAIL][32] ([i915#699])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb3/igt@kms_flip_tiling@flip-changes-tiling.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb5/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#668]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#180])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +10 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb4/igt@prime_busy@hang-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb3/igt@prime_busy@hang-bsd2.html

  
#### Possible fixes ####

  * igt@gem_caching@writes:
    - shard-hsw:          [FAIL][43] ([i915#694]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw5/igt@gem_caching@writes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw7/igt@gem_caching@writes.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +5 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb6/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [SKIP][47] ([fdo#109276]) -> [PASS][48] +24 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][49] ([i915#180]) -> [PASS][50] +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl6/igt@gem_exec_suspend@basic-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [FAIL][51] ([i915#413]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb6/igt@i915_pm_rps@reset.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb5/igt@i915_pm_rps@reset.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [DMESG-WARN][53] ([i915#180]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl2/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-a-ctm-negative:
    - shard-tglb:         [FAIL][55] ([i915#1149]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb3/igt@kms_color@pipe-a-ctm-negative.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb6/igt@kms_color@pipe-a-ctm-negative.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [FAIL][57] ([i915#168]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl4/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [FAIL][59] ([i915#168]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl8/igt@kms_color@pipe-c-ctm-max.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl7/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [FAIL][61] ([fdo#111703]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-tglb:         [DMESG-FAIL][63] ([i915#402]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled:
    - shard-tglb:         [FAIL][65] ([i915#559]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-untiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-tglb:         [FAIL][67] ([i915#488]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-snb:          [DMESG-WARN][69] ([i915#42]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb6/igt@kms_flip@flip-vs-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-snb:          [DMESG-WARN][71] ([i915#478]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb5/igt@kms_psr@psr2_cursor_render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw6/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw8/igt@kms_setmode@basic.html

  * igt@perf@rc6-disable:
    - shard-iclb:         [SKIP][77] ([i915#405]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb2/igt@perf@rc6-disable.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb7/igt@perf@rc6-disable.html
    - shard-hsw:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw5/igt@perf@rc6-disable.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw5/igt@perf@rc6-disable.html
    - shard-kbl:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl6/igt@perf@rc6-disable.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl7/igt@perf@rc6-disable.html
    - shard-apl:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-apl3/igt@perf@rc6-disable.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-apl7/igt@perf@rc6-disable.html
    - shard-tglb:         [SKIP][85] ([fdo#111719] / [i915#405]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb8/igt@perf@rc6-disable.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb2/igt@perf@rc6-disable.html
    - shard-glk:          [SKIP][87] ([fdo#109271]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-glk9/igt@perf@rc6-disable.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-glk2/igt@perf@rc6-disable.html

  * igt@perf_pmu@busy-vcs1:
    - shard-iclb:         [SKIP][89] ([fdo#112080]) -> [PASS][90] +12 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb5/igt@perf_pmu@busy-vcs1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb1/igt@perf_pmu@busy-vcs1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][91] ([i915#831]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw2/igt@prime_mmap_coherency@ioctl-errors.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw7/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@vcs1-nonpriv:
    - shard-iclb:         [FAIL][93] ([IGT#28]) -> [SKIP][94] ([fdo#112080])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-iclb1/igt@gem_ctx_isolation@vcs1-nonpriv.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-iclb3/igt@gem_ctx_isolation@vcs1-nonpriv.html

  * igt@gem_tiled_blits@interruptible:
    - shard-hsw:          [FAIL][95] ([i915#694]) -> [FAIL][96] ([i915#818])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw7/igt@gem_tiled_blits@interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw5/igt@gem_tiled_blits@interruptible.html

  * igt@gem_tiled_blits@normal:
    - shard-hsw:          [FAIL][97] ([i915#818]) -> [INCOMPLETE][98] ([i915#61])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-hsw5/igt@gem_tiled_blits@normal.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-hsw2/igt@gem_tiled_blits@normal.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][99] ([i915#468]) -> [FAIL][100] ([i915#454])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@universal-planes:
    - shard-snb:          [INCOMPLETE][101] ([i915#82]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb4/igt@i915_pm_rpm@universal-planes.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb2/igt@i915_pm_rpm@universal-planes.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][103] ([i915#56]) -> [DMESG-WARN][104] ([i915#180])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-kbl2/igt@i915_suspend@sysfs-reader.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@runner@aborted:
    - shard-snb:          ([FAIL][105], [FAIL][106], [FAIL][107], [FAIL][108], [FAIL][109], [FAIL][110], [FAIL][111], [FAIL][112]) ([fdo#111870] / [i915#1077] / [i915#698]) -> ([FAIL][113], [FAIL][114], [FAIL][115], [FAIL][116], [FAIL][117], [FAIL][118], [FAIL][119]) ([fdo#111870] / [i915#1077])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb4/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb5/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb4/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb5/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb4/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7918/shard-snb6/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb6/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb4/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb2/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb6/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb5/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/shard-snb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#28]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/28
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111703]: https://bugs.freedesktop.org/show_bug.cgi?id=111703
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1077]: https://gitlab.freedesktop.org/drm/intel/issues/1077
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#314]: https://gitlab.freedesktop.org/drm/intel/issues/314
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#488]: https://gitlab.freedesktop.org/drm/intel/issues/488
  [i915#559]: https://gitlab.freedesktop.org/drm/intel/issues/559
  [i915#56]: https://gitlab.freedesktop.org/drm/intel/issues/56
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
  [i915#698]: https://gitlab.freedesktop.org/drm/intel/issues/698
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#818]: https://gitlab.freedesktop.org/drm/intel/issues/818
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5435 -> IGTPW_4133
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7918: d9dbc4c91c2c141a9492c88255231ef6aae6fbd9 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4133: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/index.html
  IGT_5435: 2b6d4476dde53c363b8808ed9f0dd5547ac78641 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4133/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
