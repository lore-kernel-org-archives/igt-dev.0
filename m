Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 13 Jul 2020 06:17:56 -0000
Message-ID: <159462107636.16739.14391720806605643973@emeril.freedesktop.org>
References: <20200713040823.27495-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20200713040823.27495-1-priyanka.dandamudi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Feio=3A_Added_description_to_subtests?=
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
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_eio: Added description to subtests
URL   : https://patchwork.freedesktop.org/series/79393/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8736_full -> IGTPW_4758_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/index.html

Known issues
------------

  Here are the changes found in IGTPW_4758_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_auth@many-magics:
    - shard-kbl:          [PASS][1] -> [DMESG-WARN][2] ([i915#93] / [i915#95]) +52 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl7/igt@core_auth@many-magics.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@core_auth@many-magics.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-kbl:          [PASS][3] -> [INCOMPLETE][4] ([i915#794])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_reloc@basic-concurrent0:
    - shard-glk:          [PASS][5] -> [FAIL][6] ([i915#1930])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk4/igt@gem_exec_reloc@basic-concurrent0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk2/igt@gem_exec_reloc@basic-concurrent0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][7] -> [DMESG-WARN][8] ([i915#180]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl4/igt@gem_exec_suspend@basic-s3.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl1/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-contexts-all:
    - shard-glk:          [PASS][9] -> [DMESG-WARN][10] ([i915#118] / [i915#95]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk7/igt@gem_exec_whisper@basic-contexts-all.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk8/igt@gem_exec_whisper@basic-contexts-all.html

  * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
    - shard-tglb:         [PASS][11] -> [DMESG-WARN][12] ([i915#402])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-tglb8/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-tglb3/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-hsw:          [PASS][13] -> [SKIP][14] ([fdo#109271])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_addfb_basic@master-rmfb:
    - shard-snb:          [PASS][15] -> [TIMEOUT][16] ([i915#1958] / [i915#2119]) +2 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb6/igt@kms_addfb_basic@master-rmfb.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb1/igt@kms_addfb_basic@master-rmfb.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-kbl:          [PASS][17] -> [DMESG-FAIL][18] ([i915#95]) +4 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl4/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#1635] / [i915#1982]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][21] -> [DMESG-FAIL][22] ([i915#118] / [i915#95])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk9/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk8/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge:
    - shard-apl:          [PASS][23] -> [DMESG-WARN][24] ([i915#1635] / [i915#95]) +41 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl7/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl1/igt@kms_cursor_edge_walk@pipe-c-256x256-left-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [PASS][25] -> [FAIL][26] ([i915#57])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw4/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - shard-kbl:          [PASS][27] -> [DMESG-FAIL][28] ([i915#54] / [i915#95]) +2 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
    - shard-apl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#1635] / [i915#54] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][31] -> [DMESG-WARN][32] ([i915#1982])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@flip-vs-panning@a-edp1:
    - shard-tglb:         [PASS][33] -> [DMESG-WARN][34] ([i915#1982]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-tglb8/igt@kms_flip@flip-vs-panning@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-tglb2/igt@kms_flip@flip-vs-panning@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - shard-glk:          [PASS][35] -> [FAIL][36] ([i915#49])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk4/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-apl:          [PASS][37] -> [FAIL][38] ([i915#1635] / [i915#49])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl2/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl6/igt@kms_frontbuffer_tracking@fbc-badstride.html
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#49])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl3/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_plane_cursor@pipe-a-overlay-size-64:
    - shard-apl:          [PASS][41] -> [DMESG-FAIL][42] ([i915#1635] / [i915#95]) +3 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl3/igt@kms_plane_cursor@pipe-a-overlay-size-64.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl2/igt@kms_plane_cursor@pipe-a-overlay-size-64.html

  * igt@kms_plane_cursor@pipe-a-viewport-size-64:
    - shard-hsw:          [PASS][43] -> [TIMEOUT][44] ([i915#1958] / [i915#2119]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw4/igt@kms_plane_cursor@pipe-a-viewport-size-64.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@kms_plane_cursor@pipe-a-viewport-size-64.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][45] -> [SKIP][46] ([fdo#109441]) +2 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_exec_reloc@basic-wc-cpu-active:
    - shard-apl:          [DMESG-WARN][47] ([i915#1635] / [i915#95]) -> [PASS][48] +31 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl1/igt@gem_exec_reloc@basic-wc-cpu-active.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl8/igt@gem_exec_reloc@basic-wc-cpu-active.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-hsw:          [TIMEOUT][49] ([i915#1958] / [i915#2119]) -> [PASS][50] +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@gem_userptr_blits@unsync-unmap.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_workarounds@basic-read-fd:
    - shard-snb:          [TIMEOUT][51] ([i915#1958] / [i915#2119]) -> [PASS][52] +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb1/igt@gem_workarounds@basic-read-fd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb2/igt@gem_workarounds@basic-read-fd.html

  * igt@i915_hangman@error-state-basic:
    - shard-kbl:          [DMESG-WARN][53] ([i915#93] / [i915#95]) -> [PASS][54] +46 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl3/igt@i915_hangman@error-state-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@i915_hangman@error-state-basic.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][55] ([i915#1519]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@i915_pm_rc6_residency@rc6-fence.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_selftest@mock@requests:
    - shard-iclb:         [INCOMPLETE][57] ([i915#2110]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-iclb2/igt@i915_selftest@mock@requests.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-iclb5/igt@i915_selftest@mock@requests.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl3/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl4/igt@kms_big_fb@linear-16bpp-rotate-180.html
    - shard-apl:          [DMESG-FAIL][61] ([i915#1635] / [i915#95]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl3/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][63] ([i915#118] / [i915#95]) -> [PASS][64] +2 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][65] ([i915#180]) -> [PASS][66] +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl2/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][67] ([i915#180] / [i915#93] / [i915#95]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl4/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
    - shard-kbl:          [DMESG-WARN][69] ([i915#1982]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl7/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl2/igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled:
    - shard-apl:          [DMESG-FAIL][71] ([i915#1635] / [i915#54] / [i915#95]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-apl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
    - shard-kbl:          [DMESG-FAIL][73] ([i915#54] / [i915#95]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-untiled.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [INCOMPLETE][75] ([i915#1185]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-iclb7/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][77] ([i915#2122]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][79] ([i915#2055]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw6/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw4/igt@kms_flip@flip-vs-suspend@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-tglb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82] +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-tglb3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-tglb7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_plane_cursor@pipe-a-primary-size-256:
    - shard-glk:          [DMESG-WARN][83] ([i915#1982]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-glk5/igt@kms_plane_cursor@pipe-a-primary-size-256.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-glk3/igt@kms_plane_cursor@pipe-a-primary-size-256.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [SKIP][85] ([fdo#109441]) -> [PASS][86] +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-iclb4/igt@kms_psr@psr2_basic.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-iclb2/igt@kms_psr@psr2_basic.html

  * igt@perf@blocking-parameterized:
    - shard-iclb:         [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-iclb5/igt@perf@blocking-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-iclb6/igt@perf@blocking-parameterized.html

  * igt@perf_pmu@module-unload:
    - shard-hsw:          [DMESG-WARN][89] ([i915#1982]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw6/igt@perf_pmu@module-unload.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw4/igt@perf_pmu@module-unload.html

  * igt@perf_pmu@semaphore-busy@rcs0:
    - shard-kbl:          [FAIL][91] ([i915#1820]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl4/igt@perf_pmu@semaphore-busy@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl3/igt@perf_pmu@semaphore-busy@rcs0.html

  
#### Warnings ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][93] ([i915#180]) -> [DMESG-WARN][94] ([i915#180] / [i915#93] / [i915#95])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl1/igt@gem_eio@in-flight-suspend.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-snb:          [SKIP][95] ([fdo#109271]) -> [INCOMPLETE][96] ([i915#82])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb2/igt@i915_pm_dc@dc6-psr.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb5/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-hsw:          [TIMEOUT][97] ([i915#1958] / [i915#2119]) -> [SKIP][98] ([fdo#109271] / [fdo#111827])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
    - shard-snb:          [TIMEOUT][99] ([i915#1958] / [i915#2119]) -> [SKIP][100] ([fdo#109271] / [fdo#111827])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb1/igt@kms_chamelium@hdmi-cmp-planar-formats.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][101] ([i915#1319] / [i915#1958] / [i915#2119]) -> [TIMEOUT][102] ([i915#1319] / [i915#2119])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-kbl6/igt@kms_content_protection@atomic.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@pipe-a-cursor-128x42-random:
    - shard-snb:          [TIMEOUT][103] ([i915#1958] / [i915#2119]) -> [SKIP][104] ([fdo#109271]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb1/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb6/igt@kms_cursor_crc@pipe-a-cursor-128x42-random.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-snb:          [SKIP][105] ([fdo#109271]) -> [TIMEOUT][106] ([i915#1958] / [i915#2119]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-snb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-snb1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
    - shard-hsw:          [INCOMPLETE][107] ([CI#80]) -> [FAIL][108] ([i915#57])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@kms_cursor_legacy@cursor-vs-flip-varying-size.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-hsw:          [SKIP][109] ([fdo#109271]) -> [TIMEOUT][110] ([i915#1958] / [i915#2119])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack:
    - shard-hsw:          [TIMEOUT][111] ([i915#1958] / [i915#2119]) -> [SKIP][112] ([fdo#109271])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8736/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/shard-hsw4/igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1820]: https://gitlab.freedesktop.org/drm/intel/issues/1820
  [i915#1930]: https://gitlab.freedesktop.org/drm/intel/issues/1930
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedesktop.org/drm/intel/issues/2055
  [i915#2110]: https://gitlab.freedesktop.org/drm/intel/issues/2110
  [i915#2119]: https://gitlab.freedesktop.org/drm/intel/issues/2119
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#57]: https://gitlab.freedesktop.org/drm/intel/issues/57
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#82]: https://gitlab.freedesktop.org/drm/intel/issues/82
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5734 -> IGTPW_4758
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8736: 36aacc2a42f5c593a526934b246ddaf09989e743 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4758: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/index.html
  IGT_5734: 6e5c9915a80d791ea45a3e5d2a3cb7e5dc5f06f1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4758/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
