Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 04:04:56 -0000
Message-ID: <159297149643.19235.2131920267873776377@emeril.freedesktop.org>
References: <20200623181410.7000-1-robert.m.fosha@intel.com>
In-Reply-To: <20200623181410.7000-1-robert.m.fosha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fhuc=5Fcopy=3A_Enable_a_HuC_copy_test_=28rev7=29?=
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
To: "Robert M. Fosha" <robert.m.fosha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_huc_copy: Enable a HuC copy test (rev7)
URL   : https://patchwork.freedesktop.org/series/71194/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8658_full -> IGTPW_4697_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4697_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_huc_copy@huc-copy} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-iclb8/igt@gem_huc_copy@huc-copy.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8658_full and IGTPW_4697_full:

### New IGT tests (1) ###

  * igt@gem_huc_copy@huc-copy:
    - Statuses : 1 pass(s) 6 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4697_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][2] -> [DMESG-WARN][3] ([i915#180]) +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [PASS][4] -> [INCOMPLETE][5] ([i915#155])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl6/igt@gem_eio@in-flight-suspend.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl3/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [PASS][6] -> [DMESG-WARN][7] ([i915#118] / [i915#95])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk5/igt@gem_exec_whisper@basic-fds.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk7/igt@gem_exec_whisper@basic-fds.html

  * igt@gem_mmap_offset@bad-object:
    - shard-tglb:         [PASS][8] -> [DMESG-WARN][9] ([i915#402]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb8/igt@gem_mmap_offset@bad-object.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb6/igt@gem_mmap_offset@bad-object.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [PASS][10] -> [INCOMPLETE][11] ([i915#1436] / [i915#58] / [k.org#198133])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk5/igt@gen9_exec_parse@allowed-single.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk7/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#1899])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-iclb3/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
    - shard-apl:          [PASS][14] -> [DMESG-WARN][15] ([i915#1635] / [i915#95]) +31 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
    - shard-kbl:          [PASS][16] -> [DMESG-FAIL][17] ([i915#54] / [i915#95]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#1602] / [i915#456]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][20] -> [INCOMPLETE][21] ([i915#2055])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip_tiling@flip-changes-tiling-y:
    - shard-apl:          [PASS][22] -> [DMESG-FAIL][23] ([i915#1635] / [i915#95]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl1/igt@kms_flip_tiling@flip-changes-tiling-y.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render:
    - shard-kbl:          [PASS][24] -> [FAIL][25] ([i915#49])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
    - shard-apl:          [PASS][26] -> [DMESG-FAIL][27] ([i915#1635] / [i915#49] / [i915#95])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#1982])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][30] -> [DMESG-WARN][31] ([i915#93] / [i915#95]) +44 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#49])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#31])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl6/igt@kms_setmode@basic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([IGT#2])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl4/igt@kms_sysfs_edid_timing.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl4/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([IGT#2])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl3/igt@kms_sysfs_edid_timing.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl4/igt@kms_sysfs_edid_timing.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [PASS][40] -> [FAIL][41] ([i915#1542])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb6/igt@perf@polling-parameterized.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb8/igt@perf@polling-parameterized.html

  * igt@perf_pmu@rc6:
    - shard-hsw:          [PASS][42] -> [TIMEOUT][43] ([i915#1958]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw4/igt@perf_pmu@rc6.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw1/igt@perf_pmu@rc6.html
    - shard-snb:          [PASS][44] -> [TIMEOUT][45] ([i915#1958]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb5/igt@perf_pmu@rc6.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-snb4/igt@perf_pmu@rc6.html

  
#### Possible fixes ####

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][46] ([i915#118] / [i915#95]) -> [PASS][47] +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk1/igt@gem_exec_create@madvise.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk8/igt@gem_exec_create@madvise.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][48] ([i915#1930]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_shrink@reclaim:
    - shard-hsw:          [SKIP][50] ([fdo#109271]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_shrink@reclaim.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw4/igt@gem_shrink@reclaim.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][52] ([i915#1958]) -> [PASS][53] +2 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][54] ([i915#402]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb5/igt@i915_module_load@reload.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb6/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][56] ([i915#1904]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][58] ([i915#151] / [i915#155]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl7/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [DMESG-WARN][60] ([i915#180]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl3/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][62] ([i915#118] / [i915#95]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][64] ([i915#93] / [i915#95]) -> [PASS][65] +34 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          [DMESG-FAIL][66] ([i915#54] / [i915#95]) -> [PASS][67] +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][68] ([i915#95]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][70] ([i915#1635] / [i915#95]) -> [PASS][71] +2 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl7/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl4/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][72] ([i915#1982]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-iclb3/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][74] ([fdo#108145] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][76] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][78] ([i915#1982]) -> [PASS][79] +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][80] ([i915#1635] / [i915#95]) -> [PASS][81] +30 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl4/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][82] ([i915#1930]) -> [TIMEOUT][83] ([i915#1958])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-snb4/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][84] ([i915#454]) -> [SKIP][85] ([i915#468])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-tglb7/igt@i915_pm_dc@dc6-psr.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][86] ([i915#1958]) -> [SKIP][87] ([fdo#109271]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          [SKIP][88] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][89] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][90] ([i915#1319] / [i915#1958]) -> [TIMEOUT][91] ([i915#1319])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_content_protection@atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][92] ([fdo#110321]) -> [DMESG-FAIL][93] ([fdo#110321] / [i915#1635] / [i915#95])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl1/igt@kms_content_protection@srm.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          [SKIP][94] ([fdo#109271]) -> [SKIP][95] ([fdo#109271] / [i915#1635]) +19 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-snb:          [SKIP][96] ([fdo#109271]) -> [TIMEOUT][97] ([i915#1958]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
    - shard-hsw:          [SKIP][98] ([fdo#109271]) -> [TIMEOUT][99] ([i915#1958])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][100] ([i915#180]) -> [DMESG-FAIL][101] ([i915#95])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][102] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][103] ([fdo#108145] / [i915#1635] / [i915#95])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - shard-apl:          [SKIP][104] ([fdo#109271] / [i915#1635]) -> [SKIP][105] ([fdo#109271]) +10 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8658/shard-apl7/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/shard-apl1/igt@perf@gen12-unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4697
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8658: c86979e2fe3c106d95b5fcf2075709afa40f0f95 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4697: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4697/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
