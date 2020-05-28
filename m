Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 23:34:04 -0000
Message-ID: <159070884456.685.7791555596609597427@emeril.freedesktop.org>
References: <20200528203136.1196569-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200528203136.1196569-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fbalancer=3A_Randomise_bonded_submission_=28rev2=29?=
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

Series: i915/gem_exec_balancer: Randomise bonded submission (rev2)
URL   : https://patchwork.freedesktop.org/series/77701/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8549_full -> IGTPW_4621_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4621_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4621_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4621_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_balancer@bonded-dual} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl1/igt@gem_exec_balancer@bonded-dual.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-tglb3/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_basic@basic:
    - shard-glk:          NOTRUN -> [TIMEOUT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk8/igt@gem_exec_basic@basic.html

  * igt@prime_mmap@test_aperture_limit:
    - shard-glk:          [PASS][4] -> [TIMEOUT][5] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-glk2/igt@prime_mmap@test_aperture_limit.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk8/igt@prime_mmap@test_aperture_limit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@prime_vgem@wait}:
    - shard-glk:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk8/igt@prime_vgem@wait.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8549_full and IGTPW_4621_full:

### New IGT tests (1) ###

  * igt@gem_exec_balancer@bonded-dual:
    - Statuses : 2 fail(s) 3 pass(s) 2 skip(s)
    - Exec time: [0.0, 22.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_4621_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#1528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-tglb5/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-tglb8/igt@gem_ctx_persistence@legacy-engines-mixed-process@bsd2.html

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@gem_eio@in-flight-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl2/igt@gem_softpin@noreloc-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][13] -> [DMESG-WARN][14] ([i915#1436] / [i915#716])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@kms_color@pipe-b-degamma:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#71])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl2/igt@kms_color@pipe-b-degamma.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl7/igt@kms_color@pipe-b-degamma.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#71])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl1/igt@kms_color@pipe-b-degamma.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl4/igt@kms_color@pipe-b-degamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][21] -> [INCOMPLETE][22] ([i915#61])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl8/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#699] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#53] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#53] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1559] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl4/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl7/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-iclb3/igt@kms_psr@psr2_cursor_blt.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-apl:          [TIMEOUT][37] ([i915#1635]) -> [PASS][38] +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl6/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl2/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][39] ([i915#1904]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][41] ([i915#1899]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [FAIL][43] ([fdo#103375]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl2/igt@i915_pm_rpm@system-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][45] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][47] ([i915#1119] / [i915#95]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [FAIL][49] ([fdo#108145] / [i915#71] / [i915#95]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl6/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [FAIL][51] ([fdo#108145] / [i915#71] / [i915#93] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl6/igt@kms_color@pipe-a-legacy-gamma.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl7/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][53] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][55] ([i915#54]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * {igt@kms_flip@flip-vs-suspend-interruptible@c-dp1}:
    - shard-apl:          [DMESG-WARN][61] ([i915#180]) -> [PASS][62] +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][63] ([i915#49]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][67] ([i915#155]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][69] ([i915#1911]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-tglb5/igt@kms_psr2_su@frontbuffer.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-tglb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][71] ([fdo#109441]) -> [PASS][72] +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@perf@i915-ref-count:
    - shard-hsw:          [SKIP][73] ([fdo#109271]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-hsw1/igt@perf@i915-ref-count.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-hsw4/igt@perf@i915-ref-count.html
    - shard-iclb:         [SKIP][75] ([i915#405]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-iclb1/igt@perf@i915-ref-count.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-iclb5/igt@perf@i915-ref-count.html
    - shard-kbl:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl6/igt@perf@i915-ref-count.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl3/igt@perf@i915-ref-count.html
    - shard-apl:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl7/igt@perf@i915-ref-count.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl2/igt@perf@i915-ref-count.html
    - shard-glk:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-glk9/igt@perf@i915-ref-count.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk1/igt@perf@i915-ref-count.html
    - shard-tglb:         [SKIP][83] ([i915#405]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-tglb3/igt@perf@i915-ref-count.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-tglb8/igt@perf@i915-ref-count.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][85] ([i915#1319] / [i915#1635]) -> [FAIL][86] ([fdo#110321] / [fdo#110336])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@kms_content_protection@atomic-dpms.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][87] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][88] ([i915#1319] / [i915#1635])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl7/igt@kms_content_protection@legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][89] ([i915#1319] / [i915#1635]) -> [TIMEOUT][90] ([i915#1319])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl4/igt@kms_content_protection@srm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][91] ([i915#357]) -> [FAIL][92] ([i915#357] / [i915#93] / [i915#95])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl7/igt@kms_content_protection@uevent.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][93] ([i915#357]) -> [FAIL][94] ([i915#357] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl1/igt@kms_content_protection@uevent.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-WARN][95] ([i915#1926]) -> [DMESG-FAIL][96] ([i915#1925]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][97] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][98] ([fdo#108145] / [i915#265])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][99] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][100] ([fdo#108145] / [i915#265]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [FAIL][101] ([fdo#108145] / [i915#265]) -> [FAIL][102] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8549/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#53]: https://gitlab.freedesktop.org/drm/intel/issues/53
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5682 -> IGTPW_4621
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8549: e50e9c6bf4efd00b02d91ff470993bbd0db94f67 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4621: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/index.html
  IGT_5682: e5371a99a877be134c6ad5361a5f03843a66f775 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4621/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
