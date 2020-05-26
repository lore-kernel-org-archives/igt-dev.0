Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 26 May 2020 14:28:33 -0000
Message-ID: <159050331374.28043.3778966851890962919@emeril.freedesktop.org>
References: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200526081451.2045-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTWFrZSBn?=
 =?utf-8?q?em=5Fmedia=5Fvme_libdrm-free_=28rev2=29?=
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

Series: Make gem_media_vme libdrm-free (rev2)
URL   : https://patchwork.freedesktop.org/series/77651/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8537_full -> IGTPW_4611_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4611_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4611_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4611_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_suspend@debugfs-reader:
    - shard-glk:          [PASS][1] -> [TIMEOUT][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-glk7/igt@i915_suspend@debugfs-reader.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk1/igt@i915_suspend@debugfs-reader.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-glk:          NOTRUN -> [TIMEOUT][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_reloc@basic-concurrent16}:
    - shard-glk:          NOTRUN -> [TIMEOUT][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk1/igt@gem_exec_reloc@basic-concurrent16.html

  * {igt@kms_frontbuffer_tracking@fbcpsr-tiling-y}:
    - shard-glk:          [SKIP][5] ([fdo#109271]) -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-glk2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  
Known issues
------------

  Here are the changes found in IGTPW_4611_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed-process@blt:
    - shard-kbl:          [PASS][7] -> [FAIL][8] ([i915#1528])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl3/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl4/igt@gem_ctx_persistence@legacy-engines-mixed-process@blt.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][9] -> [FAIL][10] ([i915#1899])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb2/igt@i915_pm_dc@dc6-psr.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb7/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_suspend@debugfs-reader:
    - shard-apl:          [PASS][11] -> [TIMEOUT][12] ([i915#1635]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl7/igt@i915_suspend@debugfs-reader.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl1/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl2/igt@i915_suspend@fence-restore-untiled.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_color@pipe-c-ctm-max:
    - shard-kbl:          [PASS][15] -> [FAIL][16] ([i915#168])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl3/igt@kms_color@pipe-c-ctm-max.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl1/igt@kms_color@pipe-c-ctm-max.html
    - shard-apl:          [PASS][17] -> [FAIL][18] ([i915#168])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl6/igt@kms_color@pipe-c-ctm-max.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl2/igt@kms_color@pipe-c-ctm-max.html
    - shard-glk:          [PASS][19] -> [FAIL][20] ([i915#168])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-glk5/igt@kms_color@pipe-c-ctm-max.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk6/igt@kms_color@pipe-c-ctm-max.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen:
    - shard-kbl:          [PASS][21] -> [FAIL][22] ([i915#54] / [i915#93] / [i915#95]) +2 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x85-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen:
    - shard-apl:          [PASS][23] -> [FAIL][24] ([i915#54])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl4/igt@kms_cursor_crc@pipe-b-cursor-128x42-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][27] -> [DMESG-WARN][28] ([i915#180]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][29] -> [FAIL][30] ([fdo#108145] / [i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][31] -> [FAIL][32] ([fdo#108145] / [i915#52] / [i915#54] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
    - shard-kbl:          [PASS][33] -> [FAIL][34] ([i915#177] / [i915#52] / [i915#54] / [i915#93] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
    - shard-apl:          [PASS][35] -> [FAIL][36] ([i915#52] / [i915#54] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl7/igt@kms_draw_crc@draw-method-xrgb8888-render-untiled.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-7efc:
    - shard-apl:          [PASS][37] -> [FAIL][38] ([fdo#108145] / [i915#265] / [i915#95])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-coverage-7efc.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-128:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#1559] / [i915#93] / [i915#95]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl6/igt@kms_plane_cursor@pipe-a-overlay-size-128.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl4/igt@kms_plane_cursor@pipe-a-overlay-size-128.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#1559] / [i915#95])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl2/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109441]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb4/igt@kms_psr@psr2_suspend.html

  * igt@kms_setmode@basic:
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#31])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl3/igt@kms_setmode@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_setmode@basic.html

  
#### Possible fixes ####

  * {igt@gem_exec_endless@dispatch@vcs0}:
    - shard-apl:          [SKIP][47] ([fdo#109271]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl2/igt@gem_exec_endless@dispatch@vcs0.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@gem_exec_endless@dispatch@vcs0.html
    - shard-glk:          [SKIP][49] ([fdo#109271]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-glk5/igt@gem_exec_endless@dispatch@vcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-glk5/igt@gem_exec_endless@dispatch@vcs0.html

  * {igt@gem_exec_endless@dispatch@vcs1}:
    - shard-tglb:         [SKIP][51] ([i915#1929]) -> [PASS][52] +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-tglb7/igt@gem_exec_endless@dispatch@vcs1.html
    - shard-kbl:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +3 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl6/igt@gem_exec_endless@dispatch@vcs1.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl3/igt@gem_exec_endless@dispatch@vcs1.html

  * {igt@gem_exec_endless@dispatch@vecs0}:
    - shard-iclb:         [SKIP][55] ([i915#1929]) -> [PASS][56] +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb2/igt@gem_exec_endless@dispatch@vecs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb5/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         [SKIP][57] ([i915#1904]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-tglb3/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-apl:          [FAIL][59] ([i915#1119] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl3/igt@kms_big_fb@linear-32bpp-rotate-180.html
    - shard-kbl:          [FAIL][61] ([i915#1119] / [i915#93] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][63] ([i915#180]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * {igt@kms_flip@flip-vs-suspend@c-dp1}:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * {igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1}:
    - shard-kbl:          [FAIL][67] ([i915#1928]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl3/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp1.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][69] ([fdo#109441]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * {igt@perf@polling-parameterized}:
    - shard-iclb:         [FAIL][71] ([i915#1542]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb7/igt@perf@polling-parameterized.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb7/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][73] ([i915#588]) -> [SKIP][74] ([i915#658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][75] ([i915#454]) -> [FAIL][76] ([i915#1899])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-tglb5/igt@i915_pm_dc@dc6-psr.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-tglb7/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          [TIMEOUT][77] ([i915#1319] / [i915#1635]) -> [FAIL][78] ([fdo#110321] / [fdo#110336])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl6/igt@kms_content_protection@atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          [FAIL][79] ([fdo#110321] / [fdo#110336]) -> [TIMEOUT][80] ([i915#1319] / [i915#1635])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl4/igt@kms_content_protection@legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][81] ([i915#1319] / [i915#1635]) -> [FAIL][82] ([fdo#110321])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl8/igt@kms_content_protection@srm.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl4/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][83] ([i915#357]) -> [FAIL][84] ([i915#357] / [i915#93] / [i915#95])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-kbl4/igt@kms_content_protection@uevent.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-kbl3/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][85] ([i915#357]) -> [FAIL][86] ([i915#357] / [i915#95])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl2/igt@kms_content_protection@uevent.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-apl:          [SKIP][87] ([fdo#109271]) -> [TIMEOUT][88] ([i915#1635])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          [FAIL][89] ([fdo#108145] / [i915#265] / [i915#95]) -> [FAIL][90] ([fdo#108145] / [i915#265])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8537/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#1119]: https://gitlab.freedesktop.org/drm/intel/issues/1119
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1528]: https://gitlab.freedesktop.org/drm/intel/issues/1528
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1559]: https://gitlab.freedesktop.org/drm/intel/issues/1559
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#168]: https://gitlab.freedesktop.org/drm/intel/issues/168
  [i915#177]: https://gitlab.freedesktop.org/drm/intel/issues/177
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1928]: https://gitlab.freedesktop.org/drm/intel/issues/1928
  [i915#1929]: https://gitlab.freedesktop.org/drm/intel/issues/1929
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#52]: https://gitlab.freedesktop.org/drm/intel/issues/52
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5678 -> IGTPW_4611
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8537: 05a47cd761c49c3fa87648c30df0fd4d64b0b8c5 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4611: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/index.html
  IGT_5678: c1f30ee09ac2e7eb3e8e90245239731a169a6050 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4611/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
