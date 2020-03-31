Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Mar 2020 03:38:20 -0000
Message-ID: <158562590055.5566.5609965991891377270@emeril.freedesktop.org>
References: <20200330124845.43086-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200330124845.43086-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9w?=
 =?utf-8?q?erf=3A_respect_gen11_restriction_in_disable_subslices?=
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

Series: test/perf: respect gen11 restriction in disable subslices
URL   : https://patchwork.freedesktop.org/series/75239/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8213_full -> IGTPW_4374_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4374_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4374_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4374_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-glk:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk3/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  
#### Warnings ####

  * igt@i915_selftest@live@requests:
    - shard-iclb:         [INCOMPLETE][3] ([i915#1505]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb6/igt@i915_selftest@live@requests.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb3/igt@i915_selftest@live@requests.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@perf@global-sseu-config}:
    - shard-iclb:         [FAIL][5] ([i915#1543]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@perf@global-sseu-config.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb5/igt@perf@global-sseu-config.html

  
Known issues
------------

  Here are the changes found in IGTPW_4374_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_busy@busy-vcs1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#112080]) +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@gem_busy@busy-vcs1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb3/igt@gem_busy@busy-vcs1.html

  * igt@gem_exec_schedule@implicit-write-read-bsd1:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([fdo#109276] / [i915#677])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb7/igt@gem_exec_schedule@implicit-write-read-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#677]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb4/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([fdo#109276]) +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb8/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_exec_schedule@preemptive-hang-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@gem_exec_schedule@preemptive-hang-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb2/igt@gem_exec_schedule@preemptive-hang-bsd.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl4/igt@gem_workarounds@suspend-resume.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#1316])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb2/igt@i915_pm_rpm@fences.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-tglb1/igt@i915_pm_rpm@fences.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#1316])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@i915_pm_rpm@fences.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb4/igt@i915_pm_rpm@fences.html
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw1/igt@i915_pm_rpm@fences.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-hsw6/igt@i915_pm_rpm@fences.html
    - shard-glk:          [PASS][25] -> [SKIP][26] ([fdo#109271])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk5/igt@i915_pm_rpm@fences.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk8/igt@i915_pm_rpm@fences.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl3/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1119] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl6/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#1119] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#72])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#52] / [i915#54]) +6 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#52] / [i915#54] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#1525])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#64])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-kbl:          [PASS][49] -> [DMESG-WARN][50] ([i915#1297])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl1/igt@kms_flip@plain-flip-ts-check-interruptible.html
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#1297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#699] / [i915#93] / [i915#95])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#49])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-apl:          [PASS][57] -> [FAIL][58] ([i915#49])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][59] -> [FAIL][60] ([i915#53] / [i915#93] / [i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][61] -> [FAIL][62] ([i915#53] / [i915#95])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][63] -> [FAIL][64] ([i915#93] / [i915#95])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl3/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
    - shard-apl:          [PASS][65] -> [FAIL][66] ([i915#95]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109441]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb3/igt@kms_psr@psr2_sprite_render.html

  * igt@perf@gen12-mi-rpc:
    - shard-tglb:         [PASS][69] -> [FAIL][70] ([i915#1085])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb1/igt@perf@gen12-mi-rpc.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-tglb7/igt@perf@gen12-mi-rpc.html

  * igt@perf_pmu@rc6:
    - shard-hsw:          [PASS][71] -> [INCOMPLETE][72] ([i915#61])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw1/igt@perf_pmu@rc6.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-hsw4/igt@perf_pmu@rc6.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@smoke:
    - shard-iclb:         [SKIP][73] ([fdo#110854]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_balancer@smoke.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb2/igt@gem_exec_balancer@smoke.html

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [SKIP][75] ([fdo#112080]) -> [PASS][76] +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb7/igt@gem_exec_parallel@vcs1-fds.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb4/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][77] ([fdo#109276] / [i915#677]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][79] ([i915#677]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][81] ([fdo#112146]) -> [PASS][82] +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb8/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][83] ([i915#180]) -> [PASS][84] +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][85] ([i915#1390]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-tglb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][87] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk8/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][89] ([i915#82]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [INCOMPLETE][91] ([i915#1390] / [i915#140]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@i915_module_load@reload-with-fault-injection.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][93] ([i915#61]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-hsw6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][97] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][98] +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][99] ([i915#54] / [i915#95]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][101] ([fdo#109349]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-ytiled:
    - shard-glk:          [FAIL][103] ([i915#52] / [i915#54]) -> [PASS][104] +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-blt-ytiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-glk:          [FAIL][105] ([i915#177] / [i915#52] / [i915#54]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][107] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][109] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][111] ([i915#1297]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_flip@flip-vs-fences.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl3/igt@kms_flip@flip-vs-fences.html
    - shard-apl:          [DMESG-WARN][113] ([i915#1297]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@kms_flip@flip-vs-fences.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl8/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][115] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][117] ([i915#95]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][119] ([i915#93] / [i915#95]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl6/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][121] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][123] ([fdo#108145] / [i915#95]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][125] ([i915#173]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@kms_psr@no_drrs.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb5/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-snb:          [SKIP][129] ([fdo#109271]) -> [PASS][130] +4 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@kms_vblank@pipe-a-query-forked-hang.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-snb2/igt@kms_vblank@pipe-a-query-forked-hang.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][131] ([i915#1542]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@perf@polling-parameterized.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb5/igt@perf@polling-parameterized.html
    - shard-hsw:          [FAIL][133] ([i915#1542]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw6/igt@perf@polling-parameterized.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-hsw2/igt@perf@polling-parameterized.html
    - shard-tglb:         [FAIL][135] ([i915#1542]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb5/igt@perf@polling-parameterized.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-tglb5/igt@perf@polling-parameterized.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][137] ([fdo#109276]) -> [PASS][138] +20 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@prime_busy@hang-bsd2.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-iclb1/igt@prime_busy@hang-bsd2.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][139] ([i915#180]) -> [DMESG-WARN][140] ([i915#180] / [i915#93] / [i915#95])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][141] ([i915#1390] / [i915#879]) -> [INCOMPLETE][142] ([i915#1423] / [i915#879])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [INCOMPLETE][143] ([i915#1390]) -> [INCOMPLETE][144] ([i915#1423])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@i915_module_load@reload-with-fault-injection.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [INCOMPLETE][145] ([i915#82]) -> [SKIP][146] ([fdo#109271])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb2/igt@i915_pm_dc@dc5-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-snb4/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@cursor:
    - shard-snb:          [SKIP][147] ([fdo#109271]) -> [INCOMPLETE][148] ([i915#82])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb5/igt@i915_pm_rpm@cursor.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-snb6/igt@i915_pm_rpm@cursor.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][149] ([i915#155]) -> [DMESG-WARN][150] ([i915#180])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][151] ([fdo#108145] / [i915#95]) -> [FAIL][152] ([fdo#108145])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][153] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][154] ([fdo#108145])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][155] ([i915#1423] / [i915#1485] / [i915#92]) -> [FAIL][156] ([i915#1423] / [i915#92])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          [FAIL][157] ([i915#1423] / [i915#1485]) -> [FAIL][158] ([i915#1423])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110854]: https://bugs.freedesktop.org/show_bug.cgi?id=110854
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1085]: https://gitlab.freedesktop.org/drm/intel/issues/1085
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1505]: https://gitlab.freedesktop.org/drm/intel/issues/1505
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1543]: https://gitlab.freedesktop.org/drm/intel/issues/1543
  [i915#155]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4374/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
