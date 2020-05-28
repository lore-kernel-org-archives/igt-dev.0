Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 17:21:45 -0000
Message-ID: <159068650539.685.14301784587149439623@emeril.freedesktop.org>
References: <20200528142652.31504-1-anshuman.gupta@intel.com>
In-Reply-To: <20200528142652.31504-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_CP_cleanup_exit_handler_=28rev2?=
 =?utf-8?q?=29?=
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
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_content_protection: CP cleanup exit handler (rev2)
URL   : https://patchwork.freedesktop.org/series/77388/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8547_full -> IGTPW_4620_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4620_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4620_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4620_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_params@invalid-ring:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk1/igt@gem_exec_params@invalid-ring.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk4/igt@gem_exec_params@invalid-ring.html

  * igt@kms_ccs@pipe-d-crc-primary-basic:
    - shard-glk:          NOTRUN -> [TIMEOUT][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk4/igt@kms_ccs@pipe-d-crc-primary-basic.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> ([FAIL][4], [FAIL][5]) ([i915#1602])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb5/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb8/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@sysfs_preempt_timeout@invalid}:
    - shard-glk:          NOTRUN -> [TIMEOUT][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk4/igt@sysfs_preempt_timeout@invalid.html

  
Known issues
------------

  Here are the changes found in IGTPW_4620_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_params@invalid-ring:
    - shard-apl:          [PASS][7] -> [TIMEOUT][8] ([i915#1635]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl3/igt@gem_exec_params@invalid-ring.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl6/igt@gem_exec_params@invalid-ring.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb2/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#1899])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb2/igt@i915_pm_dc@dc5-psr.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb7/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#1119] / [i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54] / [i915#93] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_flip_tiling@flip-changes-tiling:
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#95])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling.html
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#699] / [i915#93] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling.html

  * igt@kms_mmap_write_crc@main:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#93] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@kms_mmap_write_crc@main.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl2/igt@kms_mmap_write_crc@main.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109441]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@suspend:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#1602] / [i915#456]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb7/igt@kms_psr@suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb8/igt@kms_psr@suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180] / [i915#93] / [i915#95])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Possible fixes ####

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-apl:          [TIMEOUT][29] ([i915#1635]) -> [PASS][30] +5 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl4/igt@gem_userptr_blits@unsync-unmap-after-close.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl7/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][31] ([i915#1436] / [i915#716]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl1/igt@gen9_exec_parse@allowed-all.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl4/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][33] ([i915#1904]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][35] ([i915#1899]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-kbl:          [FAIL][37] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl1/igt@kms_big_fb@linear-32bpp-rotate-0.html
    - shard-apl:          [FAIL][39] ([i915#1119] / [i915#95]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [FAIL][41] ([i915#1119] / [i915#118] / [i915#95]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-legacy-gamma:
    - shard-apl:          [FAIL][43] ([fdo#108145] / [i915#71] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_color@pipe-a-legacy-gamma.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl6/igt@kms_color@pipe-a-legacy-gamma.html
    - shard-kbl:          [FAIL][45] ([fdo#108145] / [i915#71] / [i915#93] / [i915#95]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_color@pipe-a-legacy-gamma.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl2/igt@kms_color@pipe-a-legacy-gamma.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [FAIL][47] ([i915#54] / [i915#93] / [i915#95]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-glk:          [FAIL][51] ([i915#54]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
    - shard-apl:          [FAIL][53] ([i915#54]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-hsw:          [INCOMPLETE][55] ([i915#61]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-hsw1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-hsw7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][57] ([fdo#109349]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb1/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [DMESG-WARN][59] ([i915#180]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][61] ([i915#49]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][67] ([i915#1911]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb6/igt@kms_psr2_su@frontbuffer.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb1/igt@kms_psr@psr2_cursor_render.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][71] ([i915#31]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl6/igt@kms_setmode@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl1/igt@kms_setmode@basic.html

  * igt@perf@i915-ref-count:
    - shard-iclb:         [SKIP][73] ([i915#405]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-iclb8/igt@perf@i915-ref-count.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-iclb8/igt@perf@i915-ref-count.html
    - shard-kbl:          [SKIP][75] ([fdo#109271]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@perf@i915-ref-count.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl4/igt@perf@i915-ref-count.html
    - shard-glk:          [SKIP][77] ([fdo#109271]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk6/igt@perf@i915-ref-count.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk5/igt@perf@i915-ref-count.html
    - shard-tglb:         [SKIP][79] ([i915#405]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb5/igt@perf@i915-ref-count.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb3/igt@perf@i915-ref-count.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][81] ([i915#454]) -> [SKIP][82] ([i915#468])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_ccs@pipe-d-crc-primary-basic:
    - shard-apl:          [SKIP][83] ([fdo#109271]) -> [TIMEOUT][84] ([i915#1635]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl8/igt@kms_ccs@pipe-d-crc-primary-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl6/igt@kms_ccs@pipe-d-crc-primary-basic.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][85] ([i915#1319] / [i915#1635]) -> [FAIL][86] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@kms_content_protection@atomic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [FAIL][87] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][88] ([i915#1319] / [i915#1635])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl4/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][89] ([i915#1319] / [i915#1635]) -> [DMESG-FAIL][90] ([fdo#110321] / [i915#95])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl6/igt@kms_content_protection@srm.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl2/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-glk:          [DMESG-FAIL][91] ([i915#1925]) -> [DMESG-WARN][92] ([i915#1926])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-glk1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-glk6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-kbl:          [FAIL][93] ([fdo#108145] / [i915#265] / [i915#93] / [i915#95]) -> [FAIL][94] ([fdo#108145] / [i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          [FAIL][95] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][96] ([fdo#108145] / [i915#265])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8547/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1925]: https://gitlab.freedesktop.org/drm/intel/issues/1925
  [i915#1926]: https://gitlab.freedesktop.org/drm/intel/issues/1926
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#699]: https://gitlab.freedesktop.org/drm/intel/issues/699
  [i915#71]: https://gitlab.freedesktop.org/drm/intel/issues/71
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5682 -> IGTPW_4620
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8547: 055c59085e117a2433d3862d645e049e30f3a2dc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4620: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/index.html
  IGT_5682: e5371a99a877be134c6ad5361a5f03843a66f775 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4620/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
