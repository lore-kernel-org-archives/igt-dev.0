Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 12 Oct 2020 18:12:27 -0000
Message-ID: <160252634796.31911.9857190921167001852@emeril.freedesktop.org>
References: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20201012123900.485289-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4IGln?=
 =?utf-8?q?t_tests_to_cope_with_ww_changes=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0348355047=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0348355047==
Content-Type: multipart/alternative;
 boundary="===============2736453628359757845=="

--===============2736453628359757845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix igt tests to cope with ww changes.
URL   : https://patchwork.freedesktop.org/series/82574/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9129_full -> IGTPW_5058_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5058_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5058_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5058_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-hsw:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_eio@in-flight-contexts-10ms.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw5/igt@gem_eio@in-flight-contexts-10ms.html

  
Known issues
------------

  Here are the changes found in IGTPW_5058_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts:
    - shard-glk:          [PASS][3] -> [DMESG-WARN][4] ([i915#118] / [i915#95]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk6/igt@gem_exec_whisper@basic-contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk6/igt@gem_exec_whisper@basic-contexts.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-apl:          [PASS][5] -> [FAIL][6] ([i915#1635] / [i915#644])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#2541])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          [PASS][9] -> [INCOMPLETE][10] ([CI#80] / [i915#155])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#1119])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#64])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][15] -> [DMESG-WARN][16] ([i915#1982]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl7/igt@kms_flip_tiling@flip-x-tiled.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-iclb:         [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][23] -> [SKIP][24] ([fdo#109642] / [fdo#111068])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][25] -> [SKIP][26] ([fdo#109441])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html

  
#### Possible fixes ####

  * {igt@core_hotunplug@hotrebind-lateclose}:
    - shard-snb:          [INCOMPLETE][27] ([i915#82]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html

  * {igt@gem_exec_capture@pi@vcs0}:
    - shard-apl:          [INCOMPLETE][29] ([i915#1635]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl3/igt@gem_exec_capture@pi@vcs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@gem_exec_capture@pi@vcs0.html

  * {igt@gem_exec_capture@pi@vecs0}:
    - shard-iclb:         [INCOMPLETE][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb1/igt@gem_exec_capture@pi@vecs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb7/igt@gem_exec_capture@pi@vecs0.html

  * igt@gem_exec_reloc@basic-many-active@bcs0:
    - shard-snb:          [FAIL][33] ([i915#2389]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb7/igt@gem_exec_reloc@basic-many-active@bcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb7/igt@gem_exec_reloc@basic-many-active@bcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-apl:          [FAIL][35] ([i915#1635] / [i915#2389]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-tglb:         [FAIL][37] ([i915#2389]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-glk:          [FAIL][39] ([i915#2389]) -> [PASS][40] +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-hsw:          [FAIL][41] ([i915#2389]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html
    - shard-iclb:         [FAIL][43] ([i915#2389]) -> [PASS][44] +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-kbl:          [FAIL][45] ([i915#2389]) -> [PASS][46] +4 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_partial_pwrite_pread@reads:
    - shard-hsw:          [FAIL][47] ([i915#1888] / [i915#2261]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw8/igt@gem_partial_pwrite_pread@reads.html

  * igt@gem_partial_pwrite_pread@writes-after-reads:
    - shard-hsw:          [FAIL][49] ([i915#2261]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html

  * igt@gem_reg_read@timestamp-monotonic:
    - shard-iclb:         [DMESG-WARN][51] ([i915#1982]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@gem_reg_read@timestamp-monotonic.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@gem_reg_read@timestamp-monotonic.html

  * igt@gem_render_copy@y-tiled:
    - shard-glk:          [FAIL][53] ([i915#2541]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@y-tiled.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@gem_render_copy@y-tiled.html
    - shard-apl:          [FAIL][55] ([i915#1635] / [i915#2541]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@gem_render_copy@y-tiled.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@gem_render_copy@y-tiled.html
    - shard-kbl:          [FAIL][57] ([i915#2541]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@y-tiled.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl2/igt@gem_render_copy@y-tiled.html
    - shard-hsw:          [FAIL][59] ([i915#2541]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_render_copy@y-tiled.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw7/igt@gem_render_copy@y-tiled.html
    - shard-iclb:         [FAIL][61] ([i915#2541]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb3/igt@gem_render_copy@y-tiled.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@gem_render_copy@y-tiled.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-tglb:         [FAIL][63] ([i915#2541]) -> [PASS][64] +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [INCOMPLETE][65] ([i915#155] / [i915#794]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [INCOMPLETE][67] ([i915#155]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@i915_suspend@sysfs-reader.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * {igt@kms_async_flips@alternate-sync-async-flip}:
    - shard-kbl:          [FAIL][69] ([i915#2521]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@kms_async_flips@alternate-sync-async-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-hsw:          [INCOMPLETE][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-apl:          [DMESG-WARN][73] ([i915#1635] / [i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][75] ([i915#433]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [DMESG-WARN][77] ([i915#118] / [i915#95]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         [DMESG-WARN][79] ([i915#1226]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb4/igt@kms_plane_lowres@pipe-a-tiling-y.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         [SKIP][81] ([fdo#109441]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][83] ([i915#1635] / [i915#31]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl4/igt@kms_setmode@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl3/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-wait-idle:
    - shard-kbl:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html
    - shard-tglb:         [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb5/igt@kms_vblank@pipe-c-wait-idle.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb3/igt@kms_vblank@pipe-c-wait-idle.html

  * igt@perf@invalid-oa-exponent:
    - shard-hsw:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw1/igt@perf@invalid-oa-exponent.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw4/igt@perf@invalid-oa-exponent.html
    - shard-iclb:         [SKIP][91] ([i915#405]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb5/igt@perf@invalid-oa-exponent.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@perf@invalid-oa-exponent.html
    - shard-glk:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk4/igt@perf@invalid-oa-exponent.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk4/igt@perf@invalid-oa-exponent.html
    - shard-tglb:         [SKIP][95] ([i915#405]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb2/igt@perf@invalid-oa-exponent.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb1/igt@perf@invalid-oa-exponent.html
    - shard-apl:          [SKIP][97] ([fdo#109271] / [i915#1635]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl7/igt@perf@invalid-oa-exponent.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@perf@invalid-oa-exponent.html
    - shard-kbl:          [SKIP][99] ([fdo#109271]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@perf@invalid-oa-exponent.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl7/igt@perf@invalid-oa-exponent.html

  
#### Warnings ####

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-hsw:          [FAIL][101] ([i915#2541]) -> [SKIP][102] ([fdo#109271])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-kbl:          [FAIL][103] ([i915#2541]) -> [SKIP][104] ([fdo#109271])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-apl:          [FAIL][105] ([i915#1635] / [i915#2541]) -> [SKIP][106] ([fdo#109271] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-iclb:         [FAIL][107] ([i915#2541]) -> [SKIP][108] ([i915#768])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
    - shard-glk:          [FAIL][109] ([i915#2541]) -> [SKIP][110] ([fdo#109271])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
    - shard-hsw:          [SKIP][111] ([fdo#109271]) -> [FAIL][112] ([i915#2541])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
    - shard-glk:          [SKIP][113] ([fdo#109271]) -> [FAIL][114] ([i915#2541])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
    - shard-apl:          [SKIP][115] ([fdo#109271] / [i915#1635]) -> [FAIL][116] ([i915#1635] / [i915#2541])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         [SKIP][117] ([i915#768]) -> [FAIL][118] ([i915#2541])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
    - shard-snb:          [SKIP][119] ([fdo#109271]) -> [FAIL][120] ([i915#2541])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb6/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
    - shard-kbl:          [SKIP][121] ([fdo#109271]) -> [FAIL][122] ([i915#2541])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2261]: https://gitlab.freedesktop.org/drm/intel/issues/2261
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2541]: https://gitlab.freedesktop.org/drm/intel/issues/2541
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#405]: https://gitlab.freedesktop.org/drm/intel/issues/405
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5810 -> IGTPW_5058
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9129: 4b6af251b88acefd229f6c81b0672343e051cf61 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5058: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html
  IGT_5810: f78ce760920efb5015725c749f411c5724114bda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html

--===============2736453628359757845==
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
<tr><td><b>Series:</b></td><td>Fix igt tests to cope with ww changes.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/82574/">https://patchwork.freedesktop.org/series/82574/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9129_full -&gt; IGTPW_5058_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5058_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5058_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5058_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_eio@in-flight-contexts-10ms:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw5/igt@gem_eio@in-flight-contexts-10ms.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5058_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk6/igt@gem_exec_whisper@basic-contexts.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk6/igt@gem_exec_whisper@basic-contexts.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl6/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl2/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/644">i915#644</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1119">i915#1119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/64">i915#64</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl7/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl6/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@kms_frontbuffer_tracking@fbc-badstride.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk1/igt@kms_frontbuffer_tracking@fbc-badstride.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb8/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@core_hotunplug@hotrebind-lateclose}:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb6/igt@core_hotunplug@hotrebind-lateclose.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/82">i915#82</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb2/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl3/igt@gem_exec_capture@pi@vcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@gem_exec_capture@pi@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@pi@vecs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb1/igt@gem_exec_capture@pi@vecs0.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb7/igt@gem_exec_capture@pi@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@bcs0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb7/igt@gem_exec_reloc@basic-many-active@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb7/igt@gem_exec_reloc@basic-many-active@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw2/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb7/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_exec_reloc@basic-many-active@vcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_partial_pwrite_pread@reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw8/igt@gem_partial_pwrite_pread@reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@writes-after-reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_partial_pwrite_pread@writes-after-reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2261">i915#2261</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw8/igt@gem_partial_pwrite_pread@writes-after-reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_reg_read@timestamp-monotonic:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb2/igt@gem_reg_read@timestamp-monotonic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@gem_reg_read@timestamp-monotonic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl2/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw7/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb3/igt@gem_render_copy@y-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@gem_render_copy@y-tiled.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/794">i915#794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl7/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@alternate-sync-async-flip}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2521">i915#2521</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw5/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk4/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk5/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb4/igt@kms_plane_lowres@pipe-a-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb4/igt@kms_psr@psr2_cursor_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb2/igt@kms_psr@psr2_cursor_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl3/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl2/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl4/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb5/igt@kms_vblank@pipe-c-wait-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb3/igt@kms_vblank@pipe-c-wait-idle.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf@invalid-oa-exponent:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw1/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw4/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb5/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb3/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk4/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk4/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-tglb2/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/405">i915#405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-tglb1/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl7/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl6/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl6/igt@perf@invalid-oa-exponent.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl7/igt@perf@invalid-oa-exponent.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw7/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl8/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl1/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb3/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-hsw7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-hsw1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-glk2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-glk2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-apl7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-apl7/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/768">i915#768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-snb6/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-snb2/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9129/shard-kbl1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/shard-kbl1/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2541">i915#2541</a>)</p>
</li>
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
<li>IGT: IGT_5810 -&gt; IGTPW_5058</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9129: 4b6af251b88acefd229f6c81b0672343e051cf61 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5058: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5058/index.html<br />
  IGT_5810: f78ce760920efb5015725c749f411c5724114bda @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============2736453628359757845==--

--===============0348355047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0348355047==--
