Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2957714531547927070=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Mon, 09 May 2022 21:16:51 -0000
Message-ID: <165213101149.22804.6412213387111231311@emeril.freedesktop.org>
References: <20220509132330.3310616-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220509132330.3310616-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQ29udmVy?=
 =?utf-8?q?t_subtests_to_dynamic_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============2957714531547927070==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Convert subtests to dynamic (rev3)
URL   : https://patchwork.freedesktop.org/series/103734/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11626_full -> IGTPW_7068_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7068_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7068_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7068_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_color@ctm-red-to-blue} (NEW):
    - shard-tglb:         NOTRUN -> [INCOMPLETE][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_color@ctm-red-to-blue.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][2] +3 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb4/igt@kms_color@ctm-red-to-blue.html
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-5/igt@kms_color@ctm-red-to-blue.html
    - shard-apl:          NOTRUN -> [INCOMPLETE][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl3/igt@kms_color@ctm-red-to-blue.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][5] +3 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb4/igt@kms_color@ctm-red-to-blue.html

  * {igt@kms_color@invalid-gamma-lut-sizes} (NEW):
    - {shard-tglu}:       NOTRUN -> [INCOMPLETE][6] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglu-6/igt@kms_color@invalid-gamma-lut-sizes.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][7] +3 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk3/igt@kms_color@invalid-gamma-lut-sizes.html

  * {igt@kms_cursor_crc@cursor-rapid-movement} (NEW):
    - shard-kbl:          NOTRUN -> [INCOMPLETE][8] +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_cursor_crc@cursor-rapid-movement.html

  * {igt@kms_cursor_legacy@short-flip-after-cursor@atomic} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][9] +5 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_legacy@short-flip-after-cursor@atomic.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][10] -> [INCOMPLETE][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_balancer@full-late:
    - {shard-rkl}:        [PASS][12] -> [INCOMPLETE][13]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@gem_exec_balancer@full-late.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-5/igt@gem_exec_balancer@full-late.html

  * igt@gem_linear_blits@normal:
    - {shard-dg1}:        NOTRUN -> [TIMEOUT][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-dg1-15/igt@gem_linear_blits@normal.html

  * {igt@kms_color@ctm-0-25}:
    - shard-snb:          NOTRUN -> [INCOMPLETE][15] +17 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb6/igt@kms_color@ctm-0-25.html

  * {igt@kms_color@ctm-0-75}:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][16] +14 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@kms_color@ctm-0-75.html

  * {igt@kms_color@ctm-negative}:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][17] +13 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@kms_color@ctm-negative.html

  * {igt@kms_color@degamma}:
    - shard-glk:          NOTRUN -> [INCOMPLETE][18] +17 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk7/igt@kms_color@degamma.html

  * {igt@kms_color@invalid-ctm-matrix-sizes}:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][19] +5 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_color@invalid-ctm-matrix-sizes.html

  * {igt@kms_cursor_crc@cursor-offscreen}:
    - shard-apl:          NOTRUN -> [INCOMPLETE][20] +17 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl8/igt@kms_cursor_crc@cursor-offscreen.html
    - {shard-tglu}:       NOTRUN -> [INCOMPLETE][21] +11 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen.html

  * {igt@kms_cursor_crc@cursor-onscreen}:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][22] +4 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen.html

  * {igt@kms_cursor_edge_walk@top-bottom}:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][23] +15 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_cursor_edge_walk@top-bottom.html

  * {igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:
    - shard-tglb:         NOTRUN -> [SKIP][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor.html

  * {igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size}:
    - {shard-rkl}:        NOTRUN -> [SKIP][25] +22 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varying-size.html

  * {igt@kms_cursor_legacy@short-busy-flip-before-cursor}:
    - shard-iclb:         NOTRUN -> [SKIP][26] +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_cursor_legacy@short-busy-flip-before-cursor.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier:
    - {shard-tglu}:       NOTRUN -> [SKIP][27] +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglu-3/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11626_full and IGTPW_7068_full:

### New IGT tests (65) ###

  * igt@kms_color@ctm-red-to-blue:
    - Statuses : 8 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_color@invalid-gamma-lut-sizes:
    - Statuses : 7 incomplete(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_crc@cursor-rapid-movement:
    - Statuses : 7 incomplete(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_edge_walk@left-edge:
    - Statuses : 7 incomplete(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:
    - Statuses : 1 pass(s)
    - Exec time: [0.92] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:
    - Statuses : 1 pass(s)
    - Exec time: [0.95] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-varying-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:
    - Statuses : 1 pass(s)
    - Exec time: [0.94] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:
    - Statuses : 1 pass(s)
    - Exec time: [0.90] s

  * igt@kms_cursor_legacy@basic-flip-after-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@basic-flip-before-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic:
    - Statuses : 7 pass(s)
    - Exec time: [27.93, 37.55] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:
    - Statuses : 7 pass(s)
    - Exec time: [28.26, 37.95] s

  * igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [29.02, 42.02] s

  * igt@kms_cursor_legacy@cursor-vs-flip@legacy:
    - Statuses : 7 pass(s)
    - Exec time: [28.09, 37.73] s

  * igt@kms_cursor_legacy@cursor-vs-flip@toggle:
    - Statuses : 7 pass(s)
    - Exec time: [28.77, 41.58] s

  * igt@kms_cursor_legacy@cursor-vs-flip@varying-size:
    - Statuses : 7 pass(s)
    - Exec time: [28.75, 41.75] s

  * igt@kms_cursor_legacy@cursora-vs-flipa:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursora-vs-flipb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.93] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.97] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.95] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.97] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@toggle:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.93] s

  * igt@kms_cursor_legacy@cursorb-vs-flipa@varying-size:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.92] s

  * igt@kms_cursor_legacy@forked-bo@all-pipes:
    - Statuses : 7 pass(s)
    - Exec time: [21.52, 21.56] s

  * igt@kms_cursor_legacy@forked-bo@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [21.51, 21.55] s

  * igt@kms_cursor_legacy@forked-bo@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [21.51, 21.57] s

  * igt@kms_cursor_legacy@forked-bo@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [21.51, 21.57] s

  * igt@kms_cursor_legacy@forked-bo@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [21.52] s

  * igt@kms_cursor_legacy@forked-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@short-flip-after-cursor:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.97] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying-size:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.95] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@legacy:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.15] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@toggle:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.93] s

  * igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:
    - Statuses : 8 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.94] s

  * igt@kms_cursor_legacy@single-bo@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@single-move@all-pipes:
    - Statuses : 5 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [21.48, 21.52] s

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [21.48, 21.52] s

  * igt@kms_cursor_legacy@single-move@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [21.48, 21.50] s

  * igt@kms_cursor_legacy@torture-bo:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_cursor_legacy@torture-move:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [2.43] s

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.69] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:
    - Statuses : 4 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 1.54] s

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.75] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:
    - Statuses : 7 pass(s)
    - Exec time: [0.29, 1.62] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:
    - Statuses : 5 pass(s)
    - Exec time: [0.28, 1.65] s

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [0.29, 1.41] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:
    - Statuses : 6 pass(s)
    - Exec time: [0.24, 1.53] s

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:
    - Statuses : 3 pass(s)
    - Exec time: [0.25, 1.41] s

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:
    - Statuses : 7 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.75] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:
    - Statuses : 1 dmesg-warn(s) 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.51] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 3.53] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:
    - Statuses : 2 pass(s)
    - Exec time: [1.69, 3.40] s

  

