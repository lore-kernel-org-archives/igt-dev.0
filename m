Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 10 Jun 2020 13:41:03 -0000
Message-ID: <159179646339.20174.2306903886409837978@emeril.freedesktop.org>
References: <20200610103356.11551-1-petri.latvala@intel.com>
In-Reply-To: <20200610103356.11551-1-petri.latvala@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgbGliL2Ry?=
 =?utf-8?q?mtest=3A_Don=27t_write_ffffffff_to_a_numeric_param?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: lib/drmtest: Don't write ffffffff to a numeric param
URL   : https://patchwork.freedesktop.org/series/78181/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8607_full -> IGTPW_4660_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/index.html

Known issues
------------

  Here are the changes found in IGTPW_4660_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [PASS][1] -> [DMESG-WARN][2] ([i915#180]) +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl1/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_exec_params@readonly:
    - shard-kbl:          [PASS][3] -> [DMESG-WARN][4] ([i915#93] / [i915#95]) +51 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl6/igt@gem_exec_params@readonly.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@gem_exec_params@readonly.html

  * igt@gem_gtt_cpu_tlb:
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#95]) +41 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl1/igt@gem_gtt_cpu_tlb.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl7/igt@gem_gtt_cpu_tlb.html

  * igt@gem_mmap@bad-size:
    - shard-snb:          [PASS][7] -> [TIMEOUT][8] ([i915#1958]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-snb2/igt@gem_mmap@bad-size.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-snb5/igt@gem_mmap@bad-size.html
    - shard-hsw:          [PASS][9] -> [TIMEOUT][10] ([i915#1958])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw8/igt@gem_mmap@bad-size.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw1/igt@gem_mmap@bad-size.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][11] -> [DMESG-WARN][12] ([i915#180] / [i915#95])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl4/igt@gem_workarounds@suspend-resume.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl6/igt@gem_workarounds@suspend-resume.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [PASS][13] -> [INCOMPLETE][14] ([i915#155]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl1/igt@gem_workarounds@suspend-resume-fd.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][15] -> [FAIL][16] ([i915#1899])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-iclb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-hsw:          [PASS][17] -> [WARN][18] ([i915#1519])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw1/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_atomic_interruptible@legacy-dpms:
    - shard-tglb:         [PASS][19] -> [DMESG-WARN][20] ([i915#402]) +3 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb2/igt@kms_atomic_interruptible@legacy-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb2/igt@kms_atomic_interruptible@legacy-dpms.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#1982])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl3/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl2/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-glk:          [PASS][23] -> [DMESG-FAIL][24] ([i915#118] / [i915#95])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-glk1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-glk8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen:
    - shard-apl:          [PASS][25] -> [FAIL][26] ([i915#54])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl7/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
    - shard-kbl:          [PASS][27] -> [FAIL][28] ([i915#54])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-256x256-onscreen.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled:
    - shard-kbl:          [PASS][29] -> [DMESG-FAIL][30] ([i915#54] / [i915#95]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl4/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
    - shard-apl:          [PASS][31] -> [DMESG-FAIL][32] ([i915#54] / [i915#95])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl8/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled:
    - shard-kbl:          [PASS][33] -> [DMESG-FAIL][34] ([fdo#108145] / [i915#54] / [i915#95])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl1/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
    - shard-apl:          [PASS][35] -> [DMESG-FAIL][36] ([fdo#108145] / [i915#54] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl6/igt@kms_draw_crc@draw-method-xrgb8888-mmap-wc-untiled.html

  * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][37] -> [DMESG-WARN][38] ([i915#1982])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][39] -> [FAIL][40] ([i915#79])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@b-dp1:
    - shard-kbl:          [PASS][41] -> [DMESG-WARN][42] ([i915#180]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl4/igt@kms_flip@flip-vs-suspend@b-dp1.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_flip@flip-vs-suspend@b-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         [PASS][43] -> [DMESG-WARN][44] ([i915#1982]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-kbl:          [PASS][45] -> [DMESG-WARN][46] ([i915#180] / [i915#93] / [i915#95]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [PASS][47] -> [SKIP][48] ([fdo#109441]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  
#### Possible fixes ####

  * igt@gem_ctx_shared@q-independent@bcs0:
    - shard-glk:          [FAIL][49] ([i915#2013]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-glk5/igt@gem_ctx_shared@q-independent@bcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-glk1/igt@gem_ctx_shared@q-independent@bcs0.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-glk:          [DMESG-WARN][51] ([i915#118] / [i915#95]) -> [PASS][52] +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-glk7/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-d:
    - shard-tglb:         [DMESG-WARN][53] ([i915#1982]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb8/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-d.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-d.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-kbl:          [DMESG-WARN][55] ([i915#1982]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-apl:          [DMESG-WARN][57] ([i915#1982]) -> [PASS][58] +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl6/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-kbl:          [DMESG-FAIL][59] ([i915#54] / [i915#95]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-hsw:          [INCOMPLETE][61] ([i915#61]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@pipe-c-forked-bo:
    - shard-apl:          [DMESG-WARN][63] ([i915#95]) -> [PASS][64] +43 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl1/igt@kms_cursor_legacy@pipe-c-forked-bo.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl8/igt@kms_cursor_legacy@pipe-c-forked-bo.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled:
    - shard-kbl:          [DMESG-WARN][65] ([i915#93] / [i915#95]) -> [PASS][66] +42 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl2/igt@kms_draw_crc@draw-method-xrgb8888-mmap-cpu-xtiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][67] ([i915#1525]) -> [PASS][68] +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [FAIL][69] ([i915#64]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][71] ([i915#180]) -> [PASS][72] +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl8/igt@kms_flip@flip-vs-suspend@a-dp1.html
    - shard-kbl:          [DMESG-WARN][73] ([i915#180]) -> [PASS][74] +3 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-glk:          [DMESG-WARN][75] ([i915#1982]) -> [PASS][76] +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-glk8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-glk1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-a:
    - shard-kbl:          [DMESG-FAIL][77] ([i915#95]) -> [PASS][78] +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl1/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
    - shard-apl:          [DMESG-FAIL][79] ([i915#95]) -> [PASS][80] +2 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl3/igt@kms_pipe_crc_basic@hang-read-crc-pipe-a.html

  * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
    - shard-iclb:         [DMESG-WARN][81] ([i915#1982]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-iclb3/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-iclb1/igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         [SKIP][83] ([fdo#109441]) -> [PASS][84] +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-iclb1/igt@kms_psr@psr2_sprite_mmap_gtt.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_vblank@pipe-c-query-busy-hang:
    - shard-tglb:         [DMESG-WARN][85] ([i915#402]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb1/igt@kms_vblank@pipe-c-query-busy-hang.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb1/igt@kms_vblank@pipe-c-query-busy-hang.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][87] ([i915#1542]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb7/igt@perf@polling-parameterized.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb8/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         [SKIP][89] ([i915#468]) -> [FAIL][90] ([i915#454])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb8/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         [FAIL][91] ([i915#454]) -> [SKIP][92] ([i915#468])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-tglb3/igt@i915_pm_dc@dc6-psr.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-snb:          [TIMEOUT][93] ([i915#1958]) -> [SKIP][94] ([fdo#109271])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-snb6/igt@kms_big_fb@yf-tiled-addfb.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-snb6/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-hsw:          [TIMEOUT][95] ([i915#1958]) -> [SKIP][96] ([fdo#109271])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw8/igt@kms_big_fb@yf-tiled-addfb.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw2/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          [TIMEOUT][97] ([i915#1319]) -> [FAIL][98] ([fdo#110321] / [fdo#110336])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl7/igt@kms_content_protection@atomic.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [TIMEOUT][99] ([i915#1319]) -> [TIMEOUT][100] ([i915#1319] / [i915#1635])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl8/igt@kms_content_protection@atomic-dpms.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl2/igt@kms_content_protection@atomic-dpms.html
    - shard-kbl:          [TIMEOUT][101] ([i915#1319] / [i915#1958]) -> [TIMEOUT][102] ([i915#1319])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl4/igt@kms_content_protection@atomic-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-kbl:          [TIMEOUT][103] ([i915#1319]) -> [TIMEOUT][104] ([i915#1319] / [i915#1958])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl2/igt@kms_content_protection@legacy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-apl:          [TIMEOUT][105] ([i915#1319] / [i915#1635]) -> [FAIL][106] ([fdo#110321])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl7/igt@kms_content_protection@srm.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          [FAIL][107] ([i915#357]) -> [DMESG-FAIL][108] ([i915#357] / [i915#95])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl3/igt@kms_content_protection@uevent.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-apl:          [FAIL][109] ([i915#357]) -> [DMESG-FAIL][110] ([i915#357] / [i915#95])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl8/igt@kms_content_protection@uevent.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][111] ([fdo#109349]) -> [DMESG-WARN][112] ([i915#1226])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled:
    - shard-hsw:          [SKIP][113] ([fdo#109271]) -> [TIMEOUT][114] ([i915#1958]) +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-hsw8/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-hsw1/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
    - shard-snb:          [SKIP][115] ([fdo#109271]) -> [TIMEOUT][116] ([i915#1958]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-snb6/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-snb5/igt@kms_draw_crc@draw-method-xrgb2101010-render-ytiled.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-apl:          [DMESG-WARN][117] ([i915#180]) -> [DMESG-WARN][118] ([i915#95])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          [DMESG-FAIL][119] ([fdo#108145] / [i915#95]) -> [FAIL][120] ([fdo#108145] / [i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          [DMESG-FAIL][121] ([IGT#2] / [i915#95]) -> [FAIL][122] ([IGT#2])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-kbl6/igt@kms_sysfs_edid_timing.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-kbl3/igt@kms_sysfs_edid_timing.html

  * igt@perf@blocking-parameterized:
    - shard-apl:          [FAIL][123] ([i915#1542]) -> [DMESG-FAIL][124] ([i915#95])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8607/shard-apl1/igt@perf@blocking-parameterized.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/shard-apl6/igt@perf@blocking-parameterized.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110321]: https://bugs.freedesktop.org/show_bug.cgi?id=110321
  [fdo#110336]: https://bugs.freedesktop.org/show_bug.cgi?id=110336
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1525]: https://gitlab.freedesktop.org/drm/intel/issues/1525
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1899]: https://gitlab.freedesktop.org/drm/intel/issues/1899
  [i915#1958]: https://gitlab.freedesktop.org/drm/intel/issues/1958
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2013]: https://gitlab.freedesktop.org/drm/intel/issues/2013
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#357]: https://gitlab.freedesktop.org/drm/intel/issues/357
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#468]: https://gitlab.freedesktop.org/drm/intel/issues/468
  [i915#54]: https://gitlab.freedesktop.org/drm/intel/issues/54
  [i915#61]: https://gitlab.freedesktop.org/drm/intel/issues/61
  [i915#64]: https://gitlab.freedesktop.org/drm/intel/issues/64
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#93]: https://gitlab.freedesktop.org/drm/intel/issues/93
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5700 -> IGTPW_4660
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_8607: 206a2c3d69185509faac1f2d79a8707c7e0d81eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4660: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/index.html
  IGT_5700: 88e379cef970db3dab020966d5dd117de7cc03ab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4660/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
