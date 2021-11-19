Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4925196939305902632=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Nov 2021 13:35:32 -0000
Message-ID: <163732893295.2298.10767162438970157985@emeril.freedesktop.org>
References: <20211119094822.2240179-1-Perry.Yuan@amd.com>
In-Reply-To: <20211119094822.2240179-1-Perry.Yuan@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYW1kZ3B1?=
 =?utf-8?q?/amd=5Fbypass=3A_add_check_for_the_connection_type_of_the_CRC_s?=
 =?utf-8?q?ource?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Perry Yuan <perry.yuan@amd.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4925196939305902632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: amdgpu/amd_bypass: add check for the connection type of the CRC source
URL   : https://patchwork.freedesktop.org/series/97098/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10904_full -> IGTPW_6416_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6416_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6416_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6416_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl8/igt@gem_workarounds@suspend-resume-fd.html

  
Known issues
------------

  Here are the changes found in IGTPW_6416_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-snb4/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#280])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][5] -> [TIMEOUT][6] ([i915#2369] / [i915#3063] / [i915#3648])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb6/igt@gem_eio@unwedge-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][7] ([i915#2842]) +4 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-tglb:         [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2842])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][14] -> [FAIL][15] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#109283])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb8/igt@gem_exec_params@no-bsd.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#284])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@gem_media_vme.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][18] ([i915#2658])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#768])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gem_workarounds@suspend-resume:
    - shard-apl:          [PASS][21] -> [DMESG-WARN][22] ([i915#180]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl8/igt@gem_workarounds@suspend-resume.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl3/igt@gem_workarounds@suspend-resume.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#2856]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2856]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#454])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl6/igt@i915_pm_dc@dc9-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - shard-tglb:         [PASS][29] -> [INCOMPLETE][30] ([i915#2411])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109506] / [i915#2411])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271]) +60 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111644] / [i915#1397] / [i915#2411])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][34] -> [INCOMPLETE][35] ([i915#3921])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-snb7/igt@i915_selftest@live@hangcheck.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#111614]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#110725] / [fdo#111614])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#3777]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#3777])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3777]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][41] -> [FAIL][42] ([i915#1888] / [i915#3653])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#3689] / [i915#3886]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3689]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615] / [i915#3689]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [i915#3886]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3886]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [i915#3886])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html
    - shard-kbl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-apl:          NOTRUN -> [SKIP][51] ([fdo#109271]) +95 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl6/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl2/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-kbl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html
    - shard-snb:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk9/igt@kms_color_chamelium@pipe-d-degamma.html
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@type1:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111828])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109279] / [i915#3359])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271]) +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3359])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3319]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          [PASS][65] -> [FAIL][66] ([i915#1888])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109274]) +2 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][68] -> [DMESG-WARN][69] ([i915#180]) +5 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-iclb:         [PASS][70] -> [SKIP][71] ([i915#3701])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#2672])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111825]) +17 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][75] -> [SKIP][76] ([i915#433])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#1187])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#533])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][79] ([fdo#108145] / [i915#265]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3536])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#658]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#2920]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:
    - shard-snb:          NOTRUN -> [SKIP][85] ([fdo#109271]) +27 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-snb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html
    - shard-glk:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#658])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][88] -> [SKIP][89] ([fdo#109441]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         NOTRUN -> [FAIL][90] ([i915#132] / [i915#3467])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_psr@psr2_suspend.html

  * igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#2530])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#2530]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109289])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@perf@mi-rpc.html

  * igt@sysfs_clients@sema-50:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2994]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl1/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][95] ([i915#180]) -> [PASS][96] +4 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
    - shard-apl:          [DMESG-WARN][97] ([i915#180]) -> [PASS][98] +4 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [TIMEOUT][99] ([i915#3063]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [FAIL][101] ([i915#2842]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_exec_fair@basic-sync@rcs0:
    - shard-kbl:          [SKIP][103] ([fdo#109271]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][105] ([i915#2849]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@i915_pm_rps@min-max-config-loaded:
    - shard-apl:          [FAIL][107] -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl2/igt@i915_pm_rps@min-max-config-loaded.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl1/igt@i915_pm_rps@min-max-config-loaded.html

  * igt@i915_selftest@live@gem_contexts:
    - shard-tglb:         [DMESG-WARN][109] -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@i915_selftest@live@gem_contexts.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@i915_selftest@live@gem_contexts.html

  * igt@i915_selftest@live@perf:
    - shard-tglb:         [DMESG-WARN][111] ([i915#2867]) -> [PASS][112] +4 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@i915_selftest@live@perf.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@i915_selftest@live@perf.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-iclb:         [FAIL][113] ([i915#2346]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][115] ([i915#79]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118] +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb5/igt@kms_psr@psr2_no_drrs.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-tglb:         [INCOMPLETE][119] ([i915#456]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][121] ([i915#2842]) -> [FAIL][122] ([i915#2876])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][123] ([i915#2684]) -> [WARN][124] ([i915#1804] / [i915#2684])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-apl:          [DMESG-FAIL][125] ([fdo#110321]) -> [TIMEOUT][126] ([i915#1319])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-apl4/igt@kms_content_protection@atomic-dpms.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][127] ([i915#658]) -> [SKIP][128] ([i915#2920]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][129] ([i915#2920]) -> [SKIP][130] ([i915#658]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135], [FAIL][136]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312] / [i915#602]) -> ([FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl4/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl7/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl2/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl1/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAIL][149]) ([i915#180] / [i915#3002] / [i915#3363] / [i915#4312]) -> ([FAIL][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/index.html

--===============4925196939305902632==
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
<tr><td><b>Series:</b></td><td>amdgpu/amd_bypass: add check for the connect=
ion type of the CRC source</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/97098/">https://patchwork.freedesktop.org/series/97098/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6416/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10904_full -&gt; IGTPW_6416_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6416_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6416_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/index.=
html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6416=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_workarounds@suspend-resume-fd:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-apl6/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/sha=
rd-apl8/igt@gem_workarounds@suspend-resume-fd.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6416_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-snb4/igt@gem_ctx_persistence@hostile.html">S=
KIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-tglb8/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i=
915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@gem_exec_fair@basic-none@vcs0.html=
">FAIL</a> ([i915#2842]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/sh=
ard-kbl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]=
)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-=
tglb8/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10904/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-=
iclb5/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/sha=
rd-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb8/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@gem_media_vme.html">SKIP</a> ([i91=
5#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> ([i915#768])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-apl8/igt@gem_workarounds@suspend-resume.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-=
apl3/igt@gem_workarounds@suspend-resume.html">DMESG-WARN</a> ([i915#180]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@gen9_exec_parse@allowed-all.html">=
SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-iclb2/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-apl6/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-apl2/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> ([fdo#109271]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/sha=
rd-tglb6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">INCOMPLETE</a> ([i915#2=
411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> ([fdo#109506] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@i915_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> ([fdo#109271]) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb8/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-snb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-sn=
b6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#3921])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb4/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_big_fb@x-tiled-max-hw-stride-32b=
pp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar is=
sue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-glk4/igt@kms_big_fb@x-tiled-max-hw-stride-32b=
pp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-64=
bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar i=
ssue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-glk2/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/=
shard-glk4/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">FAIL</a> ([i915#1=
888] / [i915#3653])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#111615]) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +1 similar issu=
e</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_ccs@pipe-b-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb6/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +1 simila=
r issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-apl3/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar=
 issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-glk4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl6/igt@kms_ccs@pipe-d-crc-primary-rotation=
-180-yf_tiled_ccs.html">SKIP</a> ([fdo#109271]) +95 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl2/igt@kms_chamelium@hdmi-cmp-planar-forma=
ts.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb7/igt@kms_color_chamelium@pipe-a-ctm-red-=
to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-snb7/igt@kms_color_chamelium@pipe-a-ctm-red-t=
o-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-5=
.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-glk9/igt@kms_color_chamelium@pipe-d-degamma.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_color_chamelium@pipe-d-degamma.=
html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_content_protection@type1.html"=
>SKIP</a> ([fdo#111828])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-onscreen.html">SKIP</a> ([fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x1=
70-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-onscreen:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-max-siz=
e-onscreen.html">SKIP</a> ([fdo#109271]) +11 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-max-si=
ze-onscreen.html">SKIP</a> ([i915#3359])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-sliding.html">SKIP</a> ([i915#3319]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6416/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html"=
>FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb4/igt@kms_flip@2x-flip-vs-expired-vblank=
.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6416/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> ([i915#180]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6416/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
32bpp-ytileccs.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl8/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb3/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-onoff.html">SKIP</a> ([fdo#111825]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-spr-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +4 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-t=
glb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_hdr@static-swap.html">SKIP</a>=
 ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl6/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb8/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> ([fdo#111615] / [fdo#112054]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-apl2/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</=
p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-kbl4/igt@kms_psr2_sf@overlay-primary-update-s=
f-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-0.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-snb4/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-3.html">SKIP</a> ([fdo#109271]) +27 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-3.html">SKIP</a> ([i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard=
-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +1 =
similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb5/igt@kms_psr@psr2_suspend.html">FAIL</a=
> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-iclb6/igt@nouveau_crc@pipe-c-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb2/igt@nouveau_crc@pipe-c-source-outp-com=
plete.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@perf@mi-rpc.html">SKIP</a> ([fdo#1=
09289])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-apl1/igt@sysfs_clients@sema-50.html">SKIP</a=
> ([fdo#109271] / [i915#2994]) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10904/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DM=
ESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6416/shard-kbl3/igt@gem_ctx_isolation@preservation-s3@bcs0.h=
tml">PASS</a> +4 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10904/shard-apl6/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DM=
ESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_6416/shard-apl8/igt@gem_ctx_isolation@preservation-s3@bcs0.h=
tml">PASS</a> +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb3/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT<=
/a> ([i915#3063]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6416/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6416/shard-tglb8/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-sync@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-kbl4/igt@gem_exec_fair@basic-sync@rcs0.html">SKIP</a> (=
[fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6416/shard-kbl3/igt@gem_exec_fair@basic-sync@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6416/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-loaded:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-apl2/igt@i915_pm_rps@min-max-config-loaded.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/sha=
rd-apl1/igt@i915_pm_rps@min-max-config-loaded.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gem_contexts:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb2/igt@i915_selftest@live@gem_contexts.html">DMESG-W=
ARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_641=
6/shard-tglb5/igt@i915_selftest@live@gem_contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@perf:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb2/igt@i915_selftest@live@perf.html">DMESG-WARN</a> =
([i915#2867]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6416/shard-tglb5/igt@i915_selftest@live@perf.html">PASS</a> +4 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size=
.html">FAIL</a> ([i915#2346]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_cursor_legacy@flip-vs-cursor-va=
rying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-=
hdmi-a2.html">FAIL</a> ([i915#79]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6416/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vbl=
ank@bc-hdmi-a1-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb5/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109=
441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/=
shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.htm=
l">INCOMPLETE</a> ([i915#456]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6416/shard-tglb6/igt@kms_vblank@pipe-a-ts-continuation-=
suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-tglb2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> =
([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_6416/shard-tglb8/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915=
#2876])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6416/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i9=
15#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-apl4/igt@kms_content_protection@atomic-dpms.html">DMESG=
-FAIL</a> ([fdo#110321]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6416/shard-apl2/igt@kms_content_protection@atomic-dpms.html">=
TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb7/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6416/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</=
a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-2.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6416/shard-iclb5/igt@kms_psr2_sf@overlay-primary-upda=
te-sf-dmg-area-2.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10904/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_10904/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_10904/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10904/shard-kbl1/igt@runner@aborted.h=
tml">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915#3002] / [i91=
5#3363] / [i915#4312] / [i915#602]) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6416/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6416/shard-kbl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_6416/shard-kbl1/igt@runner@aborted.html">FAIL</a>) ([fdo#109271] / [i9=
15#180] / [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312])</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM">FAIL</a>, [FAIL][145], [FAIL][146], [FAIL][147], [FAIL][148], [FAI=
L][149]) ([i915#180] / [i915#3002] / [i915#3363] / [i915#4312]) -&gt; ([FAI=
L][150], [FAIL][151], [FAIL][152], [FAIL][153]) ([fdo#109271] / [i915#180] =
/ [i915#1814] / [i915#3002] / [i915#3363] / [i915#4312])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4925196939305902632==--
