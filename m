Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Nov 2020 14:27:52 -0000
Message-ID: <160579607247.18185.15056195226735814178@emeril.freedesktop.org>
References: <20201007060949.3858-1-karthik.b.s@intel.com>
In-Reply-To: <20201007060949.3858-1-karthik.b.s@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Fjoiner=3A_Add_test_to_validate_big_joiner_=28rev5?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0991542434=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0991542434==
Content-Type: multipart/alternative;
 boundary="===============6127700592954556365=="

--===============6127700592954556365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_joiner: Add test to validate big joiner (rev5)
URL   : https://patchwork.freedesktop.org/series/78769/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9359_full -> IGTPW_5193_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5193_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_joiner@basic} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb8/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb5/igt@kms_big_joiner@basic.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9359_full and IGTPW_5193_full:

### New IGT tests (2) ###

  * igt@kms_big_joiner@basic:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_joiner@invalid-modeset:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5193_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][3] -> [FAIL][4] ([i915#2389])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][7] -> [SKIP][8] ([i915#2190])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-kbl:          [PASS][9] -> [SKIP][10] ([fdo#109271]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl7/igt@i915_pm_rpm@fences-dpms.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@i915_pm_rpm@fences-dpms.html
    - shard-glk:          [PASS][11] -> [SKIP][12] ([fdo#109271]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk8/igt@i915_pm_rpm@fences-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk1/igt@i915_pm_rpm@fences-dpms.html
    - shard-apl:          [PASS][13] -> [SKIP][14] ([fdo#109271] / [i915#1635]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl3/igt@i915_pm_rpm@fences-dpms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl8/igt@i915_pm_rpm@fences-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-random:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#54])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#1635] / [i915#54])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#54])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-glk:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2346])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@dpms-off-confusion@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl2/igt@kms_flip@dpms-off-confusion@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl6/igt@kms_flip@dpms-off-confusion@a-dp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#79])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([fdo#109642] / [fdo#111068])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_vblank@pipe-b-query-forked-busy:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#1635] / [i915#1982]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109278])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@perf_pmu@module-unload:
    - shard-iclb:         [PASS][37] -> [DMESG-WARN][38] ([i915#1982] / [i915#262])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb7/igt@perf_pmu@module-unload.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb3/igt@perf_pmu@module-unload.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-glk:          [INCOMPLETE][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [DMESG-WARN][41] ([i915#2635]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-apl:          [INCOMPLETE][43] ([i915#1635] / [i915#2635]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-kbl:          [INCOMPLETE][45] ([i915#794]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [INCOMPLETE][47] ([i915#1373]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_parallel@engines@contexts:
    - shard-iclb:         [INCOMPLETE][49] -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb3/igt@gem_exec_parallel@engines@contexts.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb4/igt@gem_exec_parallel@engines@contexts.html

  * igt@gem_exec_whisper@basic-normal-all:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk6/igt@gem_exec_whisper@basic-normal-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk9/igt@gem_exec_whisper@basic-normal-all.html

  * igt@i915_pm_rpm@cursor:
    - shard-kbl:          [SKIP][53] ([fdo#109271]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@i915_pm_rpm@cursor.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl1/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][55] ([i915#579]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb2/igt@i915_pm_rpm@cursor.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb7/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][57] ([fdo#109271]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@i915_pm_rpm@cursor.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk2/igt@i915_pm_rpm@cursor.html
    - shard-apl:          [SKIP][59] ([fdo#109271] / [i915#1635]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl6/igt@i915_pm_rpm@cursor.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl1/igt@i915_pm_rpm@cursor.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][61] ([i915#1635] / [i915#1982]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [FAIL][65] ([i915#54]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [FAIL][67] ([i915#1635] / [i915#54]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-glk:          [FAIL][69] ([i915#54]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-tglb:         [FAIL][73] ([i915#2346]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][77] ([i915#180]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][79] ([fdo#109441]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-tglb:         [INCOMPLETE][81] -> [DMESG-WARN][82] ([i915#2411])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglb:         [DMESG-WARN][83] ([i915#1436]) -> [DMESG-WARN][84] ([i915#2411])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][85] ([i915#579]) -> [DMESG-WARN][86] ([i915#2411])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@i915_pm_rpm@cursor.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb1/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@fences-dpms:
    - shard-tglb:         [DMESG-WARN][87] ([i915#2411]) -> [SKIP][88] ([i915#579])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb6/igt@i915_pm_rpm@fences-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb8/igt@i915_pm_rpm@fences-dpms.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][89] ([i915#1319] / [i915#1635]) -> [FAIL][90] ([fdo#110321] / [fdo#110336] / [i915#1635])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl7/igt@kms_content_protection@atomic-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][91] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][92] ([i915#2411])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][93] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][94] ([fdo#108145] / [i915#1635] / [i915#1982])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
    - shard-glk:          [FAIL][95] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][96] ([fdo#108145] / [i915#1982])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:
    - shard-tglb:         [DMESG-WARN][97] ([i915#2411]) -> [SKIP][98] ([i915#2648])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][99], [FAIL][100]) ([i915#1436] / [i915#1611] / [i915#2295] / [i915#2439] / [i915#483]) -> [FAIL][101] ([i915#1611] / [i915#2295] / [i915#2439] / [i915#483])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl2/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][102], [FAIL][103], [FAIL][104]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [k.org#202321]) -> [FAIL][105] ([i915#1611] / [i915#2295] / [i915#2439] / [k.org#202321])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk1/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk8/igt@runner@aborted.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][106], [FAIL][107], [FAIL][108]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#402]) -> [FAIL][109] ([i915#2295] / [i915#2439])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2648]: https://gitlab.freedesktop.org/drm/intel/issues/2648
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5858 -> IGTPW_5193
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9359: 5529f30897761dc08c5cfcefc6d1659f9250d622 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/index.html
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/index.html

--===============6127700592954556365==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_joiner: Add test to validate b=
ig joiner (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/78769/">https://patchwork.freedesktop.org/series/78769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5193/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5193/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9359_full -&gt; IGTPW_5193_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5193=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_joiner@basic} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5193/shard-tglb8/igt@kms_big_joiner@basic.html">SKIP</a>=
 +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5193/shard-iclb5/igt@kms_big_joiner@basic.html">SKIP</a>=
 +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9359_full and IGTPW_5193_f=
ull:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5193_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/=
shard-glk3/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk9/igt@gem_exec_whisper@basic-fds-priority-all.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_519=
3/shard-glk1/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#11=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915=
#95</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb6/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl7/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk8/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk1/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl3/igt@i915_pm_rpm@fences-dpms.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-apl8/igt@=
i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1635">i915#1635</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5193/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5193/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#=
1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5193/shard-glk9/igt@kms_cursor_crc@pipe-b-cursor-128x128-random.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5193/shard-glk9/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
93/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl2/igt@kms_flip@dpms-off-confusion@a-dp1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shar=
d-kbl6/igt@kms_flip@dpms-off-confusion@a-dp1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b=
-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5193/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@b-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-i=
ndfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p=
-primscrn-spr-indfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb3/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/sh=
ard-apl2/igt@kms_vblank@pipe-b-query-forked-busy.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb8/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5193/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@module-unload:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb7/igt@perf_pmu@module-unload.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb3/ig=
t@perf_pmu@module-unload.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/262">i915#262</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">IN=
COMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5193/shard-glk6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5193/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5193/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794=
">i915#794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5193/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS<=
/a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-iclb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
73">i915#1373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5193/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">P=
ASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb3/igt@gem_exec_parallel@engines@contexts.html">INCOM=
PLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
193/shard-iclb4/igt@gem_exec_parallel@engines@contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-normal-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk6/igt@gem_exec_whisper@basic-normal-all.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95"=
>i915#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5193/shard-glk9/igt@gem_exec_whisper@basic-normal-all.html">PASS</a> +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl1/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-iclb2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-iclb7/igt=
@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-glk2/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl6/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-=
apl1/igt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">=
i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5193/shard-apl7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS=
</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">=
i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5193/shard-kbl2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5193/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5193/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5193/shard-glk4/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5193/shard-glk5/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
46">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5193/shard-tglb1/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb2/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5193/shard-kbl2/igt@kms_plane@plane-panning-botto=
m-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5193/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
436">i915#1436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5193/shard-tglb3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb1/ig=
t@i915_pm_rpm@cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences-dpms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb6/igt@i915_pm_rpm@fences-dpms.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/s=
hard-tglb8/igt@i915_pm_rpm@fences-dpms.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-apl7/igt@kms_content_protection@atomic-dpms.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">i91=
5#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5193/shard-apl6/igt@kms_content_protection@atomic-dpms.html">FAIL</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110321">fdo#11=
0321</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110336=
">fdo#110336</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1635">i915#1635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5193/shard-tglb3/igt@kms_pipe_crc_basic@suspen=
d-read-crc-pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5193/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic=
.html">DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9359/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">F=
AIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">=
fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/265">i915#265</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5193/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html"=
>DMESG-FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb7/igt@kms_vblank@pipe-b-ts-continuation-modeset-rpm.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5193/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-mode=
set-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2648">i915#2648</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-kbl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/shard-kbl6/igt@runner@aborted.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1611=
">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-glk2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9359/shard-glk8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</=
a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org=
#202321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5193/shard-glk5/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a h=
ref=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</=
a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9359/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9359/shard-tglb2/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9359/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/402">i915#402</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/sh=
ard-tglb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2439">i915#2439</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-snb-2600 pig-glk-j5005 pig-skl-6260u </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5858 -&gt; IGTPW_5193</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9359: 5529f30897761dc08c5cfcefc6d1659f9250d622 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5193: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5193/index.htm=
l<br />
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6127700592954556365==--

--===============0991542434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0991542434==--
