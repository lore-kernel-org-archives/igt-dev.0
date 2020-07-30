Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 30 Jul 2020 14:27:32 -0000
Message-ID: <159611925263.11112.13099000955430068039@emeril.freedesktop.org>
References: <20200730114920.383-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200730114920.383-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev17=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1659923093=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1659923093==
Content-Type: multipart/alternative;
 boundary="===============8735453516316410932=="

--===============8735453516316410932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove libdrm in rendercopy (rev17)
URL   : https://patchwork.freedesktop.org/series/79823/
State : failure

== Summary ==

CI Bug Log - changes from IGT_5752_full -> IGTPW_4829_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4829_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4829_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4829_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@render-x-reloc-512} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +4 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb8/igt@api_intel_bb@render-x-reloc-512.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [PASS][2] -> [FAIL][3] +10 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-hsw:          [PASS][4] -> [FAIL][5] +3 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw6/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-snb:          [PASS][6] -> [FAIL][7] +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] +4 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-kbl:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-tglb:         [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_psr@primary_blt:
    - shard-tglb:         [PASS][13] -> [FAIL][14] +12 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@kms_psr@primary_blt.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb2/igt@kms_psr@primary_blt.html

  * igt@kms_psr@sprite_blt:
    - shard-iclb:         [PASS][15] -> [FAIL][16] +8 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr@sprite_blt.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb7/igt@kms_psr@sprite_blt.html

  
#### Warnings ####

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][17] ([fdo#109441]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
New tests
---------

  New tests have been introduced between IGT_5752_full and IGTPW_4829_full:

### New IGT tests (14) ###

  * igt@api_intel_bb@check-canonical:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.01] s

  * igt@api_intel_bb@render-ccs:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.47] s

  * igt@api_intel_bb@render-none-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.28, 0.49] s

  * igt@api_intel_bb@render-none-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.11] s

  * igt@api_intel_bb@render-none-reloc-1024:
    - Statuses :
    - Exec time: [None] s

  * igt@api_intel_bb@render-none-reloc-512:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@api_intel_bb@render-x-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.23, 0.47] s

  * igt@api_intel_bb@render-x-512:
    - Statuses : 6 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@api_intel_bb@render-x-reloc-1024:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.42] s

  * igt@api_intel_bb@render-x-reloc-512:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.21] s

  * igt@api_intel_bb@render-y-1024:
    - Statuses : 7 pass(s)
    - Exec time: [0.26, 0.46] s

  * igt@api_intel_bb@render-y-512:
    - Statuses : 7 pass(s)
    - Exec time: [0.07, 0.12] s

  * igt@api_intel_bb@render-y-reloc-1024:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.36] s

  * igt@api_intel_bb@render-y-reloc-512:
    - Statuses : 6 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.10] s

  

