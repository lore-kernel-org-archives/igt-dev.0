Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 31 Mar 2020 10:07:35 -0000
Message-ID: <158564925591.5565.4076653200789912199@emeril.freedesktop.org>
References: <20200330110229.4755-1-mika.kahola@intel.com>
In-Reply-To: <20200330110229.4755-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fconcurrent=3A_Move_bandwidth_calculation_to_igt=5Ffixture?=
 =?utf-8?q?_=28rev4=29?=
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
To: "Kahola, Mika" <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_concurrent: Move bandwidth calculation to igt_fixture (rev4)
URL   : https://patchwork.freedesktop.org/series/75174/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8213_full -> IGTPW_4372_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/index.html

Known issues
------------

  Here are the changes found in IGTPW_4372_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_schedule@implicit-read-write-bsd1:
    - shard-iclb:         [PASS][1] -> [SKIP][2] ([fdo#109276] / [i915#677]) +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@gem_exec_schedule@implicit-read-write-bsd1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb5/igt@gem_exec_schedule@implicit-read-write-bsd1.html

  * igt@gem_exec_schedule@pi-distinct-iova-bsd:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#677]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@pi-distinct-iova-bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@gem_exec_schedule@pi-distinct-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][5] -> [SKIP][6] ([fdo#112146]) +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@gem_exec_schedule@preempt-queue-bsd1:
    - shard-iclb:         [PASS][7] -> [SKIP][8] ([fdo#109276]) +12 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@gem_exec_schedule@preempt-queue-bsd1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb3/igt@gem_exec_schedule@preempt-queue-bsd1.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl4/igt@gem_workarounds@suspend-resume-context.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw2/igt@i915_pm_rpm@gem-pread.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-hsw1/igt@i915_pm_rpm@gem-pread.html
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1316]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb6/igt@i915_pm_rpm@gem-pread.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-tglb5/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([i915#1316]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@i915_pm_rpm@system-suspend-devices.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_selftest@live@execlists:
    - shard-apl:          [PASS][19] -> [INCOMPLETE][20] ([i915#1430] / [i915#656])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@i915_selftest@live@execlists.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl2/igt@i915_selftest@live@execlists.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#52] / [i915#54]) +5 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-y.html
    - shard-kbl:          [PASS][31] -> [FAIL][32] ([i915#699] / [i915#93] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl7/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-256:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#1559])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk4/igt@kms_plane_cursor@pipe-a-viewport-size-256.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk5/igt@kms_plane_cursor@pipe-a-viewport-size-256.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb1/igt@kms_psr@psr2_sprite_render.html

  * igt@perf_pmu@busy-check-all-vcs1:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#112080]) +8 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@perf_pmu@busy-check-all-vcs1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb7/igt@perf_pmu@busy-check-all-vcs1.html

  
#### Possible fixes ####

  * igt@gem_exec_schedule@implicit-read-write-bsd2:
    - shard-iclb:         [SKIP][39] ([fdo#109276] / [i915#677]) -> [PASS][40] +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb8/igt@gem_exec_schedule@implicit-read-write-bsd2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@gem_exec_schedule@implicit-read-write-bsd2.html

  * igt@gem_exec_schedule@pi-common-bsd:
    - shard-iclb:         [SKIP][41] ([i915#677]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb4/igt@gem_exec_schedule@pi-common-bsd.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb8/igt@gem_exec_schedule@pi-common-bsd.html

  * igt@gem_exec_schedule@preempt-contexts-bsd2:
    - shard-iclb:         [SKIP][43] ([fdo#109276]) -> [PASS][44] +21 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@gem_exec_schedule@preempt-contexts-bsd2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb4/igt@gem_exec_schedule@preempt-contexts-bsd2.html

  * igt@gem_exec_schedule@reorder-wide-bsd:
    - shard-iclb:         [SKIP][45] ([fdo#112146]) -> [PASS][46] +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@gem_exec_schedule@reorder-wide-bsd.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb5/igt@gem_exec_schedule@reorder-wide-bsd.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][47] ([i915#180]) -> [PASS][48] +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl3/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_hangman@error-state-capture-vcs1:
    - shard-iclb:         [SKIP][49] ([fdo#112080]) -> [PASS][50] +12 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb7/igt@i915_hangman@error-state-capture-vcs1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@i915_hangman@error-state-capture-vcs1.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [INCOMPLETE][51] ([i915#1390]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb6/igt@i915_module_load@reload-with-fault-injection.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-tglb5/igt@i915_module_load@reload-with-fault-injection.html
    - shard-glk:          [INCOMPLETE][53] ([i915#1390] / [i915#58] / [k.org#198133]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk3/igt@i915_module_load@reload-with-fault-injection.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-snb:          [INCOMPLETE][55] ([i915#82]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@i915_module_load@reload-with-fault-injection.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-iclb:         [INCOMPLETE][57] ([i915#1390] / [i915#140]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb3/igt@i915_module_load@reload-with-fault-injection.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
    - shard-hsw:          [INCOMPLETE][59] ([i915#61]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw2/igt@i915_module_load@reload-with-fault-injection.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-hsw1/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_selftest@live@requests:
    - shard-iclb:         [INCOMPLETE][61] ([i915#1505]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb6/igt@i915_selftest@live@requests.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb7/igt@i915_selftest@live@requests.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64] +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@i915_suspend@fence-restore-tiled2untiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_concurrent@pipe-b:
    - shard-hsw:          [FAIL][65] ([i915#1539]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw2/igt@kms_concurrent@pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-hsw7/igt@kms_concurrent@pipe-b.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [FAIL][67] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [FAIL][71] ([i915#52] / [i915#54]) -> [PASS][72] +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-glk5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [FAIL][73] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [FAIL][75] ([i915#52] / [i915#54] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@flip-vs-fences:
    - shard-kbl:          [DMESG-WARN][77] ([i915#1297]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl7/igt@kms_flip@flip-vs-fences.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl2/igt@kms_flip@flip-vs-fences.html
    - shard-apl:          [DMESG-WARN][79] ([i915#1297]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl8/igt@kms_flip@flip-vs-fences.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl1/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [FAIL][81] ([i915#699] / [i915#93] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [FAIL][83] ([i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [FAIL][85] ([i915#93] / [i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl1/igt@kms_mmap_write_crc@main.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [FAIL][87] ([fdo#108145] / [i915#93] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [FAIL][89] ([fdo#108145] / [i915#95]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [FAIL][91] ([i915#173]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb1/igt@kms_psr@no_drrs.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb7/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb7/igt@kms_psr@psr2_primary_mmap_gtt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][95] ([i915#31]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl7/igt@kms_setmode@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl1/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-forked-hang:
    - shard-snb:          [SKIP][97] ([fdo#109271]) -> [PASS][98] +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb1/igt@kms_vblank@pipe-a-query-forked-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-snb4/igt@kms_vblank@pipe-a-query-forked-hang.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][99] ([i915#1542]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@perf@polling-parameterized.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb7/igt@perf@polling-parameterized.html
    - shard-hsw:          [FAIL][101] ([i915#1542]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-hsw6/igt@perf@polling-parameterized.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-hsw7/igt@perf@polling-parameterized.html
    - shard-tglb:         [FAIL][103] ([i915#1542]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-tglb5/igt@perf@polling-parameterized.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-tglb2/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [INCOMPLETE][106] ([i915#155])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl6/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-kbl:          [INCOMPLETE][107] ([i915#1390] / [i915#879]) -> [INCOMPLETE][108] ([i915#1423] / [i915#879])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_module_load@reload-with-fault-injection.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl7/igt@i915_module_load@reload-with-fault-injection.html
    - shard-apl:          [INCOMPLETE][109] ([i915#1390]) -> [INCOMPLETE][110] ([i915#1423])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@i915_module_load@reload-with-fault-injection.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-snb:          [INCOMPLETE][111] ([i915#82]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-snb2/igt@i915_pm_dc@dc5-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-snb5/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][113] ([i915#155]) -> [DMESG-WARN][114] ([i915#180])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl2/igt@i915_suspend@sysfs-reader.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][115] ([fdo#108145] / [i915#95]) -> [FAIL][116] ([fdo#108145])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [FAIL][117] ([fdo#108145] / [i915#93] / [i915#95]) -> [FAIL][118] ([fdo#108145])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][119] ([fdo#109642] / [fdo#111068]) -> [FAIL][120] ([i915#608])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-iclb5/igt@kms_psr2_su@page_flip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][121] ([i915#1423] / [i915#1485] / [i915#92]) -> [FAIL][122] ([i915#1423] / [i915#92])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-kbl3/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-kbl7/igt@runner@aborted.html
    - shard-apl:          [FAIL][123] ([i915#1423] / [i915#1485]) -> ([FAIL][124], [FAIL][125]) ([i915#1423] / [i915#529])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8213/shard-apl3/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/shard-apl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [i915#1297]: https://gitlab.freedesktop.org/drm/intel/issues/1297
  [i915#1316]: https://gitlab.freedesktop.org/drm/intel/issues/1316
  [i915#1390]: https://gitlab.freedesktop.org/drm/intel/issues/1390
  [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
  [i915#1423]: https://gitlab.freedesktop.org/drm/intel/issues/1423
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#1485]: https://gitlab.freedesktop.org/drm/intel/issues/1485
  [i915#1505]: https://gitlab.freedesktop.org/drm/intel/issues/1505
  [i915#1539]: https://gitlab.freedesktop.org/drm/intel/issues/1539
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#529]: https://gitlab.freedesktop.org/drm/intel/issues/529
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#608]: https://gitlab.freedesktop.org/drm/intel/issues/608
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5544 -> IGTPW_4372
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8213: 3cebf14c87d0d4508d4cc9c49db14061af752c37 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4372: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/index.html
  IGT_5544: 477c562fc9932939083d732b77dd7b083c6bc0a1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4372/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
