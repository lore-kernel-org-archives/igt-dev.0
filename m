Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Jul 2020 06:18:28 -0000
Message-ID: <159470750848.6782.4504512068226662147@emeril.freedesktop.org>
References: <20200714044234.26328-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20200714044234.26328-1-sai.gowtham.ch@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fcreate=3A_Added_test_description_for_test_case=2E?=
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_create: Added test description for test case.
URL   : https://patchwork.freedesktop.org/series/79439/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8740_full -> IGTPW_4760_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/index.html

Known issues
------------

  Here are the changes found in IGTPW_4760_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@vecs0:
    - shard-apl:          [PASS][1] -> [FAIL][2] ([i915#1528] / [i915#1635])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl6/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl4/igt@gem_ctx_persistence@engines-mixed-process@vecs0.html

  * igt@gem_ctx_ringsize@clone:
    - shard-apl:          [PASS][3] -> [DMESG-WARN][4] ([i915#1635] / [i915#95]) +31 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@gem_ctx_ringsize@clone.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl7/igt@gem_ctx_ringsize@clone.html

  * igt@gem_mmap_gtt@basic-small-bo:
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958] / [i915#2119]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw7/igt@gem_mmap_gtt@basic-small-bo.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw2/igt@gem_mmap_gtt@basic-small-bo.html
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb4/igt@gem_mmap_gtt@basic-small-bo.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-snb1/igt@gem_mmap_gtt@basic-small-bo.html

  * igt@gem_mmap_wc@write-wc-read-gtt:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#93] / [i915#95]) +34 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl2/igt@gem_mmap_wc@write-wc-read-gtt.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@gem_mmap_wc@write-wc-read-gtt.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12] ([CI#80] / [i915#155])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [PASS][13] -> [SKIP][14] ([i915#1904])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw7/igt@i915_pm_rpm@sysfs-read.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw2/igt@i915_pm_rpm@sysfs-read.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         [PASS][17] -> [INCOMPLETE][18] ([i915#750])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb6/igt@i915_selftest@live@execlists.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb5/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@mock@requests:
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2110] / [i915#58] / [k.org#198133])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk1/igt@i915_selftest@mock@requests.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk5/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [PASS][21] -> [DMESG-FAIL][22] ([i915#1635] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][23] -> [DMESG-FAIL][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl2/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [INCOMPLETE][28] ([i915#155])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([i915#1635] / [i915#54])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#54])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#1635] / [i915#70] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl2/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled:
    - shard-apl:          [PASS][37] -> [DMESG-FAIL][38] ([i915#1635] / [i915#54] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
    - shard-kbl:          [PASS][39] -> [DMESG-FAIL][40] ([i915#54] / [i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-blt-untiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane@plane-position-hole-pipe-c-planes:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#402]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb7/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb1/igt@kms_plane@plane-position-hole-pipe-c-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][45] -> [DMESG-FAIL][46] ([i915#95]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][47] -> [FAIL][48] ([i915#173])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb8/igt@kms_psr@no_drrs.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][49] -> [SKIP][50] ([fdo#109441]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#31])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl3/igt@kms_setmode@basic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@kms_setmode@basic.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][53] -> [FAIL][54] ([i915#1542])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb8/igt@perf@polling-parameterized.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb5/igt@perf@polling-parameterized.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][55] -> [FAIL][56] ([i915#1820])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][57] ([i915#180]) -> [PASS][58] +5 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox:
    - shard-apl:          [FAIL][59] ([i915#1528] / [i915#1635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl7/igt@gem_ctx_persistence@legacy-engines-mixed-process@vebox.html

  * igt@gem_exec_fence@syncobj-unused-fence:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#95]) -> [PASS][62] +36 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@gem_exec_fence@syncobj-unused-fence.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl3/igt@gem_exec_fence@syncobj-unused-fence.html

  * igt@gem_mmap_wc@fault-concurrent:
    - shard-iclb:         [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb2/igt@gem_mmap_wc@fault-concurrent.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-iclb3/igt@gem_mmap_wc@fault-concurrent.html

  * igt@gem_softpin@noreloc-interruptible:
    - shard-snb:          [INCOMPLETE][65] ([i915#82]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@gem_softpin@noreloc-interruptible.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-snb5/igt@gem_softpin@noreloc-interruptible.html

  * igt@gem_sync@basic-all:
    - shard-glk:          [DMESG-WARN][67] ([i915#118] / [i915#95]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk6/igt@gem_sync@basic-all.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk5/igt@gem_sync@basic-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][69] ([i915#402]) -> [PASS][70] +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb7/igt@i915_module_load@reload.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb6/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][71] ([i915#118] / [i915#95]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][73] ([i915#93] / [i915#95]) -> [PASS][74] +40 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#54] / [i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
    - shard-glk:          [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-glk2/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-glk1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1:
    - shard-kbl:          [FAIL][79] ([i915#2122]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-kbl:          [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
    - shard-tglb:         [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][85] ([i915#95]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane@plane-position-covered-pipe-b-planes:
    - shard-kbl:          [FAIL][87] ([i915#247]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl6/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
    - shard-apl:          [FAIL][89] ([i915#1635] / [i915#247]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@kms_plane@plane-position-covered-pipe-b-planes.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl7/igt@kms_plane@plane-position-covered-pipe-b-planes.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][91] ([i915#1635] / [i915#95]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl4/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [SKIP][93] ([fdo#109441]) -> [PASS][94] +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-a-query-busy-hang:
    - shard-hsw:          [TIMEOUT][95] ([i915#1958] / [i915#2119]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw1/igt@kms_vblank@pipe-a-query-busy-hang.html
    - shard-snb:          [TIMEOUT][97] ([i915#1958] / [i915#2119]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@kms_vblank@pipe-a-query-busy-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-snb4/igt@kms_vblank@pipe-a-query-busy-hang.html

  * igt@testdisplay:
    - shard-kbl:          [TIMEOUT][99] ([i915#1692] / [i915#1958] / [i915#2119]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl7/igt@testdisplay.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl6/igt@testdisplay.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-hsw:          [SKIP][101] ([fdo#109271]) -> [TIMEOUT][102] ([i915#1958] / [i915#2119]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-hsw:          [INCOMPLETE][103] -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@gen9_exec_parse@bb-start-far.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw1/igt@gen9_exec_parse@bb-start-far.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [INCOMPLETE][105] ([i915#155]) -> [DMESG-WARN][106] ([i915#180])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-kbl:          [DMESG-WARN][107] ([i915#93] / [i915#95]) -> [DMESG-FAIL][108] ([i915#70] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl1/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-snb:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-snb1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [DMESG-WARN][112] ([i915#180] / [i915#93] / [i915#95])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [DMESG-FAIL][113] ([fdo#108145] / [i915#1635] / [i915#95]) -> [FAIL][114] ([fdo#108145] / [i915#1635] / [i915#265])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
    - shard-kbl:          [DMESG-FAIL][115] ([fdo#108145] / [i915#95]) -> [FAIL][116] ([fdo#108145] / [i915#265])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_cursor@pipe-d-overlay-size-128:
    - shard-hsw:          [TIMEOUT][117] ([i915#1958] / [i915#2119]) -> [SKIP][118] ([fdo#109271]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-hsw1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-hsw1/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
    - shard-snb:          [TIMEOUT][119] ([i915#1958] / [i915#2119]) -> [SKIP][120] ([fdo#109271]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-snb6/igt@kms_plane_cursor@pipe-d-overlay-size-128.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-snb4/igt@kms_plane_cursor@pipe-d-overlay-size-128.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#2110] / [i915#716]) -> ([FAIL][125], [FAIL][126]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl3/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl4/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-apl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl6/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][127], [FAIL][128]) ([i915#1764] / [i915#2110]) -> [FAIL][129] ([i915#2110])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb3/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8740/shard-tglb8/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/shard-tglb7/igt@runner@aborted.html

  
  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1692]: https://gitlab.freedesktop.org/drm/intel/issues/1692
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#247]: https://gitlab.freedesktop.org/drm/intel/issues/247
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#70]: https://gitlab.freedesktop.org/drm/intel/issues/70
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#750]: https://gitlab.freedesktop.org/drm/intel/issues/750
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5735 -> IGTPW_4760
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8740: b182a04c513e3b385fa3cdbac559f2625b778be1 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4760: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/index.html
  IGT_5735: 21f8204e54c122e4a0f8ca4b59e4b2db8d1ba687 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4760/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
