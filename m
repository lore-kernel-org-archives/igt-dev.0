Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Nov 2020 09:27:26 -0000
Message-ID: <160577804616.18187.10014148490110225489@emeril.freedesktop.org>
References: <20201119044800.12686-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20201119044800.12686-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fauth=3A_Added_test_description_for_test_case_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1639245458=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1639245458==
Content-Type: multipart/alternative;
 boundary="===============0146090941182654057=="

--===============0146090941182654057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/core_auth: Added test description for test case (rev2)
URL   : https://patchwork.freedesktop.org/series/82455/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9357_full -> IGTPW_5190_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5190_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5190_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5190_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5190_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#658])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb2/igt@feature_discovery@psr2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_sync@basic-all:
    - shard-glk:          [PASS][5] -> [DMESG-WARN][6] ([i915#118] / [i915#95])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk3/igt@gem_sync@basic-all.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk8/igt@gem_sync@basic-all.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-apl:          [PASS][7] -> [SKIP][8] ([fdo#109271] / [i915#1635])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl7/igt@i915_pm_rpm@pm-caching.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl6/igt@i915_pm_rpm@pm-caching.html
    - shard-glk:          [PASS][9] -> [SKIP][10] ([fdo#109271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk4/igt@i915_pm_rpm@pm-caching.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk3/igt@i915_pm_rpm@pm-caching.html
    - shard-iclb:         [PASS][11] -> [SKIP][12] ([i915#579])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb5/igt@i915_pm_rpm@pm-caching.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb3/igt@i915_pm_rpm@pm-caching.html
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw4/igt@i915_pm_rpm@pm-caching.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/igt@i915_pm_rpm@pm-caching.html
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl7/igt@i915_pm_rpm@pm-caching.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl7/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:
    - shard-glk:          [PASS][17] -> [DMESG-WARN][18] ([i915#1982]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-hsw:          [PASS][19] -> [FAIL][20] ([i915#2295] / [i915#2370])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2346])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:
    - shard-kbl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1982]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][25] -> [DMESG-WARN][26] ([i915#1982]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         [PASS][27] -> [DMESG-WARN][28] ([i915#1982]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][29] -> [SKIP][30] ([i915#433])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-hsw:          [PASS][31] -> [INCOMPLETE][32] ([i915#2055] / [i915#2637])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-kbl:          [PASS][33] -> [INCOMPLETE][34] ([i915#155])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-apl:          [PASS][35] -> [INCOMPLETE][36] ([i915#1635] / [i915#2635])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-glk:          [PASS][37] -> [INCOMPLETE][38] ([i915#2635])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
    - shard-iclb:         [PASS][39] -> [INCOMPLETE][40] ([i915#1185])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [PASS][43] -> [SKIP][44] ([fdo#109642] / [fdo#111068])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb2/igt@kms_psr2_su@page_flip.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb8/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#1635] / [i915#1982]) +5 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl1/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-features-pipe-b.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-glk:          [INCOMPLETE][49] ([i915#2635]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-apl:          [INCOMPLETE][51] ([i915#1635] / [i915#2635]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-kbl:          [INCOMPLETE][53] ([i915#794]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [INCOMPLETE][55] ([i915#1373]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-hsw:          [INCOMPLETE][57] ([i915#2637]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_create@madvise:
    - shard-glk:          [DMESG-WARN][59] ([i915#118] / [i915#95]) -> [PASS][60] +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk7/igt@gem_exec_create@madvise.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk1/igt@gem_exec_create@madvise.html

  * igt@i915_pm_rpm@cursor:
    - shard-kbl:          [SKIP][61] ([fdo#109271]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@i915_pm_rpm@cursor.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl2/igt@i915_pm_rpm@cursor.html
    - shard-hsw:          [SKIP][63] ([fdo#109271]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw6/igt@i915_pm_rpm@cursor.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/igt@i915_pm_rpm@cursor.html
    - shard-iclb:         [SKIP][65] ([i915#579]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb7/igt@i915_pm_rpm@cursor.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb8/igt@i915_pm_rpm@cursor.html
    - shard-glk:          [SKIP][67] ([fdo#109271]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk8/igt@i915_pm_rpm@cursor.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk2/igt@i915_pm_rpm@cursor.html
    - shard-apl:          [SKIP][69] ([fdo#109271] / [i915#1635]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl1/igt@i915_pm_rpm@cursor.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl6/igt@i915_pm_rpm@cursor.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-apl:          [DMESG-WARN][71] ([i915#1635] / [i915#1982]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
    - shard-kbl:          [DMESG-WARN][73] ([i915#1982]) -> [PASS][74] +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
    - shard-hsw:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180:
    - shard-kbl:          [DMESG-WARN][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:
    - shard-kbl:          [FAIL][79] ([i915#54]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-apl:          [FAIL][81] ([i915#1635] / [i915#54]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
    - shard-glk:          [FAIL][83] ([i915#54]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [DMESG-WARN][85] ([i915#1982]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:
    - shard-snb:          [DMESG-WARN][87] ([i915#42]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         [DMESG-WARN][89] ([i915#1982]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][91] ([fdo#109441]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-tglb:         [INCOMPLETE][93] -> [DMESG-WARN][94] ([i915#2411])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-tglb:         [DMESG-WARN][95] ([i915#1436]) -> [DMESG-WARN][96] ([i915#2411])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@i915_pm_rpm@cursor:
    - shard-tglb:         [SKIP][97] ([i915#579]) -> [DMESG-WARN][98] ([i915#2411])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb8/igt@i915_pm_rpm@cursor.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb8/igt@i915_pm_rpm@cursor.html

  * igt@i915_pm_rpm@pm-caching:
    - shard-tglb:         [DMESG-WARN][99] ([i915#2411]) -> [SKIP][100] ([i915#579])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb7/igt@i915_pm_rpm@pm-caching.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb1/igt@i915_pm_rpm@pm-caching.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-tglb:         [DMESG-WARN][101] ([i915#2411]) -> [INCOMPLETE][102] ([i915#1436] / [i915#456])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-tglb:         [INCOMPLETE][103] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [DMESG-WARN][104] ([i915#2411])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][105] ([i915#1436] / [i915#2295] / [i915#2439]) -> [FAIL][106] ([fdo#109271] / [i915#2295])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-hsw6/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][107], [FAIL][108]) ([i915#1436] / [i915#1611] / [i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][109], [FAIL][110]) ([i915#1611] / [i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl6/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][111], [FAIL][112]) ([i915#2295] / [i915#2439] / [i915#483]) -> ([FAIL][113], [FAIL][114]) ([i915#1814] / [i915#2295] / [i915#2439] / [i915#483])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb1/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb7/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb3/igt@runner@aborted.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          ([FAIL][115], [FAIL][116]) ([i915#1611] / [i915#1635] / [i915#2295] / [i915#2439]) -> ([FAIL][117], [FAIL][118]) ([fdo#109271] / [i915#1611] / [i915#1635] / [i915#1814] / [i915#2295] / [i915#2439])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl3/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl1/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl4/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl6/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2439] / [i915#402]) -> ([FAIL][123], [FAIL][124]) ([i915#1602] / [i915#2295] / [i915#2439] / [i915#456])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb8/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb5/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb7/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb6/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

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
  [i915#1611]: https://gitlab.freedesktop.org/drm/intel/issues/1611
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2370]: https://gitlab.freedesktop.org/drm/intel/issues/2370
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2439]: https://gitlab.freedesktop.org/drm/intel/issues/2439
  [i915#2521]: https://gitlab.freedesktop.org/drm/intel/issues/2521
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#42]: https://gitlab.freedesktop.org/drm/intel/issues/42
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5858 -> IGTPW_5190
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9357: 99f6f5285a2b51186ed60f8968ca5baddcd4dafc @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/index.html
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/index.html

--===============0146090941182654057==
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
<tr><td><b>Series:</b></td><td>tests/core_auth: Added test description for =
test case (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/82455/">https://patchwork.freedesktop.org/series/82455/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5190/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5190/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9357_full -&gt; IGTPW_5190_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5190_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5190_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5190=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-hsw7/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vg=
a1-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5190/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptibl=
e@bc-vga1-hdmi-a1.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5190_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb5/ig=
t@feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_sync@basic-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-glk3/igt@gem_sync@basic-all.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk8/igt@gem_=
sync@basic-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/95">i915#95</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl7/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl6/igt@i=
915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1635">i915#1635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-glk4/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk3/igt@i=
915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-iclb5/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb3/igt=
@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw4/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/igt@i=
915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl7/igt@i915_pm_rpm@pm-caching.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl7/igt@i=
915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-glk6/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5190/shard-glk2/igt@kms_cursor_edge_walk@pipe-a-64x64-left-edge.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982=
">i915#1982</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transit=
ions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5190/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2370">i915#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_51=
90/shard-tglb3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-kbl4/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5190/shard-kbl3/igt@kms_draw_crc@draw-method-rgb565-pwrite-untiled.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-hsw6/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi=
-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5190/shard-hsw1/igt@kms_flip@2x-plain-flip-fb-recreate@ab-vga1-hdmi=
-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-i=
ndfb-draw-pwrite.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5190/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-1p-p=
rimscrn-cur-indfb-draw-pwrite.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +3 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tg=
lb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
190/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2055">i=
915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
190/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i9=
15#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
190/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-glk5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
190/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5190/shard-iclb3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1185"=
>i915#1185</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-c-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5190/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-su=
spend-pipe-c-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb8/igt=
@kms_psr2_su@page_flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb=
7/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-gen9-features-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-apl1/igt@kms_universal_plane@universal-plane-gen9-featur=
es-pipe-b.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5190/shard-apl6/igt@kms_universal_plane@universal-plane-gen9-=
features-pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1982">i915#1982</a>) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
5">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5190/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/163=
5">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2635">i915#2635</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5190/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/794=
">i915#794</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5190/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS<=
/a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
73">i915#1373</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5190/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">P=
ASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/263=
7">i915#2637</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5190/shard-hsw1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_create@madvise:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-glk7/igt@gem_exec_create@madvise.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i915#95</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/sh=
ard-glk1/igt@gem_exec_create@madvise.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl2/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl2/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw6/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-hsw1/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-iclb7/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-iclb8/igt=
@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-glk8/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-glk2/i=
gt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl1/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-=
apl6/igt@i915_pm_rpm@cursor.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635">i=
915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5190/shard-apl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS<=
/a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl2/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5190/shard-kbl1/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> +1=
 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i=
915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5190/shard-hsw7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-kbl2/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html">D=
MESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5190/shard-kbl7/igt@kms_ccs@pipe-a-crc-primary-rotation-180.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5190/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1635"=
>i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/54">i915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5190/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-glk1/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i=
915#54</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5190/shard-glk2/igt@kms_cursor_crc@pipe-a-cursor-64x64-sliding.html">PASS<=
/a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-glk3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5190/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-snb7/igt@kms_flip@flip-vs-suspend-interruptible@a-vga1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/42">i915#42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5190/shard-snb2/igt@kms_flip@flip-vs-suspend-interruptible@a-vga=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pr=
i-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb2/igt@kms_frontbuffer_track=
ing@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_519=
0/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5190/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">=
i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
436">i915#1436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5190/shard-tglb8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb8/igt@i915_pm_rpm@cursor.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb8/ig=
t@i915_pm_rpm@cursor.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-caching:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb7/igt@i915_pm_rpm@pm-caching.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/sh=
ard-tglb1/igt@i915_pm_rpm@pm-caching.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5190/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-=
a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/456">i915#456</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/456">i915#456</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb3/igt@kms_pipe_crc_basic@suspen=
d-read-crc-pipe-c.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9357/shard-hsw6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-=
hsw7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-kbl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-kbl1/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190=
/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>=
)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-iclb7/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5190/shard-iclb3/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-ic=
lb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1611">i915#1611</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1635">i915#1635</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2439">i915#2439</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-apl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/sha=
rd-apl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1611">i915#1611</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439=
</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9357/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb5/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9357/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9357/shard-tglb6/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2439">i915#2439</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/402">i915#402</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/shard-tglb2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5190/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2439">i915#2439</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/456">i915#456</a>=
)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5858 -&gt; IGTPW_5190</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9357: 99f6f5285a2b51186ed60f8968ca5baddcd4dafc @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5190: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5190/index.htm=
l<br />
  IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0146090941182654057==--

--===============1639245458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1639245458==--
