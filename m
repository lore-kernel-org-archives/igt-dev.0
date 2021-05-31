Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 31 May 2021 14:39:13 -0000
Message-ID: <162247195371.27954.17071598955203307426@emeril.freedesktop.org>
References: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgRml4dXAg?=
 =?utf-8?q?clang_compiler_warnings=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0569331157=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0569331157==
Content-Type: multipart/alternative;
 boundary="===============6236970984217247408=="

--===============6236970984217247408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixup clang compiler warnings.
URL   : https://patchwork.freedesktop.org/series/90784/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10152_full -> IGTPW_5865_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5865_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5865_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5865_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  
Known issues
------------

  Here are the changes found in IGTPW_5865_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][2] ([i915#3002])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl2/igt@gem_create@create-massive.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][3] ([i915#180]) +6 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb2/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#280])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][6] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][7] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][8] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-sync@rcs0:
    - shard-kbl:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271]) +254 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109283])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb7/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109283])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-apl:          NOTRUN -> [FAIL][14] ([i915#2389]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_whisper@basic-normal:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk1/igt@gem_exec_whisper@basic-normal.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_exec_whisper@basic-normal.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][17] ([i915#2055])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-tglb:         [PASS][18] -> [INCOMPLETE][19] ([i915#3468])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2428])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_mmap_gtt@fault-concurrent:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][22] ([i915#3468]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@gem_mmap_gtt@fault-concurrent.html

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          NOTRUN -> [INCOMPLETE][23] ([i915#3468])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html

  * igt@gem_mmap_offset@clear:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#3160])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk7/igt@gem_mmap_offset@clear.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_mmap_offset@clear.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][26] ([i915#2658])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +166 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#768]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#3297])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#3297])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_vm_create@destroy-race:
    - shard-tglb:         [PASS][31] -> [TIMEOUT][32] ([i915#2795])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb3/igt@gem_vm_create@destroy-race.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@gem_vm_create@destroy-race.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109289]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109289]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#112306])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#112306])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@shadow-peek:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#2856])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#2856])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][39] ([i915#454])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#1937])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111644] / [i915#1397] / [i915#2411])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110892])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109303])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109303])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([fdo#111614])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#110725] / [fdo#111614])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110723])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111615]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#2705])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_big_joiner@basic.html
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#2705])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#2705])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_big_joiner@basic.html
    - shard-glk:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#2705])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb8/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278] / [i915#1149])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][61] ([i915#1319])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109279] / [i915#3359]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#3319]) +4 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][66] ([i915#3444])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3359]) +3 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109274]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-kbl:          NOTRUN -> [FAIL][72] ([i915#79])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [PASS][73] -> [DMESG-WARN][74] ([i915#180])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-apl7/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2672])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#2642])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109285])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109285])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109280]) +13 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111825]) +24 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271]) +80 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#1187])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@kms_hdr@static-toggle-suspend.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#1187])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#533])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#533])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][86] ([i915#265])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          NOTRUN -> [FAIL][87] ([fdo#108145] / [i915#265])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-apl:          NOTRUN -> [FAIL][88] ([fdo#108145] / [i915#265])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-kbl:          NOTRUN -> [FAIL][89] ([fdo#108145] / [i915#265]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109278]) +20 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2733])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#658]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#658]) +5 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][97] -> [SKIP][98] ([fdo#109642] / [fdo#111068] / [i915#658])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][99] -> [SKIP][100] ([fdo#109441]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109441])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html
    - shard-tglb:         NOTRUN -> [FAIL][102] ([i915#132] / [i915#3467])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][103] ([IGT#2])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flip-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109502])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_vrr@flip-suspend.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109502])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-check-output:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#2437])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_writeback@writeback-check-output.html
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#2437])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_writeback@writeback-check-output.html
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#2437])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_writeback@writeback-check-output.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2437])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([i915#2530]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2530]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271]) +200 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109291])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([fdo#109291])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#2994]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@sysfs_clients@fair-1.html
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#2994])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@pidname:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([i915#2994])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@sysfs_clients@pidname.html
    - shard-glk:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#2994])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][119] ([i915#2369] / [i915#3063]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][121] ([i915#2842]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][123] ([i915#2842]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [FAIL][125] ([i915#2849]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-glk:          [INCOMPLETE][127] ([i915#2055] / [i915#3468]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
    - shard-iclb:         [INCOMPLETE][129] ([i915#3468]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [DMESG-WARN][131] ([i915#180]) -> [PASS][132] +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl4/igt@gem_softpin@noreloc-s3.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_softpin@noreloc-s3.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [SKIP][133] ([fdo#109441]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html

  
#### Warnings ####

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-snb:          [INCOMPLETE][135] ([i915#2055]) -> [INCOMPLETE][136] ([i915#2055] / [i915#3468])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][137] ([i915#658]) -> [SKIP][138] ([i915#588])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_selftest@live@execlists:
    - shard-tglb:         [INCOMPLETE][1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/index.html

--===============6236970984217247408==
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
<tr><td><b>Series:</b></td><td>Fixup clang compiler warnings.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90784/">https://patchwork.freedesktop.org/series/90784/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10152_full -&gt; IGTPW_5865_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5865_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5865_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5865_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_lowres@pipe-c-tiling-yf:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb3/igt@kms_plane_lowres@pipe-c-tiling-yf.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5865_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl2/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb2/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html">SKIP</a> ([fdo#109271]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109271]) +254 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb7/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk1/igt@gem_exec_whisper@basic-normal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_exec_whisper@basic-normal.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb5/igt@gem_mmap_gtt@cpuset-basic-small-copy.html">INCOMPLETE</a> ([i915#2055])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@gem_mmap_gtt@fault-concurrent.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-y:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb6/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> ([i915#3468])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk7/igt@gem_mmap_offset@clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk9/igt@gem_mmap_offset@clear.html">FAIL</a> ([i915#3160])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +166 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb6/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@destroy-race:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb3/igt@gem_vm_create@destroy-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@gem_vm_create@destroy-race.html">TIMEOUT</a> ([i915#2795])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@shadow-peek:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gen9_exec_parse@shadow-peek.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_big_joiner@basic.html">SKIP</a> ([fdo#109271] / [i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb8/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_color@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_color_chamelium@pipe-b-gamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x256-onscreen.html">FAIL</a> ([i915#3444])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-max-size-onscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb7/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> ([fdo#109274]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-apl7/igt@kms_flip@flip-vs-suspend@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb3/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#111825]) +24 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +80 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl3/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html">SKIP</a> ([fdo#109278]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#109271] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@kms_psr@psr2_primary_mmap_cpu.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_vrr@flip-suspend.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk4/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb2/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +200 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb6/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-apl7/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@sysfs_clients@pidname.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#2055] / [i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-glk8/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb2/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb4/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-kbl4/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-kbl4/igt@gem_softpin@noreloc-s3.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-snb6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-snb7/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#2055] / [i915#3468])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10152/shard-iclb8/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5865/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-tglb:         [INCOMPLETE][1</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6236970984217247408==--

--===============0569331157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0569331157==--
