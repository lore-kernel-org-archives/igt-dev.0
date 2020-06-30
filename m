Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 30 Jun 2020 12:14:52 -0000
Message-ID: <159351929205.22703.7363626013298511675@emeril.freedesktop.org>
References: <20200630093343.21923-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200630093343.21923-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIGFw?=
 =?utf-8?q?i=5Fintel=5Fbb_test_=28rev8=29?=
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: Add api_intel_bb test (rev8)
URL   : https://patchwork.freedesktop.org/series/78719/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8676_full -> IGTPW_4716_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4716_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@api_intel_bb@intel-bb-blit} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb2/igt@api_intel_bb@intel-bb-blit.html
    - shard-hsw:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw4/igt@api_intel_bb@intel-bb-blit.html

  
New tests
---------

  New tests have been introduced between CI_DRM_8676_full and IGTPW_4716_full:

### New IGT tests (9) ###

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@blit-reloc-purge-cache:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@full-batch:
    - Statuses : 7 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@api_intel_bb@intel-bb-blit:
    - Statuses : 2 fail(s) 5 pass(s)
    - Exec time: [0.06, 0.18] s

  * igt@api_intel_bb@offset-control:
    - Statuses : 2 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@api_intel_bb@simple-bb-ctx:
    - Statuses : 7 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in IGTPW_4716_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-valid-nonaligned:
    - shard-snb:          [PASS][3] -> [TIMEOUT][4] ([i915#1958]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-snb1/igt@gem_create@create-valid-nonaligned.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-snb6/igt@gem_create@create-valid-nonaligned.html
    - shard-hsw:          [PASS][5] -> [TIMEOUT][6] ([i915#1958]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-hsw7/igt@gem_create@create-valid-nonaligned.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw1/igt@gem_create@create-valid-nonaligned.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-glk7/igt@gem_exec_whisper@basic-queues-forked-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html

  * igt@gem_sync@basic-store-each:
    - shard-apl:          [PASS][9] -> [DMESG-WARN][10] ([i915#1635] / [i915#95]) +32 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl3/igt@gem_sync@basic-store-each.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl4/igt@gem_sync@basic-store-each.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [PASS][11] -> [DMESG-WARN][12] ([i915#1436] / [i915#716])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl1/igt@gen9_exec_parse@allowed-all.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl1/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@reload:
    - shard-iclb:         [PASS][13] -> [DMESG-WARN][14] ([i915#1982])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb6/igt@i915_module_load@reload.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb3/igt@i915_module_load@reload.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#454])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb5/igt@i915_pm_dc@dc6-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-tglb:         [PASS][17] -> [DMESG-WARN][18] ([i915#402])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb3/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb7/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-glk:          [PASS][19] -> [DMESG-FAIL][20] ([i915#118] / [i915#95])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_cursor_legacy@pipe-c-single-bo:
    - shard-kbl:          [PASS][21] -> [DMESG-WARN][22] ([i915#93] / [i915#95]) +46 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl3/igt@kms_cursor_legacy@pipe-c-single-bo.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl4/igt@kms_cursor_legacy@pipe-c-single-bo.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#180]) +4 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@nonexisting-fb-interruptible@a-dp1:
    - shard-kbl:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl6/igt@kms_flip@nonexisting-fb-interruptible@a-dp1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl6/igt@kms_flip@nonexisting-fb-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb5/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-256:
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#1635] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl6/igt@kms_plane_cursor@pipe-a-overlay-size-256.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl7/igt@kms_plane_cursor@pipe-a-overlay-size-256.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-kbl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl1/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr2_su@page_flip:
    - shard-tglb:         [PASS][33] -> [SKIP][34] ([i915#1911])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb5/igt@kms_psr2_su@page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb5/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@vecs0:
    - shard-kbl:          [DMESG-WARN][37] ([i915#180]) -> [PASS][38] +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@vecs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vecs0.html

  * igt@gem_exec_nop@basic-parallel:
    - shard-apl:          [DMESG-WARN][39] ([i915#1635] / [i915#95]) -> [PASS][40] +37 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl2/igt@gem_exec_nop@basic-parallel.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl1/igt@gem_exec_nop@basic-parallel.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [FAIL][41] ([i915#1930]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-glk5/igt@gem_exec_reloc@basic-concurrent0.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-glk3/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - shard-snb:          [TIMEOUT][43] ([i915#1958]) -> [PASS][44] +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-snb1/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-snb4/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc:
    - shard-iclb:         [INCOMPLETE][45] -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb4/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync@uc.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-apl:          [DMESG-WARN][47] ([i915#1436] / [i915#716]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl4/igt@gen9_exec_parse@allowed-all.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_getparams_basic@basic-eu-total:
    - shard-kbl:          [DMESG-WARN][49] ([i915#93] / [i915#95]) -> [PASS][50] +45 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl2/igt@i915_getparams_basic@basic-eu-total.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl2/igt@i915_getparams_basic@basic-eu-total.html

  * igt@i915_module_load@reload:
    - shard-tglb:         [DMESG-WARN][51] ([i915#402]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb2/igt@i915_module_load@reload.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb1/igt@i915_module_load@reload.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][53] ([i915#118] / [i915#95]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-glk8/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-glk5/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen:
    - shard-kbl:          [DMESG-FAIL][55] ([i915#54] / [i915#95]) -> [PASS][56] +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-128x128-offscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_lease@lessee_list:
    - shard-hsw:          [TIMEOUT][59] ([i915#1958]) -> [PASS][60] +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-hsw2/igt@kms_lease@lessee_list.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw7/igt@kms_lease@lessee_list.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid:
    - shard-kbl:          [DMESG-FAIL][61] ([fdo#108145] / [i915#95]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
    - shard-apl:          [DMESG-FAIL][63] ([fdo#108145] / [i915#1635] / [i915#95]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-mid.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-apl:          [DMESG-FAIL][65] ([fdo#108145] / [i915#1635] / [i915#1982] / [i915#95]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [DMESG-FAIL][67] ([i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
    - shard-apl:          [DMESG-FAIL][69] ([i915#1635] / [i915#95]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl8/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][71] ([i915#1982]) -> [PASS][72] +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb5/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][73] ([fdo#109441]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_setmode@basic:
    - shard-apl:          [FAIL][75] ([i915#31]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl1/igt@kms_setmode@basic.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl7/igt@kms_setmode@basic.html

  * igt@perf@invalid-remove-userspace-config:
    - shard-hsw:          [INCOMPLETE][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-hsw1/igt@perf@invalid-remove-userspace-config.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw1/igt@perf@invalid-remove-userspace-config.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [FAIL][79] ([i915#1542]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb1/igt@perf@polling-parameterized.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb1/igt@perf@polling-parameterized.html
    - shard-tglb:         [FAIL][81] ([i915#1542]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-tglb6/igt@perf@polling-parameterized.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-tglb3/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][83] ([i915#588]) -> [SKIP][84] ([i915#658])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-apl:          [SKIP][85] ([fdo#109271] / [fdo#111827] / [i915#1635]) -> [SKIP][86] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-0-75.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl2/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes:
    - shard-apl:          [SKIP][87] ([fdo#109271] / [fdo#111827]) -> [SKIP][88] ([fdo#109271] / [fdo#111827] / [i915#1635]) +3 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl6/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl4/igt@kms_color_chamelium@pipe-invalid-degamma-lut-sizes.html

  * igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge:
    - shard-snb:          [SKIP][89] ([fdo#109271]) -> [TIMEOUT][90] ([i915#1958]) +3 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-snb5/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-snb6/igt@kms_cursor_edge_walk@pipe-c-64x64-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge:
    - shard-apl:          [SKIP][91] ([fdo#109271] / [i915#1635]) -> [SKIP][92] ([fdo#109271]) +12 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl7/igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl8/igt@kms_cursor_edge_walk@pipe-d-128x128-bottom-edge.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-snb:          [TIMEOUT][93] ([i915#1958]) -> [SKIP][94] ([fdo#109271]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-snb1/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
    - shard-hsw:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-hsw2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-apl:          [SKIP][97] ([fdo#109271]) -> [SKIP][98] ([fdo#109271] / [i915#1635]) +9 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-hsw:          [SKIP][99] ([fdo#109271]) -> [TIMEOUT][100] ([i915#1958]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-hsw8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-hsw1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][101] ([fdo#109642] / [fdo#111068]) -> [SKIP][102] ([i915#1911])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-iclb3/igt@kms_psr2_su@page_flip.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@perf@blocking-parameterized:
    - shard-apl:          [FAIL][103] ([i915#1542]) -> [DMESG-FAIL][104] ([i915#1635] / [i915#95])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl2/igt@perf@blocking-parameterized.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl4/igt@perf@blocking-parameterized.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][105] ([i915#1436] / [i915#1784]) -> [FAIL][106] ([fdo#109271] / [i915#1436] / [i915#716])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-kbl6/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][107], [FAIL][108], [FAIL][109]) ([fdo#109271] / [i915#1610] / [i915#1635] / [i915#716]) -> [FAIL][110] ([i915#1635])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl4/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl3/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8676/shard-apl8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/shard-apl2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1784]: https://gitlab.freedesktop.org/drm/intel/issues/1784
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5718 -> IGTPW_4716
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8676: 90573bcfde94b770410e07294c914b2c630d3999 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4716: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/index.html
  IGT_5718: af1ef32bfae90bcdbaf1b5d84c61ff4e04368505 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4716/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
