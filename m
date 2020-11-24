Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Nov 2020 08:46:12 -0000
Message-ID: <160620757250.10862.13996861784787929370@emeril.freedesktop.org>
References: <20201124062406.12636-1-nidhi1.gupta@intel.com>
In-Reply-To: <20201124062406.12636-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkZWQg?=
 =?utf-8?q?dynamic_Subtest_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0898157605=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: nidhi1.gupta@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0898157605==
Content-Type: multipart/alternative;
 boundary="===============3770107689103008963=="

--===============3770107689103008963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Added dynamic Subtest (rev3)
URL   : https://patchwork.freedesktop.org/series/83576/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9379_full -> IGTPW_5213_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5213_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_atomic_transition@modeset-transitions} (NEW):
    - shard-hsw:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw2/igt@kms_atomic_transition@modeset-transitions.html
    - shard-tglb:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb8/igt@kms_atomic_transition@modeset-transitions.html
    - shard-kbl:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl6/igt@kms_atomic_transition@modeset-transitions.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk3/igt@kms_atomic_transition@modeset-transitions.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb7/igt@kms_atomic_transition@modeset-transitions.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-snb7/igt@kms_atomic_transition@modeset-transitions.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9379_full and IGTPW_5213_full:

### New IGT tests (1) ###

  * igt@kms_atomic_transition@modeset-transitions:
    - Statuses : 7 incomplete(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5213_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-iclb:         [PASS][7] -> [INCOMPLETE][8] ([i915#2502])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb5/igt@gem_exec_endless@dispatch@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-hsw:          [PASS][9] -> [FAIL][10] ([i915#2389])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@i915_pm_rpm@gem-idle:
    - shard-hsw:          [PASS][11] -> [SKIP][12] ([fdo#109271])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw1/igt@i915_pm_rpm@gem-idle.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw1/igt@i915_pm_rpm@gem-idle.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:
    - shard-glk:          [PASS][13] -> [DMESG-WARN][14] ([i915#118] / [i915#95]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][15] -> [INCOMPLETE][16] ([i915#1185])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [PASS][17] -> [INCOMPLETE][18] ([i915#1635] / [i915#2635])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          [PASS][19] -> [INCOMPLETE][20] ([i915#2635])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][21] -> [INCOMPLETE][22] ([i915#155])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:
    - shard-glk:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk7/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk9/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [INCOMPLETE][26] ([i915#2055])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-apl:          [PASS][27] -> [DMESG-WARN][28] ([i915#1635] / [i915#1982]) +4 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-kbl:          [PASS][29] -> [DMESG-WARN][30] ([i915#1982]) +4 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
    - shard-tglb:         [PASS][31] -> [DMESG-WARN][32] ([i915#1982]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([fdo#109642] / [fdo#111068])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb6/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [PASS][35] -> [SKIP][36] ([fdo#109441]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html

  
#### Possible fixes ####

  * igt@api_intel_bb@intel-bb-blit-y:
    - shard-hsw:          [INCOMPLETE][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw2/igt@api_intel_bb@intel-bb-blit-y.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw1/igt@api_intel_bb@intel-bb-blit-y.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [FAIL][39] ([i915#2389]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_softpin@noreloc-s3:
    - shard-iclb:         [INCOMPLETE][41] ([i915#1373] / [i915#2405]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@gem_softpin@noreloc-s3.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@gem_softpin@noreloc-s3.html
    - shard-apl:          [INCOMPLETE][43] ([i915#1635] / [i915#2405] / [i915#2635]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl8/igt@gem_softpin@noreloc-s3.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl2/igt@gem_softpin@noreloc-s3.html
    - shard-glk:          [INCOMPLETE][45] ([i915#2199] / [i915#2405] / [i915#2635]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@gem_softpin@noreloc-s3.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk8/igt@gem_softpin@noreloc-s3.html
    - shard-hsw:          [INCOMPLETE][47] ([i915#2405] / [i915#2637]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw4/igt@gem_softpin@noreloc-s3.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@gem_softpin@noreloc-s3.html
    - shard-kbl:          [INCOMPLETE][49] ([i915#2405]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl7/igt@gem_softpin@noreloc-s3.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl7/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-snb:          [INCOMPLETE][51] -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-snb4/igt@gem_userptr_blits@coherency-sync.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-snb7/igt@gem_userptr_blits@coherency-sync.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [SKIP][53] ([fdo#109271]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [SKIP][55] ([i915#579]) -> [PASS][56] +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb4/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-hsw:          [SKIP][57] ([fdo#109271]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html
    - shard-apl:          [SKIP][59] ([fdo#109271] / [i915#1635]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl3/igt@i915_pm_rpm@gem-execbuf.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@i915_pm_rpm@gem-execbuf.html
    - shard-glk:          [SKIP][61] ([fdo#109271]) -> [PASS][62] +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-kbl:          [DMESG-WARN][63] ([i915#1982]) -> [PASS][64] +4 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-tglb:         [DMESG-WARN][65] ([i915#1982]) -> [PASS][66] +3 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:
    - shard-apl:          [DMESG-WARN][67] ([i915#1635] / [i915#1982]) -> [PASS][68] +5 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70] +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:
    - shard-glk:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +7 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][75] ([fdo#109642] / [fdo#111068]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb8/igt@kms_psr2_su@frontbuffer.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][77] ([fdo#109441]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb1/igt@kms_psr@psr2_dpms.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@kms_setmode@basic:
    - shard-hsw:          [FAIL][79] ([i915#31]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_setmode@basic.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_setmode@basic.html

  * igt@perf@short-reads:
    - shard-hsw:          [FAIL][81] ([i915#51]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@perf@short-reads.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw2/igt@perf@short-reads.html

  
#### Warnings ####

  * igt@gem_softpin@noreloc-s3:
    - shard-tglb:         [INCOMPLETE][83] ([i915#1373] / [i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456]) -> [DMESG-WARN][84] ([i915#2411])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb6/igt@gem_softpin@noreloc-s3.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb7/igt@gem_softpin@noreloc-s3.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][85] ([i915#1804] / [i915#2684]) -> [WARN][86] ([i915#2681] / [i915#2684])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf:
    - shard-tglb:         [SKIP][87] ([i915#579]) -> [DMESG-WARN][88] ([i915#2411]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-glk:          [FAIL][89] ([fdo#108145] / [i915#265]) -> [DMESG-FAIL][90] ([fdo#108145] / [i915#1982])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
    - shard-apl:          [FAIL][91] ([fdo#108145] / [i915#1635] / [i915#265]) -> [DMESG-FAIL][92] ([fdo#108145] / [i915#1635] / [i915#1982])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          [DMESG-FAIL][93] ([fdo#108145] / [i915#1635] / [i915#1982]) -> [FAIL][94] ([fdo#108145] / [i915#1635] / [i915#265])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@runner@aborted:
    - shard-iclb:         ([FAIL][95], [FAIL][96]) ([i915#2295]) -> ([FAIL][97], [FAIL][98]) ([i915#2295] / [i915#483])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@runner@aborted.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@runner@aborted.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb3/igt@runner@aborted.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb7/igt@runner@aborted.html
    - shard-glk:          ([FAIL][99], [FAIL][100]) ([i915#2295] / [i915#86] / [k.org#202321]) -> ([FAIL][101], [FAIL][102]) ([i915#2295] / [k.org#202321])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk9/igt@runner@aborted.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@runner@aborted.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk4/igt@runner@aborted.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk9/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1373]: https://gitlab.freedesktop.org/drm/intel/issues/1373
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2199]: https://gitlab.freedesktop.org/drm/intel/issues/2199
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2405]: https://gitlab.freedesktop.org/drm/intel/issues/2405
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2502]: https://gitlab.freedesktop.org/drm/intel/issues/2502
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#31]: https://gitlab.freedesktop.org/drm/intel/issues/31
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#51]: https://gitlab.freedesktop.org/drm/intel/issues/51
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#86]: https://gitlab.freedesktop.org/drm/intel/issues/86
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5868 -> IGTPW_5213
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9379: 17d72e5f82c18c61f83b8980c427e66dbf17d747 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5213: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html

--===============3770107689103008963==
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
<tr><td><b>Series:</b></td><td>Added dynamic Subtest (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/83576/">https://patchwork.freedesktop.org/series/83576/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9379_full -&gt; IGTPW_5213_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5213_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_atomic_transition@modeset-transitions} (NEW):</p>
<ul>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw2/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb8/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl6/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk3/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb7/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-snb7/igt@kms_atomic_transition@modeset-transitions.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9379_full and IGTPW_5213_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_atomic_transition@modeset-transitions:<ul>
<li>Statuses : 7 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5213_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb5/igt@gem_exec_endless@dispatch@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb6/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2502">i915#2502</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-idle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw1/igt@i915_pm_rpm@gem-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw1/igt@i915_pm_rpm@gem-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-left-edge.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk7/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk9/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2055">i915#2055</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb6/igt@kms_psr2_su@page_flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw2/igt@api_intel_bb@intel-bb-blit-y.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw1/igt@api_intel_bb@intel-bb-blit-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk9/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl8/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl2/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2199">i915#2199</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2635">i915#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk8/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw4/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2637">i915#2637</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl7/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2405">i915#2405</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl7/igt@gem_softpin@noreloc-s3.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-snb4/igt@gem_userptr_blits@coherency-sync.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-snb7/igt@gem_userptr_blits@coherency-sync.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb4/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw4/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl3/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk4/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@i915_pm_rpm@gem-execbuf.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_draw_crc@draw-method-rgb565-pwrite-ytiled.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-vga1-hdmi-a1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-min.html">PASS</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb8/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb1/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/31">i915#31</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw6/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@short-reads:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-hsw6/igt@perf@short-reads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/51">i915#51</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-hsw2/igt@perf@short-reads.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb6/igt@gem_softpin@noreloc-s3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1373">i915#1373</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb7/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-tglb8/igt@i915_pm_rpm@gem-execbuf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-tglb7/igt@i915_pm_rpm@gem-execbuf.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">DMESG-FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-apl8/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-iclb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9379/shard-glk2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/86">i915#86</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/shard-glk9/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=202321">k.org#202321</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5868 -&gt; IGTPW_5213</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9379: 17d72e5f82c18c61f83b8980c427e66dbf17d747 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5213: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5213/index.html<br />
  IGT_5868: 36b5fc05c30dbfd9242069fd6e51ebb419b386bc @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============3770107689103008963==--

--===============0898157605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0898157605==--
