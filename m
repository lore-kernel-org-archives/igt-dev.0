Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 04 Jun 2020 08:19:22 -0000
Message-ID: <159125876266.14554.9209920886824213818@emeril.freedesktop.org>
References: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
In-Reply-To: <20200603210506.17185-1-mohammed.khajapasha@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdC9r?=
 =?utf-8?q?ms=3A_Add_support_for_display_with_non-contiguous_pipes_=28rev3?=
 =?utf-8?q?=29?=
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: test/kms: Add support for display with non-contiguous pipes (rev3)
URL   : https://patchwork.freedesktop.org/series/74431/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8579_full -> IGTPW_4647_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4647_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4647_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4647_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-glk:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk4/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_lease@simple_lease:
    - shard-apl:          [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl3/igt@kms_lease@simple_lease.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl1/igt@kms_lease@simple_lease.html
    - shard-iclb:         [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_lease@simple_lease.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb1/igt@kms_lease@simple_lease.html
    - shard-glk:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@kms_lease@simple_lease.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk1/igt@kms_lease@simple_lease.html
    - shard-hsw:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw1/igt@kms_lease@simple_lease.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-hsw4/igt@kms_lease@simple_lease.html
    - shard-kbl:          [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_lease@simple_lease.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl3/igt@kms_lease@simple_lease.html
    - shard-snb:          [PASS][12] -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-snb4/igt@kms_lease@simple_lease.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-snb4/igt@kms_lease@simple_lease.html
    - shard-tglb:         [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb8/igt@kms_lease@simple_lease.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb2/igt@kms_lease@simple_lease.html

  * {igt@kms_plane_cursor@pipe-invalid-overlay-size-128} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][16] +8 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb5/igt@kms_plane_cursor@pipe-invalid-overlay-size-128.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@pipe-d-forked-move:
    - shard-apl:          [SKIP][17] ([fdo#109271]) -> [FAIL][18] +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl8/igt@kms_cursor_legacy@pipe-d-forked-move.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl8/igt@kms_cursor_legacy@pipe-d-forked-move.html

  * igt@kms_cursor_legacy@pipe-d-single-bo:
    - shard-glk:          [SKIP][19] ([fdo#109271]) -> [FAIL][20] +4 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk2/igt@kms_cursor_legacy@pipe-d-single-bo.html
    - shard-hsw:          [SKIP][21] ([fdo#109271]) -> [FAIL][22] +5 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@kms_cursor_legacy@pipe-d-single-bo.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-hsw1/igt@kms_cursor_legacy@pipe-d-single-bo.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         [SKIP][23] ([fdo#109278] / [fdo#112010]) -> [FAIL][24] +5 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_cursor_legacy@pipe-d-single-move.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb6/igt@kms_cursor_legacy@pipe-d-single-move.html
    - shard-kbl:          [SKIP][25] ([fdo#109271]) -> [FAIL][26] +3 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-move.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl4/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-snb:          [SKIP][27] ([fdo#109271]) -> [FAIL][28] +11 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-snb1/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-snb4/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8579_full and IGTPW_4647_full:

### New IGT tests (9) ###

  * igt@kms_plane_cursor@pipe-invalid-overlay-size-128:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-overlay-size-256:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-overlay-size-64:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-primary-size-128:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-primary-size-256:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-primary-size-64:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-viewport-size-128:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-viewport-size-256:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_cursor@pipe-invalid-viewport-size-64:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_4647_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_whisper@basic-contexts-priority:
    - shard-glk:          [PASS][29] -> [DMESG-WARN][30] ([i915#118] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk8/igt@gem_exec_whisper@basic-contexts-priority.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk4/igt@gem_exec_whisper@basic-contexts-priority.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb1/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_tiled_blits@basic:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#402]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb2/igt@gem_tiled_blits@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb7/igt@gem_tiled_blits@basic.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-apl:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl7/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-glk:          [PASS][37] -> [DMESG-FAIL][38] ([i915#118] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_color@pipe-a-ctm-blue-to-red:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#129])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_color@pipe-a-ctm-blue-to-red.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl1/igt@kms_color@pipe-a-ctm-blue-to-red.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
    - shard-apl:          [PASS][41] -> [DMESG-WARN][42] ([i915#95]) +30 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen:
    - shard-kbl:          [PASS][43] -> [DMESG-FAIL][44] ([i915#54] / [i915#95]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-glk:          [PASS][49] -> [DMESG-FAIL][50] ([i915#1925] / [i915#1926])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@pipe-c-torture-bo:
    - shard-iclb:         [PASS][51] -> [DMESG-WARN][52] ([i915#128])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_cursor_legacy@pipe-c-torture-bo.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb8/igt@kms_cursor_legacy@pipe-c-torture-bo.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-kbl:          [PASS][53] -> [FAIL][54] ([i915#64])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_fbcon_fbt@fbc.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl7/igt@kms_fbcon_fbt@fbc.html
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#1525])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_fbcon_fbt@fbc.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl3/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [PASS][57] -> [DMESG-FAIL][58] ([i915#95]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [PASS][59] -> [DMESG-FAIL][60] ([i915#95])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][63] -> [FAIL][64] ([i915#31])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_setmode@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl8/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-a-query-busy:
    - shard-kbl:          [PASS][65] -> [DMESG-WARN][66] ([i915#93] / [i915#95]) +40 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_vblank@pipe-a-query-busy.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl6/igt@kms_vblank@pipe-a-query-busy.html

  
#### Possible fixes ####

  * {igt@gem_exec_fence@syncobj-channel}:
    - shard-hsw:          [DMESG-WARN][67] ([i915#1927]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@gem_exec_fence@syncobj-channel.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-hsw1/igt@gem_exec_fence@syncobj-channel.html

  * {igt@gem_exec_schedule@implicit-write-read@rcs0}:
    - shard-snb:          [INCOMPLETE][69] ([i915#82]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-snb5/igt@gem_exec_schedule@implicit-write-read@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-snb6/igt@gem_exec_schedule@implicit-write-read@rcs0.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@gem_workarounds@suspend-resume-context.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl3/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [TIMEOUT][73] ([i915#1635]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@i915_suspend@sysfs-reader.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-apl:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-tglb:         [DMESG-WARN][77] ([i915#402]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen:
    - shard-kbl:          [DMESG-FAIL][79] ([i915#54] / [i915#95]) -> [PASS][80] +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge:
    - shard-apl:          [DMESG-WARN][81] ([i915#95]) -> [PASS][82] +32 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl4/igt@kms_cursor_edge_walk@pipe-a-64x64-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][83] ([i915#72]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-a-torture-move:
    - shard-hsw:          [INCOMPLETE][85] ([i915#61]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-hsw4/igt@kms_cursor_legacy@pipe-a-torture-move.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-hsw1/igt@kms_cursor_legacy@pipe-a-torture-move.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-apl:          [DMESG-FAIL][87] ([i915#54] / [i915#95]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1}:
    - shard-kbl:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-tglb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          [FAIL][93] ([i915#49]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-glk:          [FAIL][95] ([i915#49]) -> [PASS][96] +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
    - shard-apl:          [DMESG-FAIL][97] ([i915#49] / [i915#95]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][99] ([i915#1982]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb5/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [SKIP][101] ([fdo#109441]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [DMESG-WARN][103] ([i915#180]) -> [PASS][104] +2 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-modeset-hang:
    - shard-glk:          [INCOMPLETE][105] ([i915#1927] / [i915#58] / [k.org#198133]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk9/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk5/igt@kms_vblank@pipe-c-ts-continuation-modeset-hang.html

  * {igt@perf@blocking-parameterized}:
    - shard-tglb:         [FAIL][107] ([i915#1542]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@perf@blocking-parameterized.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb5/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@rc6-runtime-pm:
    - shard-glk:          [TIMEOUT][109] ([i915#1958]) -> [PASS][110] +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@perf_pmu@rc6-runtime-pm.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html

  * igt@syncobj_wait@invalid-wait-zero-handles:
    - shard-kbl:          [DMESG-WARN][111] ([i915#93] / [i915#95]) -> [PASS][112] +42 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl1/igt@syncobj_wait@invalid-wait-zero-handles.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl1/igt@syncobj_wait@invalid-wait-zero-handles.html

  
#### Warnings ####

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         [SKIP][113] ([fdo#109278] / [fdo#112010] / [i915#1149]) -> [SKIP][114] ([fdo#109278] / [i915#1149]) +9 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb4/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-0-75:
    - shard-tglb:         [FAIL][115] ([i915#1149] / [i915#315]) -> [DMESG-FAIL][116] ([i915#1149] / [i915#402])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb7/igt@kms_color@pipe-d-ctm-0-75.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb1/igt@kms_color@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][117] ([i915#1319] / [i915#1635]) -> [FAIL][118] ([fdo#110321] / [fdo#110336])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_content_protection@atomic.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl7/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][119] ([i915#1319]) -> [TIMEOUT][120] ([i915#1319] / [i915#1635])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_content_protection@atomic-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic:
    - shard-apl:          [TIMEOUT][121] ([i915#1319] / [i915#1635]) -> [DMESG-FAIL][122] ([fdo#110321])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl6/igt@kms_content_protection@lic.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl3/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [FAIL][123] ([fdo#110321]) -> [TIMEOUT][124] ([i915#1319] / [i915#1635])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl2/igt@kms_content_protection@srm.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [DMESG-FAIL][125] ([i915#357] / [i915#95]) -> [FAIL][126] ([i915#357])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl2/igt@kms_content_protection@uevent.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl2/igt@kms_content_protection@uevent.html
    - shard-apl:          [DMESG-FAIL][127] ([i915#357] / [i915#95]) -> [FAIL][128] ([i915#357])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl1/igt@kms_content_protection@uevent.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         [SKIP][129] ([fdo#109279]) -> [SKIP][130] ([fdo#109278] / [fdo#109279]) +26 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         [SKIP][131] ([fdo#109278] / [fdo#112010] / [i915#508]) -> [SKIP][132] ([fdo#109278])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-dpms:
    - shard-iclb:         [SKIP][133] ([fdo#109278] / [fdo#112010]) -> [SKIP][134] ([fdo#109278]) +73 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-dpms.html

  * igt@kms_cursor_legacy@pipe-d-forked-bo:
    - shard-apl:          [SKIP][135] ([fdo#109271]) -> [DMESG-FAIL][136] ([i915#95])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl8/igt@kms_cursor_legacy@pipe-d-forked-bo.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl7/igt@kms_cursor_legacy@pipe-d-forked-bo.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          [SKIP][137] ([fdo#109271]) -> [DMESG-FAIL][138] ([i915#95]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-kbl6/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-yf:
    - shard-tglb:         [SKIP][139] ([fdo#112025] / [fdo#112054]) -> [SKIP][140] ([fdo#112054])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-tglb:         [SKIP][141] ([fdo#111825] / [fdo#112015]) -> [SKIP][142] ([fdo#111825])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-tglb1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-apl:          [TIMEOUT][143] ([i915#1635] / [i915#1640]) -> [SKIP][144] ([fdo#109271])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-apl4/igt@kms_vblank@pipe-d-query-idle-hang.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-apl2/igt@kms_vblank@pipe-d-query-idle-hang.html
    - shard-glk:          [TIMEOUT][145] ([i915#1640] / [i915#1958]) -> [SKIP][146] ([fdo#109271])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8579/shard-glk5/igt@kms_vblank@pipe-d-query-idle-hang.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/shard-glk2/igt@kms_vblank@pipe-d-query-idle-hang.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#112010]: https://bugs.freedesktop.org/show_bug.cgi?id=112010
  [fdo#112015]: https://bugs.freedesktop.org/show_bug.cgi?id=112015
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#128]: https://gitlab.freedesktop.org/drm/intel/issues/128
  [i915#129]: https://gitlab.freedesktop.org/drm/intel/issues/129
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1640]: https://gitlab.freedesktop.org/drm/intel/issues/1640
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1925]: https://g

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4647/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
