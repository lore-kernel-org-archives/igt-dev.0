Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 10 Dec 2020 15:33:00 -0000
Message-ID: <160761438036.19120.8043324959138087860@emeril.freedesktop.org>
References: <20201208231617.1346190-1-arundhati.hagaragi@intel.com>
In-Reply-To: <20201208231617.1346190-1-arundhati.hagaragi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fatomic=5Finterruptible=3Aadd_test_description?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1613254567=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arundhati.hagaragi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1613254567==
Content-Type: multipart/alternative;
 boundary="===============5643816055248801453=="

--===============5643816055248801453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_atomic_interruptible:add test description
URL   : https://patchwork.freedesktop.org/series/84777/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9470_full -> IGTPW_5268_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/index.html

Known issues
------------

  Here are the changes found in IGTPW_5268_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@file:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw2/igt@gem_ctx_persistence@file.html

  * igt@gem_exec_whisper@basic-fds:
    - shard-glk:          [PASS][2] -> [DMESG-WARN][3] ([i915#118] / [i915#95])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk4/igt@gem_exec_whisper@basic-fds.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk2/igt@gem_exec_whisper@basic-fds.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][4] -> [FAIL][5] ([i915#454])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-kbl:          [PASS][6] -> [SKIP][7] ([fdo#109271]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-kbl2/igt@i915_pm_rpm@cursor-dpms.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl1/igt@i915_pm_rpm@cursor-dpms.html
    - shard-hsw:          [PASS][8] -> [SKIP][9] ([fdo#109271]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw5/igt@i915_pm_rpm@cursor-dpms.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw2/igt@i915_pm_rpm@cursor-dpms.html
    - shard-glk:          [PASS][10] -> [SKIP][11] ([fdo#109271]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk1/igt@i915_pm_rpm@cursor-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk1/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [PASS][12] -> [SKIP][13] ([i915#579]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb5/igt@i915_pm_rpm@pm-caching.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb1/igt@i915_pm_rpm@pm-caching.html

  * igt@i915_pm_rpm@sysfs-read:
    - shard-iclb:         [PASS][14] -> [SKIP][15] ([i915#579]) +2 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb4/igt@i915_pm_rpm@sysfs-read.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb8/igt@i915_pm_rpm@sysfs-read.html
    - shard-apl:          [PASS][16] -> [SKIP][17] ([fdo#109271]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl6/igt@i915_pm_rpm@sysfs-read.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl6/igt@i915_pm_rpm@sysfs-read.html

  * igt@kms_chamelium@dp-edid-change-during-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][18] ([fdo#109271] / [fdo#111827])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw5/igt@kms_chamelium@dp-edid-change-during-suspend.html

  * igt@kms_color@pipe-b-ctm-max:
    - shard-apl:          [PASS][19] -> [FAIL][20] ([i915#1292])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl1/igt@kms_color@pipe-b-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl1/igt@kms_color@pipe-b-ctm-max.html
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#1292])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl4/igt@kms_color@pipe-b-ctm-max.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109274] / [fdo#109278])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#72])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][27] -> [INCOMPLETE][28] ([i915#2295])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111825]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-hsw:          NOTRUN -> [SKIP][30] ([fdo#109271]) +6 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109280]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#433])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109642] / [fdo#111068])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb1/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +16 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109278])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@testdisplay:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#165] / [i915#180])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-kbl2/igt@testdisplay.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl2/igt@testdisplay.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [DMESG-WARN][43] ([i915#118] / [i915#95]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][45] ([i915#644]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@debugfs-forcewake-user:
    - shard-iclb:         [SKIP][47] ([i915#579]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb2/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-tglb:         [SKIP][49] ([i915#579]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-apl:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl1/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl4/igt@i915_pm_rpm@debugfs-forcewake-user.html
    - shard-glk:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@i915_pm_rpm@debugfs-forcewake-user.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [FAIL][55] ([i915#1119]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk9/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:
    - shard-kbl:          [FAIL][57] ([i915#54]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
    - shard-apl:          [FAIL][59] ([i915#54]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
    - shard-glk:          [FAIL][61] ([i915#54]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html

  * igt@kms_draw_crc@fill-fb:
    - shard-iclb:         [FAIL][63] ([i915#52]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb7/igt@kms_draw_crc@fill-fb.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb1/igt@kms_draw_crc@fill-fb.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][65] ([i915#2055]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [FAIL][67] ([i915#2122]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][71] ([i915#49]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb1/igt@kms_psr@psr2_no_drrs.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-hsw:          [DMESG-WARN][75] ([i915#2637]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-kbl:          [INCOMPLETE][77] ([i915#155]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [DMESG-WARN][79] ([i915#1602]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-apl:          [DMESG-WARN][81] ([i915#1602] / [i915#2635]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-glk:          [DMESG-WARN][83] ([i915#1602] / [i915#2635]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-tglb:         [INCOMPLETE][85] ([i915#1436] / [i915#1602] / [i915#1798] / [i915#1887] / [i915#1982] / [i915#2411] / [i915#456]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf@polling-parameterized:
    - shard-glk:          [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk1/igt@perf@polling-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][89], [FAIL][90]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#2724]) -> [FAIL][91] ([i915#2295] / [i915#2722] / [i915#2724] / [i915#483])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb2/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb4/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][92], [FAIL][93]) ([i915#1814] / [i915#2295] / [i915#2722]) -> [FAIL][94] ([i915#2295] / [i915#2722])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl6/igt@runner@aborted.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl1/igt@runner@aborted.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][95], [FAIL][96]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321]) -> [FAIL][97] ([i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk7/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][98], [FAIL][99]) ([i915#1602] / [i915#2295] / [i915#2722]) -> [FAIL][100] ([i915#2295] / [i915#2722])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb5/igt@runner@aborted.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb3/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb2/igt@runner@aborted.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1292]: https://gitlab.freedesktop.org/drm/intel/issues/1292
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5887 -> IGTPW_5268
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9470: 6896621da6d9d92fe11f715f85eab8e1aa01a02c @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/index.html
  IGT_5887: 7d87d0f1a22544e6a78dc0920b3f54b64144a029 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/index.html

--===============5643816055248801453==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_atomic_interruptible:add test desc=
ription</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84777/">https://patchwork.freedesktop.org/series/84777/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5268/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9470_full -&gt; IGTPW_5268_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5268_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@file:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5268/shard-hsw2/igt@gem_ctx_persistence@file.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk4/igt@gem_exec_whisper@basic-fds.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk2/=
igt@gem_exec_whisper@basic-fds.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb5/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb4/igt@i9=
15_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-kbl2/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl1/igt@=
i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-hsw5/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-hsw2/igt@=
i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-glk1/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk1/igt@=
i915_pm_rpm@cursor-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-tglb5/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb1/ig=
t@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/579">i915#579</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-iclb4/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb8/igt=
@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/579">i915#579</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-apl6/igt@i915_pm_rpm@sysfs-read.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl6/igt@i=
915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5268/shard-hsw5/igt@kms_chamelium@dp-edid-change-during=
-suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-max:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-apl1/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-apl1/igt=
@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1292">i915#1292</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-kbl3/igt@kms_color@pipe-b-ctm-max.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl4/igt=
@kms_color@pipe-b-ctm-max.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1292">i915#1292</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-apl2/igt@kms_cursor_legacy@2x-cursor-vs-flip-=
atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-iclb6/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5268/shard-glk8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72=
">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5268/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5268/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-shrfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-iclb2/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-glk3/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tg=
lb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb1/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-i=
clb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-kbl4/igt@kms_universal_plane@disable-primary-=
vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a>) +16 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5268/shard-iclb2/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-kbl2/igt@testdisplay.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-kbl2/igt@testdisplay=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/165">i915#165</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/180">i915#180</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk8/igt@gem_exec_whisper@basic-contexts-forked.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/11=
8">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5268/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk4/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#64=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268=
/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@debugfs-forcewake-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-iclb2/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268=
/shard-iclb5/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#57=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268=
/shard-tglb3/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-apl1/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
268/shard-apl4/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-glk6/igt@i915_pm_rpm@debugfs-forcewake-user.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
268/shard-glk7/igt@i915_pm_rpm@debugfs-forcewake-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk9/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#11=
19</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_526=
8/shard-glk3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54"=
>i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5268/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html">P=
ASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-apl4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54"=
>i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5268/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html">P=
ASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-glk6/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54"=
>i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5268/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-256x85-onscreen.html">P=
ASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb7/igt@kms_draw_crc@fill-fb.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/52">i915#52</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb1/=
igt@kms_draw_crc@fill-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a1.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2055">i915#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5268/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend@bc-vga1-hdmi-a=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptibl=
e@ab-vga1-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-r=
ecreate-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-hsw2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMP=
LETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
68/shard-hsw6/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-in=
dfb-draw-mmap-cpu.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/49">i915#49</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5268/shard-glk7/igt@kms_frontbuffer_tracking@fbc-2p=
-primscrn-pri-indfb-draw-mmap-cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb1/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5268/shard-hsw1/igt@kms_vblank@pipe-b-ts-continuation-dpms-s=
uspend.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5268/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-sus=
pend.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5268/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-dpms=
-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5268/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-=
dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-glk6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5268/shard-glk4/igt@kms_vblank@pipe-b-ts-continuation-=
dpms-suspend.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9470/shard-tglb3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-tglb6/igt@kms=
_vblank@pipe-b-ts-continuation-dpms-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk1/igt@perf@polling-parameterized.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard=
-glk8/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2724">i915#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-iclb7/igt@runner@aborted.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295"=
>i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5268/shard-apl2/igt@runner@aborted.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i9=
15#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-glk6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kerne=
l.org/show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/shard-glk7/igt@runner@aborted.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/show_=
bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9470/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9470/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5268/shard-tglb2/igt@runner@aborted.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722"=
>i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5887 -&gt; IGTPW_5268</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9470: 6896621da6d9d92fe11f715f85eab8e1aa01a02c @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5268: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5268/index.htm=
l<br />
  IGT_5887: 7d87d0f1a22544e6a78dc0920b3f54b64144a029 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5643816055248801453==--

--===============1613254567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1613254567==--
