Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 27 Nov 2020 12:38:41 -0000
Message-ID: <160648072133.26782.2241540175593507872@emeril.freedesktop.org>
References: <20201127082834.26930-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201127082834.26930-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHBy?=
 =?utf-8?q?etty-name_for_lsgpu_and_intel-gpu-top?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1091716736=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1091716736==
Content-Type: multipart/alternative;
 boundary="===============1983993618166280449=="

--===============1983993618166280449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add pretty-name for lsgpu and intel-gpu-top
URL   : https://patchwork.freedesktop.org/series/84318/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9396_full -> IGTPW_5232_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/index.html

Known issues
------------

  Here are the changes found in IGTPW_5232_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][1] -> [SKIP][2] ([i915#2190])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-hsw:          [PASS][3] -> [SKIP][4] ([fdo#109271]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw1/igt@i915_pm_rpm@fences-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw6/igt@i915_pm_rpm@fences-dpms.html
    - shard-glk:          [PASS][5] -> [SKIP][6] ([fdo#109271]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk2/igt@i915_pm_rpm@fences-dpms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk2/igt@i915_pm_rpm@fences-dpms.html
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl2/igt@i915_pm_rpm@fences-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl7/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#579]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][11] -> [FAIL][12] ([i915#2370]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#1982]) +9 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#79])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl3/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html

  * igt@kms_flip@flip-vs-fences@a-dp1:
    - shard-apl:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl1/igt@kms_flip@flip-vs-fences@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-snb:          [PASS][21] -> [DMESG-WARN][22] ([i915#42])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-glk:          [PASS][23] -> [INCOMPLETE][24] ([i915#2635])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-apl:          [PASS][25] -> [INCOMPLETE][26] ([i915#2635])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-iclb:         [PASS][27] -> [INCOMPLETE][28] ([i915#1185] / [i915#250])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
    - shard-hsw:          [PASS][29] -> [DMESG-WARN][30] ([i915#2637])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109441]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb8/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@prime_self_import@basic-with_one_bo_two_files:
    - shard-iclb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb8/igt@prime_self_import@basic-with_one_bo_two_files.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb6/igt@prime_self_import@basic-with_one_bo_two_files.html

  
#### Possible fixes ####

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [DMESG-WARN][35] ([i915#118] / [i915#95]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@i915_pm_dc@dc5-dpms:
    - shard-iclb:         [FAIL][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb7/igt@i915_pm_dc@dc5-dpms.html
    - shard-glk:          [FAIL][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@i915_pm_dc@dc5-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk8/igt@i915_pm_dc@dc5-dpms.html
    - shard-apl:          [FAIL][41] -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@i915_pm_dc@dc5-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl8/igt@i915_pm_dc@dc5-dpms.html
    - shard-tglb:         [FAIL][43] -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@i915_pm_dc@dc5-dpms.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb1/igt@i915_pm_dc@dc5-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-iclb:         [SKIP][45] ([i915#579]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb8/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
    - shard-hsw:          [DMESG-WARN][47] ([i915#1982]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-hsw:          [DMESG-FAIL][49] ([i915#1982]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][51] ([i915#2346]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:
    - shard-glk:          [FAIL][53] ([i915#79]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][55] ([i915#2295]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-a:
    - shard-glk:          [DMESG-WARN][59] ([i915#1982]) -> [PASS][60] +5 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][61] ([fdo#109441]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-glk:          [DMESG-WARN][63] ([i915#2635]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [INCOMPLETE][65] ([i915#2635]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-hsw:          [INCOMPLETE][67] ([i915#2637]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-iclb:         [INCOMPLETE][69] ([fdo#111764] / [i915#1078] / [i915#1185]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@perf_pmu@module-unload:
    - shard-tglb:         [DMESG-WARN][71] ([i915#1982] / [i915#262]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@perf_pmu@module-unload.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb2/igt@perf_pmu@module-unload.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][73] ([i915#658]) -> [SKIP][74] ([i915#588])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-tglb:         [DMESG-WARN][75] ([i915#2411]) -> [SKIP][76] ([i915#579]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb6/igt@i915_pm_rpm@fences-dpms.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb3/igt@i915_pm_rpm@fences-dpms.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-tglb:         [SKIP][77] ([i915#579]) -> [DMESG-WARN][78] ([i915#2411])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb3/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][79] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][80] ([i915#2411])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][81], [FAIL][82], [FAIL][83]) ([fdo#109271] / [i915#1814] / [i915#2295] / [i915#2722] / [i915#716]) -> ([FAIL][84], [FAIL][85]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#62])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl8/igt@runner@aborted.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@runner@aborted.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl1/igt@runner@aborted.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl3/igt@runner@aborted.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][86], [FAIL][87]) ([i915#1602] / [i915#2295] / [i915#2722]) -> [FAIL][88] ([i915#2295] / [i915#2722])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb3/igt@runner@aborted.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb8/igt@runner@aborted.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [i915#1078]: https://gitlab.freedesktop.org/drm/intel/issues/1078
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#250]: https://gitlab.freedesktop.org/drm/intel/issues/250
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#2722]: https://gitlab.freedesktop.org/drm/intel/issues/2722
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5872 -> IGTPW_5232
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9396: c5b0dff321fdead6daece5e91275c8436c15cf03 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5232: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/index.html
  IGT_5872: d8ebb937c76184d5e526c59a2c18abca1c7a03c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/index.html

--===============1983993618166280449==
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
<tr><td><b>Series:</b></td><td>Add pretty-name for lsgpu and intel-gpu-top<=
/td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84318/">https://patchwork.freedesktop.org/series/84318/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5232/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5232/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9396_full -&gt; IGTPW_5232_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5232_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-hsw1/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-hsw6/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk2/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk2/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl2/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl7/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/sh=
ard-iclb8/igt@i915_pm_rpm@system-suspend-execbuf.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
2/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i915#2370</a=
>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5232/shard-glk9/igt@kms_cursor_legacy@cursora-vs-fl=
ipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +9 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl7/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/=
shard-apl3/igt@kms_flip@flip-vs-expired-vblank@a-dp1.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl4/igt@kms_flip@flip-vs-fences@a-dp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-ap=
l1/igt@kms_flip@flip-vs-fences@a-dp1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5232/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-stridechange.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5232/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42">i9=
15#42</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5232/shard-glk2/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5232/shard-apl3/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5232/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-s=
uspend-pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1185">i915#1185</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/250">i915#250</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5232/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-sus=
pend-pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/2637">i915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-i=
clb8/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@prime_self_import@basic-with_one_bo_two_files:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb8/igt@prime_self_import@basic-with_one_bo_two_files.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5232/shard-iclb6/igt@prime_self_import@basic-with_one_bo_two_files.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk7/igt@gem_exec_whisper@basic-contexts-forked-all.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/95">i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5232/shard-glk2/igt@gem_exec_whisper@basic-contexts-forked-all.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-iclb7/igt@i9=
15_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-glk8/igt@i915=
_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl4/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl8/igt@i915=
_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-tglb7/igt@i915_pm_dc@dc5-dpms.html">FAIL</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tglb1/igt@i9=
15_pm_dc@dc5-dpms.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb5/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-ic=
lb8/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw6/igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5232/shard-hsw1/igt@kms_cursor_edge_walk@pipe-c-256x256-bo=
ttom-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5232/shard-hsw6/igt@kms_cursor_legacy@2x-long-cursor-vs-fl=
ip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5232/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-varying-siz=
e.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i=
915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5232/shard-glk5/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a2.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2295">i915#2295</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5232/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptibl=
e@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5232/shard-apl3/igt@kms_flip@flip-vs-wf_vblank-interruptibl=
e@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-a:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-glk2/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5232/shard-glk8/igt@kms_pipe_crc_basic@read-crc-pipe-a.html">PASS</a> +=
5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/=
shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-glk7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5232/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-apl8/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5232/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2637">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5232/shard-hsw4/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9396/shard-iclb1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111764">fdo#111764</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1078">i915#1078</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1185">i915#1185</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5232/shard-iclb1/igt@kms_vblank@pipe-c-ts-continua=
tion-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@perf_pmu@module-unload.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/262">i915#2=
62</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_523=
2/shard-tglb2/igt@perf_pmu@module-unload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/s=
hard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb6/igt@i915_pm_rpm@fences-dpms.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/s=
hard-tglb3/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb7/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-tg=
lb3/igt@i915_pm_rpm@modeset-lpsp.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5232/shard-tglb6/igt@kms_vblank@pipe-c-ts-conti=
nuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-apl4/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9396/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#=
716</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
232/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5232/shard-apl4/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">=
i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/62">i915#62</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9396/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9396/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2722">i915#2722</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5232/shard-tglb5/igt@runner@aborted.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722"=
>i915#2722</a>)</p>
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
<li>IGT: IGT_5872 -&gt; IGTPW_5232</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9396: c5b0dff321fdead6daece5e91275c8436c15cf03 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5232: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5232/index.htm=
l<br />
  IGT_5872: d8ebb937c76184d5e526c59a2c18abca1c7a03c1 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============1983993618166280449==--

--===============1091716736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1091716736==--
