Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 23 Oct 2020 02:46:02 -0000
Message-ID: <160342116299.1405.324614752786297465@emeril.freedesktop.org>
References: <20201023010552.39117-1-ashutosh.dixit@intel.com>
In-Reply-To: <20201023010552.39117-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBz?=
 =?utf-8?q?ync_i915=5Fpciids=2Eh_with_kernel_=28rev7=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2137181487=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2137181487==
Content-Type: multipart/alternative;
 boundary="===============3714832210251966682=="

--===============3714832210251966682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: sync i915_pciids.h with kernel (rev7)
URL   : https://patchwork.freedesktop.org/series/50957/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9187_full -> IGTPW_5086_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5086_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5086_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5086_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html

  * igt@kms_color@pipe-a-ctm-0-25:
    - shard-hsw:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@kms_color@pipe-a-ctm-0-25.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw7/igt@kms_color@pipe-a-ctm-0-25.html

  
Known issues
------------

  Here are the changes found in IGTPW_5086_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-snb:          [PASS][5] -> [FAIL][6] ([i915#2389])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:
    - shard-snb:          [PASS][7] -> [INCOMPLETE][8] ([i915#82])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#1888]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-kbl:          [PASS][11] -> [TIMEOUT][12] ([i915#1288])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
    - shard-apl:          [PASS][13] -> [TIMEOUT][14] ([i915#1288] / [i915#1635])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#180])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl1/igt@i915_suspend@sysfs-reader.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1635] / [i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-kbl:          [PASS][19] -> [DMESG-WARN][20] ([i915#78])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +6 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#49])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([fdo#109441]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [INCOMPLETE][29] ([i915#82]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][31] ([i915#1635] / [i915#2389]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-forked-all:
    - shard-glk:          [DMESG-WARN][33] ([i915#118] / [i915#95]) -> [PASS][34] +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html

  * igt@gem_exec_whisper@basic-queues-priority-all:
    - shard-glk:          [FAIL][35] ([i915#1888]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@gem_exec_whisper@basic-queues-priority-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [INCOMPLETE][37] ([i915#155]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl2/igt@i915_suspend@debugfs-reader.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@i915_suspend@debugfs-reader.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-glk:          [FAIL][39] ([i915#2521]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-apl:          [DMESG-WARN][41] ([i915#1635] / [i915#1982]) -> [PASS][42] +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][43] ([i915#180]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-glk:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-apl:          [FAIL][47] ([i915#1635] / [i915#54]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][49] ([i915#54]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_flip@blocking-wf_vblank@a-edp1:
    - shard-tglb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-glk:          [DMESG-WARN][53] ([i915#1982]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][55] ([fdo#109441]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
    - shard-kbl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html

  * igt@perf@polling:
    - shard-glk:          [SKIP][59] ([fdo#109271] / [i915#1354]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@perf@polling.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk2/igt@perf@polling.html
    - shard-tglb:         [SKIP][61] ([i915#1354]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb3/igt@perf@polling.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb7/igt@perf@polling.html
    - shard-apl:          [SKIP][63] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl7/igt@perf@polling.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl2/igt@perf@polling.html
    - shard-kbl:          [SKIP][65] ([fdo#109271] / [i915#1354]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl6/igt@perf@polling.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@perf@polling.html
    - shard-hsw:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@perf@polling.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw7/igt@perf@polling.html
    - shard-iclb:         [SKIP][69] ([i915#1354]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb2/igt@perf@polling.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb7/igt@perf@polling.html

  * igt@prime_vgem@coherency-blt:
    - shard-hsw:          [FAIL][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@prime_vgem@coherency-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw8/igt@prime_vgem@coherency-blt.html

  
#### Warnings ####

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [DMESG-WARN][73] ([i915#2411]) -> [INCOMPLETE][74] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][75] ([fdo#109349]) -> [DMESG-WARN][76] ([i915#1226])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-tglb:         [DMESG-WARN][77] ([i915#1982] / [i915#2411]) -> [DMESG-WARN][78] ([i915#2411])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1288]: https://gitlab.freedesktop.org/drm/intel/issues/1288
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5822 -> IGTPW_5086
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9187: e11ff28a7d8e3881b55292f504ed63372167b591 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5086: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html

--===============3714832210251966682==
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
<tr><td><b>Series:</b></td><td>lib: sync i915_pciids.h with kernel (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/50957/">https://patchwork.freedesktop.org/series/50957/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9187_full -&gt; IGTPW_5086_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5086_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5086_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5086_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@kms_color@pipe-a-ctm-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw7/igt@kms_color@pipe-a-ctm-0-25.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5086_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb5/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb4/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@uc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw6/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw2/igt@gem_userptr_blits@map-fixed-invalidate-busy-gup@wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl3/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1288">i915#1288</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl1/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl4/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/78">i915#78</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb3/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-snb5/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk6/igt@gem_exec_whisper@basic-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk2/igt@gem_exec_whisper@basic-forked-all.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@gem_exec_whisper@basic-queues-priority-all.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk7/igt@gem_exec_whisper@basic-queues-priority-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl2/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk7/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk9/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb2/igt@kms_flip@blocking-wf_vblank@a-edp1.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl4/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl2/igt@kms_universal_plane@universal-plane-gen9-features-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-glk5/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-glk2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb3/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb7/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-apl7/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-apl2/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-kbl6/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-kbl6/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@perf@polling.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw7/igt@perf@polling.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb2/igt@perf@polling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb7/igt@perf@polling.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-hsw1/igt@prime_vgem@coherency-blt.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-hsw8/igt@prime_vgem@coherency-blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-iclb6/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109349">fdo#109349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9187/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
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
<li>IGT: IGT_5822 -&gt; IGTPW_5086</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9187: e11ff28a7d8e3881b55292f504ed63372167b591 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5086: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5086/index.html<br />
  IGT_5822: b4bcf05cb9839037128905deda7146434155cc41 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3714832210251966682==--

--===============2137181487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2137181487==--