Known issues
------------

  Here are the changes found in IGTPW_4829_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-mixed-process@vcs0:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#1528])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#1930])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#118] / [i915#95]) +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][25] -> [SKIP][26] ([i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@gem_huc_copy@huc-copy.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb6/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@medium-copy-odd:
    - shard-hsw:          [PASS][27] -> [TIMEOUT][28] ([i915#1958] / [i915#2119]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw2/igt@gem_mmap_gtt@medium-copy-odd.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@gem_mmap_gtt@medium-copy-odd.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][29] -> [WARN][30] ([i915#1519])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][31] -> [INCOMPLETE][32] ([i915#155])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#1635]) +7 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-glk:          [PASS][35] -> [DMESG-WARN][36] ([i915#1982])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#407])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-x-tiled:
    - shard-kbl:          [PASS][39] -> [DMESG-WARN][40] ([i915#1982]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_flip_tiling@flip-x-tiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1635] / [i915#49])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
    - shard-iclb:         [PASS][43] -> [FAIL][44] ([i915#49])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#49]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
    - shard-kbl:          [PASS][47] -> [FAIL][48] ([i915#49])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-tglb:         [PASS][49] -> [DMESG-WARN][50] ([i915#1982]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_psr@no_drrs:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#173])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@no_drrs.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb1/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][53] -> [SKIP][54] ([fdo#109441]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-b-accuracy-idle:
    - shard-apl:          [PASS][57] -> [DMESG-WARN][58] ([i915#1635] / [i915#1982])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl6/igt@kms_vblank@pipe-b-accuracy-idle.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl3/igt@kms_vblank@pipe-b-accuracy-idle.html

  * igt@syncobj_wait@single-wait-submitted:
    - shard-snb:          [PASS][59] -> [TIMEOUT][60] ([i915#1958] / [i915#2119]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb1/igt@syncobj_wait@single-wait-submitted.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb1/igt@syncobj_wait@single-wait-submitted.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-iclb:         [FAIL][61] -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb7/igt@core_setmaster@master-drop-set-user.html
    - shard-kbl:          [FAIL][63] -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl3/igt@core_setmaster@master-drop-set-user.html
    - shard-snb:          [FAIL][65] -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb5/igt@core_setmaster@master-drop-set-user.html
    - shard-tglb:         [FAIL][67] -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb5/igt@core_setmaster@master-drop-set-user.html
    - shard-apl:          [FAIL][69] ([i915#1635]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl8/igt@core_setmaster@master-drop-set-user.html
    - shard-glk:          [FAIL][71] -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@core_setmaster@master-drop-set-user.html
    - shard-hsw:          [FAIL][73] -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw6/igt@core_setmaster@master-drop-set-user.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [DMESG-WARN][75] ([i915#180]) -> [PASS][76] +8 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-hsw:          [TIMEOUT][77] ([i915#1958] / [i915#2119]) -> [PASS][78] +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          [DMESG-WARN][79] ([i915#1982]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:
    - shard-snb:          [TIMEOUT][81] ([i915#1958] / [i915#2119]) -> [PASS][82] +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][85] ([i915#2055]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-kbl:          [DMESG-WARN][87] ([i915#1982]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
    - shard-iclb:         [DMESG-WARN][91] ([i915#1982]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [INCOMPLETE][93] ([i915#155]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][95] ([fdo#109642] / [fdo#111068]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][97] ([fdo#109441]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-kbl:          [FAIL][99] ([i915#31]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_setmode@basic.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl6/igt@kms_setmode@basic.html

  * igt@kms_vblank@pipe-c-query-forked-busy:
    - shard-apl:          [DMESG-WARN][101] ([i915#1635] / [i915#1982]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl1/igt@kms_vblank@pipe-c-query-forked-busy.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][103] ([i915#1542]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb3/igt@perf@blocking-parameterized.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][105] ([i915#1319] / [i915#2119]) -> [TIMEOUT][106] ([i915#1319] / [i915#1958] / [i915#2119])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-hsw:          [SKIP][107] ([fdo#109271]) -> [TIMEOUT][108] ([i915#1958] / [i915#2119]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_content_protection@legacy.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@kms_content_protection@legacy.html
    - shard-snb:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_content_protection@legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-snb:          [TIMEOUT][111] ([i915#1958] / [i915#2119]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-hsw:          [TIMEOUT][113] ([i915#1958] / [i915#2119]) -> [SKIP][114] ([fdo#109271]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#173]: https://gitlab.freedesktop.org/drm/intel/issues/173
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#407]: https://gitlab.freedesktop.org/drm/intel/issues/407
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5752 -> IGTPW_4829

  CI-20190529: 20190529
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4829: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html

--===============8735453516316410932==
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
<tr><td><b>Series:</b></td><td>Remove libdrm in rendercopy (rev17)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/79823/">https://patchwork.freedesktop.org/series/79823/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_5752_full -&gt; IGTPW_4829_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_4829_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_4829_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4829_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@api_intel_bb@render-x-reloc-512} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb8/igt@api_intel_bb@render-x-reloc-512.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk3/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk1/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +10 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw8/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw6/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb5/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">FAIL</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@kms_psr@primary_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb2/igt@kms_psr@primary_blt.html">FAIL</a> +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr@sprite_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb7/igt@kms_psr@sprite_blt.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_psr@psr2_sprite_blt:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb6/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_5752_full and IGTPW_4829_full:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@api_intel_bb@check-canonical:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.28, 0.49] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-reloc-1024:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-none-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.23, 0.47] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-512:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.42] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-x-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.21] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-1024:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.26, 0.46] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-512:</p>
<ul>
<li>Statuses : 7 pass(s)</li>
<li>Exec time: [0.07, 0.12] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-reloc-1024:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.36] s</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-y-reloc-512:</p>
<ul>
<li>Statuses : 6 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4829_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-mixed-process@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl4/igt@gem_ctx_persistence@engines-mixed-process@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1528">i915#1528</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-concurrent0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@gem_exec_reloc@basic-concurrent0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@gem_exec_reloc@basic-concurrent0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1930">i915#1930</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@gem_exec_whisper@basic-fds-priority.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-odd:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw2/igt@gem_mmap_gtt@medium-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@gem_mmap_gtt@medium-copy-odd.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl4/igt@kms_big_fb@linear-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk4/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/407">i915#407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-x-tiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_flip_tiling@flip-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_flip_tiling@flip-x-tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/49">i915#49</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb1/igt@kms_psr@no_drrs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/173">i915#173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb5/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-accuracy-idle:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl6/igt@kms_vblank@pipe-b-accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl3/igt@kms_vblank@pipe-b-accuracy-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</li>
</ul>
</li>
<li>
<p>igt@syncobj_wait@single-wait-submitted:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb1/igt@syncobj_wait@single-wait-submitted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb1/igt@syncobj_wait@single-wait-submitted.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb7/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl2/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl3/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb5/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb5/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl4/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl8/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk9/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@core_setmaster@master-drop-set-user.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw6/igt@core_setmaster@master-drop-set-user.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl6/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_addfb_basic@bo-too-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw2/igt@kms_addfb_basic@bo-too-small.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-glk6/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-glk5/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb6/igt@kms_cursor_edge_walk@pipe-b-256x256-top-edge.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-tglb5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-busy:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-apl3/igt@kms_vblank@pipe-c-query-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-apl1/igt@kms_vblank@pipe-c-query-forked-busy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@blocking-parameterized:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-iclb2/igt@perf@blocking-parameterized.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-iclb3/igt@perf@blocking-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-kbl1/igt@kms_content_protection@atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb1/igt@kms_content_protection@legacy.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-snb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5752/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1958">i915#1958</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2119">i915#2119</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5752 -&gt; IGTPW_4829</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8815: 521846d50ed323d4dcb0ffafa63e34528b0a4996 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4829: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4829/index.html<br />
  IGT_5752: 3ecf9d88803a686354394ea60164551646235273 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8735453516316410932==--

--===============1659923093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1659923093==--
