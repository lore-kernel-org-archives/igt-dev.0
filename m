Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 21 Aug 2020 17:40:35 -0000
Message-ID: <159803163552.16198.17489156056346233245@emeril.freedesktop.org>
References: <20200821153807.18613-1-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200821153807.18613-1-janusz.krzysztofik@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Fixes_and_enhancements_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1300916393=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1300916393==
Content-Type: multipart/alternative;
 boundary="===============6870133841509017290=="

--===============6870133841509017290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_hotunplug: Fixes and enhancements (rev4)
URL   : https://patchwork.freedesktop.org/series/79671/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8913_full -> IGTPW_4901_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4901_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4901_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4901_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@core_hotunplug@hotrebind-lateclose} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-glk:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk3/igt@core_hotunplug@hotrebind-lateclose.html
    - shard-kbl:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl1/igt@core_hotunplug@hotrebind-lateclose.html

  * {igt@core_hotunplug@hotunbind-lateclose} (NEW):
    - shard-hsw:          NOTRUN -> [INCOMPLETE][4] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw8/igt@core_hotunplug@hotunbind-lateclose.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-snb:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb5/igt@gem_exec_flush@basic-uc-rw-default.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb4/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8913_full and IGTPW_4901_full:

### New IGT tests (4) ###

  * igt@core_hotunplug@hotrebind-lateclose:
    - Statuses : 4 fail(s) 1 incomplete(s) 1 pass(s)
    - Exec time: [0.0, 16.20] s

  * igt@core_hotunplug@hotunbind-lateclose:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 0.55] s

  * igt@core_hotunplug@hotunbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.91] s

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 1 incomplete(s) 6 pass(s)
    - Exec time: [0.0, 1.93] s

  

