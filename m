Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 08:45:47 -0000
Message-ID: <159402514736.17681.17017028022532100240@emeril.freedesktop.org>
References: <20200706072118.17441-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200706072118.17441-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_dependency_from_gem=5F=5Bcaching/hang=5D_=28rev3=29?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Remove libdrm dependency from gem_[caching/hang] (rev3)
URL   : https://patchwork.freedesktop.org/series/78886/
State : success

== Summary ==

CI Bug Log - changes from IGT_5723_full -> IGTPW_4737_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/index.html

Known issues
------------

  Here are the changes found in IGTPW_4737_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fence@long-history:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#1635] / [i915#95]) +34 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@gem_exec_fence@long-history.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl4/igt@gem_exec_fence@long-history.html

  * igt@gem_exec_fence@parallel@vcs0:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +4 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk4/igt@gem_exec_fence@parallel@vcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk7/igt@gem_exec_fence@parallel@vcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1930])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_render_copy_redux@flink:
    - shard-hsw:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw1/igt@gem_render_copy_redux@flink.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw2/igt@gem_render_copy_redux@flink.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#1119])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-pixel-format:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#93] / [i915#95]) +38 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl1/igt@kms_ccs@pipe-a-bad-pixel-format.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl1/igt@kms_ccs@pipe-a-bad-pixel-format.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#54])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_lease@multimaster-lease:
    - shard-snb:          [PASS][25] -> [TIMEOUT][26] ([i915#1958] / [i915#2119]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb5/igt@kms_lease@multimaster-lease.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-snb2/igt@kms_lease@multimaster-lease.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-apl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#1635] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl4/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-b-query-busy-hang:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl4/igt@kms_vblank@pipe-b-query-busy-hang.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl1/igt@kms_vblank@pipe-b-query-busy-hang.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb1/igt@perf_pmu@module-unload.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@other-init-4:
    - shard-tglb:         [PASS][37] -> [DMESG-WARN][38] ([i915#402])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb2/igt@perf_pmu@other-init-4.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb6/igt@perf_pmu@other-init-4.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1820])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#1755])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk4/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_eio@wait-10ms:
    - shard-snb:          [TIMEOUT][43] ([i915#1958] / [i915#2119]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb1/igt@gem_eio@wait-10ms.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-snb1/igt@gem_eio@wait-10ms.html

  * igt@gem_exec_nop@basic-series:
    - shard-glk:          [DMESG-WARN][45] ([i915#118] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@gem_exec_nop@basic-series.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk6/igt@gem_exec_nop@basic-series.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [INCOMPLETE][47] ([i915#926]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb4/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][49] ([i915#1904]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [FAIL][51] ([i915#1899]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][53] ([i915#1519]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw5/igt@i915_pm_rc6_residency@rc6-fence.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@i2c:
    - shard-hsw:          [SKIP][55] ([fdo#109271]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@i915_pm_rpm@i2c.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw1/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [DMESG-WARN][57] ([i915#93] / [i915#95]) -> [PASS][58] +35 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][59] ([i915#1602] / [i915#1887] / [i915#456]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@i915_suspend@debugfs-reader.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb5/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-tglb:         [DMESG-WARN][61] ([i915#1149] / [i915#402]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@kms_color@pipe-b-ctm-green-to-red.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb6/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-kbl:          [DMESG-FAIL][63] ([i915#54] / [i915#95]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding:
    - shard-apl:          [DMESG-WARN][65] ([i915#1635] / [i915#95]) -> [PASS][66] +33 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x42-sliding.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][69] ([i915#1525]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [FAIL][71] ([i915#79]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][79] ([i915#402]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][81] ([i915#83]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
    - shard-apl:          [DMESG-FAIL][83] ([i915#1635] / [i915#95]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
    - shard-kbl:          [DMESG-FAIL][85] ([i915#95]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl3/igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][87] ([i915#62] / [i915#92]) -> [PASS][88] +34 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@kms_vblank@pipe-a-wait-forked-hang:
    - shard-hsw:          [TIMEOUT][89] ([i915#1958] / [i915#2119]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@kms_vblank@pipe-a-wait-forked-hang.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw4/igt@kms_vblank@pipe-a-wait-forked-hang.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][91] ([i915#454]) -> [FAIL][92] ([i915#1899])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][93] ([i915#1515]) -> [WARN][94] ([i915#1515])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-apl:          [SKIP][95] ([fdo#109271] / [fdo#111827]) -> [SKIP][96] ([fdo#109271] / [fdo#111827] / [i915#1635]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][97] ([fdo#110321]) -> [DMESG-FAIL][98] ([fdo#110321] / [i915#1635] / [i915#95]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl8/igt@kms_content_protection@lic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl4/igt@kms_content_protection@lic.html
    - shard-kbl:          [TIMEOUT][99] ([i915#1319] / [i915#1958] / [i915#2119]) -> [DMESG-FAIL][100] ([fdo#110321] / [i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl3/igt@kms_content_protection@lic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][101] ([i915#54] / [i915#95]) -> [FAIL][102] ([i915#54])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
    - shard-apl:          [DMESG-WARN][103] ([i915#1635] / [i915#95]) -> [FAIL][104] ([i915#54])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#1635]) -> [SKIP][106] ([fdo#109271]) +11 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl6/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][107] ([i915#64]) -> [DMESG-WARN][108] ([i915#180])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [SKIP][111] ([fdo#109271]) -> [TIMEOUT][112] ([i915#1958] / [i915#2119]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-snb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-hsw4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
    - shard-snb:          [TIMEOUT][115] ([i915#1958] / [i915#2119]) -> [SKIP][116] ([fdo#109271]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-snb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-apl:          [SKIP][117] ([fdo#109271]) -> [SKIP][118] ([fdo#109271] / [i915#1635]) +13 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][119], [FAIL][120], [FAIL][121]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][122] ([i915#1635] / [i915#2110])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl4/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-apl7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][123], [FAIL][124]) ([i915#1602] / [i915#2110]) -> [FAIL][125] ([i915#2110])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb5/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#83]: https://gitlab.freedesktop.org/drm/intel/issues/83
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92
  [i915#926]: https://gitlab.freedesktop.org/drm/intel/issues/926
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5723 -> IGTPW_4737

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4737: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/index.html
  IGT_5723: 75bcaf7a609d184305d5f6ac9da38d9297ed22ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4737/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
