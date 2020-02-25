Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 25 Feb 2020 12:19:40 -0000
Message-ID: <158263318040.5722.6077174763648739496@emeril.freedesktop.org>
References: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224092418.1450732-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915/perf=3A_fix_loading_c?=
 =?utf-8?q?onfigurations?=
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] lib/i915/perf: fix loading configurations
URL   : https://patchwork.freedesktop.org/series/73837/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7993_full -> IGTPW_4217_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4217_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4217_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4217_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_hdmi_inject@inject-audio:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl1/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@suspend:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@kms_psr@suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb3/igt@kms_psr@suspend.html

  
#### Warnings ####

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         [SKIP][5] ([fdo#111644]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         [SKIP][7] ([fdo#110892]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_whisper@basic-contexts-forked}:
    - shard-iclb:         [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb7/igt@gem_exec_whisper@basic-contexts-forked.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb8/igt@gem_exec_whisper@basic-contexts-forked.html

  
Known issues
------------

  Here are the changes found in IGTPW_4217_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_parallel@vcs1-fds:
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([fdo#112080]) +11 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb1/igt@gem_exec_parallel@vcs1-fds.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb3/igt@gem_exec_parallel@vcs1-fds.html

  * igt@gem_exec_schedule@pi-shared-iova-bsd:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#677])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb6/igt@gem_exec_schedule@pi-shared-iova-bsd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@gem_exec_schedule@pi-shared-iova-bsd.html

  * igt@gem_exec_schedule@preempt-other-chain-bsd:
    - shard-iclb:         [PASS][15] -> [SKIP][16] ([fdo#112146]) +11 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@gem_exec_schedule@preempt-other-chain-bsd.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@gem_exec_schedule@preempt-other-chain-bsd.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [PASS][17] -> [FAIL][18] ([i915#454])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@i915_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-hsw:          [PASS][19] -> [SKIP][20] ([fdo#109271])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-glk:          [PASS][21] -> [SKIP][22] ([fdo#109271])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-kbl:          [PASS][23] -> [INCOMPLETE][24] ([fdo#103665] / [i915#151])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl1/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_pm_rps@reset:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#413])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb1/igt@i915_pm_rps@reset.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@i915_pm_rps@reset.html

  * igt@kms_color@pipe-c-degamma:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#61])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw7/igt@kms_color@pipe-c-degamma.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw7/igt@kms_color@pipe-c-degamma.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#52] / [i915#54])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk5/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-xtiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-apl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [PASS][33] -> [FAIL][34] ([i915#49])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#668]) +5 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [PASS][37] -> [DMESG-WARN][38] ([i915#180])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][39] -> [SKIP][40] ([fdo#109441])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@prime_vgem@fence-wait-bsd2:
    - shard-iclb:         [PASS][41] -> [SKIP][42] ([fdo#109276]) +11 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb2/igt@prime_vgem@fence-wait-bsd2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb5/igt@prime_vgem@fence-wait-bsd2.html

  * igt@sw_sync@sync_multi_producer_single_consumer:
    - shard-tglb:         [PASS][43] -> [TIMEOUT][44] ([fdo#112271])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb3/igt@sw_sync@sync_multi_producer_single_consumer.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb1/igt@sw_sync@sync_multi_producer_single_consumer.html
    - shard-glk:          [PASS][45] -> [TIMEOUT][46] ([fdo#112271])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk5/igt@sw_sync@sync_multi_producer_single_consumer.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk2/igt@sw_sync@sync_multi_producer_single_consumer.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@exec-shared-gtt-bsd2:
    - shard-tglb:         [FAIL][47] ([i915#616]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb8/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb1/igt@gem_ctx_shared@exec-shared-gtt-bsd2.html

  * igt@gem_exec_async@concurrent-writes-bsd:
    - shard-iclb:         [SKIP][49] ([fdo#112146]) -> [PASS][50] +3 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb1/igt@gem_exec_async@concurrent-writes-bsd.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb3/igt@gem_exec_async@concurrent-writes-bsd.html

  * {igt@gem_exec_schedule@implicit-write-read-bsd2}:
    - shard-iclb:         [SKIP][51] ([fdo#109276] / [i915#677]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb8/igt@gem_exec_schedule@implicit-write-read-bsd2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@gem_exec_schedule@implicit-write-read-bsd2.html

  * {igt@gem_exec_whisper@basic-contexts-forked}:
    - shard-tglb:         [INCOMPLETE][53] -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb3/igt@gem_exec_whisper@basic-contexts-forked.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb3/igt@gem_exec_whisper@basic-contexts-forked.html
    - shard-glk:          [INCOMPLETE][55] ([i915#58] / [k.org#198133]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk3/igt@gem_exec_whisper@basic-contexts-forked.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-tglb:         [FAIL][57] ([i915#644]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb2/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb6/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][59] -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb2/igt@i915_pm_rpm@system-suspend-devices.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-tglb:         [SKIP][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb8/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk7/igt@i915_pm_rpm@system-suspend-devices.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk3/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@waitboost:
    - shard-iclb:         [FAIL][65] ([i915#413]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@i915_pm_rps@waitboost.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb6/igt@i915_pm_rps@waitboost.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen:
    - shard-kbl:          [FAIL][67] ([i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk2/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk5/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
    - shard-apl:          [FAIL][71] ([i915#54]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-onscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][73] ([i915#96]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][75] ([i915#72]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-untiled:
    - shard-hsw:          [FAIL][77] ([i915#54]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw2/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw5/igt@kms_draw_crc@draw-method-rgb565-blt-untiled.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-glk:          [FAIL][79] ([i915#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-glk7/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-glk9/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb6/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][83] ([i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl2/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl7/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][85] ([i915#180]) -> [PASS][86] +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][87] ([fdo#103665]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@blocking:
    - shard-hsw:          [SKIP][89] ([fdo#109271]) -> [PASS][90] +15 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw8/igt@perf@blocking.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw6/igt@perf@blocking.html

  * igt@perf@invalid-open-flags:
    - shard-tglb:         [SKIP][91] ([fdo#112172]) -> [PASS][92] +11 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb5/igt@perf@invalid-open-flags.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb6/igt@perf@invalid-open-flags.html

  * igt@perf@missing-sample-flags:
    - shard-iclb:         [SKIP][93] ([i915#276]) -> [PASS][94] +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb7/igt@perf@missing-sample-flags.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@perf@missing-sample-flags.html

  * igt@perf@rc6-disable:
    - shard-tglb:         [SKIP][95] ([fdo#111719] / [fdo#112172]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb8/igt@perf@rc6-disable.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb8/igt@perf@rc6-disable.html

  * igt@perf_pmu@busy-no-semaphores-vcs1:
    - shard-iclb:         [SKIP][97] ([fdo#112080]) -> [PASS][98] +7 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb8/igt@perf_pmu@busy-no-semaphores-vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb4/igt@perf_pmu@busy-no-semaphores-vcs1.html

  * igt@prime_busy@hang-bsd2:
    - shard-iclb:         [SKIP][99] ([fdo#109276]) -> [PASS][100] +14 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb7/igt@prime_busy@hang-bsd2.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb1/igt@prime_busy@hang-bsd2.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-hsw:          [FAIL][101] ([i915#831]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-hsw6/igt@prime_mmap_coherency@ioctl-errors.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-hsw1/igt@prime_mmap_coherency@ioctl-errors.html

  
#### Warnings ####

  * igt@i915_selftest@live_gt_lrc:
    - shard-tglb:         [INCOMPLETE][103] ([i915#1233]) -> [DMESG-FAIL][104] ([i915#1233])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb5/igt@i915_selftest@live_gt_lrc.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb5/igt@i915_selftest@live_gt_lrc.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][105] ([fdo#112271]) -> [TIMEOUT][106] ([fdo#112271] / [i915#727])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-kbl2/igt@kms_content_protection@legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-kbl1/igt@kms_content_protection@legacy.html

  * igt@perf@unprivileged-single-ctx-counters:
    - shard-iclb:         [SKIP][107] ([i915#276]) -> [SKIP][108] ([fdo#109289]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-iclb5/igt@perf@unprivileged-single-ctx-counters.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-iclb3/igt@perf@unprivileged-single-ctx-counters.html
    - shard-tglb:         [SKIP][109] ([fdo#112172]) -> [SKIP][110] ([fdo#109289]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7993/shard-tglb5/igt@perf@unprivileged-single-ctx-counters.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/shard-tglb8/igt@perf@unprivileged-single-ctx-counters.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103665]: https://bugs.freedesktop.org/show_bug.cgi?id=103665
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111719]: https://bugs.freedesktop.org/show_bug.cgi?id=111719
  [fdo#112080]: https://bugs.freedesktop.org/show_bug.cgi?id=112080
  [fdo#112146]: https://bugs.freedesktop.org/show_bug.cgi?id=112146
  [fdo#112172]: https://bugs.freedesktop.org/show_bug.cgi?id=112172
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#1120]: https://gitlab.freedesktop.org/drm/intel/issues/1120
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#151]: https://gitlab.freedesktop.org/drm/intel/issues/151
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#276]: https://gitlab.freedesktop.org/drm/intel/issues/276
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#413]: https://gitlab.freedesktop.org/drm/intel/issues/413
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#58]: https://gitlab.freedesktop.org/drm/intel/issues/58
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#616]: https://gitlab.freedesktop.org/drm/intel/issues/616
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#668]: https://gitlab.freedesktop.org/drm/intel/issues/668
  [i915#677]: https://gitlab.freedesktop.org/drm/intel/issues/677
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#727]: https://gitlab.freedesktop.org/drm/intel/issues/727
  [i915#831]: https://gitlab.freedesktop.org/drm/intel/issues/831
  [i915#899]: https://gitlab.freedesktop.org/drm/intel/issues/899
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#198133]: https://bugzilla.kernel.org/show_bug.cgi?id=198133


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5459 -> IGTPW_4217
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_7993: db7cdbfad15a4b58edea31e516886081aeab188b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4217: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/index.html
  IGT_5459: ca5337002b52fe115cb871d5146543616fd1f207 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4217/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
