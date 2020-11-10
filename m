Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Nov 2020 13:50:50 -0000
Message-ID: <160501625096.11376.6595277678467325931@emeril.freedesktop.org>
References: <20201110050334.2747067-1-kunal1.joshi@intel.com>
In-Reply-To: <20201110050334.2747067-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcolor=5Fchamelium=3A_time_optimization?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0213370336=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0213370336==
Content-Type: multipart/alternative;
 boundary="===============6784629708470683144=="

--===============6784629708470683144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_color_chamelium: time optimization
URL   : https://patchwork.freedesktop.org/series/83670/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9298_full -> IGTPW_5150_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5150_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5150_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5150_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@gem_caching@read-writes:
    - shard-hsw:          [PASS][3] -> [FAIL][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@gem_caching@read-writes.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_caching@read-writes.html

  * igt@perf_pmu@most-busy-check-all@rcs0:
    - shard-tglb:         [PASS][5] -> [INCOMPLETE][6] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@perf_pmu@most-busy-check-all@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb6/igt@perf_pmu@most-busy-check-all@rcs0.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         [FAIL][7] ([i915#1814]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_5150_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-tglb:         [PASS][9] -> [DMESG-WARN][10] ([i915#1982]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@core_hotunplug@hotunbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb6/igt@core_hotunplug@hotunbind-rebind.html

  * igt@gem_exec_fence@parallel@vecs0:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#1888])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw7/igt@gem_exec_fence@parallel@vecs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_exec_fence@parallel@vecs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-snb:          [PASS][13] -> [INCOMPLETE][14] ([i915#2650])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_partial_pwrite_pread@reads-display:
    - shard-hsw:          [PASS][15] -> [FAIL][16] ([i915#1888] / [i915#2261])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_partial_pwrite_pread@reads-display.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-kbl:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl2/igt@i915_pm_rpm@dpms-non-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@i915_pm_rpm@sysfs-read.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@i915_pm_rpm@sysfs-read.html
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1635]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl7/igt@i915_pm_rpm@sysfs-read.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl4/igt@i915_pm_rpm@sysfs-read.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@i915_pm_rpm@sysfs-read.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk5/igt@i915_pm_rpm@sysfs-read.html
    - shard-hsw:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a:
    - shard-glk:          [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk9/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][31] -> [DMESG-WARN][32] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][33] -> [FAIL][34] ([i915#96])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#2346])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:
    - shard-apl:          [PASS][37] -> [DMESG-WARN][38] ([i915#1635] / [i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-tglb:         [PASS][41] -> [FAIL][42] ([i915#2122])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][43] -> [INCOMPLETE][44] ([i915#155])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
    - shard-apl:          [PASS][45] -> [INCOMPLETE][46] ([i915#1635] / [i915#2635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-iclb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1373])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][49] -> [INCOMPLETE][50] ([i915#2635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-hsw:          [PASS][51] -> [INCOMPLETE][52] ([i915#2055] / [i915#2637])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_lease@page_flip_implicit_plane:
    - shard-kbl:          [PASS][53] -> [DMESG-WARN][54] ([i915#1982])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_lease@page_flip_implicit_plane.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl6/igt@kms_lease@page_flip_implicit_plane.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#165] / [i915#78]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][57] -> [SKIP][58] ([fdo#109642] / [fdo#111068])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][59] -> [SKIP][60] ([fdo#109441])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@perf@create-destroy-userspace-config:
    - shard-glk:          [PASS][61] -> [SKIP][62] ([fdo#109271] / [i915#1354]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@perf@create-destroy-userspace-config.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk3/igt@perf@create-destroy-userspace-config.html
    - shard-apl:          [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl2/igt@perf@create-destroy-userspace-config.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@perf@create-destroy-userspace-config.html
    - shard-tglb:         [PASS][65] -> [SKIP][66] ([i915#1354])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb2/igt@perf@create-destroy-userspace-config.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb8/igt@perf@create-destroy-userspace-config.html
    - shard-kbl:          [PASS][67] -> [SKIP][68] ([fdo#109271] / [i915#1354]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl2/igt@perf@create-destroy-userspace-config.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl7/igt@perf@create-destroy-userspace-config.html
    - shard-iclb:         [PASS][69] -> [SKIP][70] ([i915#1354])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@perf@create-destroy-userspace-config.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@perf@create-destroy-userspace-config.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][71] ([i915#2389]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_rpm@system-suspend-modeset:
    - shard-glk:          [SKIP][73] ([fdo#109271]) -> [PASS][74] +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-iclb:         [SKIP][75] ([i915#579]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html
    - shard-apl:          [SKIP][77] ([fdo#109271] / [i915#1635]) -> [PASS][78] +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-snb:          [FAIL][79] -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [INCOMPLETE][81] ([i915#1635] / [i915#2635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-iclb:         [INCOMPLETE][83] ([i915#1185]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-glk:          [INCOMPLETE][85] ([i915#2635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-hsw:          [INCOMPLETE][87] ([i915#2637]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
    - shard-kbl:          [INCOMPLETE][89] ([i915#155]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:
    - shard-apl:          [DMESG-WARN][91] ([i915#1635] / [i915#1982]) -> [PASS][92] +6 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-hsw:          [FAIL][93] ([i915#96]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-snb:          [FAIL][97] ([i915#2546]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-glk:          [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +7 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-iclb:         [DMESG-WARN][101] ([i915#1982]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-iclb:         [SKIP][103] ([i915#433]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][105] ([fdo#109441]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-hsw:          [INCOMPLETE][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [PASS][110] +6 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-kbl:          [SKIP][111] ([fdo#109271]) -> [PASS][112] +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
    - shard-iclb:         [SKIP][113] ([fdo#109278]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][115] ([i915#1982]) -> [PASS][116] +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl3/igt@kms_vblank@pipe-c-wait-idle.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl3/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@disabled-read-error:
    - shard-glk:          [SKIP][117] ([fdo#109271] / [i915#1354]) -> [PASS][118] +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@perf@disabled-read-error.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk7/igt@perf@disabled-read-error.html
    - shard-apl:          [SKIP][119] ([fdo#109271] / [i915#1354] / [i915#1635]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl7/igt@perf@disabled-read-error.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl3/igt@perf@disabled-read-error.html
    - shard-kbl:          [SKIP][121] ([fdo#109271] / [i915#1354]) -> [PASS][122] +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl7/igt@perf@disabled-read-error.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl6/igt@perf@disabled-read-error.html
    - shard-tglb:         [SKIP][123] ([i915#1354]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb5/igt@perf@disabled-read-error.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@perf@disabled-read-error.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [SKIP][125] ([i915#1354]) -> [PASS][126] +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@perf@invalid-remove-userspace-config.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@perf@invalid-remove-userspace-config.html

  
#### Warnings ####

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         [SKIP][127] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][128] ([i915#579])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         [SKIP][129] ([fdo#110892]) -> [SKIP][130] ([i915#579])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@gem-pread:
    - shard-tglb:         [SKIP][131] ([i915#579]) -> [DMESG-WARN][132] ([i915#2411]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@i915_pm_rpm@gem-pread.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb5/igt@i915_pm_rpm@gem-pread.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-tglb:         [DMESG-WARN][133] ([i915#2411]) -> [SKIP][134] ([i915#579])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb5/igt@i915_pm_rpm@sysfs-read.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-tglb:         [INCOMPLETE][135] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][136] ([i915#2411])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][137] ([i915#2411]) -> [INCOMPLETE][138] ([i915#1436] / [i915#456])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          [FAIL][139] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][140] ([fdo#108145] / [i915#1635] / [i915#1982])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [SKIP][141] ([i915#2648]) -> [DMESG-WARN][142] ([i915#2411]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][143] ([i915#1436] / [i915#456]) -> [DMESG-WARN][144] ([i915#2411])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][145] -> [FAIL][146] ([i915#483])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@runner@aborted.html
    - shard-apl:          [FAIL][147] ([i915#1635] / [i915#1814]) -> [FAIL][148] ([i915#1611] / [i915#1635])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl2/igt@runner@aborted.html
    - shard-glk:          [FAIL][149] ([i915#1814] / [k.org#202321]) -> [FAIL][150] ([i915#1611] / [k.org#202321])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][151], [FAIL][152]) ([i915#1602]) -> [FAIL][153] ([i915#2248])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb3/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2248]: https://gitlab.freedesktop.org/drm/intel/issues/2248
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/index.html

--===============6784629708470683144==
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
<tr><td><b>Series:</b></td><td>tests/kms_color_chamelium: time optimization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83670/">https://patchwork.freedesktop.org/series/83670/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9298_full -&gt; IGTPW_5150_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5150_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5150_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5150_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb7/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb4/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_caching@read-writes:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@gem_caching@read-writes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_caching@read-writes.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-check-all@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@perf_pmu@most-busy-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb6/igt@perf_pmu@most-busy-check-all@rcs0.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5150_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb6/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@parallel@vecs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw7/igt@gem_exec_fence@parallel@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_exec_fence@parallel@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb6/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb5/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#2650])</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-display:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@gem_partial_pwrite_pread@reads-display.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw7/igt@gem_partial_pwrite_pread@reads-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl2/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl7/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl4/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk5/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk6/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk9/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@hdmi-a-1-pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">FAIL</a> ([i915#96])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl4/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl8/igt@kms_draw_crc@draw-method-xrgb2101010-render-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#2635])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> ([i915#2635])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a> / [i915#2637])</li>
</ul>
</li>
<li>
<p>igt@kms_lease@page_flip_implicit_plane:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_lease@page_flip_implicit_plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl6/igt@kms_lease@page_flip_implicit_plane.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl6/igt@kms_plane_lowres@pipe-c-tiling-yf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-yf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / [i915#78]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@create-destroy-userspace-config:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk3/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl2/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb2/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb8/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl2/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl7/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@perf@create-destroy-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb8/igt@perf@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk4/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk3/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@i915_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl8/igt@i915_pm_rpm@system-suspend-modeset.html">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl8/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl3/igt@kms_cursor_edge_walk@pipe-c-256x256-right-edge.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw5/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw6/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +6 similar issues</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl2/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-modeset-rpm.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl3/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl3/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@disabled-read-error:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk4/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl7/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl3/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-kbl7/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-kbl6/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb5/igt@perf@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@perf@disabled-read-error.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb8/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@perf@invalid-remove-userspace-config.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111644">fdo#111644</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a> / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-iclb4/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-pread:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@i915_pm_rpm@gem-pread.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb5/igt@i915_pm_rpm@gem-pread.html">DMESG-WARN</a> ([i915#2411]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb5/igt@i915_pm_rpm@sysfs-read.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#265]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb8/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> ([i915#2648]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-hsw5/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-hsw1/igt@runner@aborted.html">FAIL</a> ([i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-apl6/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-apl2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-glk2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [k.org#202321]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-glk8/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9298/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5150/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2248">i915#2248</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============6784629708470683144==--

--===============0213370336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0213370336==--
