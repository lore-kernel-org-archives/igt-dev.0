Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 11 Jan 2021 18:49:30 -0000
Message-ID: <161039097028.25133.8739292214244507301@emeril.freedesktop.org>
References: <20210111161658.3476-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20210111161658.3476-1-ville.syrjala@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Skip_the_Y=3C-=3EX_tile_test_on_pre-skl?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1600418467=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1600418467==
Content-Type: multipart/alternative;
 boundary="===============8467846476875110973=="

--===============8467846476875110973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_async_flips: Skip the Y<->X tile test on pre-skl
URL   : https://patchwork.freedesktop.org/series/85712/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9580_full -> IGTPW_5379_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5379_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5379_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5379_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@pipe-c-query-forked-busy-hang:
    - shard-hsw:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_5379_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          NOTRUN -> [WARN][3] ([i915#2283])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw4/igt@core_hotunplug@unbind-rebind.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#658])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@feature_discovery@psr2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-hsw:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +5 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([fdo#109283])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-many-active@vcs0:
    - shard-hsw:          NOTRUN -> [FAIL][10] ([i915#2389]) +3 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@gem_exec_reloc@basic-many-active@vcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][11] ([i915#2389]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-hsw:          NOTRUN -> [WARN][12] ([i915#2658])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][13] ([i915#768])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109289]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109289]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb1/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112306])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#112306])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#110725] / [fdo#111614])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#111614])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#110723])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#111615]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-hsw:          NOTRUN -> [SKIP][22] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw6/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#1149] / [i915#315])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][24] ([i915#1149] / [i915#315])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#1149])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#1149])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109278] / [i915#1149])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111828])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][35] ([i915#1319])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109300] / [fdo#111066])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][37] ([i915#1319])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#109279])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109274] / [fdo#109278])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [FAIL][40] ([i915#2346])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109274])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][42] ([i915#2122])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
    - shard-hsw:          [PASS][43] -> [INCOMPLETE][44] ([i915#2295])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109280]) +18 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271]) +30 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111825]) +20 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271]) +36 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#533])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#533])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#533]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][52] ([i915#265])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][53] ([i915#265])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][54] ([i915#265])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +12 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-hsw:          NOTRUN -> [SKIP][56] ([fdo#109271]) +216 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-y:
    - shard-kbl:          [PASS][57] -> [DMESG-WARN][58] ([i915#165] / [i915#180] / [i915#78])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-y.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +64 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109441]) +1 similar issue
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][61] -> [SKIP][62] ([fdo#109441])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109278] / [i915#2530])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#2530])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109291]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#109291]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-glk:          [TIMEOUT][67] ([i915#2918]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_fair@basic-none-vip@rcs0}:
    - shard-kbl:          [FAIL][69] ([i915#2842]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * {igt@gem_exec_fair@basic-pace@vecs0}:
    - shard-tglb:         [FAIL][71] ([i915#2842]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html

  * {igt@gem_exec_fair@basic-throttle@rcs0}:
    - shard-glk:          [FAIL][73] ([i915#2842]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@bcs0}:
    - shard-tglb:         [DMESG-WARN][75] ([i915#2803]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@gem_exec_schedule@u-fairslice@bcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@gem_exec_schedule@u-fairslice@bcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-kbl:          [DMESG-WARN][77] ([i915#1610] / [i915#2803]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vecs0}:
    - shard-iclb:         [DMESG-WARN][79] ([i915#2803]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vecs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@gem_exec_schedule@u-fairslice@vecs0.html

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-glk:          [DMESG-WARN][81] ([i915#118] / [i915#95]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-hsw:          [WARN][83] ([i915#1519]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][85] ([fdo#109271]) -> [PASS][86] +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][87] ([fdo#109271]) -> [PASS][88] +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][89] ([i915#579]) -> [PASS][90] +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [SKIP][91] ([i915#579]) -> [PASS][92] +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [SKIP][93] ([fdo#109271]) -> [PASS][94] +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl6/igt@i915_pm_rpm@system-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl7/igt@i915_pm_rpm@system-suspend.html
    - shard-hsw:          [SKIP][95] ([fdo#109271]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw2/igt@i915_pm_rpm@system-suspend.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         [FAIL][97] ([i915#2346]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-tglb:         [FAIL][99] ([i915#79]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [FAIL][101] ([i915#2598]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][103] ([i915#433]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [DMESG-WARN][105] ([i915#1602]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][107] ([i915#1602] / [i915#2635]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][109] ([i915#1602] / [i915#2635]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [DMESG-WARN][111] ([i915#2637]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][113] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [DMESG-WARN][115] ([i915#1602]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-glk:          [DMESG-FAIL][117] ([i915#118] / [i915#95]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][119] ([fdo#109441]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb6/igt@kms_psr@psr2_dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_psr@psr2_dpms.html

  
#### Warnings ####

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124]) ([i915#1436] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2505]) -> [FAIL][125] ([i915#2295])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl2/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl6/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl3/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][126], [FAIL][127], [FAIL][128]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724]) -> [FAIL][129] ([i915#2295] / [i915#2724])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb1/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb8/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][130], [FAIL][131]) ([i915#1814] / [i915#2295]) -> [FAIL][132] ([i915#2295])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl1/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl4/igt@runner@aborted.html
    - shard-glk:          ([FAIL][133], [FAIL][134]) ([i915#1814] / [i915#2295] / [k.org#202321]) -> [FAIL][135] ([i915#2295] / [k.org#202321])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][136], [FAIL][137], [FAIL][138]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][139], [FAIL][140]) ([i915#1764] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1519]: https://gitlab.freedesktop.org/drm/intel/issues/1519
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/index.html

--===============8467846476875110973==
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
<tr><td><b>Series:</b></td><td>tests/kms_async_flips: Skip the Y&lt;-&gt;X tile test on pre-skl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85712/">https://patchwork.freedesktop.org/series/85712/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9580_full -&gt; IGTPW_5379_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5379_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5379_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5379_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-c-query-forked-busy-hang:<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw6/igt@kms_vblank@pipe-c-query-forked-busy-hang.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5379_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw4/igt@core_hotunplug@unbind-rebind.html">WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@gem_exec_params@no-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@gem_exec_params@no-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109283">fdo#109283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@vcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@gem_exec_reloc@basic-many-active@vcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb1/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110725">fdo#110725</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw6/igt@kms_chamelium@common-hpd-after-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_color@pipe-b-degamma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@kms_color@pipe-d-ctm-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@kms_color_chamelium@pipe-a-gamma.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111828">fdo#111828</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl7/igt@kms_content_protection@srm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1319">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw8/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-max.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +216 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-y:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl1/igt@kms_plane_lowres@pipe-c-tiling-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@kms_plane_lowres@pipe-c-tiling-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/">i915#180</a> / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-x:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +64 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb4/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / [i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb5/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk5/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> ([i915#2918]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk8/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-vip@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl2/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@vecs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-throttle@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@bcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@gem_exec_schedule@u-fairslice@bcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@gem_exec_schedule@u-fairslice@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1610">i915#1610</a> / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl1/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vecs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@gem_exec_schedule@u-fairslice@vecs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb3/igt@gem_exec_schedule@u-fairslice@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk6/igt@gem_exec_whisper@basic-fds-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk2/igt@gem_exec_whisper@basic-fds-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1519">i915#1519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl6/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl7/igt@i915_pm_rpm@system-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw2/igt@i915_pm_rpm@system-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw2/igt@i915_pm_rpm@system-suspend.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk1/igt@kms_plane_lowres@pipe-a-tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk4/igt@kms_plane_lowres@pipe-a-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb6/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2505]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-kbl3/igt@runner@aborted.html">FAIL</a> ([i915#2295])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-iclb8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-iclb6/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2724])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-apl7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-apl4/igt@runner@aborted.html">FAIL</a> ([i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-glk3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [k.org#202321]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-glk7/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9580/shard-tglb1/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5379/shard-tglb3/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1764">i915#1764</a> / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============8467846476875110973==--

--===============1600418467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1600418467==--
