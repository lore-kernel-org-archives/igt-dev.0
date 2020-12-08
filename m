Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 08 Dec 2020 06:41:36 -0000
Message-ID: <160740969647.9599.10953949602979450485@emeril.freedesktop.org>
References: <20201208050325.27791-1-arjun.melkaveri@intel.com>
In-Reply-To: <20201208050325.27791-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgZ2VtX3No?=
 =?utf-8?q?rink=3ARemoved_gem=5Fmappable=5Faperture=5Fsize_and_initialize_?=
 =?utf-8?q?alloc_size_to_128_MiB?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1407709883=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1407709883==
Content-Type: multipart/alternative;
 boundary="===============5814434156461894579=="

--===============5814434156461894579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gem_shrink:Removed gem_mappable_aperture_size and initialize alloc size to 128 MiB
URL   : https://patchwork.freedesktop.org/series/84659/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9457_full -> IGTPW_5257_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5257_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5257_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5257_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
    - shard-iclb:         [PASS][3] -> [DMESG-WARN][4] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_5257_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-queues-forked:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk8/igt@gem_exec_whisper@basic-queues-forked.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk2/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [PASS][11] -> [SKIP][12] ([i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-hsw:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [PASS][17] -> [SKIP][18] ([i915#579])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-iclb:         [PASS][19] -> [INCOMPLETE][20] ([i915#1185])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2346])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][23] -> [INCOMPLETE][24] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-glk:          [PASS][25] -> [DMESG-WARN][26] ([i915#2635]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#2635]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#2637]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109441]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb6/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@suspend:
    - shard-tglb:         [PASS][35] -> [DMESG-WARN][36] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb1/igt@kms_psr@suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb6/igt@kms_psr@suspend.html

  
#### Possible fixes ####

  * {igt@gem_ctx_exec@basic-close-race}:
    - shard-kbl:          [INCOMPLETE][37] ([i915#2245]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl1/igt@gem_ctx_exec@basic-close-race.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl3/igt@gem_ctx_exec@basic-close-race.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][39] ([i915#2190]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@hang:
    - shard-snb:          [INCOMPLETE][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-snb7/igt@gem_mmap_gtt@hang.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-snb5/igt@gem_mmap_gtt@hang.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][43] ([i915#54]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][45] ([i915#54]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:
    - shard-kbl:          [FAIL][47] ([i915#2346]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][49] ([i915#2346]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][51] ([i915#2055]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1:
    - shard-kbl:          [DMESG-WARN][53] ([i915#180] / [i915#78]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl2/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][55] ([i915#2055] / [i915#2295]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][57] ([i915#433]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-hsw:          [DMESG-WARN][59] ([i915#2637]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][63] -> [FAIL][64] ([i915#454])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][65] ([i915#2295] / [i915#483]) -> ([FAIL][66], [FAIL][67]) ([fdo#109271] / [i915#2295])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-hsw1/igt@runner@aborted.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw8/igt@runner@aborted.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          [FAIL][68] ([i915#2295] / [i915#2722]) -> ([FAIL][69], [FAIL][70], [FAIL][71]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-kbl7/igt@runner@aborted.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@runner@aborted.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@runner@aborted.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         [FAIL][72] ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][73], [FAIL][74], [FAIL][75]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-iclb8/igt@runner@aborted.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb1/igt@runner@aborted.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb3/igt@runner@aborted.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          [FAIL][76] ([i915#2295] / [i915#2722]) -> ([FAIL][77], [FAIL][78], [FAIL][79], [FAIL][80]) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2722])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-apl7/igt@runner@aborted.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl2/igt@runner@aborted.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl1/igt@runner@aborted.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl1/igt@runner@aborted.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][81], [FAIL][82]) ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][83], [FAIL][84], [FAIL][85], [FAIL][86]) ([i915#1814] / [i915#2295] / [i915#2722] / [k.org#202321])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk7/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk2/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk8/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk5/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk2/igt@runner@aborted.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][87], [FAIL][88]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][89], [FAIL][90], [FAIL][91]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2722])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb5/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb6/igt@runner@aborted.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb8/igt@runner@aborted.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb7/igt@runner@aborted.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2245]: https://gitlab.freedesktop.org/drm/intel/issues/2245
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#78]: https://gitlab.freedesktop.org/drm/intel/issues/78
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5884 -> IGTPW_5257
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9457: 2faca88cd21a5c168974051516a9c1685f47ce6d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5257: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/index.html
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/index.html

--===============5814434156461894579==
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
<tr><td><b>Series:</b></td><td>gem_shrink:Removed gem_mappable_aperture_siz=
e and initialize alloc size to 128 MiB</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84659/">https://patchwork.freedesktop.org/series/84659/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5257/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5257/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9457_full -&gt; IGTPW_5257_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5257_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5257_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5257=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/sh=
ard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> +1 s=
imilar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-iclb1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/s=
hard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> +1=
 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5257_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-glk6/igt@gem_exec_whisper@basic-queues-forked.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/s=
hard-glk8/igt@gem_exec_whisper@basic-queues-forked.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a=
>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-gl=
k2/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-apl6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-ap=
l1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-t=
glb7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-kbl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kb=
l7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-hsw8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hs=
w8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-i=
clb1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/=
shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_52=
57/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-tglb8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5257/shard-tglb7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436"=
>i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-glk8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
257/shard-glk2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
257/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>) +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
257/shard-hsw8/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i=
915#2637</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb6/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-i=
clb6/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb1/igt@kms_psr@suspend.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb6/igt@kms=
_psr@suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race}:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-kbl1/igt@gem_ctx_exec@basic-close-race.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2245">i915#=
2245</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
257/shard-kbl3/igt@gem_ctx_exec@basic-close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-tg=
lb1/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@hang:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-snb7/igt@gem_mmap_gtt@hang.html">INCOMPLETE</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-snb5/igt=
@gem_mmap_gtt@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5257/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS<=
/a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5257/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomic:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-kbl1/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-atomi=
c.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5257/shard-kbl6/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-a=
tomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">=
i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5257/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-hsw1/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vg=
a1-hdmi-a1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2055">i915#2055</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5257/shard-hsw2/igt@kms_flip@2x-flip-vs-suspend-=
interruptible@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-kbl2/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/78">i915#78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5257/shard-kbl1/igt@kms_flip@flip-vs-blocking-wf-vblank@b-dp1.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">=
i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5257/shard-hsw4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shar=
d-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-hsw1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5257/shard-hsw6/igt@kms_plane@plane-panning-bot=
tom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_525=
7/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/igt@i91=
5_pm_dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-hsw1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-hsw8/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5257/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-kbl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5257/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-iclb8/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-=
iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5257/shard-iclb3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-iclb7=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9457/shard-apl7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5257/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-apl1/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5257/shard-apl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#229=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i9=
15#2722</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show=
_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-=
glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5257/shard-glk2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-glk1/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://bugz=
illa.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9457/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9457/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5257/shard-tglb8/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/shard-=
tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5257/shard-tglb6/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i9=
15#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5884 -&gt; IGTPW_5257</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9457: 2faca88cd21a5c168974051516a9c1685f47ce6d @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5257: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5257/index.htm=
l<br />
  IGT_5884: b1015a3267bbccb985b2fa7e3accb778c7bff0ed @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5814434156461894579==--

--===============1407709883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1407709883==--
