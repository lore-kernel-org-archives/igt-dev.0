Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Mar 2020 14:15:23 -0000
Message-ID: <158531852377.17236.686026415239492942@emeril.freedesktop.org>
References: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
In-Reply-To: <20200327002301.16434-1-swathi.dhanavanthri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliOiBz?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh_with_kernel_=28rev6=29?=
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
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib: sync i915_pciids.h with kernel (rev6)
URL   : https://patchwork.freedesktop.org/series/50957/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8197_full -> IGTPW_4361_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html

New tests
---------

  New tests have been introduced between CI_DRM_8197_full and IGTPW_4361_full:

### New IGT tests (3) ###

  * igt@gem_ctx_isolation@clean:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_isolation@dirty-create:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_ctx_shared@exec-shared-gtt:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_4361_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2] ([i915#1492])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb4/igt@gem_ctx_persistence@close-replace-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb2/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([fdo#109276] / [i915#677]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([i915#677])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb3/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb2/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +19 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb1/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb7/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#112146]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@i915_selftest@live@requests:
    - shard-iclb:         [PASS][11] -> [INCOMPLETE][12] ([fdo#109644] / [fdo#110464])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb1/igt@i915_selftest@live@requests.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb8/igt@i915_selftest@live@requests.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#52] / [i915#54]) +3 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#52] / [i915#54] / [i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#79])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-glk4/igt@kms_flip@flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-glk2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180] / [i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([fdo#108145] / [i915#93] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [PASS][27] -> [FAIL][28] ([fdo#108145] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#93] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#31])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl6/igt@kms_setmode@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl6/igt@kms_setmode@basic.html

  * igt@kms_universal_plane@universal-plane-pipe-c-functional:
    - shard-kbl:          [PASS][37] -> [FAIL][38] ([i915#331])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl6/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
    - shard-apl:          [PASS][39] -> [FAIL][40] ([i915#331])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl7/igt@kms_universal_plane@universal-plane-pipe-c-functional.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl4/igt@kms_universal_plane@universal-plane-pipe-c-functional.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@init-busy-vcs1:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#112080]) +8 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb1/igt@perf_pmu@init-busy-vcs1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb5/igt@perf_pmu@init-busy-vcs1.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1492]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-tglb8/igt@gem_ctx_persistence@close-replace-race.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][47] ([fdo#112080]) -> [PASS][48] +11 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][49] ([fdo#109276] / [i915#677]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@out-order-bsd2:
    - shard-iclb:         [SKIP][51] ([fdo#109276]) -> [PASS][52] +12 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb5/igt@gem_exec_schedule@out-order-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@gem_exec_schedule@out-order-bsd2.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [SKIP][53] ([i915#677]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][55] ([fdo#112146]) -> [PASS][56] +5 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-iclb:         [SKIP][57] ([i915#1316]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb6/igt@i915_pm_rpm@gem-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb4/igt@i915_pm_rpm@gem-idle.html
    - shard-glk:          [SKIP][59] ([fdo#109271]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-glk1/igt@i915_pm_rpm@gem-idle.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-glk3/igt@i915_pm_rpm@gem-idle.html
    - shard-tglb:         [SKIP][61] ([i915#1316]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-tglb5/igt@i915_pm_rpm@gem-idle.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-tglb8/igt@i915_pm_rpm@gem-idle.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-hsw6/igt@i915_pm_rpm@system-suspend-execbuf.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-hsw2/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@requests:
    - shard-tglb:         [INCOMPLETE][65] ([i915#1531]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-tglb7/igt@i915_selftest@live@requests.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-tglb8/igt@i915_selftest@live@requests.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled:
    - shard-glk:          [FAIL][67] ([i915#52] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-xtiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [FAIL][69] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [FAIL][71] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +7 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [FAIL][77] ([i915#93] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [FAIL][79] ([i915#95]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [FAIL][81] ([i915#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-glk8/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Warnings ####

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-hsw:          [DMESG-WARN][85] ([fdo#111870]) -> [DMESG-WARN][86] ([fdo#110789] / [fdo#111870])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-hsw5/igt@gem_userptr_blits@dmabuf-sync.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-hsw4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt:
    - shard-hsw:          [DMESG-WARN][87] ([fdo#110789] / [i915#478]) -> [DMESG-WARN][88] ([i915#478])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-hsw8/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-hsw5/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@gtt.html

  * igt@gem_userptr_blits@sync-unmap-after-close:
    - shard-hsw:          [DMESG-WARN][89] ([fdo#110789] / [fdo#111870]) -> [DMESG-WARN][90] ([fdo#111870])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-hsw8/igt@gem_userptr_blits@sync-unmap-after-close.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-hsw2/igt@gem_userptr_blits@sync-unmap-after-close.html
    - shard-snb:          [DMESG-WARN][91] ([fdo#110789] / [fdo#111870] / [i915#478]) -> [DMESG-WARN][92] ([fdo#111870] / [i915#478])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-snb5/igt@gem_userptr_blits@sync-unmap-after-close.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-snb1/igt@gem_userptr_blits@sync-unmap-after-close.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][93] ([i915#454]) -> [FAIL][94] ([i915#454] / [i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         [SKIP][95] ([i915#468]) -> [FAIL][96] ([i915#454])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-tglb6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-snb:          [INCOMPLETE][97] ([i915#82]) -> [SKIP][98] ([fdo#109271])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-snb1/igt@i915_pm_rpm@system-suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-snb1/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][99] ([i915#180]) -> [FAIL][100] ([fdo#103375]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb:
    - shard-kbl:          [FAIL][101] ([fdo#108145]) -> [FAIL][102] ([fdo#108145] / [i915#93] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb.html
    - shard-apl:          [FAIL][103] ([fdo#108145]) -> [FAIL][104] ([fdo#108145] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8197/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109644]: https://bugs.freedesktop.org/show_bug.cgi?id=109644
  [fdo#110464]: https://bugs.freedesktop.org/show_bug.cgi?id=110464
  [fdo#110789]: https://bugs.freedesktop.org/show_bug.cgi?id=110789
  [fdo#111870]: https://bugs.freedesktop.org/show_bug.cgi?id=111870
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1492]: https://gitlab.freedesktop.org/drm/intel/issues/1492
  [i915#1531]: https://gitlab.freedesktop.org/drm/intel/issues/1531
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#331]: https://gitlab.freedesktop.org/drm/intel/issues/331
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#478]: https://gitlab.freedesktop.org/drm/intel/issues/478
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5539 -> IGTPW_4361
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8197: 198bab1da198b9d6d5c36d52704dd4abab6e81a8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4361: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html
  IGT_5539: e7aae12e37771a8b7796ba252574eb832a5839c3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4361/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