Known issues
------------

  Here are the changes found in IGTPW_4901_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@mock@contexts:
    - shard-apl:          [PASS][9] -> [INCOMPLETE][10] ([i915#1635] / [i915#2278])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@i915_selftest@mock@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl6/igt@i915_selftest@mock@contexts.html

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-hsw:          [PASS][11] -> [TIMEOUT][12] ([i915#1958]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][13] -> [DMESG-FAIL][14] ([i915#118] / [i915#95])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][15] -> [FAIL][16] ([i915#2122])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][17] -> [DMESG-WARN][18] ([i915#180]) +8 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
    - shard-iclb:         [PASS][23] -> [FAIL][24] ([i915#49])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk2/igt@kms_hdr@bpc-switch-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk8/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-snb:          [PASS][27] -> [TIMEOUT][28] ([i915#1958]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][29] -> [SKIP][30] ([fdo#109642] / [fdo#111068])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@prime_busy@before-wait@vecs0:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#2258]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw1/igt@prime_busy@before-wait@vecs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw7/igt@prime_busy@before-wait@vecs0.html

  
#### Possible fixes ####

  * igt@gem_exec_endless@dispatch@bcs0:
    - shard-tglb:         [INCOMPLETE][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb8/igt@gem_exec_endless@dispatch@bcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html

  * igt@gem_exec_gttfill@engines@rcs0:
    - shard-hsw:          [INCOMPLETE][37] -> [PASS][38] +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@gem_exec_gttfill@engines@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@gem_exec_gttfill@engines@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [DMESG-WARN][39] ([i915#180]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@gem_exec_suspend@basic-s3.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl4/igt@gem_exec_suspend@basic-s3.html

  * {igt@gem_mmap_offset@blt-coherency}:
    - shard-apl:          [FAIL][41] ([i915#1635]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl4/igt@gem_mmap_offset@blt-coherency.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl4/igt@gem_mmap_offset@blt-coherency.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [DMESG-FAIL][43] ([i915#118] / [i915#95]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][45] ([i915#1635] / [i915#1982]) -> [PASS][46] +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-random:
    - shard-kbl:          [FAIL][47] ([i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
    - shard-apl:          [FAIL][49] ([i915#1635] / [i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-hsw:          [TIMEOUT][51] ([i915#1958]) -> [PASS][52] +3 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-glk:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [DMESG-WARN][55] ([i915#2344]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb7/igt@kms_dp_aux_dev.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb6/igt@kms_dp_aux_dev.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-kbl:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [SKIP][61] ([i915#1911]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_psr2_su@page_flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][63] ([fdo#109441]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb6/igt@kms_psr@psr2_suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][65] ([i915#1542]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb3/igt@perf@blocking-parameterized.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@perf@blocking-parameterized.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][67] ([i915#1542]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@perf@polling-parameterized.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_reloc@basic-concurrent16:
    - shard-snb:          [FAIL][69] ([i915#1930]) -> [TIMEOUT][70] ([i915#1958])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][71] ([i915#588]) -> [SKIP][72] ([i915#658])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][73] ([i915#1515]) -> [FAIL][74] ([i915#1515])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][75] ([i915#1319] / [i915#1958]) -> [TIMEOUT][76] ([i915#1319]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@kms_content_protection@atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_content_protection@atomic.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-snb:          [SKIP][77] ([fdo#109271]) -> [TIMEOUT][78] ([i915#1958]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb4/igt@kms_flip@2x-flip-vs-dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][79] ([fdo#109271]) -> [TIMEOUT][80] ([i915#1958]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_vblank@pipe-d-accuracy-idle:
    - shard-hsw:          [TIMEOUT][81] ([i915#1958]) -> [SKIP][82] ([fdo#109271])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1515]: https://gitlab.freedesktop.org/drm/intel/issues/1515
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2258]: https://gitlab.freedesktop.org/drm/intel/issues/2258
  [i915#2278]: https://gitlab.freedesktop.org/drm/intel/issues/2278
  [i915#2344]: https://gitlab.freedesktop.org/drm/intel/issues/2344
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5770 -> IGTPW_4901
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8913: e18d8e120e73feaf39d84afe14f9a7f58b696785 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html
  IGT_5770: f1d0c240ea2e631dfb9f493f37f8fb61cb2b1cf2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html

--===============6870133841509017290==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/core_hotunplug: Fixes and enhancements (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79671/">https://patchwork.freedesktop.org/series/79671/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8913_full -&gt; IGTPW_4901_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4901_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4901_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4901_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk3/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl1/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@core_hotunplug@hotunbind-lateclose} (NEW):</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw8/igt@core_hotunplug@hotunbind-lateclose.html">INCOMPLETE</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb5/igt@gem_exec_flush@basic-uc-rw-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb4/igt@gem_exec_flush@basic-uc-rw-default.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb5/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb3/igt@kms_flip@flip-vs-suspend-interruptible@c-edp1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_8913_full and IGTPW_4901_full:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>Statuses : 4 fail(s) 1 incomplete(s) 1 pass(s)</li>
<li>Exec time: [0.0, 16.20] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-lateclose:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 1.91] s</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>Statuses : 1 incomplete(s) 6 pass(s)</li>
<li>Exec time: [0.0, 1.93] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4901_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@mock@contexts:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@i915_selftest@mock@contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl6/igt@i915_selftest@mock@contexts.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2278">i915#2278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@kms_atomic_interruptible@universal-setplane-cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@kms_atomic_interruptible@universal-setplane-cursor.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk3/igt@kms_flip@2x-plain-flip-fb-recreate@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk8/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-a-overlay-size-256:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@kms_plane_cursor@pipe-a-overlay-size-256.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@kms_psr@psr2_primary_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb6/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_busy@before-wait@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw1/igt@prime_busy@before-wait@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw7/igt@prime_busy@before-wait@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2258">i915#2258</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@bcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb8/igt@gem_exec_endless@dispatch@bcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb5/igt@gem_exec_endless@dispatch@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw7/igt@gem_exec_gttfill@engines@rcs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl4/igt@gem_exec_suspend@basic-s3.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_mmap_offset@blt-coherency}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl4/igt@gem_mmap_offset@blt-coherency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl4/igt@gem_mmap_offset@blt-coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-128x128-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-random.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw1/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-glk3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-glk2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb7/igt@kms_dp_aux_dev.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2344">i915#2344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb6/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1911">i915#1911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb5/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb3/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb2/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb1/igt@perf@polling-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-tglb8/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-concurrent16:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb2/igt@gem_exec_reloc@basic-concurrent16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@gem_exec_reloc@basic-concurrent16.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1515">i915#1515</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-kbl7/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-snb4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-snb5/igt@kms_flip@2x-flip-vs-dpms.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-cpu.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-accuracy-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/shard-hsw4/igt@kms_vblank@pipe-d-accuracy-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5770 -&gt; IGTPW_4901</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8913: e18d8e120e73feaf39d84afe14f9a7f58b696785 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4901: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4901/index.html<br />
  IGT_5770: f1d0c240ea2e631dfb9f493f37f8fb61cb2b1cf2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============6870133841509017290==--

--===============1300916393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1300916393==--
