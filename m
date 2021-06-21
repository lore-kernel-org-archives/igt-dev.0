Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 21 Jun 2021 04:32:13 -0000
Message-ID: <162424993326.19771.2735079104605691784@emeril.freedesktop.org>
References: <20210621030010.9956-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210621030010.9956-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fdummyload=3A_Fix_undefined_behavior_in_bitshift?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0936362335=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0936362335==
Content-Type: multipart/alternative;
 boundary="===============0510802726251161073=="

--===============0510802726251161073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_dummyload: Fix undefined behavior in bitshift
URL   : https://patchwork.freedesktop.org/series/91713/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10248_full -> IGTPW_5945_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5945_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5945_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5945_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html

  
Known issues
------------

  Here are the changes found in IGTPW_5945_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#1099]) +5 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][4] -> [FAIL][5] ([i915#2846])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          [PASS][6] -> [FAIL][7] ([i915#2842]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][8] -> [FAIL][9] ([i915#2842]) +2 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_suspend@basic-s3:
    - shard-kbl:          [PASS][10] -> [DMESG-WARN][11] ([i915#180])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl2/igt@gem_exec_suspend@basic-s3.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl7/igt@gem_exec_suspend@basic-s3.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][12] -> [DMESG-WARN][13] ([i915#118] / [i915#95]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_mmap_gtt@cpuset-big-copy:
    - shard-iclb:         [PASS][14] -> [FAIL][15] ([i915#2428])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb8/igt@gem_mmap_gtt@cpuset-big-copy.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][16] ([fdo#109271] / [i915#3323])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#3323])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#3323])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#3323])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3323])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-apl:          NOTRUN -> [DMESG-WARN][21] ([i915#3002])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl8/igt@gem_userptr_blits@input-checking.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][22] ([i915#3002])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl3/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][23] ([i915#2724])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-snb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          NOTRUN -> [FAIL][24] ([i915#3296])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl1/igt@gen9_exec_parse@bb-large.html

  * igt@i915_suspend@forcewake:
    - shard-apl:          [PASS][25] -> [DMESG-WARN][26] ([i915#180]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl3/igt@i915_suspend@forcewake.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#111614])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#110725] / [fdo#111614])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2705])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb7/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#2705])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb2/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb5/igt@kms_chamelium@hdmi-audio.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb8/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-crc-nonplanar-formats:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl2/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +14 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][37] ([i915#1319])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][38] ([i915#2105])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#3444])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-apl:          NOTRUN -> [FAIL][41] ([i915#3444])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
    - shard-glk:          [PASS][42] -> [FAIL][43] ([i915#3444])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109278]) +5 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3359]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109279] / [i915#3359]) +1 similar issue
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109278] / [fdo#109279])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109274] / [fdo#109278])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#111825]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [PASS][52] -> [INCOMPLETE][53] ([i915#155])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#2672])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109280]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [PASS][56] -> [FAIL][57] ([i915#2546] / [i915#49])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][58] ([fdo#109271]) +68 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +198 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][60] ([fdo#109271]) +51 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#110577])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb7/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#533])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][63] ([fdo#108145] / [i915#265])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][64] ([fdo#108145] / [i915#265])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111615])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#658])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#658]) +4 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +290 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-snb6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#2437])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#2530])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb7/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#2530])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@sysfs_clients@recycle-many:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#2994]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl6/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#2994])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][74] ([i915#2842]) -> [PASS][75] +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-kbl:          [SKIP][76] ([fdo#109271]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][78] ([i915#2849]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][80] ([i915#2190]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][82] ([i915#180]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-kbl:          [FAIL][84] ([i915#3444]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [FAIL][86] ([i915#79]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][88] ([i915#180]) -> [PASS][89] +3 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][90] ([i915#433]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-glk:          [FAIL][92] ([i915#2472]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][94] ([fdo#109441]) -> [PASS][95] +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb1/igt@kms_psr@psr2_primary_blt.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][96] ([i915#155] / [i915#2828]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][98] ([i915#1542]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-tglb6/igt@perf@polling-parameterized.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tglb5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][100] ([i915#2852]) -> [FAIL][101] ([i915#2842])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][102] ([i915#2684]) -> [WARN][103] ([i915#1804] / [i915#2684])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-iclb:         [SKIP][104] ([i915#2920]) -> [SKIP][105] ([i915#658]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][106] ([i915#658]) -> [SKIP][107] ([i915#2920])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][108], [FAIL][109], [FAIL][110]) ([i915#180] / [i915#1814] / [i915#3363]) -> ([FAIL][111], [FAIL][112], [FAIL][113]) ([i915#180] / [i915#3002] / [i915#3363])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl1/igt@runner@aborted.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl8/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl1/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl8/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/igt@runner@aborted.html

  
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110577]: https://bugs.freedesktop.org/show_bug.cgi?id=110577
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2428]: https://gitlab.freedesktop.org/drm/intel/issues/2428
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2472]: https://gitlab.freedesktop.org/drm/intel/issues/2472
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2828]: https://gitlab.freedesktop.org/drm/intel/issues/2828
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3296]: https://gitlab.freedesktop.org/drm/intel/issues/3296
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3363]: https://gitlab.freedesktop.org/drm/intel/issues/3363
  [i915#3444]: https://gitlab.freedesktop.org/drm/intel/issues/3444
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#49]: https://gitlab.freedesktop.org/drm/intel/issues/49
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#95]: https://gitlab.freedesktop.org/drm/intel/issues/95


Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6113 -> IGTPW_5945
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_10248: 940478dea0bccfe1ef632c6cbfca66c5d3fc345e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html
  IGT_6113: 138a29e30277b1039e9934fca5c782dc1e7a9f99 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.html

--===============0510802726251161073==
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
<tr><td><b>Series:</b></td><td>lib/igt_dummyload: Fix undefined behavior in=
 bitshift</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/91713/">https://patchwork.freedesktop.org/series/91713/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5945/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10248_full -&gt; IGTPW_5945_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5945_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5945_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5945=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@gem-execbuf-stress:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb4/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard=
-iclb7/igt@i915_pm_rpm@gem-execbuf-stress.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5945_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-snb6/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kb=
l2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-g=
lk3/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-k=
bl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl2/igt@gem_exec_suspend@basic-s3.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-kbl7/=
igt@gem_exec_suspend@basic-s3.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_59=
45/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#1=
18</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i91=
5#95</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb4/igt@gem_mmap_gtt@cpuset-big-copy.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-i=
clb8/igt@gem_mmap_gtt@cpuset-big-copy.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2428">i915#2428</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb5/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3323"=
>i915#3323</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-apl8/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-glk5/igt@gem_userptr_blits@dmabuf-sync.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3323">i915#3323</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb6/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3323"=
>i915#3323</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-apl8/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002">i915#3002</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-kbl3/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3002">i915#3002</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-snb7/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i=
915#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl1/igt@gen9_exec_parse@bb-large.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3296">i915=
#3296</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-apl3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/igt=
@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb7/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb2/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb5/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb8/igt@kms_chamelium@hdmi-audio.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo=
#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-kbl2/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl2/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-glk2/igt@kms_color_chamelium@pipe-b-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ct=
m-matrix-sizes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl2/igt@kms_content_protection@uevent.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105"=
>i915#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10248/shard-kbl3/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5945/shard-kbl1/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3444">=
i915#3444</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-128x128=
-onscreen.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3444">i915#3444</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10248/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5945/shard-glk8/igt@kms_cursor_crc@pipe-b-cursor-128x128-onscreen.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3444">=
i915#3444</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-=
onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-32x10-=
onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3359">i915#3359</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-iclb8/igt@kms_cursor_legacy@cursorb-vs-flipa=
-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo=
#111825</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo=
#109274</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-=
kbl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-i=
ndfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5945/shard-glk3/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-pri-indfb-draw-blt.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2546">i915#2546</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/49">i915#49</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +68 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +198 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-glk1/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +51 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-tglb7/igt@kms_invalid_dotclock.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110577">fdo#11=
0577</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl8/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
7efc.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-tglb2/igt@kms_plane_multiple@atomic-pipe-b-t=
iling-yf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-1.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/658">i915#658</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-snb6/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +290 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5945/shard-apl1/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-tglb7/igt@nouveau_crc@pipe-a-source-outp-comp=
lete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-iclb8/igt@nouveau_crc@pipe-a-source-outp-comp=
lete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-apl6/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5945/shard-kbl1/igt@sysfs_clients@recycle-many.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
994">i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk4/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
945/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl3/igt@gem_exec_fair@basic-pace@vcs1.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10927=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945=
/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
945/shard-iclb5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-tg=
lb7/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5945/shard-kbl1/igt@i915_suspend@fence-restore-untiled.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/34=
44">i915#3444</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5945/shard-kbl6/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk8/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_5945/shard-glk4/igt@kms_flip@flip-vs-expired-vblank-interru=
ptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-apl1/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
945/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +3 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-tglb2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">i915#433</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/sha=
rd-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-plan=
es.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2472">i915#2472</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5945/shard-glk5/igt@kms_plane@plane-position-hole-dpms@pipe-b-=
planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb1/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/sha=
rd-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-kbl6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/155">i915#155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2828">i915#2828</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5945/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-=
dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-tglb6/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1542">i915#1542</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/sha=
rd-tglb5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915=
#2852</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5945/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945=
/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-=
1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5945/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-ar=
ea-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10248/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-are=
a-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5945/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-=
area-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_10248/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10248/shard-apl8/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_10248/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3363">i915#3363</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-=
apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5945/shard-apl3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/shard-apl3/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3363">i915#3363</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6113 -&gt; IGTPW_5945</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10248: 940478dea0bccfe1ef632c6cbfca66c5d3fc345e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_5945: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5945/index.htm=
l<br />
  IGT_6113: 138a29e30277b1039e9934fca5c782dc1e7a9f99 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0510802726251161073==--

--===============0936362335==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0936362335==--
