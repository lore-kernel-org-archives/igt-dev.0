Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6064473554202620716=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 07 Feb 2022 21:04:38 -0000
Message-ID: <164426787825.23829.9477835279594188645@emeril.freedesktop.org>
References: <20220207182152.31211-1-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgREcyIHBs?=
 =?utf-8?q?atform_definition_and_Tile_4_plane_format_support?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6064473554202620716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DG2 platform definition and Tile 4 plane format support
URL   : https://patchwork.freedesktop.org/series/99784/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11197_full -> IGTPW_6599_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6599_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6599_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6599_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_big_fb@4-tiled-32bpp-rotate-270} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][1] +39 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * {igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][2] +22 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * {igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][3] +43 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * {igt@kms_draw_crc@draw-method-rgb565-blt-4tiled} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][4] +16 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html
    - shard-apl:          NOTRUN -> [FAIL][5] +16 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html

  * {igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +17 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html

  * {igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][7] +11 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglu-5/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html

  * {igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][8] +16 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * {igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][9] +16 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html

  * {igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled} (NEW):
    - shard-kbl:          NOTRUN -> [FAIL][10] +17 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html

  * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
    - shard-kbl:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl6/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl3/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html

  
#### Warnings ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-apl:          [SKIP][13] ([fdo#109271]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-tglb:         [SKIP][15] ([i915#3826]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-glk:          [SKIP][17] ([fdo#109271]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-kbl:          [SKIP][19] ([fdo#109271]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          [SKIP][21] ([fdo#109271]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-snb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         [SKIP][23] ([i915#3826]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11197_full and IGTPW_6599_full:

### New IGT tests (66) ###

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-addfb:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.03] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.24] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - Statuses : 5 fail(s)
    - Exec time: [0.02, 0.22] s

  * igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.10] s

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.14] s

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.03, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.21] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.19] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 1.42] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:
    - Statuses : 5 fail(s)
    - Exec time: [0.01, 0.12] s

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.01, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.01, 0.14] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.03, 0.14] s

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.13] s

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - Statuses : 6 fail(s)
    - Exec time: [0.04, 0.18] s

  * igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:
    - Statuses : 7 fail(s)
    - Exec time: [0.02, 0.23] s

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@pipe-a-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@pipe-b-tiling-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@pipe-d-tiling-4:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_multiple@atomic-pipe-a-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-4:
    - Statuses : 5 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-4:
    - Statuses : 7 skip(s)
    - Exec time: [0.0] s

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.10] s

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - Statuses : 6 skip(s)
    - Exec time: [0.0, 0.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_6599_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][27] -> [FAIL][28] ([i915#232])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_eio@kms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb3/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][29] -> [TIMEOUT][30] ([i915#2481] / [i915#3070])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@gem_eio@unwedge-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][31] -> [SKIP][32] ([i915#4525])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_balancer@parallel.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb7/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_capture@pi@vcs1:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][33] ([i915#3371])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@gem_exec_capture@pi@vcs1.html

  * igt@gem_exec_capture@pi@vecs0:
    - shard-tglb:         [PASS][34] -> [INCOMPLETE][35] ([i915#3371])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_capture@pi@vecs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@gem_exec_capture@pi@vecs0.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [PASS][36] -> [INCOMPLETE][37] ([i915#3778])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][38] -> [FAIL][39] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#2842]) +5 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][41] -> [FAIL][42] ([i915#2842]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#2849])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [PASS][45] -> [DMESG-WARN][46] ([i915#118]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#4613]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl7/igt@gem_lmem_swapping@random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#4613]) +4 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#4613])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@gem_lmem_swapping@smem-oom.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#4613])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb3/igt@gem_lmem_swapping@smem-oom.html
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#4613])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_mmap_gtt@coherency:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109292])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb8/igt@gem_mmap_gtt@coherency.html

  * igt@gem_pxp@create-valid-protected-context:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#4270]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@gem_pxp@create-valid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#4270]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#768]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +219 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3297]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3297]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-iclb:         NOTRUN -> [FAIL][59] ([i915#3318])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#2527] / [i915#2856]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb1/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#2856]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [PASS][62] -> [WARN][63] ([i915#2681] / [i915#2684])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [PASS][64] -> [WARN][65] ([i915#1804] / [i915#2684])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109506] / [i915#2411])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111644] / [i915#1397] / [i915#2411])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110892])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          [PASS][69] -> [INCOMPLETE][70] ([i915#636])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-snb6/igt@i915_suspend@forcewake.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb4/igt@i915_suspend@forcewake.html

  * {igt@kms_big_fb@4-tiled-8bpp-rotate-0} (NEW):
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271]) +111 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * {igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip} (NEW):
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +88 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3777]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3777]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111615]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +151 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#110723])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [i915#3886]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#3886])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3689] / [i915#3886])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#3886]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3689]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#3886]) +4 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl1/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615] / [i915#3689]) +6 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color@pipe-d-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109278] / [i915#1149]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb3/igt@kms_color@pipe-d-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-c-ctm-max:
    - shard-apl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][93] ([i915#1319])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#1063])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#3359]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3319]) +3 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278] / [fdo#109279])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-random:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278]) +19 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109279] / [i915#3359]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([fdo#109274] / [fdo#109278]) +2 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-tglb:         [P

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html

--===============6064473554202620716==
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
<tr><td><b>Series:</b></td><td>DG2 platform definition and Tile 4 plane format support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/99784/">https://patchwork.freedesktop.org/series/99784/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11197_full -&gt; IGTPW_6599_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6599_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6599_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/index.html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6599_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_big_fb@4-tiled-32bpp-rotate-270} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> +39 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> +22 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> +43 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-rgb565-blt-4tiled} (NEW):</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html">FAIL</a> +16 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl7/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html">FAIL</a> +16 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk4/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled.html">FAIL</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglu-5/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html">FAIL</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html">FAIL</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html">FAIL</a> +16 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled} (NEW):</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled.html">FAIL</a> +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@bcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl6/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl3/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-snb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11197_full and IGTPW_6599_full:</p>
<h3>New IGT tests (66)</h3>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.02, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-wc-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.03, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-wc-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.01, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.01, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.01, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.03, 0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.02, 0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.04, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-render-4tiled:</p>
<ul>
<li>Statuses : 7 fail(s)</li>
<li>Exec time: [0.02, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-4:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-a-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-4:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-4:</p>
<ul>
<li>Statuses : 7 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6599_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb3/igt@gem_eio@kms.html">FAIL</a> ([i915#232])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2481] / [i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_balancer@parallel.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb7/igt@gem_exec_balancer@parallel.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@gem_exec_capture@pi@vcs1.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vecs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb3/igt@gem_exec_capture@pi@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@gem_exec_capture@pi@vecs0.html">INCOMPLETE</a> ([i915#3371])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@gem_exec_endless@dispatch@vcs1.html">INCOMPLETE</a> ([i915#3778])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl8/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-glk3/igt@gem_exec_whisper@basic-queues-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">DMESG-WARN</a> ([i915#118]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl7/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl6/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb3/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@gem_lmem_swapping@smem-oom.html">SKIP</a> ([i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb8/igt@gem_mmap_gtt@coherency.html">SKIP</a> ([fdo#109292])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-valid-protected-context:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@gem_pxp@create-valid-protected-context.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl7/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +219 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb1/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb1/igt@gen9_exec_parse@basic-rejected.html">SKIP</a> ([i915#2527] / [i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-tglb6/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11197/shard-snb6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb4/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#636])</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@4-tiled-8bpp-rotate-0} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb6/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +111 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271]) +88 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +151 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb5/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl8/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl1/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_ccs@pipe-c-missing-ccs-buffer-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_chamelium@dp-hpd-storm-disable.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-snb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-glk2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb3/igt@kms_color@pipe-d-ctm-0-5.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl6/igt@kms_color_chamelium@pipe-c-ctm-max.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-apl2/igt@kms_content_protection@atomic-dpms.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb6/igt@kms_content_protection@content_type_change.html">SKIP</a> ([i915#1063])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb2/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-sliding.html">SKIP</a> ([i915#3319]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb4/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html">SKIP</a> ([fdo#109278]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6599/shard-iclb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-tglb:         [P</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6064473554202620716==--
