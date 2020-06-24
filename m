Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 24 Jun 2020 12:47:48 -0000
Message-ID: <159300286823.19235.15631599572039786918@emeril.freedesktop.org>
References: <20200624082545.14362-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200624082545.14362-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev4=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev4)
URL   : https://patchwork.freedesktop.org/series/78719/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8660_full -> IGTPW_4699_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4699_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4699_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4699_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intentionally-fail} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl3/igt@api_intel_bb@intentionally-fail.html
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-tglb8/igt@api_intel_bb@intentionally-fail.html
    - shard-iclb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-iclb6/igt@api_intel_bb@intentionally-fail.html
    - shard-snb:          NOTRUN -> [FAIL][4] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-snb6/igt@api_intel_bb@intentionally-fail.html
    - shard-kbl:          NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl6/igt@api_intel_bb@intentionally-fail.html
    - shard-hsw:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw7/igt@api_intel_bb@intentionally-fail.html
    - shard-glk:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk7/igt@api_intel_bb@intentionally-fail.html

  * igt@gem_exec_gttfill@all:
    - shard-apl:          [PASS][8] -> [INCOMPLETE][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl1/igt@gem_exec_gttfill@all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl8/igt@gem_exec_gttfill@all.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-snb:          [PASS][10] -> [DMESG-WARN][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb2/igt@gem_mmap_gtt@fault-concurrent.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-snb4/igt@gem_mmap_gtt@fault-concurrent.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8660_full and IGTPW_4699_full:

### New IGT tests (9) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 7 pass(s)
    - Exec time: [0.06, 0.19] s

  * igt@api_intel_bb@intentionally-fail:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.22] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4699_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-range:
    - shard-apl:          [PASS][12] -> [DMESG-WARN][13] ([i915#1635] / [i915#95]) +34 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl2/igt@gem_ctx_param@set-priority-range.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl1/igt@gem_ctx_param@set-priority-range.html

  * igt@gem_eio@in-flight-internal-immediate:
    - shard-hsw:          [PASS][14] -> [TIMEOUT][15] ([i915#1958]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@gem_eio@in-flight-internal-immediate.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw4/igt@gem_eio@in-flight-internal-immediate.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#1930])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [PASS][18] -> [DMESG-WARN][19] ([i915#118] / [i915#95]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk9/igt@gem_exec_whisper@basic-normal.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk5/igt@gem_exec_whisper@basic-normal.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [PASS][20] -> [DMESG-WARN][21] ([i915#1436] / [i915#716])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl7/igt@gen9_exec_parse@allowed-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [PASS][22] -> [DMESG-WARN][23] ([i915#402])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb3/igt@i915_module_load@reload.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-tglb1/igt@i915_module_load@reload.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][24] -> [DMESG-FAIL][25] ([i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [PASS][26] -> [DMESG-FAIL][27] ([i915#54] / [i915#95]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-kbl:          [PASS][28] -> [DMESG-WARN][29] ([i915#93] / [i915#95]) +41 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl1/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#79])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][32] -> [FAIL][33] ([i915#46])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][34] -> [DMESG-WARN][35] ([i915#180]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          [PASS][36] -> [FAIL][37] ([IGT#2])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_sysfs_edid_timing.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl3/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([IGT#2])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl7/igt@kms_sysfs_edid_timing.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-apl:          [PASS][40] -> [DMESG-WARN][41] ([i915#1982])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl1/igt@kms_vblank@pipe-c-query-forked-busy.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl4/igt@kms_vblank@pipe-c-query-forked-busy.html

  
#### Possible fixes ####

  * igt@gem_exec_create@forked:
    - shard-hsw:          [INCOMPLETE][42] -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw7/igt@gem_exec_create@forked.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw5/igt@gem_exec_create@forked.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][44] ([i915#118] / [i915#95]) -> [PASS][45] +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk8/igt@gem_exec_create@madvise.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk6/igt@gem_exec_create@madvise.html

  * igt@gem_userptr_blits@create-destroy-sync:
    - shard-hsw:          [TIMEOUT][46] ([i915#1958]) -> [PASS][47] +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@gem_userptr_blits@create-destroy-sync.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw1/igt@gem_userptr_blits@create-destroy-sync.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][48] ([i915#1904]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-tglb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [INCOMPLETE][50] ([i915#151] / [i915#155]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl4/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][52] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl7/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][54] ([i915#118] / [i915#95]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-glk6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [DMESG-WARN][56] ([i915#93] / [i915#95]) -> [PASS][57] +37 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][58] ([i915#54] / [i915#95]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-hsw:          [FAIL][60] ([i915#57]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw2/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][62] ([i915#1525]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [DMESG-WARN][64] ([i915#180]) -> [PASS][65] +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][66] ([i915#95]) -> [PASS][67] +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl1/igt@kms_flip_tiling@flip-changes-tiling-yf.html
    - shard-apl:          [DMESG-FAIL][68] ([i915#1635] / [i915#95]) -> [PASS][69] +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl2/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-iclb:         [DMESG-WARN][70] ([i915#1982]) -> [PASS][71] +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_invalid_dotclock:
    - shard-snb:          [TIMEOUT][72] ([i915#1958]) -> [PASS][73] +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@kms_invalid_dotclock.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-snb6/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][74] ([fdo#108145] / [i915#95]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][76] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-tglb:         [DMESG-WARN][78] ([i915#1982]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb3/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-tglb8/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm:
    - shard-apl:          [DMESG-WARN][80] ([i915#1635] / [i915#95]) -> [PASS][81] +26 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-rpm.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][82] ([i915#1820]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl6/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [TIMEOUT][84] ([i915#1958]) -> [FAIL][85] ([i915#1930])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@gem_exec_reloc@basic-concurrent16.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-snb1/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][86] ([i915#468]) -> [FAIL][87] ([i915#454])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - shard-apl:          [SKIP][88] ([fdo#109271]) -> [SKIP][89] ([fdo#109271] / [i915#1635]) +13 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl4/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-hsw:          [TIMEOUT][90] ([i915#1958]) -> [SKIP][91] ([fdo#109271]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw4/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-apl:          [SKIP][92] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][93] ([fdo#109271] / [fdo#111827])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl7/igt@kms_chamelium@hdmi-hpd-fast.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl6/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-snb:          [TIMEOUT][94] ([i915#1958]) -> [SKIP][95] ([fdo#109271]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-snb6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-snb5/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [DMESG-WARN][96] ([i915#180]) -> [DMESG-WARN][97] ([i915#180] / [i915#93] / [i915#95])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-kbl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-hsw:          [SKIP][98] ([fdo#109271]) -> [TIMEOUT][99] ([i915#1958]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-apl:          [SKIP][100] ([fdo#109271] / [i915#1635]) -> [SKIP][101] ([fdo#109271]) +8 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8660/shard-apl6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/shard-apl2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#46]: https://gitlab.freedesktop.org/drm/intel/issues/46
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5717 -> IGTPW_4699
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8660: 46d717372cd0a64380f01c9def59738f5705bd43 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4699: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html
  IGT_5717: 725bf2dae51f0087eaa64f1931a2ef9d22f070dd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4699/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
