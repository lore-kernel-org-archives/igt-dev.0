Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Apr 2021 13:37:34 -0000
Message-ID: <161944425461.18666.1211472582128805849@emeril.freedesktop.org>
References: <20210426093206.9182-1-kunal1.joshi@intel.com>
In-Reply-To: <20210426093206.9182-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgVGVzdCB0?=
 =?utf-8?q?iled_display_with_aid_of_chamelium=2E=5D?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0484539599=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0484539599==
Content-Type: multipart/alternative;
 boundary="===============3465283964972156070=="

--===============3465283964972156070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Test tiled display with aid of chamelium.]
URL   : https://patchwork.freedesktop.org/series/89477/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10006_full -> IGTPW_5763_full
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_5763_full need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5763_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5763_full:

### IGT changes ###

#### Warnings ####

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         [SKIP][1] ([i915#426]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         [SKIP][3] ([i915#426]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10006_full and IGTPW_5763_full:

### New IGT tests (1) ###

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5763_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][5] ([i915#3002])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb3/igt@gem_create@create-massive.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][6] ([i915#3002])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-snb6/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][7] ([i915#3002])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][8] ([i915#3002])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb1/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][9] ([i915#3002])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [PASS][11] -> [FAIL][12] ([i915#2410])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb1/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][13] -> [TIMEOUT][14] ([i915#2369] / [i915#2481] / [i915#3070])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2846])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][24] -> [DMESG-WARN][25] ([i915#118] / [i915#95])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk6/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [PASS][27] -> [FAIL][28] ([i915#307])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][29] ([i915#2658])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][30] ([i915#2658])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#768]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([i915#3297])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#3297])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen3_render_tiledy_blits:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109289]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb2/igt@gen3_render_tiledy_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109289]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gen3_render_tiledy_blits.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271]) +33 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk1/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#112306])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb7/igt@gen9_exec_parse@secure-batches.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#112306])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb2/igt@gen9_exec_parse@secure-batches.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][39] -> [FAIL][40] ([i915#2574])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-tglb7/igt@kms_async_flips@test-time-stamp.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb1/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_joiner@basic:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#2705])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_big_joiner@basic.html

  * igt@kms_chamelium@hdmi-hpd-storm-disable:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm-disable.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-glk:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][52] ([i915#1319]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][53] ([i915#1319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109279] / [i915#3359])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-random:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +118 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3359]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-random.html

  * igt@kms_flip@2x-busy-flip:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111825]) +5 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][60] ([fdo#109271]) +360 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-snb7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-iclb:         [PASS][61] -> [FAIL][62] ([i915#49])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109280]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-kbl:          [PASS][64] -> [DMESG-WARN][65] ([i915#180]) +6 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl2/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][67] ([i915#180])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][68] ([i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][69] ([i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][70] ([fdo#108145] / [i915#265]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][71] ([i915#265]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][72] ([fdo#108145] / [i915#265]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278]) +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#658]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][76] -> [SKIP][77] ([fdo#109642] / [fdo#111068] / [i915#658]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][78] -> [SKIP][79] ([fdo#109441]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109441])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb7/igt@kms_psr@psr2_primary_render.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][81] ([IGT#2])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271]) +225 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#2437]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#2437])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#2530]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#2530]) +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109291]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb8/igt@prime_nv_api@i915_self_import.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109291]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb1/igt@prime_nv_api@i915_self_import.html

  * igt@prime_vgem@sync@vecs0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][89] ([i915#409])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl7/igt@prime_vgem@sync@vecs0.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2994]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl1/igt@sysfs_clients@create.html
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2994])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@sysfs_clients@create.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][92] ([i915#2369] / [i915#3063]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [FAIL][94] ([i915#2842]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][96] ([i915#2842]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][98] ([i915#2849]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-forked:
    - shard-glk:          [DMESG-WARN][100] ([i915#118] / [i915#95]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk2/igt@gem_exec_whisper@basic-forked.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk9/igt@gem_exec_whisper@basic-forked.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [FAIL][102] ([i915#307]) -> [PASS][103] +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-glk:          [FAIL][104] ([i915#307]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][106] ([i915#454]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109] +4 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][110] ([i915#180]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][112] ([i915#79]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-glk:          [FAIL][114] ([i915#49]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117] +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][118] ([i915#1804] / [i915#2684]) -> [WARN][119] ([i915#2681] / [i915#2684]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][120] ([i915#2920]) -> [SKIP][121] ([i915#658])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][122] ([i915#658]) -> [SKIP][123] ([i915#2920]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][124], [FAIL][125], [FAIL][126], [FAIL][127], [FAIL][128], [FAIL][129]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002]) -> ([FAIL][130], [FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl2/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl1/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl4/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl3/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl4/igt@runner@aborted.html
    - shard-apl:          ([FAIL][136], [FAIL][137]) ([i915#1814] / [i915#3002]) -> ([FAIL][138], [FAIL][139]) ([i915#2426] / [i915#3002] / [i915#409])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-apl6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-apl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl7/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-apl2/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/index.html

--===============3465283964972156070==
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
<tr><td><b>Series:</b></td><td>Test tiled display with aid of chamelium.]</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/89477/">https://patchwork.freedesktop.org/series/89477/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5763/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10006_full -&gt; IGTPW_5763_full</=
h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with IGTPW_5763_full need to be verified<br=
 />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5763_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5763=
_full:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10006/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.html">=
SKIP</a> ([i915#426]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5763/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern.htm=
l">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10006/shard-tglb8/igt@kms_dp_tiled_display@basic-test-pattern.html">=
SKIP</a> ([i915#426]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5763/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern.htm=
l">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10006_full and IGTPW_5763_=
full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5763_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb3/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-snb6/igt@gem_create@create-massive.html">DMES=
G-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_create@create-massive.html">DMES=
G-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb1/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-glk2/igt@gem_create@create-massive.html">DMES=
G-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-tglb8/igt@gem_ctx_persistence@many-contexts.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/sh=
ard-tglb1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> ([i915#2410]=
)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb4/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i=
915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10006/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk=
1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-k=
bl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/s=
hard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#284=
2])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/s=
hard-iclb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#284=
2]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
63/shard-glk6/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#1=
18</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/sha=
rd-iclb8/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307])</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-y-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-=
y-tiled-ccs.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb7/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.ht=
ml">SKIP</a> ([i915#3297])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb2/igt@gen3_render_tiledy_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb2/igt@gen3_render_tiledy_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-glk1/igt@gen7_exec_parse@basic-allocation.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb7/igt@gen9_exec_parse@secure-batches.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11230=
6">fdo#112306</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb2/igt@gen9_exec_parse@secure-batches.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11230=
6">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-tglb7/igt@kms_async_flips@test-time-stamp.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shar=
d-tglb1/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb2/igt@kms_big_fb@linear-8bpp-rotate-270.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb6/igt@kms_big_fb@linear-8bpp-rotate-270.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm-disabl=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-glk9/igt@kms_color_chamelium@pipe-a-ctm-limit=
ed-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb7/igt@kms_color_chamelium@pipe-d-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb3/igt@kms_color_chamelium@pipe-d-ctm-max.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_content_protection@atomic.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / [i915#3359])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-random:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-32x10-r=
andom.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +118 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-32x10-=
random.html">SKIP</a> ([i915#3359]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-tglb5/igt@kms_flip@2x-busy-flip.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#1=
11825</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb3/igt@kms_flip@2x-plain-flip-fb-recreate=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-snb7/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +360 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:</=
p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-s=
pr-indfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5763/shard-iclb8/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-draw-pwrite.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb5/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-kbl7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl2/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-glk1/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> ([i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-const=
ant-alpha-max.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl1/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/=
igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / [i915#658]) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-iclb5/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb7/igt@kms_psr@psr2_primary_render.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
>fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_vblank@pipe-d-ts-continuation-i=
dle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +225 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl8/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-kbl7/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-tglb6/igt@nouveau_crc@pipe-a-source-outp-com=
plete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb2/igt@nouveau_crc@pipe-c-source-rg.html"=
>SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-tglb8/igt@prime_nv_api@i915_self_import.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb1/igt@prime_nv_api@i915_self_import.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vecs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-apl7/igt@prime_vgem@sync@vecs0.html">INCOMPL=
ETE</a> ([i915#409])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-apl1/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-kbl6/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i9=
15#2369] / [i915#3063]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5763/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5763/shard-glk1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5763/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5763/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk2/igt@gem_exec_whisper@basic-forked.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#=
118</a> / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5763/shard-glk9/igt@gem_exec_whisper@basic-forked.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a=
> ([i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5763/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk8/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL=
</a> ([i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5763/shard-glk9/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shar=
d-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5763/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a=
> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5763/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk2/igt@kms_flip@2x-flip-=
vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-glk1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-mmap-wc.html">FAIL</a> ([i915#49]) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-glk9/igt@kms_frontbuffer_track=
ing@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb7/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10944=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763=
/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> +2 similar iss=
ues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#18=
04</a> / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5763/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN<=
/a> ([i915#2681] / [i915#2684]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
3.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5763/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-3.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-iclb1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-=
4.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5763/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10006/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10006/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-kbl2/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/180">i915#180</a> / <a href=3D"https://">i915#1814</a> / [i915#3002])=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5763/shard-kbl3/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5763/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-kbl2/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5763/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a=
 href=3D"https://">i915#1814</a> / [i915#2505] / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10006/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10006/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://">i915#1814</a> / [i915#3002]) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5763/shard-ap=
l7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5763/shard-apl2/igt@runner@aborted.html">FAIL</a>) ([i=
915#2426] / [i915#3002] / [i915#409])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3465283964972156070==--

--===============0484539599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0484539599==--
