Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 11 Jun 2020 15:14:36 -0000
Message-ID: <159188847615.22715.306303222137093622@emeril.freedesktop.org>
References: <20200611104208.91381-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200611104208.91381-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Freloc=3A_Verify_engine_isolation?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_reloc: Verify engine isolation
URL   : https://patchwork.freedesktop.org/series/78219/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8616_full -> IGTPW_4666_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4666_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4666_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4666_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_exec_reloc@basic-spin-others@vcs0} (NEW):
    - shard-snb:          NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb5/igt@gem_exec_reloc@basic-spin-others@vcs0.html

  * igt@runner@aborted:
    - shard-tglb:         NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb6/igt@runner@aborted.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8616_full and IGTPW_4666_full:

### New IGT tests (6) ###

  * igt@gem_exec_reloc@basic-spin-others:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_exec_reloc@basic-spin-others@bcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_reloc@basic-spin-others@rcs0:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@gem_exec_reloc@basic-spin-others@vcs0:
    - Statuses : 6 pass(s) 1 warn(s)
    - Exec time: [0.00, 6.30] s

  * igt@gem_exec_reloc@basic-spin-others@vcs1:
    - Statuses : 3 pass(s)
    - Exec time: [0.00] s

  * igt@gem_exec_reloc@basic-spin-others@vecs0:
    - Statuses : 6 pass(s)
    - Exec time: [0.00] s

  