Known issues
------------

  Here are the changes found in IGTPW_7068_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ccs@block-copy-inplace:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#5327])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([i915#3555] / [i915#5325])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-massive:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][30] ([i915#4991])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1099]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb6/igt@gem_ctx_persistence@engines-cleanup.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][32] -> [TIMEOUT][33] ([i915#3070])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][34] ([i915#5076] / [i915#5614])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([i915#4525])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][37] ([i915#5076] / [i915#5614])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gem_exec_balancer@parallel-bb-first.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4525])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][39] ([i915#5076] / [i915#5614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#2842])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#2842]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][44] -> [FAIL][45] ([i915#2842])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][46] -> [FAIL][47] ([i915#2842])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_flush@basic-wb-rw-before-default:
    - shard-snb:          [PASS][48] -> [SKIP][49] ([fdo#109271]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-snb4/igt@gem_exec_flush@basic-wb-rw-before-default.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb6/igt@gem_exec_flush@basic-wb-rw-before-default.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-iclb:         [PASS][50] -> [INCOMPLETE][51] ([i915#5498] / [i915#5843])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked-all.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#2190])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2190])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl2/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#2190])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk7/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#2190])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#2190])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#4613]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#4613]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_lmem_swapping@smem-oom.html
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#4613])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          [PASS][60] -> [DMESG-FAIL][61] ([i915#4998])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb6/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][62] ([i915#2658]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][63] ([i915#2658])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#4270])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +180 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-kbl:          NOTRUN -> [FAIL][66] ([i915#3318])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@gem_userptr_blits@vma-merge.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109289])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@gen3_mixed_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +89 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl1/igt@gen7_exec_parse@basic-offset.html
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109289]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][70] -> [DMESG-WARN][71] ([i915#5566] / [i915#716])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk2/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2527] / [i915#2856]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#2856]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][74] ([fdo#109271]) +122 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb4/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([i915#454])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#1937])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#4387])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#5286]) +3 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111614]) +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110725] / [fdo#111614])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615]) +5 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#110723]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3689]) +7 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [i915#3886]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#3886]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk9/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#3689] / [i915#3886]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271]) +41 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#3886]) +13 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278] / [i915#3886]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#111615] / [i915#3689])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278]) +6 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][93] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color_chamelium@pipe-c-degamma:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl2/igt@kms_color_chamelium@pipe-c-degamma.html
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk2/igt@kms_color_chamelium@pipe-c-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-5.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#3116] / [i915#3299])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][100] ([i915#1319])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@kms_content_protection@srm.html

  * {igt@kms_cursor_edge_walk@left-edge} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][101] ([i915#4098]) +7 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_edge_walk@left-edge.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109274])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#5287]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#5287])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109274] / [fdo#111825]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#109274]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109280]) +9 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109280] / [fdo#111825]) +22 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][109] ([i915#180]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#3555]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@kms_hdr@static-swap.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][111] ([fdo#108145] / [i915#265])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#3536])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][113] ([i915#5176]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2920])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-kbl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#658])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][116] -> [SKIP][117] ([fdo#109441])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][118] ([i915#132] / [i915#3467]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][119] -> [SKIP][120] ([i915#5519])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#3555])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109309])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][123] -> [DMESG-WARN][124] ([i915#180]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][125] -> [DMESG-WARN][126] ([i915#180]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2437])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-apl:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#2437])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#2530])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#2530])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@prime_nv_pcopy@test3_1:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#109291]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@prime_nv_pcopy@test3_1.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109291])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109295])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][134] ([fdo#109295])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@prime_vgem@fence-flip-hang.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-apl:          NOTRUN -> [DMESG-WARN][135] ([i915#5098])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][136] ([i915#5098])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-iclb:         NOTRUN -> [DMESG-FAIL][137] ([i915#5098])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][138] ([i915#5098])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-apl:          NOTRUN -> [DMESG-FAIL][139] ([i915#5098])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl4/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][140] ([i915#5098])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk2/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][141] ([i915#5098])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@syncobj_timeline@transfer-timeline-point.html
    - shard-snb:          NOTRUN -> [DMESG-FAIL][142] ([i915#5098])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb7/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@fair-1:
    - shard-tglb:         NOTRUN -> [SKIP][143] ([i915#2994]) +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][144] ([fdo#109271] / [i915#2994])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl7/igt@sysfs_clients@recycle-many.html
    - shard-iclb:         NOTRUN -> [SKIP][145] ([i915#2994])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][146] ([fdo#109271] / [i915#2994])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk4/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-25:
    - shard-kbl:          NOTRUN -> [SKIP][147] ([fdo#109271] / [i915#2994]) +1 similar issue
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@sysfs_clients@sema-25.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][148] ([i915#658]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb3/igt@feature_discovery@psr2.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@feature_discovery@psr2.html
    - {shard-rkl}:        [SKIP][150] ([i915#658]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-2/igt@feature_discovery@psr2.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-rkl}:        [FAIL][152] ([i915#2410]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-2/igt@gem_ctx_persistence@many-contexts.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][154] ([i915#3063]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb6/igt@gem_eio@in-flight-contexts-1us.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [FAIL][156] ([i915#2842]) -> [PASS][157] +3 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][158] ([i915#2842]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][160] ([i915#2849]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-pro-default:
    - shard-snb:          [SKIP][162] ([fdo#109271]) -> [PASS][163] +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html

  * igt@gem_mmap_gtt@fault-concurrent-x:
    - shard-snb:          [INCOMPLETE][164] ([i915#5161]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [DMESG-WARN][166] ([i915#180]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][168] ([i915#3921]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-snb2/igt@i915_selftest@live@hangcheck.html
    - shard-tglb:         [DMESG-WARN][170] ([i915#5591]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb3/igt@i915_selftest@live@hangcheck.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [DMESG-WARN][172] ([i915#180]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@i915_suspend@debugfs-reader.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@i915_suspend@debugfs-reader.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-tglb:         [FAIL][174] ([i915#2521]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-0:
    - {shard-rkl}:        [SKIP][176] ([i915#1845] / [i915#4098]) -> [PASS][177] +14 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-0.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [FAIL][178] ([i915#1888] / [i915#5138]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - {shard-rkl}:        ([PASS][180], [SKIP][181]) ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][182] +1 similar issue
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [SKIP][183] ([i915#3701]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - {shard-rkl}:        [SKIP][185] ([i915#1849] / [i915#4098]) -> [PASS][186] +7 similar issues
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-iclb:         [FAIL][187] ([i915#1888] / [i915#2546]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:
    - {shard-rkl}:        ([SKIP][189], [PASS][190]) ([i915#1849] / [i915#4098]) -> [PASS][191] +3 similar issues
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu.html

  * igt@kms_invalid_mode@bad-htotal:
    - {shard-rkl}:        ([PASS][192], [SKIP][193]) ([i915#4278]) -> [PASS][194]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-2/igt@kms_invalid_mode@bad-htotal.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - {shard-rkl}:        ([PASS][195], [SKIP][196]) ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][197]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - {shard-rkl}:        [SKIP][198] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-x:
    - {shard-rkl}:        [SKIP][200] ([i915#1849] / [i915#3558] / [i915#4070]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.html

  * igt@kms_psr@dpms:
    - {shard-rkl}:        ([SKIP][202], [PASS][203]) ([i915#1072]) -> [PASS][204]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_psr@dpms.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_psr@dpms.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_psr@dpms.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         [SKIP][205] ([fdo#109441]) -> [PASS][206] +1 similar issue
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb6/igt@kms_psr@psr2_sprite_plane_onoff.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - {shard-rkl}:        ([SKIP][207], [PASS][208]) ([i915#1845] / [i915#4098]) -> [PASS][209] +6 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_universal_plane@universal-plane-pipe-a-functional:
    - {shard-rkl}:        [SKIP][210] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-5/igt@kms_universal_plane@universal-plane-pipe-a-functional.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_universal_plane@universal-plane-pipe-a-functional.html

  * igt@perf@polling-parameterized:
    - {shard-rkl}:        [FAIL][212] ([i915#5639]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@perf@polling-parameterized.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][214] ([i915#5784]) -> [TIMEOUT][215] ([i915#3063])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [SKIP][216] ([i915#4525]) -> [DMESG-WARN][217] ([i915#5614]) +1 similar issue
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb5/igt@gem_exec_balancer@parallel.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb4/igt@gem_exec_balancer@parallel.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         [SKIP][218] ([fdo#109300]) -> [SKIP][219] ([fdo#109300] / [fdo#111066])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@kms_content_protection@mei_interface.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         [SKIP][220] ([fdo#109300]) -> [SKIP][221] ([i915#1063])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-tglb7/igt@kms_content_protection@mei_interface.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-iclb:         [SKIP][222] ([fdo#109274] / [fdo#109278]) -> [SKIP][223] ([fdo#109274]) +6 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [SKIP][224] ([fdo#109271]) -> [SKIP][225] ([fdo#109271] / [i915#1888])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][226] ([fdo#111068] / [i915#658]) -> [SKIP][227] ([i915#2920]) +1 similar issue
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716] / [i915#92]) -> ([FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251], [FAIL][252], [FAIL][253], [FAIL][254], [FAIL][255], [FAIL][256], [FAIL][257], [FAIL][258], [FAIL][259]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl3/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl6/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl6/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl6/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl7/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl3/igt@runner@aborted.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@runner@aborted.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4831]: https://gitlab.freedesktop.org/drm/intel/issues/4831
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#4998]: https://gitlab.freedesktop.org/drm/intel/issues/4998
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5080]: https://gitlab.freedesktop.org/drm/intel/issues/5080
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5161]: https://gitlab.freedesktop.org/drm/intel/issues/5161
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5498]: https://gitlab.freedesktop.org/drm/intel/issues/5498
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5843]: https://gitlab.freedesktop.org/drm/intel/issues/5843
  [i915#5849]: https://gitlab.freedesktop.org/drm/intel/issues/5849
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6468 -> IGTPW_7068
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11626: 1672d1c43e4377628b445ab011343fe2496a41ce @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7068: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/index.html
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/index.html

--===============2957714531547927070==
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
<tr><td><b>Series:</b></td><td>Convert subtests to dynamic (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103734/">https://patchwork.freedesktop.org/series/103734/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7068/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11626_full -&gt; IGTPW_7068_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7068_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7068_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7068=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_color@ctm-red-to-blue} (NEW):</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_color@ctm-red-to-blue.html">INC=
OMPLETE</a> +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-snb4/igt@kms_color@ctm-red-to-blue.html">INCO=
MPLETE</a> +3 similar issues</p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-rkl-5/igt@kms_color@ctm-red-to-blue.html">INC=
OMPLETE</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl3/igt@kms_color@ctm-red-to-blue.html">INCO=
MPLETE</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb4/igt@kms_color@ctm-red-to-blue.html">INC=
OMPLETE</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color@invalid-gamma-lut-sizes} (NEW):</p>
<ul>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglu-6/igt@kms_color@invalid-gamma-lut-sizes.=
html">INCOMPLETE</a> +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk3/igt@kms_color@invalid-gamma-lut-sizes.ht=
ml">INCOMPLETE</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-rapid-movement} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_cursor_crc@cursor-rapid-movemen=
t.html">INCOMPLETE</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@short-flip-after-cursor@atomic} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_legacy@short-flip-after=
-cursor@atomic.html">SKIP</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspen=
d.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7068/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.h=
tml">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_balancer@full-late:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-5/igt@gem_exec_balancer@full-late.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rk=
l-5/igt@gem_exec_balancer@full-late.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@gem_linear_blits@normal:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-dg1-15/igt@gem_linear_blits@normal.html">TIM=
EOUT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-0-25}:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-snb6/igt@kms_color@ctm-0-25.html">INCOMPLETE=
</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-0-75}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@kms_color@ctm-0-75.html">INCOMPLET=
E</a> +14 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@ctm-negative}:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@kms_color@ctm-negative.html">INCOMP=
LETE</a> +13 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@degamma}:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-glk7/igt@kms_color@degamma.html">INCOMPLETE<=
/a> +17 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@invalid-ctm-matrix-sizes}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_color@invalid-ctm-matrix-sizes=
.html">INCOMPLETE</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-offscreen}:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl8/igt@kms_cursor_crc@cursor-offscreen.html=
">INCOMPLETE</a> +17 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglu-3/igt@kms_cursor_crc@cursor-offscreen.ht=
ml">INCOMPLETE</a> +11 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_crc@cursor-onscreen}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen.ht=
ml">INCOMPLETE</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_edge_walk@top-bottom}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_cursor_edge_walk@top-bottom.ht=
ml">INCOMPLETE</a> +15 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-busy-flip-before-cursor}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@basic-flip-before-cursor@atomic-transitions-varyi=
ng-size}:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_legacy@basic-flip-befor=
e-cursor@atomic-transitions-varying-size.html">SKIP</a> +22 similar issues<=
/li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_legacy@short-busy-flip-before-cursor}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-hdmi-a-=
1-downscale-with-modifier:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglu-3/igt@kms_plane_scaling@downscale-with-=
modifier-factor-0-25@pipe-d-hdmi-a-1-downscale-with-modifier.html">SKIP</a>=
 +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11626_full and IGTPW_7068_=
full:</p>
<h3>New IGT tests (65)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>Statuses : 8 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes:</p>
<ul>
<li>Statuses : 7 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement:</p>
<ul>
<li>Statuses : 7 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@left-edge:</p>
<ul>
<li>Statuses : 7 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@atomic-transitions-v=
arying-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@legacy:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@toggle:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor@varying-size:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [27.93, 37.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.26, 37.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@atomic-transitions-varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [29.02, 42.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@legacy:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.09, 37.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@toggle:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.77, 41.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip@varying-size:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [28.75, 41.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@atomic-transitions-varying-size:<=
/p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@legacy:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@toggle:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa@varying-size:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@all-pipes:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.52, 21.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.51, 21.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [21.51, 21.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [21.51, 21.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-bo@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [21.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@forked-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@atomic-transitions-varying=
-size:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@legacy:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@toggle:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.93] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor@varying-size:</p>
<ul>
<li>Statuses : 8 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [21.48, 21.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@all-pipes:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [21.48, 21.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [21.48, 21.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [21.48, 21.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [21.48, 21.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 4 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.26, 0.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.29, 1.62] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.28, 1.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.29, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.24, 1.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence@pipe-d:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.25, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a:</p>
<ul>
<li>Statuses : 7 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s) 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 3.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.69, 3.40] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7068_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i=
915#5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325"=
>i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-snb6/igt@gem_ctx_persistence@engines-cleanup=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb1/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_balancer@parallel.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/50=
76">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb2/igt@gem_exec_balancer@parallel-balancer.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/=
shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gem_exec_balancer@parallel-bb-first=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb5/igt@gem_exec_balancer@parallel-bb-first=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4525">i915#4525</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@gem_exec_balancer@parallel-ordering=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/=
shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-glk2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-=
glk3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/=
shard-tglb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-k=
bl1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-snb4/igt@gem_exec_flush@basic-wb-rw-before-default.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7068/shard-snb6/igt@gem_exec_flush@basic-wb-rw-before-default.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked-all.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_706=
8/shard-iclb5/igt@gem_exec_whisper@basic-fds-forked-all.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5498">i915#54=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5843">i=
915#5843</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl2/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk7/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@gem_lmem_swapping@basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl7/igt@gem_lmem_swapping@smem-oom.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl7/igt@gem_lmem_swapping@smem-oom.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-snb2/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-sn=
b6/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/4998">i915#4998</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i9=
15#2658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +180 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb6/igt@gen3_mixed_blits.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl1/igt@gen7_exec_parse@basic-offset.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +89 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gen7_exec_parse@basic-offset.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289"=
>fdo#109289</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk=
2/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">=
i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-snb4/igt@i915_hangman@engine-engine-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +122 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl6/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10723">fdo#110723</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk9/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-glk5/igt@kms_ccs@pipe-a-random-ccs-data-y_ti=
led_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +41 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +13 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb1/igt@kms_ccs@pipe-b-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_ccs@pipe-c-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb1/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-snb5/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_chamelium@hdmi-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_chamelium@vga-hpd-fast.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-degamma:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl2/igt@kms_color_chamelium@pipe-c-degamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk2/igt@kms_color_chamelium@pipe-c-degamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-0-5=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_content_protection@dp-mst-lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_cursor_edge_walk@left-edge} (NEW):</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-rkl-1/igt@kms_cursor_edge_walk@left-edge.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/409=
8">i915#4098</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_display_modes@extended-mode-ba=
sic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_draw_crc@draw-method-xrgb21010=
10-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_flip@2x-plain-flip-ts-check-in=
terruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-pr=
i-indfb-multidraw.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +22 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb6/igt@kms_hdr@static-swap.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#355=
5</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-d=
ownscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb7/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shar=
d-iclb1/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb5/igt@kms_psr@psr2_sprite_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7068/shard-iclb7/igt@kms_psr_stress_test@invalidate-primary-flip=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
09">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7068/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7068/shard-apl8/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-apl2/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb8/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb8/igt@prime_nv_pcopy@test3_1.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb6/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb5/igt@prime_vgem@fence-flip-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl7/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl1/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb3/igt@syncobj_timeline@transfer-timeline-=
point.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-kbl7/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl4/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk2/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-tglb2/igt@syncobj_timeline@transfer-timeline-=
point.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-snb7/igt@syncobj_timeline@transfer-timeline-p=
oint.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-tglb3/igt@sysfs_clients@fair-1.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-apl7/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-iclb6/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i9=
15#2994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-glk4/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-kbl4/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-iclb3/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb=
2/igt@feature_discovery@psr2.html">PASS</a></p>
</li>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-rkl-2/igt@feature_discovery@psr2.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-=
6/igt@feature_discovery@psr2.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-2/igt@gem_ctx_persistence@many-contexts.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#=
2410</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
068/shard-rkl-6/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-tglb6/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#=
3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
068/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-glk2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/s=
hard-glk3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/=
shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
068/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-pro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-snb6/igt@gem_exec_flush@basic-wb-pro-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7068/shard-snb2/igt@gem_exec_flush@basic-wb-pro-default.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-x.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5161">i9=
15#5161</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7068/shard-snb2/igt@gem_mmap_gtt@fault-concurrent-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7068/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3=
921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
68/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-tglb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5591">i915#=
5591</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
068/shard-tglb8/igt@i915_selftest@live@hangcheck.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-kbl1/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#18=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068=
/shard-kbl4/igt@i915_suspend@debugfs-reader.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-tglb8/igt@kms_async_flips@alternate-sync-async-flip.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
1">i915#2521</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7068/shard-tglb3/igt@kms_async_flips@alternate-sync-async-flip.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#18=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i=
915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7068/shard-rkl-6/igt@kms_big_fb@linear-8bpp-rotate-0.html">PASS</a> +14 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915=
#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138=
">i915#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7068/shard-glk4/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-render-unt=
iled.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11626/shard-rkl-2/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled=
.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb8888-render-untiled.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-iclb3/igt@kms_flip_scaled_crc@fl=
ip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-mul=
tidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p=
-pri-indfb-multidraw.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-m=
map-wc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-rg=
b101010-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-=
mmap-cpu.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-=
mmap-cpu.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_frontbuffer_tracking@psr=
-rgb101010-draw-mmap-cpu.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-=
2/igt@kms_invalid_mode@bad-htotal.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4278">i915#4278</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_inval=
id_mode@bad-htotal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1626/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915=
#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070=
">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-prem=
ult-vs-constant.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_alpha_=
blend@pipe-a-coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-x:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-5/igt@kms_plane_multiple@atomic-pipe-b-tiling-x.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/184=
9">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3558">i915#3558</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_plane_multiple@atomic-pipe-b-ti=
ling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@dpms:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-5/igt@kms_psr@dpms.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-rkl-6/igt@kms_psr@d=
pms.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/1072">i915#1072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_psr@dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb6/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#10=
9441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
068/shard-iclb2/igt@kms_psr@psr2_sprite_plane_onoff.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-rkl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM=
_11626/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">P=
ASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">=
i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7068/shard-rkl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0=
.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pipe-a-functional:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-5/igt@kms_universal_plane@universal-plane-pipe-a-fu=
nctional.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7068/shard-rkl-6/igt@kms_universal_plane@uni=
versal-plane-pipe-a-functional.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-rkl-6/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/sha=
rd-rkl-5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-tglb2/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-t=
glb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb5/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/sha=
rd-iclb4/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7068/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109=
300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066"=
>fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11626/shard-tglb7/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7068/shard-tglb5/igt@kms_content_protection@mei_interface.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#106=
3</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb2/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7068/shard-iclb7/igt@kms_cursor_legacy@2x-cursor-vs-flip-=
legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pr=
i-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7068/shard-glk7/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11626/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7068/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11626/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11626/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11626/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11626/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_116=
26/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_11626/shard-kbl4/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/sha=
rd-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_11626/shard-kbl1/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11626/shard-=
kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shar=
d-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7068/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_706=
8/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard=
-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7068/shard-kbl7/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl6/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7068/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/shard-kbl1/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7068/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#=
4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257"=
>i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6468 -&gt; IGTPW_7068</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11626: 1672d1c43e4377628b445ab011343fe2496a41ce @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7068: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7068/index.htm=
l<br />
  IGT_6468: cffa5fffe9acddf49565b4caeeb5e3355ff2ea44 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2957714531547927070==--
