Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 06 Jul 2020 06:15:16 -0000
Message-ID: <159401611607.17683.8600544608222816487@emeril.freedesktop.org>
References: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200706044038.8203-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fkms=3A_Add_support_for_display_with_=28rev5=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/igt_kms: Add support for display with (rev5)
URL   : https://patchwork.freedesktop.org/series/78482/
State : success

== Summary ==

CI Bug Log - changes from IGT_5723_full -> IGTPW_4736_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4736_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4736_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4736_full:

### IGT changes ###

#### Warnings ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-iclb:         [INCOMPLETE][1] ([i915#926]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         [SKIP][3] ([i915#1839]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         [SKIP][5] ([i915#1839]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  
Known issues
------------

  Here are the changes found in IGTPW_4736_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_clone@engines:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958] / [i915#2119]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb4/igt@gem_ctx_clone@engines.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb2/igt@gem_ctx_clone@engines.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][9] -> [FAIL][10] ([i915#1930])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-queues-priority:
    - shard-glk:          [PASS][11] -> [DMESG-WARN][12] ([i915#118] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk6/igt@gem_exec_whisper@basic-queues-priority.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-glk1/igt@gem_exec_whisper@basic-queues-priority.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][13] -> [DMESG-WARN][14] ([i915#402]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb6/igt@i915_module_load@reload.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-hsw:          [PASS][15] -> [TIMEOUT][16] ([i915#1958] / [i915#2119]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw1/igt@i915_query@query-topology-coherent-slice-mask.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw6/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#95]) +31 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-random:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#93] / [i915#95]) +45 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb5/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb2/igt@kms_cursor_legacy@flip-vs-cursor-crc-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][25] -> [DMESG-FAIL][26] ([fdo#108145] / [i915#54] / [i915#95])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl7/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109441]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@kms_vblank@pipe-d-accuracy-idle.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb8/igt@kms_vblank@pipe-d-accuracy-idle.html

  
#### Possible fixes ####

  * igt@gem_eio@wait-10ms:
    - shard-snb:          [TIMEOUT][33] ([i915#1958] / [i915#2119]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb1/igt@gem_eio@wait-10ms.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb2/igt@gem_eio@wait-10ms.html

  * igt@gem_exec_nop@basic-series:
    - shard-glk:          [DMESG-WARN][35] ([i915#118] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@gem_exec_nop@basic-series.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-glk6/igt@gem_exec_nop@basic-series.html

  * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
    - shard-apl:          [DMESG-WARN][37] ([i915#1635] / [i915#95]) -> [PASS][38] +30 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl7/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl6/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][39] ([i915#1904]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][41] ([i915#1899]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb1/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][43] ([i915#1899]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@i915_pm_dc@dc5-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb6/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][45] ([i915#1519]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw5/igt@i915_pm_rc6_residency@rc6-fence.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@i2c:
    - shard-hsw:          [SKIP][47] ([fdo#109271]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@i915_pm_rpm@i2c.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw5/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +33 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@mock@requests:
    - shard-kbl:          [INCOMPLETE][51] ([i915#2110]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl4/igt@i915_selftest@mock@requests.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl1/igt@i915_selftest@mock@requests.html

  * igt@i915_suspend@debugfs-reader:
    - shard-tglb:         [INCOMPLETE][53] ([i915#1602] / [i915#1887] / [i915#456]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@i915_suspend@debugfs-reader.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb8/igt@i915_suspend@debugfs-reader.html

  * igt@kms_color@pipe-b-ctm-green-to-red:
    - shard-tglb:         [DMESG-WARN][55] ([i915#1149] / [i915#402]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@kms_color@pipe-b-ctm-green-to-red.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb1/igt@kms_color@pipe-b-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][57] ([i915#54] / [i915#95]) -> [PASS][58] +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-glk2/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-glk6/igt@kms_cursor_edge_walk@pipe-c-128x128-left-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][61] ([i915#1525]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp1:
    - shard-apl:          [FAIL][63] ([i915#79]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl4/igt@kms_flip@flip-vs-expired-vblank@c-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-iclb:         [DMESG-WARN][67] ([i915#1982]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-tglb:         [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
    - shard-tglb:         [DMESG-WARN][71] ([i915#402]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb7/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-iclb:         [FAIL][73] ([i915#83]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb1/igt@kms_panel_fitting@atomic-fastset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb5/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-128:
    - shard-apl:          [DMESG-FAIL][75] ([i915#1635] / [i915#95]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl8/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
    - shard-kbl:          [DMESG-FAIL][77] ([i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl2/igt@kms_plane_cursor@pipe-a-viewport-size-128.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-128.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-iclb:         [FAIL][81] ([IGT#2]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@kms_sysfs_edid_timing.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb5/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][83] ([i915#62] / [i915#92]) -> [PASS][84] +33 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-modeset-hang.html

  * igt@kms_vblank@pipe-a-wait-forked-hang:
    - shard-hsw:          [TIMEOUT][85] ([i915#1958] / [i915#2119]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@kms_vblank@pipe-a-wait-forked-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw5/igt@kms_vblank@pipe-a-wait-forked-hang.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb8/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb2/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - shard-snb:          [WARN][89] ([i915#2021]) -> [WARN][90] ([i915#2036])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb6/igt@gem_exec_reloc@basic-spin-others@vcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [FAIL][91] ([i915#1515]) -> [WARN][92] ([i915#1515])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-snb:          [TIMEOUT][93] ([i915#1958] / [i915#2119]) -> [SKIP][94] ([fdo#109271]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb1/igt@kms_big_fb@yf-tiled-addfb.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb1/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][95] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][96] ([fdo#109278] / [i915#1149]) +9 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb7/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-apl:          [SKIP][97] ([fdo#109271] / [fdo#111827]) -> [SKIP][98] ([fdo#109271] / [fdo#111827] / [i915#1635])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl4/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][99] ([i915#2105]) -> [DMESG-FAIL][100] ([i915#95])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl2/igt@kms_content_protection@uevent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl4/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][101] ([i915#2105]) -> [DMESG-FAIL][102] ([i915#1635] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl6/igt@kms_content_protection@uevent.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][103] ([fdo#109279]) -> [SKIP][104] ([fdo#109278] / [fdo#109279]) +24 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-apl:          [SKIP][105] ([fdo#109271] / [i915#1635]) -> [SKIP][106] ([fdo#109271]) +10 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl1/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl4/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][107] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][108] ([fdo#109278])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb6/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding:
    - shard-apl:          [SKIP][109] ([fdo#109271]) -> [SKIP][110] ([fdo#109271] / [i915#1635]) +13 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         [SKIP][111] ([fdo#109274]) -> [SKIP][112] ([fdo#109274] / [fdo#109278]) +23 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][113] ([fdo#109278] / [fdo#112010]) -> [SKIP][114] ([fdo#109278]) +81 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-move.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][115] ([i915#64]) -> [DMESG-WARN][116] ([i915#180])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-snb:          [SKIP][117] ([fdo#109271]) -> [TIMEOUT][118] ([i915#1958] / [i915#2119]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-hsw:          [TIMEOUT][119] ([i915#1958] / [i915#2119]) -> [SKIP][120] ([fdo#109271]) +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_cursor@pipe-a-primary-size-256:
    - shard-kbl:          [DMESG-WARN][121] ([i915#62] / [i915#92]) -> [DMESG-WARN][122] ([i915#93] / [i915#95])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-256.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-256.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-hsw:          [SKIP][123] ([fdo#109271]) -> [TIMEOUT][124] ([i915#1958] / [i915#2119])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-hsw8/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-hsw6/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][125] ([fdo#111825] / [fdo#112015]) -> [SKIP][126] ([fdo#111825])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1610] / [i915#1635] / [i915#2110]) -> [FAIL][130] ([i915#1635] / [i915#2110])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-apl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-apl8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][131], [FAIL][132]) ([i915#1602] / [i915#2110]) -> [FAIL][133] ([i915#2110])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb8/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5723/shard-tglb5/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2021]: https://gitlab.freedesktop.org/drm/intel/issues/2021
  [i915#2036]: https://gitlab.freedesktop.org/drm/intel/issues/2036
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#508]: https://gitlab.freedesktop.org/drm/intel/issues/508
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
  * IGT: IGT_5723 -> IGTPW_4736

  CI-20190529: 20190529
  CI_DRM_8708: 170e94a1430fd0a4f0841ad0f7366904d52e49be @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4736: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/index.html
  IGT_5723: 75bcaf7a609d184305d5f6ac9da38d9297ed22ef @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4736/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
