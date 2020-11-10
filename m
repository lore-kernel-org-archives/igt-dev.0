Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 10 Nov 2020 21:00:29 -0000
Message-ID: <160504202961.11377.15512245026409986583@emeril.freedesktop.org>
References: <20201110155608.89946-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201110155608.89946-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?api=5Fintel=5Fbb=3A_Verify_delta_is_properly_added_in_emit_relo?=
 =?utf-8?q?cation_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1867629221=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1867629221==
Content-Type: multipart/alternative;
 boundary="===============4233453849512109604=="

--===============4233453849512109604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/api_intel_bb: Verify delta is properly added in emit relocation (rev3)
URL   : https://patchwork.freedesktop.org/series/83678/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9302_full -> IGTPW_5154_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5154_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5154_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5154_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@delta-check} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk9/igt@api_intel_bb@delta-check.html
    - shard-iclb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb8/igt@api_intel_bb@delta-check.html
    - shard-tglb:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb3/igt@api_intel_bb@delta-check.html
    - shard-kbl:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@api_intel_bb@delta-check.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@render:
    - shard-iclb:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-hostile@render.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-hostile@render.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@vebox:
    - shard-tglb:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html

  * igt@kms_flip@basic-plain-flip@a-vga1:
    - shard-hsw:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@kms_flip@basic-plain-flip@a-vga1.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw7/igt@kms_flip@basic-plain-flip@a-vga1.html

  * igt@prime_mmap_coherency@ioctl-errors:
    - shard-snb:          [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-snb6/igt@prime_mmap_coherency@ioctl-errors.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-snb2/igt@prime_mmap_coherency@ioctl-errors.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9302_full and IGTPW_5154_full:

### New IGT tests (2) ###

  * igt@api_intel_bb@delta-check:
    - Statuses : 5 fail(s) 2 skip(s)
    - Exec time: [0.0, 0.15] s

  * igt@sysfs_defaults@readonly:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5154_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][13] -> [FAIL][14] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-kbl:          [PASS][17] -> [SKIP][18] ([fdo#109271]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#579])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-apl:          [PASS][21] -> [SKIP][22] ([fdo#109271] / [i915#1635]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][25] -> [INCOMPLETE][26] ([i915#1635] / [i915#2635])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1185])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-kbl:          [PASS][29] -> [INCOMPLETE][30] ([i915#155] / [i915#794])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-glk:          [PASS][31] -> [INCOMPLETE][32] ([i915#2199] / [i915#2635])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +6 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:
    - shard-kbl:          [PASS][35] -> [FAIL][36] ([i915#54])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1635] / [i915#54])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-hsw:          [PASS][39] -> [FAIL][40] ([i915#96]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:
    - shard-glk:          [PASS][41] -> [DMESG-WARN][42] ([i915#1982]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#52] / [i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][45] -> [DMESG-WARN][46] ([i915#1982]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw5/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-fences@a-dp1:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1635] / [i915#1982]) +4 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][49] -> [FAIL][50] ([i915#49])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-tglb:         [PASS][51] -> [DMESG-WARN][52] ([i915#1982]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html

  * igt@perf@buffer-fill:
    - shard-hsw:          [PASS][55] -> [SKIP][56] ([fdo#109271]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw2/igt@perf@buffer-fill.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@perf@buffer-fill.html
    - shard-kbl:          [PASS][57] -> [SKIP][58] ([fdo#109271] / [i915#1354]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl3/igt@perf@buffer-fill.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@perf@buffer-fill.html
    - shard-tglb:         [PASS][59] -> [SKIP][60] ([i915#1354]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@perf@buffer-fill.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@perf@buffer-fill.html
    - shard-apl:          [PASS][61] -> [SKIP][62] ([fdo#109271] / [i915#1354] / [i915#1635]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@perf@buffer-fill.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@perf@buffer-fill.html
    - shard-glk:          [PASS][63] -> [SKIP][64] ([fdo#109271] / [i915#1354]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk7/igt@perf@buffer-fill.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@perf@buffer-fill.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-iclb:         [PASS][65] -> [SKIP][66] ([i915#1354]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@perf@invalid-remove-userspace-config.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb1/igt@perf@invalid-remove-userspace-config.html

  
#### Possible fixes ####

  * igt@gem_create@create-clear:
    - shard-snb:          [INCOMPLETE][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-snb6/igt@gem_create@create-clear.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-snb6/igt@gem_create@create-clear.html

  * igt@gem_ctx_persistence@replace@vcs0:
    - shard-tglb:         [INCOMPLETE][69] ([i915#2473]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@gem_ctx_persistence@replace@vcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@gem_ctx_persistence@replace@vcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-iclb:         [INCOMPLETE][71] ([i915#1394]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb5/igt@gem_exec_whisper@basic-fds-priority.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb4/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][73] ([i915#118] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@gem_exec_whisper@basic-normal-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][75] ([i915#2190]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [SKIP][77] ([i915#579]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@i915_pm_rpm@system-suspend-devices.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-kbl:          [SKIP][79] ([fdo#109271]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl6/igt@i915_pm_rpm@system-suspend-devices.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl1/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-hsw:          [SKIP][81] ([fdo#109271]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-glk:          [SKIP][83] ([fdo#109271]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk1/igt@i915_pm_rpm@system-suspend-devices.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-apl:          [SKIP][85] ([fdo#109271] / [i915#1635]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@i915_pm_rpm@system-suspend-devices.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl3/igt@i915_pm_rpm@system-suspend-devices.html

  * {igt@kms_async_flips@async-flip-with-page-flip-events}:
    - shard-tglb:         [FAIL][87] ([i915#2521]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-apl:          [DMESG-WARN][89] ([i915#1635] / [i915#1982]) -> [PASS][90] +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_dp_aux_dev:
    - shard-iclb:         [DMESG-FAIL][91] -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@kms_dp_aux_dev.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb3/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][93] ([i915#1982]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw7/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw2/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
    - shard-kbl:          [DMESG-WARN][95] ([i915#1982]) -> [PASS][96] +7 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][97] ([i915#2598]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [INCOMPLETE][99] ([i915#1635] / [i915#2635]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-iclb:         [INCOMPLETE][101] ([i915#1373]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-glk:          [INCOMPLETE][103] ([i915#2635]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-hsw:          [INCOMPLETE][105] ([i915#2055] / [i915#2637]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [DMESG-WARN][107] ([i915#1982]) -> [PASS][108] +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
    - shard-iclb:         [DMESG-WARN][109] ([i915#1982]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][111] ([fdo#109642] / [fdo#111068]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@kms_psr2_su@page_flip.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][113] ([fdo#109441]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-c-wait-forked-busy:
    - shard-glk:          [DMESG-WARN][115] ([i915#1982]) -> [PASS][116] +4 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk1/igt@kms_vblank@pipe-c-wait-forked-busy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk9/igt@kms_vblank@pipe-c-wait-forked-busy.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-hsw:          [FAIL][117] ([i915#2644]) -> [WARN][118] ([i915#2283])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@core_hotunplug@hotrebind-lateclose.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-tglb:         [DMESG-WARN][119] ([i915#2411]) -> [SKIP][120] ([i915#579])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         [SKIP][121] ([fdo#110892]) -> [SKIP][122] ([i915#579])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         [SKIP][123] ([i915#579]) -> [SKIP][124] ([fdo#109293] / [fdo#109506])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         [SKIP][125] ([i915#579]) -> [SKIP][126] ([fdo#109506] / [i915#2411])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-tglb:         [SKIP][127] ([i915#579]) -> [DMESG-WARN][128] ([i915#2411])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-tglb:         [DMESG-WARN][129] ([i915#2411]) -> [INCOMPLETE][130] ([i915#1436] / [i915#456])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [INCOMPLETE][131] ([i915#1436] / [i915#456]) -> [DMESG-WARN][132] ([i915#2411])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          [FAIL][133] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][134] ([fdo#108145] / [i915#1982])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
    - shard-apl:          [FAIL][135] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][136] ([fdo#108145] / [i915#1635] / [i915#1982])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:
    - shard-tglb:         [DMESG-WARN][137] ([i915#2411]) -> [SKIP][138] ([i915#2648])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [DMESG-WARN][139] ([i915#2411]) -> [DMESG-WARN][140] ([i915#1436])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][141] -> [FAIL][142] ([i915#2505])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw5/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][143], [FAIL][144], [FAIL][145]) ([i915#2439] / [i915#483] / [i915#788]) -> ([FAIL][146], [FAIL][147]) ([i915#2439] / [i915#483])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@runner@aborted.html
    - shard-glk:          ([FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1611] / [i915#1814] / [i915#2439] / [k.org#202321]) -> ([FAIL][151], [FAIL][152]) ([i915#1611] / [i915#2439] / [k.org#202321])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk8/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk4/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk6/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][153], [FAIL][154], [FAIL][155]) ([i915#2248] / [i915#2426] / [i915#2439]) -> ([FAIL][156], [FAIL][157], [FAIL][158]) ([i915#1602] / [i915#2439])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1354]: https://gitlab.freedesktop.org/drm/intel/issues/1354
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1394]: https://gitlab.freedesktop.org/drm/intel/issues/1394
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: http

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/index.html

--===============4233453849512109604==
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
<tr><td><b>Series:</b></td><td>tests/api_intel_bb: Verify delta is properly added in emit relocation (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83678/">https://patchwork.freedesktop.org/series/83678/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9302_full -&gt; IGTPW_5154_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5154_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5154_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5154_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@api_intel_bb@delta-check} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk9/igt@api_intel_bb@delta-check.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb8/igt@api_intel_bb@delta-check.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb3/igt@api_intel_bb@delta-check.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@api_intel_bb@delta-check.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb3/igt@gem_ctx_persistence@legacy-engines-hostile@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@gem_ctx_persistence@legacy-engines-hostile@render.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@vebox:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb6/igt@gem_ctx_persistence@legacy-engines-hostile@vebox.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@kms_flip@basic-plain-flip@a-vga1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw7/igt@kms_flip@basic-plain-flip@a-vga1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@prime_mmap_coherency@ioctl-errors:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-snb6/igt@prime_mmap_coherency@ioctl-errors.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-snb2/igt@prime_mmap_coherency@ioctl-errors.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9302_full and IGTPW_5154_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>Statuses : 5 fail(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.15] s</li>
</ul>
</li>
<li>
<p>igt@sysfs_defaults@readonly:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5154_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#2635])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / [i915#794])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> ([i915#2199] / [i915#2635])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-256x85-sliding.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">FAIL</a> ([i915#96]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-untiled.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_draw_crc@draw-method-xrgb8888-render-xtiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw5/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@kms_flip@2x-flip-vs-panning-vs-hang@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="http">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb8/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw2/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl3/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk7/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@perf@buffer-fill.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-remove-userspace-config:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@perf@invalid-remove-userspace-config.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb1/igt@perf@invalid-remove-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1354">i915#1354</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-snb6/igt@gem_create@create-clear.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-snb6/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@replace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@gem_ctx_persistence@replace@vcs0.html">INCOMPLETE</a> ([i915#2473]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@gem_ctx_persistence@replace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb5/igt@gem_exec_whisper@basic-fds-priority.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1394">i915#1394</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb4/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk3/igt@gem_exec_whisper@basic-normal-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@gem_exec_whisper@basic-normal-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl6/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl1/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw1/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw8/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk1/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk6/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl4/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl3/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html">FAIL</a> ([i915#2521]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@kms_dp_aux_dev.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb3/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw7/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw2/igt@kms_flip@2x-flip-vs-panning@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> ([i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk2/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">INCOMPLETE</a> ([i915#2055] / [i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-stridechange.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb8/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-busy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk1/igt@kms_vblank@pipe-c-wait-forked-busy.html">DMESG-WARN</a> (<a href="http">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk9/igt@kms_vblank@pipe-c-wait-forked-busy.html">PASS</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@core_hotunplug@hotrebind-lateclose.html">FAIL</a> ([i915#2644]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw4/igt@core_hotunplug@hotrebind-lateclose.html">WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb1/igt@i915_pm_rpm@debugfs-forcewake-user.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a> / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb5/igt@i915_pm_rpm@system-suspend-devices.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb3/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">DMESG-WARN</a> ([i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="http">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / [i915#265]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-apl1/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="http">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@kms_vblank@pipe-a-ts-continuation-dpms-rpm.html">SKIP</a> ([i915#2648])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-hsw8/igt@runner@aborted.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-hsw5/igt@runner@aborted.html">FAIL</a> ([i915#2505])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#2439] / [i915#483] / [i915#788]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-iclb5/igt@runner@aborted.html">FAIL</a>) ([i915#2439] / [i915#483])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-glk6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2439] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-glk8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / [i915#2439] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9302/shard-tglb7/igt@runner@aborted.html">FAIL</a>) ([i915#2248] / [i915#2426] / [i915#2439]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5154/shard-tglb1/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2439])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============4233453849512109604==--

--===============1867629221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1867629221==--
