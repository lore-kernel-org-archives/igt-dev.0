Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 08 Apr 2021 03:23:07 -0000
Message-ID: <161785218720.10402.17519672178282305988@emeril.freedesktop.org>
References: <20210408002158.1318976-1-khaled.almahallawy@intel.com>
In-Reply-To: <20210408002158.1318976-1-khaled.almahallawy@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdG9vbHM6?=
 =?utf-8?q?_Fix_running_intel=5Fdp=5Fcompliance_if_it_is_found_in_the_sear?=
 =?utf-8?q?ch_path=28=24PATH_env_variable=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2107736097=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2107736097==
Content-Type: multipart/alternative;
 boundary="===============0205856742843074232=="

--===============0205856742843074232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tools: Fix running intel_dp_compliance if it is found in the search path($PATH env variable)
URL   : https://patchwork.freedesktop.org/series/88824/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9933_full -> IGTPW_5709_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/index.html

Known issues
------------

  Here are the changes found in IGTPW_5709_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +7 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([i915#280])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][3] -> [TIMEOUT][4] ([i915#2369] / [i915#3063])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][5] -> [FAIL][6] ([i915#2842]) +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][9] ([i915#2389]) +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271]) +27 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#768])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#3323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271]) +396 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-snb6/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@set-cache-level:
    - shard-apl:          NOTRUN -> [FAIL][15] ([i915#3324])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/igt@gem_userptr_blits@set-cache-level.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#1937])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [PASS][17] -> [WARN][18] ([i915#2681] / [i915#2684])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][19] -> [DMESG-WARN][20] ([i915#180])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110725] / [fdo#111614])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111614])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#111615]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_chamelium@hdmi-audio.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk6/igt@kms_chamelium@hdmi-audio.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb2/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-snb7/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl6/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109278] / [i915#1149])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          NOTRUN -> [TIMEOUT][31] ([i915#1319]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#3116])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][33] ([i915#3116])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][34] ([i915#2105])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#3319]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-suspend:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271]) +176 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspend.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-tglb:         NOTRUN -> [FAIL][39] ([i915#2346])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:
    - shard-glk:          NOTRUN -> [FAIL][40] ([i915#52] / [i915#54])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#52] / [i915#54]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109274]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111825]) +11 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb7/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
    - shard-glk:          [PASS][45] -> [FAIL][46] ([i915#79])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#2642])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#2672])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-snb:          [PASS][49] -> [SKIP][50] ([fdo#109271]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([i915#49])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109280]) +8 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109289])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#109289])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#533])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#533])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][58] ([fdo#108145] / [i915#265]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][59] ([i915#265])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][60] ([fdo#108145] / [i915#265]) +3 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109278]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#2733])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#658]) +3 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#658]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109441])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([fdo#109441])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb5/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][68] ([i915#180])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271]) +222 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#2437])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#2530])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2530])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2994]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl3/igt@sysfs_clients@split-25.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2994])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@sysfs_clients@split-25.html
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [i915#2994])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk9/igt@sysfs_clients@split-25.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#2994])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb3/igt@sysfs_clients@split-25.html

  * igt@sysfs_clients@split-50:
    - shard-apl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#2994])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][78] ([i915#658]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb7/igt@feature_discovery@psr2.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@many-contexts:
    - shard-tglb:         [FAIL][80] ([i915#2410]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][82] ([i915#2842]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-glk:          [FAIL][84] ([i915#2842]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [FAIL][86] ([i915#2842]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][88] ([i915#2842]) -> [PASS][89] +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][90] ([i915#118] / [i915#95]) -> [PASS][91] +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-kbl:          [DMESG-WARN][92] ([i915#180]) -> [PASS][93] +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][94] ([i915#2597]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-tglb8/igt@kms_async_flips@test-time-stamp.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_draw_crc@draw-method-rgb565-render-untiled:
    - shard-glk:          [FAIL][96] ([i915#52] / [i915#54]) -> [PASS][97] +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-apl:          [FAIL][98] ([i915#49]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
    - shard-kbl:          [FAIL][100] ([i915#2546] / [i915#49]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-glk:          [FAIL][102] ([i915#49]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][104] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb7/igt@kms_psr2_su@frontbuffer.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][106] ([fdo#109441]) -> [PASS][107] +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [SKIP][108] ([fdo#109271]) -> [FAIL][109] ([i915#2842])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][110] ([i915#2684]) -> [WARN][111] ([i915#2681] / [i915#2684])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][112] ([i915#1804] / [i915#2684]) -> [FAIL][113] ([i915#2680])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_dp_dsc@basic-dsc-enable-edp:
    - shard-iclb:         [SKIP][114] ([fdo#109349]) -> [DMESG-WARN][115] ([i915#1226])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-iclb:         [SKIP][116] ([i915#658]) -> [SKIP][117] ([i915#2920])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][118], [FAIL][119], [FAIL][120], [FAIL][121], [FAIL][122], [FAIL][123], [FAIL][124], [FAIL][125], [FAIL][126]) ([i915#180] / [i915#1814] / [i915#2505] / [i915#3002]) -> ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130], [FAIL][131], [FAIL][132]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#3002])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@runner@aborted.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl7/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl4/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl7/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@runner@aborted.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl7/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl4/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl3/igt@runner@aborted.html
    - shard-apl:          ([FAIL][133], [FAIL][134]) ([i915#3002]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#180] / [i915#1814] / [i915#3002])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-apl1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-apl8/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109349]: https://bugs.freedesktop.org/show_bug.cgi?id=109349
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1226]: https://gitlab.freedesktop.org/drm/intel/issues/1226
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2369]: https://gitlab.freedesktop.org/drm/intel/issues/2369
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2505]: https://gitlab.freedesktop.org/drm/intel/issues/2505
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2597]: https://gitlab.freedesktop.org/drm/intel/issues/2597
  [i915#2642]: https://gi

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/index.html

--===============0205856742843074232==
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
<tr><td><b>Series:</b></td><td>tools: Fix running intel_dp_compliance if it=
 is found in the search path($PATH env variable)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/88824/">https://patchwork.freedesktop.org/series/88824/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5709/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9933_full -&gt; IGTPW_5709_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5709_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-tglb3/ig=
t@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/2369">i915#2369</a> / [i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-t=
glb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +4 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk9/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-gl=
k3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-snb7/igt@gem_exec_reloc@basic-wide-active@rc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-til=
ed-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a>) +27 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb6/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-snb6/igt@gem_userptr_blits@mmap-offset-inval=
idate-active@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +396 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@set-cache-level:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl8/igt@gem_userptr_blits@set-cache-level.h=
tml">FAIL</a> ([i915#3324])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1937">i915#1937</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-=
tglb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i91=
5#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
09/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb7/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-tglb8/igt@kms_big_fb@yf-tiled-32bpp-rotate-9=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-glk6/igt@kms_chamelium@hdmi-audio.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
27">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb2/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-snb7/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl6/igt@kms_chamelium@vga-hpd.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">f=
do#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl2/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb6/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb6/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> ([i915#3116])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl7/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-offscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/s=
hard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@kms_cursor_crc@pipe-d-cursor-suspen=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +176 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-v=
arying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-cpu-untiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mma=
p-cpu-untiled.html">FAIL</a> ([i915#52] / [i915#54])</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk9/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5709/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.ht=
ml">FAIL</a> ([i915#52] / [i915#54]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb8/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-tglb7/igt@kms_flip@2x-plain-flip-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a=
-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5709/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interrupti=
ble@a-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gi">i915#264=
2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-snb6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-=
msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_5709/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-in=
dfb-draw-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-pri-indfb-draw-render.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb2/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-mo=
deset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_pipe_crc_basic@hang-read-crc-pi=
pe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-const=
ant-alpha-min.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_plane_scaling@scaler-with-clipp=
ing-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-3.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-4.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#658]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb1/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-iclb=
5/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl1/igt@kms_vblank@pipe-d-wait-forked-hang.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +222 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_writeback@writeback-invalid-par=
ameters.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb1/igt@nouveau_crc@pipe-c-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb3/igt@nouveau_crc@pipe-c-ctx-flip-skip-cu=
rrent-frame.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-kbl3/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [i915#2994]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-tglb1/igt@sysfs_clients@split-25.html">SKIP</=
a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-glk9/igt@sysfs_clients@split-25.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / [i915#2994])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5709/shard-iclb3/igt@sysfs_clients@split-25.html">SKIP</=
a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-apl2/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / [i915#2994])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb7/igt@feature_discovery@psr2.html">SKIP</a> ([i915#6=
58]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/s=
hard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2=
410</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
09/shard-tglb3/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5709/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a=
> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5709/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5709/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5709/shard-tglb7/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a> +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i9=
15#118</a> / [i915#95]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5709/shard-glk5/igt@gem_exec_whisper@basic-queues-all.html">PA=
SS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-kbl6/igt@gem_workarounds@suspend-resume-fd.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i9=
15#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5709/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html">PASS</a> +3 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-tglb8/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2597">i915#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709=
/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-untiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk7/igt@kms_draw_crc@draw-method-rgb565-render-untiled.=
html">FAIL</a> ([i915#52] / [i915#54]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5709/shard-glk7/igt@kms_draw_crc@draw-method-rg=
b565-render-untiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9933/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-onoff.html">FAIL</a> ([i915#49]) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5709/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1=
p-primscrn-spr-indfb-onoff.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9933/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-ind=
fb-onoff.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2546">i915#2546</a> / [i915#49]) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@kms_frontbuffer_tracking=
@fbc-1p-primscrn-spr-indfb-onoff.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-in=
dfb-draw-pwrite.html">FAIL</a> ([i915#49]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-glk9/igt@kms_frontbuffer_trackin=
g@fbc-2p-scndscrn-cur-indfb-draw-pwrite.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb7/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / [i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5709/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb4/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#1094=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_570=
9/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar =
issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/=
shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5709/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i=
915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5709/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">FAIL</a>=
 ([i915#2680])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-edp:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb4/igt@kms_dp_dsc@basic-dsc-enable-edp.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109349">fdo#109=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_57=
09/shard-iclb2/igt@kms_dp_dsc@basic-dsc-enable-edp.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1226">i915#1226</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-iclb8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
-5.html">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5709/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-5.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9933/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_99=
33/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/sh=
ard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/CI_DRM_9933/shard-kbl4/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-k=
bl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2505">i915#2505</a> / [i915#3002]) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl6/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5709/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5709/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5709/shard-kbl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2505">i915#2505</=
a> / [i915#3002])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9933/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9933/shard-apl8/igt@runner@abort=
ed.html">FAIL</a>) ([i915#3002]) -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5709/shard-apl2/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5709/shard-apl8/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5709/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>=
 / [i915#3002])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============0205856742843074232==--

--===============2107736097==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2107736097==--
