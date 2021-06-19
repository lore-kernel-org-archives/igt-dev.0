Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sat, 19 Jun 2021 18:59:10 -0000
Message-ID: <162412915001.29206.1096489766670119574@emeril.freedesktop.org>
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fplane=5Falpha=5Fblend=3A_Fix_coverage-vs-premult-vs-const?=
 =?utf-8?q?ant_tests_=28rev5=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0890431396=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0890431396==
Content-Type: multipart/alternative;
 boundary="===============6099230805389603618=="

--===============6099230805389603618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_plane_alpha_blend: Fix coverage-vs-premult-vs-constant tests (rev5)
URL   : https://patchwork.freedesktop.org/series/90828/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10246_full -> IGTPW_5944_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/index.html

Known issues
------------

  Here are the changes found in IGTPW_5944_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_create@create-massive:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1] ([i915#3002])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-snb2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][2] ([fdo#109271] / [i915#1099]) +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][3] -> [TIMEOUT][4] ([i915#2369] / [i915#2481] / [i915#3070])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb6/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][5] -> [FAIL][6] ([i915#2846])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-kbl:          [PASS][7] -> [SKIP][8] ([fdo#109271])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][9] -> [FAIL][10] ([i915#2842]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2842]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#112283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-glk:          NOTRUN -> [FAIL][17] ([i915#3633]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk3/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][18] ([i915#3633])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-glk:          [PASS][19] -> [DMESG-WARN][20] ([i915#118] / [i915#95]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk8/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#3323])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#3323])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#3323])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#3323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#3323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#112306])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb8/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1937])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#111614])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-iclb:         [PASS][29] -> [DMESG-WARN][30] ([i915#3621])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109278] / [i915#1149])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-glk:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-negative:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-negative.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][39] ([i915#1319]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl6/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#109300] / [fdo#111066])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x42-random:
    - shard-kbl:          [PASS][42] -> [FAIL][43] ([i915#3444])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
    - shard-glk:          [PASS][44] -> [FAIL][45] ([i915#3444])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3359]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109279] / [i915#3359]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278]) +14 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109274] / [fdo#109278])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#79])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111825]) +10 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#2672]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271]) +307 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#2546])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109280]) +12 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271]) +58 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271]) +52 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#110577])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109310])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb8/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109289])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_plane@plane-position-hole@pipe-a-planes:
    - shard-kbl:          [PASS][65] -> [FAIL][66] ([i915#2472])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl3/igt@kms_plane@plane-position-hole@pipe-a-planes.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl7/igt@kms_plane@plane-position-hole@pipe-a-planes.html
    - shard-apl:          [PASS][67] -> [FAIL][68] ([i915#2472])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl7/igt@kms_plane@plane-position-hole@pipe-a-planes.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl8/igt@kms_plane@plane-position-hole@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][69] ([fdo#108145] / [i915#265]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#111615])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#658])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [PASS][73] -> [SKIP][74] ([fdo#109441]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][75] ([IGT#2])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][76] -> [INCOMPLETE][77] ([i915#155])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][78] -> [DMESG-WARN][79] ([i915#180]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#2530])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb1/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([i915#2530])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +267 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [i915#2530])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb3/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109291])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@sysfs_clients@fair-0:
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#2994])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk3/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@fair-7:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl6/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-apl:          [SKIP][89] ([fdo#109271]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][91] ([i915#2842]) -> [PASS][92] +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][95] ([i915#2842]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][97] ([i915#2849]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [FAIL][99] ([i915#307]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][101] ([i915#118] / [i915#95]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-kbl:          [FAIL][103] ([i915#3444]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [DMESG-WARN][105] ([i915#180]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [FAIL][107] ([i915#2122]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk7/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-snb:          [SKIP][109] ([fdo#109271]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-apl:          [DMESG-WARN][111] ([i915#180]) -> [PASS][112] +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][113] ([i915#3622]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-glk:          [FAIL][115] ([i915#2472]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-glk3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][119] ([i915#1804] / [i915#2684]) -> [WARN][120] ([i915#2684])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][121] ([i915#2920]) -> [SKIP][122] ([i915#658])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][123] ([i915#658]) -> [SKIP][124] ([i915#2920]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][125], [FAIL][126], [FAIL][127]) ([i915#1436] / [i915#1814] / [i915#2505] / [i915#3002] / [i915#3363]) -> ([FAIL][128], [FAIL][129]) ([i915#3002] / [i915#3363])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl6/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl2/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][130], [FAIL][131]) ([i915#3002]) -> ([FAIL][132], [FAIL][133], [FAIL][134]) ([i915#1814] / [i915#3002])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb4/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#180] / [i915#1814] / [i915#3002] / [i915#3363])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl6/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl6/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl3/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl8/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl8/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl6/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl2/igt@runner@aborted.html

  
  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109310]: https://bugs.freedesktop.org/show_bug.cgi?id=109310
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110577]: https://bugs.freedesktop.org/show_bug.cgi?id=110577
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/index.html

--===============6099230805389603618==
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
<tr><td><b>Series:</b></td><td>tests/kms_plane_alpha_blend: Fix coverage-vs=
-premult-vs-constant tests (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/90828/">https://patchwork.freedesktop.org/series/90828/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5944/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10246_full -&gt; IGTPW_5944_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5944_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-snb2/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-snb6/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i=
915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kb=
l2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/s=
hard-kbl6/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-k=
bl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-=
tglb1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/sha=
rd-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-glk3/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> ([i915#3633]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#3633])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk4/igt@gem_exec_whisper@basic-fds-forked.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/sha=
rd-glk8/igt@gem_exec_whisper@basic-fds-forked.html">DMESG-WARN</a> ([i915#1=
18] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-apl3/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb8/igt@gen9_exec_parse@basic-rejected-ctx=
-param.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270=
.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/sh=
ard-iclb1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> ([i915=
#3621])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_big_fb@y-tiled-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_chamelium@hdmi-audio.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fd=
o#109284</a> / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_chamelium@vga-hpd.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb3/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">f=
do#109278</a> / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-glk3/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-negative:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-snb7/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-apl6/igt@kms_content_protection@lic.html">TIM=
EOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_content_protection@lic.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi">fdo#1=
11066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_cursor_crc@pipe-a-cursor-512x5=
12-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x42-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10246/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5944/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html">FAIL</=
a> ([i915#3444])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10246/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5944/shard-glk3/igt@kms_cursor_crc@pipe-b-cursor-128x42-random.html">FAIL</=
a> ([i915#3444])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-onscreen.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / [i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-offscreen.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a1-=
hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5944/shard-glk8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-=
a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_flip@2x-flip-vs-rmfb.html">SKI=
P</a> ([fdo#111825]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@kms_flip@2x-flip-vs-suspend.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274"=
>fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#2672]) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-snb5/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +307 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrac=
k-mmap-gtt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5944/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-indfb-fl=
iptrack-mmap-gtt.html">FAIL</a> ([i915#2546])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +58 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-kbl7/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +52 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-tglb5/igt@kms_invalid_dotclock.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110577">fdo#110=
577</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-iclb8/igt@kms_invalid_dotclock.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109310">fdo#109=
310</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-planes:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10246/shard-kbl3/igt@kms_plane@plane-position-hole@pipe-a-planes.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5944/shard-kbl7/igt@kms_plane@plane-position-hole@pipe-a-planes.html">FAIL=
</a> ([i915#2472])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10246/shard-apl7/igt@kms_plane@plane-position-hole@pipe-a-planes.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5944/shard-apl8/igt@kms_plane@plane-position-hole@pipe-a-planes.html">FAIL=
</a> ([i915#2472])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-tglb8/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard=
-iclb7/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar=
 issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl7/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5944/shard-kbl3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">INCOMPL=
ETE</a> ([i915#155])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5944/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-W=
ARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-tglb1/igt@nouveau_crc@pipe-a-source-outp-comp=
lete.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-iclb5/igt@nouveau_crc@pipe-a-source-outp-comp=
lete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a>) +267 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb3/igt@nouveau_crc@pipe-d-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a> / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-iclb6/igt@prime_nv_api@i915_nv_import_vs_clo=
se.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-glk3/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-kbl6/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl1/igt@sysfs_clients@recycle-many.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-apl6/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5944/shard-apl7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5944/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PAS=
S</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944=
/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5944/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5944/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb7/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> (=
[i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5944/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">DMESG-=
WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5944/shard-glk5/igt@kms_big_fb@y-tiled-32bpp-rotate-=
0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.ht=
ml">FAIL</a> ([i915#3444]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5944/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-128x128-ra=
ndom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DME=
SG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5944/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk6/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5944/shard-glk7/igt@kms_flip@plain-flip-fb-recr=
eate-interruptible@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-snb7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-fullscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5944/shard-snb7/igt@kms_frontbuffer_tracking@fb=
c-1p-primscrn-spr-indfb-fullscreen.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a=
> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5944/shard-apl2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +3 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb3/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-b-planes.html">INCOMPLETE</a> ([i915#3622]) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_plane@plane-=
panning-bottom-right-suspend@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-glk3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plan=
es.html">FAIL</a> ([i915#2472]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5944/shard-glk5/igt@kms_plane@plane-position-hole-dpms=
@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a=
> ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5944/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.htm=
l">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5944/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP<=
/a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-4.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5944/shard-iclb2/igt@kms_psr2_sf@overlay-primary-updat=
e-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-kbl6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10246/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#1436] / [i9=
15#1814] / [i915#2505] / [i915#3002] / [i915#3363]) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-kbl4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5944/shard-kbl1/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#33=
63])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-iclb4/igt@runner@a=
borted.html">FAIL</a>) ([i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5944/shard-iclb5/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-ic=
lb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5944/shard-iclb1/igt@runner@aborted.html">FAIL</a>) (=
[i915#1814] / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10246/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10246/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10246/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10246/shard-apl3/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363=
]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/sh=
ard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5944/shard-apl8/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl=
6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5944/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5944/shard-apl1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5944/shard-apl2/igt@runner@aborted.html">FAIL</a>) ([i915#180]=
 / [i915#1814] / [i915#3002] / [i915#3363])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6099230805389603618==--

--===============0890431396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0890431396==--