Known issues
------------

  Here are the changes found in IGTPW_4666_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_bad_destroy@invalid-pad:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +39 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl1/igt@gem_ctx_bad_destroy@invalid-pad.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl7/igt@gem_ctx_bad_destroy@invalid-pad.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [PASS][5] -> [DMESG-WARN][6] ([i915#180]) +5 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@replace-hostile@rcs0:
    - shard-tglb:         [PASS][7] -> [DMESG-WARN][8] ([i915#402]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@gem_ctx_persistence@replace-hostile@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb7/igt@gem_ctx_persistence@replace-hostile@rcs0.html

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#95]) +43 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl8/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl7/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12] ([i915#1602])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb2/igt@gem_exec_suspend@basic-s3.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_softpin@noreloc-s3:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#1959])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl6/igt@gem_softpin@noreloc-s3.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl3/igt@gem_softpin@noreloc-s3.html

  * igt@gem_unfence_active_buffers:
    - shard-snb:          [PASS][15] -> [TIMEOUT][16] ([i915#1958]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb5/igt@gem_unfence_active_buffers.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb2/igt@gem_unfence_active_buffers.html
    - shard-hsw:          [PASS][17] -> [TIMEOUT][18] ([i915#1958])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@gem_unfence_active_buffers.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw4/igt@gem_unfence_active_buffers.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][19] -> [DMESG-FAIL][20] ([i915#54] / [i915#95]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-bo:
    - shard-tglb:         [PASS][21] -> [DMESG-WARN][22] ([i915#128])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb8/igt@kms_cursor_legacy@all-pipes-torture-bo.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb3/igt@kms_cursor_legacy@all-pipes-torture-bo.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#1525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#1928])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk4/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-glk9/igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#180] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([i915#95]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl1/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [PASS][37] -> [SKIP][38] ([fdo#109441]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-iclb3/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_vblank@pipe-b-query-idle-hang:
    - shard-apl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl2/igt@kms_vblank@pipe-b-query-idle-hang.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl6/igt@kms_vblank@pipe-b-query-idle-hang.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][41] ([i915#180]) -> [PASS][42] +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_shared@disjoint-timelines:
    - shard-kbl:          [DMESG-WARN][43] ([i915#93] / [i915#95]) -> [PASS][44] +48 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl4/igt@gem_ctx_shared@disjoint-timelines.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl1/igt@gem_ctx_shared@disjoint-timelines.html

  * igt@gem_ctx_shared@q-smoketest@bcs0:
    - shard-tglb:         [INCOMPLETE][45] ([i915#1889]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb8/igt@gem_ctx_shared@q-smoketest@bcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb5/igt@gem_ctx_shared@q-smoketest@bcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][47] ([i915#1930]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_schedule@implicit-read-write@rcs0:
    - shard-snb:          [INCOMPLETE][49] ([i915#82]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@gem_exec_schedule@implicit-read-write@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb2/igt@gem_exec_schedule@implicit-read-write@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][53] ([i915#1436] / [i915#716]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk9/igt@gen9_exec_parse@allowed-all.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-glk8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][55] ([i915#1899]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-iclb8/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][57] ([i915#1519]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw6/igt@i915_pm_rc6_residency@rc6-fence.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_addfb_basic@bad-pitch-32:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@kms_addfb_basic@bad-pitch-32.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw2/igt@kms_addfb_basic@bad-pitch-32.html
    - shard-snb:          [TIMEOUT][61] ([i915#1958]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@kms_addfb_basic@bad-pitch-32.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb4/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@kms_atomic@atomic-invalid-params:
    - shard-apl:          [DMESG-WARN][63] ([i915#95]) -> [PASS][64] +40 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl4/igt@kms_atomic@atomic-invalid-params.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl7/igt@kms_atomic@atomic-invalid-params.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl7/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl8/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][67] ([i915#118] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
    - shard-kbl:          [DMESG-FAIL][69] ([i915#54] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen.html

  * igt@kms_cursor_legacy@all-pipes-torture-move:
    - shard-hsw:          [DMESG-WARN][71] ([i915#128]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw4/igt@kms_cursor_legacy@all-pipes-torture-move.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw8/igt@kms_cursor_legacy@all-pipes-torture-move.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-apl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl6/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf:
    - shard-kbl:          [DMESG-FAIL][75] ([i915#95]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl6/igt@kms_flip_tiling@flip-changes-tiling-yf.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-iclb:         [DMESG-WARN][77] ([i915#1982]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-iclb4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][79] ([i915#433]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [DMESG-FAIL][81] ([i915#95]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-tglb:         [SKIP][83] ([i915#1911]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb3/igt@kms_psr2_su@frontbuffer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb7/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb4/igt@kms_psr@psr2_basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf_pmu@other-init-3:
    - shard-tglb:         [DMESG-WARN][87] ([i915#402]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@perf_pmu@other-init-3.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb3/igt@perf_pmu@other-init-3.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][89] ([i915#588]) -> [SKIP][90] ([i915#658])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [FAIL][91] ([i915#454]) -> [SKIP][92] ([i915#468])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][93] ([i915#1899]) -> [FAIL][94] ([i915#454])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-tglb6/igt@i915_pm_dc@dc6-psr.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@sysfs-reader:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [DMESG-WARN][96] ([i915#93] / [i915#95])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl3/igt@i915_suspend@sysfs-reader.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_busy@basic-flip-pipe-d:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958]) -> [SKIP][98] ([fdo#109271]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@kms_busy@basic-flip-pipe-d.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw4/igt@kms_busy@basic-flip-pipe-d.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][99] ([i915#1319]) -> [TIMEOUT][100] ([i915#1319] / [i915#1958]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@kms_content_protection@atomic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl4/igt@kms_content_protection@atomic.html
    - shard-apl:          [TIMEOUT][101] ([i915#1319]) -> [DMESG-FAIL][102] ([fdo#110321] / [i915#95])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl1/igt@kms_content_protection@atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][103] ([i915#1319] / [i915#1635]) -> [FAIL][104] ([fdo#110321] / [fdo#110336]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl3/igt@kms_content_protection@atomic-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl8/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [FAIL][105] ([fdo#110321]) -> [TIMEOUT][106] ([i915#1319] / [i915#1635])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl4/igt@kms_content_protection@lic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          [DMESG-FAIL][107] ([fdo#110321] / [i915#95]) -> [TIMEOUT][108] ([i915#1319])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-kbl2/igt@kms_content_protection@srm.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-kbl2/igt@kms_content_protection@srm.html
    - shard-apl:          [TIMEOUT][109] ([i915#1319]) -> [FAIL][110] ([fdo#110321])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-apl7/igt@kms_content_protection@srm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb:
    - shard-snb:          [TIMEOUT][111] ([i915#1958]) -> [SKIP][112] ([fdo#109271]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb1/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb6/igt@kms_plane_alpha_blend@pipe-d-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-hsw2/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-hsw4/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html

  * igt@kms_plane_scaling@pipe-b-scaler-with-rotation:
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8616/shard-snb4/igt@kms_plane_scaling@pipe-b-scaler-with-rotation.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/shard-snb2/igt@kms_plane_scaling@pipe-b-scaler-with-rotation.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1889]: https://gitlab.freedesktop.org/drm/intel/issues/1889
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1959]: https://gitlab.freedesktop.org/drm/intel/issues/1959
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5702 -> IGTPW_4666
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8616: 461ce57da4f8793e59534c8c1f57f8a87f40dfbe @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4666: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/index.html
  IGT_5702: d16ad07e7f2a028e14d61f570931c87fa5ce404c @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4666/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
