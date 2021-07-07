Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 07 Jul 2021 13:01:43 -0000
Message-ID: <162566290391.30455.9469195097228989229@emeril.freedesktop.org>
References: <20210707105238.1694091-1-matthew.auld@intel.com>
In-Reply-To: <20210707105238.1694091-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Faddfb=5Fbasic=3A_pass_the_actual_fd_to_gem=5Fhas=5Flmem?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1928679077=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1928679077==
Content-Type: multipart/alternative;
 boundary="===============1853200253078669046=="

--===============1853200253078669046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_addfb_basic: pass the actual fd to gem_has_lmem
URL   : https://patchwork.freedesktop.org/series/92271/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6130_full -> IGTPW_5988_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5988_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5988_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5988_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_isolation@nonpriv:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@gem_ctx_isolation@nonpriv.html

  
#### Warnings ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         [FAIL][2] ([i915#3745]) -> [SKIP][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         [FAIL][4] ([i915#3745]) -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  
Known issues
------------

  Here are the changes found in IGTPW_5988_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][9] ([fdo#109271] / [i915#1099]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb6/igt@gem_ctx_persistence@clone.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][10] -> [TIMEOUT][11] ([i915#2369] / [i915#3063] / [i915#3648])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][13] -> [FAIL][14] ([i915#2842]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][16] -> [FAIL][17] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-blt:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109283])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][21] ([i915#3633])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#180])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#307])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb5/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@linear-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#768])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271]) +137 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#3297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@chained-batch:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@gen7_exec_parse@chained-batch.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         NOTRUN -> [FAIL][30] ([i915#3343])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#1937])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#1937])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         NOTRUN -> [WARN][33] ([i915#2684])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [PASS][34] -> [INCOMPLETE][35] ([i915#151] / [i915#155])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl7/igt@i915_pm_rpm@system-suspend.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@i915_pm_rpm@system-suspend.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          NOTRUN -> [INCOMPLETE][36] ([i915#2782])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#118] / [i915#95]) +3 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#110725] / [fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110723])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2705])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#3689]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#3742])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-degamma:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#1149])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl3/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3116])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][53] ([i915#1319])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][54] ([i915#2105])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109279] / [i915#3359])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109278]) +21 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][58] ([fdo#109271]) +368 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274] / [fdo#109278])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180]) +7 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2587])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#111825]) +8 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - shard-glk:          [PASS][64] -> [FAIL][65] ([i915#2546] / [i915#49])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109280]) +16 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271]) +76 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@static-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#1187])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_hdr@static-toggle.html
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#1187])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@kms_hdr@static-toggle.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#533]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#533])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#533]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][73] ([fdo#108145] / [i915#265]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][74] ([i915#265]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3536])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#112054])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109274]) +6 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-kbl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#658]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#658]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#658]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109642] / [fdo#111068] / [i915#658]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][85] -> [SKIP][86] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109441]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][88] -> [DMESG-WARN][89] ([i915#180] / [i915#295])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#2437])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [i915#2437])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271]) +250 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#2530]) +2 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#109289])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109291]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@prime_nv_pcopy@test3_5.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109291])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@prime_nv_pcopy@test3_5.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#2994]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl1/igt@sysfs_clients@create.html

  * igt@sysfs_clients@fair-3:
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk2/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl4/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-glk:          [DMESG-WARN][101] ([i915#2283]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@core_hotunplug@unbind-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [DMESG-WARN][103] ([i915#2283]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl7/igt@core_hotunplug@unbind-rebind.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl4/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [DMESG-WARN][105] ([i915#1602] / [i915#2283]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb5/igt@core_hotunplug@unbind-rebind.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb3/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [SKIP][107] ([fdo#109271]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_gttfill@basic:
    - shard-glk:          [DMESG-WARN][111] ([i915#118] / [i915#95]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@gem_exec_gttfill@basic.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@gem_exec_gttfill@basic.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-iclb:         [DMESG-WARN][113] ([i915#1226]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [FAIL][115] ([i915#79]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][119] ([i915#180]) -> [PASS][120] +3 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][121] ([fdo#109441]) -> [PASS][122] +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb7/igt@kms_psr@psr2_no_drrs.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][123] ([i915#2852]) -> [FAIL][124] ([i915#2842])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][125] ([i915#1804] / [i915#2684]) -> [WARN][126] ([i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-glk:          [FAIL][127] ([i915#3745]) -> [SKIP][128] ([fdo#109271])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-kbl:          [FAIL][129] ([i915#3745]) -> [SKIP][130] ([fdo#109271])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-snb:          [FAIL][131] ([i915#3745]) -> [SKIP][132] ([fdo#109271])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-snb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-iclb:         [SKIP][133] ([i915#2920]) -> [SKIP][134] ([i915#658])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][135] ([i915#658]) -> [SKIP][136] ([i915#2920]) +1 similar issue
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([i915#180] / [i915#1814] / [i915#2283] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363]) -> ([FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#602])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html

--===============1853200253078669046==
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
<tr><td><b>Series:</b></td><td>tests/kms_addfb_basic: pass the actual fd to gem_has_lmem</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92271/">https://patchwork.freedesktop.org/series/92271/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6130_full -&gt; IGTPW_5988_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5988_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5988_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5988_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_ctx_isolation@nonpriv:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@gem_ctx_isolation@nonpriv.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a> ([i915#3745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a> ([i915#3745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5988_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb6/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb5/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb3/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk1/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb5/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@linear-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_render_copy@linear-to-vebox-yf-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +137 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@chained-batch:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@gen7_exec_parse@chained-batch.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl7/igt@i915_pm_rpm@system-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@i915_pm_rpm@system-suspend.html">INCOMPLETE</a> ([i915#151] / [i915#155])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@kms_big_joiner@basic.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_color@pipe-d-degamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl3/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk5/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl2/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-64x21-sliding.html">SKIP</a> ([fdo#109278]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +368 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#111825]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html">FAIL</a> ([i915#2546] / [i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109280]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109271]) +76 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@kms_hdr@static-toggle.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_plane_lowres@pipe-c-tiling-x.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> ([fdo#109274]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb8/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([i915#2437])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@nouveau_crc@pipe-a-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl1/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +250 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb3/igt@perf@per-context-mode-unprivileged.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb4/igt@prime_nv_pcopy@test3_5.html">SKIP</a> ([fdo#109291]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-tglb6/igt@prime_nv_pcopy@test3_5.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl1/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk2/igt@sysfs_clients@fair-3.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl4/igt@sysfs_clients@split-50.html">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl4/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb5/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#1602] / [i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb3/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_gttfill@basic:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk3/igt@gem_exec_gttfill@basic.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk4/igt@gem_exec_gttfill@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb8/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#1226]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2852]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-glk7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a> ([i915#3745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-glk6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a> ([i915#3745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-kbl2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-snb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">FAIL</a> ([i915#3745]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-snb7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5988/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6130/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6">FAIL</a>, [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144]) ([i915#180] / [i915#1814] / [i915#2283] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363]) -&gt; ([FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154], [FAIL][155]) ([fdo#109271] / [i915#1436] / [i915#180] / [i915#1814] / [i915#2292] / [i915#2505] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#602])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1853200253078669046==--

--===============1928679077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1928679077==--
