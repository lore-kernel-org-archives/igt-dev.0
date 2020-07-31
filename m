Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 31 Jul 2020 12:58:02 -0000
Message-ID: <159620028256.10474.10673617331331421648@emeril.freedesktop.org>
References: <20200731074839.2028782-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200731074839.2028782-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?feature=5Fdiscovery=3A_Fix_things_spotted_by_GitLab=27s_CI?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0019666558=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0019666558==
Content-Type: multipart/alternative;
 boundary="===============5426223968151685675=="

--===============5426223968151685675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/feature_discovery: Fix things spotted by GitLab's CI
URL   : https://patchwork.freedesktop.org/series/80132/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8820_full -> IGTPW_4833_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4833_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4833_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4833_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@mock@timelines:
    - shard-hsw:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@i915_selftest@mock@timelines.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@feature_discovery@psr2}:
    - shard-iclb:         [PASS][2] -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@feature_discovery@psr2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@feature_discovery@psr2.html

  
Known issues
------------

  Here are the changes found in IGTPW_4833_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dumb_buffer@create-valid-dumb:
    - shard-snb:          [PASS][4] -> [TIMEOUT][5] ([i915#1958] / [i915#2119]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb2/igt@dumb_buffer@create-valid-dumb.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb4/igt@dumb_buffer@create-valid-dumb.html
    - shard-hsw:          [PASS][6] -> [TIMEOUT][7] ([i915#1958] / [i915#2119]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw2/igt@dumb_buffer@create-valid-dumb.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw4/igt@dumb_buffer@create-valid-dumb.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][8] -> [DMESG-WARN][9] ([i915#118] / [i915#95]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk7/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][10] -> [SKIP][11] ([i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#1436] / [i915#716])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#454])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb6/igt@i915_pm_dc@dc6-psr.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][16] -> [DMESG-FAIL][17] ([i915#118] / [i915#95])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-tglb:         [PASS][18] -> [DMESG-WARN][19] ([i915#128])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#1982])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][22] -> [DMESG-WARN][23] ([i915#180]) +8 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-iclb:         [PASS][24] -> [DMESG-WARN][25] ([i915#1982])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [PASS][26] -> [DMESG-WARN][27] ([i915#1982]) +3 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [PASS][28] -> [FAIL][29] ([i915#49])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][30] -> [SKIP][31] ([fdo#109441]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][32] -> [INCOMPLETE][33] ([i915#155])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [PASS][34] -> [FAIL][35] ([i915#1820])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Possible fixes ####

  * igt@drm_read@empty-nonblock:
    - shard-snb:          [TIMEOUT][36] ([i915#1958] / [i915#2119]) -> [PASS][37] +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb1/igt@drm_read@empty-nonblock.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb1/igt@drm_read@empty-nonblock.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][38] ([i915#180]) -> [PASS][39] +4 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl7/igt@gem_eio@in-flight-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl2/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][40] ([i915#1930]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][42] ([i915#1436] / [i915#1635] / [i915#716]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-apl3/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-iclb:         [FAIL][44] ([i915#1899]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@i915_pm_dc@dc5-psr.html
    - shard-tglb:         [FAIL][46] ([i915#1899]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@i915_pm_dc@dc5-psr.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb2/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][48] ([i915#1519]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][50] ([i915#118] / [i915#95]) -> [PASS][51] +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
    - shard-hsw:          [TIMEOUT][52] ([i915#1958] / [i915#2119]) -> [PASS][53] +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [INCOMPLETE][56] ([i915#155]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-tglb:         [DMESG-WARN][58] ([i915#1982]) -> [PASS][59] +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][60] ([fdo#109441]) -> [PASS][61] +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-hsw:          [SKIP][62] ([fdo#109271]) -> [TIMEOUT][63] ([i915#1958] / [i915#2119]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
    - shard-snb:          [SKIP][64] ([fdo#109271]) -> [TIMEOUT][65] ([i915#1958] / [i915#2119]) +3 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
    - shard-snb:          [TIMEOUT][66] ([i915#1958] / [i915#2119]) -> [SKIP][67] ([fdo#109271]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
    - shard-hsw:          [TIMEOUT][68] ([i915#1958] / [i915#2119]) -> [SKIP][69] ([fdo#109271])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][70], [FAIL][71]) ([fdo#109271] / [i915#1635] / [i915#2110] / [i915#716]) -> [FAIL][72] ([i915#1635] / [i915#2110])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl6/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl4/igt@runner@aborted.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5753 -> IGTPW_4833
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8820: e5171a77612f7e9de647afc839f8ad1c42fda128 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html
  IGT_5753: d80bd02632e8a91389c58c601b3ebce8e6c924d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html

--===============5426223968151685675==
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
<tr><td><b>Series:</b></td><td>tests/feature_discovery: Fix things spotted by GitLab&#39;s CI</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/80132/">https://patchwork.freedesktop.org/series/80132/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8820_full -&gt; IGTPW_4833_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4833_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4833_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4833_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@mock@timelines:<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@i915_selftest@mock@timelines.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@feature_discovery@psr2}:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@feature_discovery@psr2.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4833_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@dumb_buffer@create-valid-dumb:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb2/igt@dumb_buffer@create-valid-dumb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb4/igt@dumb_buffer@create-valid-dumb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw2/igt@dumb_buffer@create-valid-dumb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw4/igt@dumb_buffer@create-valid-dumb.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk7/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-torture-bo:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb1/igt@kms_cursor_legacy@pipe-c-torture-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/128">i915#128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk3/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl4/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1820">i915#1820</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_read@empty-nonblock:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb1/igt@drm_read@empty-nonblock.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb1/igt@drm_read@empty-nonblock.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl7/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl2/igt@gem_eio@in-flight-suspend.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk8/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl4/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-apl3/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb6/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb6/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb1/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1899">i915#1899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb2/igt@i915_pm_dc@dc5-psr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-glk9/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-badstride:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-snb1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-hsw6/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-badstride.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8820/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/shard-apl8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2110">i915#2110</a>)</li>
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
<li>IGT: IGT_5753 -&gt; IGTPW_4833</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8820: e5171a77612f7e9de647afc839f8ad1c42fda128 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4833: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4833/index.html<br />
  IGT_5753: d80bd02632e8a91389c58c601b3ebce8e6c924d3 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============5426223968151685675==--

--===============0019666558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0019666558==--
