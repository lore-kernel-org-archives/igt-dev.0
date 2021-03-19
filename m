Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 19 Mar 2021 15:06:06 -0000
Message-ID: <161616636696.8628.3068604277794025006@emeril.freedesktop.org>
References: <20210319113044.118440-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210319113044.118440-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcontent=5Fprotection=3A_Initialize_fb_height_width_to_0_?=
 =?utf-8?b?KHJldjIp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1100034677=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1100034677==
Content-Type: multipart/alternative;
 boundary="===============1146154068573340492=="

--===============1146154068573340492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_content_protection: Initialize fb height width to 0 (rev2)
URL   : https://patchwork.freedesktop.org/series/88114/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9875_full -> IGTPW_5628_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/index.html

Known issues
------------

  Here are the changes found in IGTPW_5628_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][1] ([fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb2/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][2] ([fdo#109271]) +58 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk6/igt@feature_discovery@display-3x.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][3] ([i915#3002])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +5 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_exec_balancer@hang:
    - shard-iclb:         [PASS][5] -> [INCOMPLETE][6] ([i915#1895])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb6/igt@gem_exec_balancer@hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@gem_exec_balancer@hang.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][7] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [PASS][10] -> [FAIL][11] ([i915#2842]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb5/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#112283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-parallel:
    - shard-apl:          NOTRUN -> [TIMEOUT][16] ([i915#3183])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@gem_exec_reloc@basic-parallel.html

  * igt@gem_exec_schedule@u-fairslice@rcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][17] ([i915#1610])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.html
    - shard-iclb:         [PASS][18] -> [DMESG-WARN][19] ([i915#2803])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb3/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-fds-all:
    - shard-glk:          [PASS][20] -> [DMESG-WARN][21] ([i915#118] / [i915#95]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk2/igt@gem_exec_whisper@basic-fds-all.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-glk:          [PASS][22] -> [FAIL][23] ([i915#307])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb6/igt@gem_pwrite@basic-exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][25] ([i915#2658])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@input-checking:
    - shard-glk:          NOTRUN -> [DMESG-WARN][26] ([i915#3002])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk6/igt@gem_userptr_blits@input-checking.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][27] ([i915#3002])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb5/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#1317]) +3 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271]) +79 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@gem_userptr_blits@mmap-offset-invalidate-active@wb.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#1317]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][31] ([i915#180])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][32] -> [INCOMPLETE][33] ([i915#2782])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-snb2/igt@i915_selftest@live@hangcheck.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111614])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110725] / [fdo#111614])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110723])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111615]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2705])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@dp-hpd-storm-disable:
    - shard-glk:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk5/igt@kms_chamelium@dp-hpd-storm-disable.html
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_chamelium@dp-hpd-storm-disable.html

  * igt@kms_chamelium@vga-hpd-fast:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_chamelium@vga-hpd-fast.html

  * igt@kms_color@pipe-b-degamma:
    - shard-iclb:         NOTRUN -> [FAIL][42] ([i915#1149])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color@pipe-d-ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [i915#1149])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][46] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-to-blue.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][47] ([i915#2105])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278] / [fdo#109279])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109279]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +352 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][52] -> [FAIL][53] ([i915#79])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109274]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][55] -> [DMESG-WARN][56] ([i915#180]) +3 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
    - shard-apl:          NOTRUN -> [FAIL][57] ([i915#2641])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#2672]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#2672])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html
    - shard-iclb:         NOTRUN -> [SKIP][60] ([i915#2587])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111825]) +15 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109280]) +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#110577])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_invalid_dotclock.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#533]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#533])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-glk:          NOTRUN -> [FAIL][67] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][68] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][69] ([i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#112054])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#2733])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#658]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#658])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#658])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb7/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_setmode@basic:
    - shard-snb:          NOTRUN -> [FAIL][79] ([i915#31])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb2/igt@kms_setmode@basic.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][80] ([IGT#2])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +217 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2437]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-c-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#2530]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-c-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([i915#2530])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html

  * igt@perf@buffer-fill:
    - shard-iclb:         [PASS][85] -> [DMESG-WARN][86] ([i915#1226])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb4/igt@perf@buffer-fill.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@perf@buffer-fill.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109291]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#109291])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@prime_vgem@sync@vcs0:
    - shard-tglb:         [PASS][89] -> [INCOMPLETE][90] ([i915#409])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-tglb2/igt@prime_vgem@sync@vcs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@prime_vgem@sync@vcs0.html

  * igt@sysfs_clients@recycle:
    - shard-snb:          [PASS][91] -> [FAIL][92] ([i915#3028])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-snb7/igt@sysfs_clients@recycle.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb7/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-snb:          NOTRUN -> [FAIL][93] ([i915#3028])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb2/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-10@bcs0:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#3026])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl3/igt@sysfs_clients@split-10@bcs0.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][95] ([i915#658]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb7/igt@feature_discovery@psr2.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][97] ([i915#2846]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl2/igt@gem_exec_fair@basic-deadline.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [FAIL][99] ([i915#2842]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][101] ([i915#2849]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [FAIL][103] ([i915#307]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb7/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@i915_selftest@live@client:
    - shard-glk:          [DMESG-FAIL][105] ([i915#3047]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk2/igt@i915_selftest@live@client.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk3/igt@i915_selftest@live@client.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x21-random:
    - shard-apl:          [FAIL][107] ([i915#54]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
    - shard-glk:          [FAIL][109] ([i915#54]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][111] ([i915#180]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:
    - shard-tglb:         [DMESG-WARN][113] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-apl:          [DMESG-WARN][115] ([i915#180]) -> [PASS][116] +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][117] ([fdo#109441]) -> [PASS][118] +3 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb8/igt@kms_psr@psr2_cursor_render.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [INCOMPLETE][119] ([i915#155]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][121] ([i915#1542]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-tglb8/igt@perf@polling-parameterized.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@perf@polling-parameterized.html

  * igt@sysfs_clients@recycle:
    - shard-glk:          [FAIL][123] ([i915#3028]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-glk4/igt@sysfs_clients@recycle.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-glk5/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-tglb:         [FAIL][125] ([i915#3028]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-tglb5/igt@sysfs_clients@recycle-many.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb5/igt@sysfs_clients@recycle-many.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][127] ([i915#1804] / [i915#2684]) -> [WARN][128] ([i915#2684])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         [WARN][129] ([i915#2681] / [i915#2684]) -> [FAIL][130] ([i915#2681] / [i915#2692])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_content_protection@legacy:
    - shard-iclb:         [FAIL][131] ([i915#3144]) -> [SKIP][132] ([fdo#109300] / [fdo#111066])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb1/igt@kms_content_protection@legacy.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_content_protection@legacy.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][133] ([i915#2920]) -> [SKIP][134] ([i915#658]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][135], [FAIL][136], [FAIL][137], [FAIL][138], [FAIL][139]) ([i915#180] / [i915#1814] / [i915#2505] / [i915#2724] / [i915#3002]) -> ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143], [FAIL][144], [FAIL][145], [FAIL][146]) ([i915#180] / [i915#1814] / [i915#2724] / [i915#3002])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl1/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl2/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl4/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl1/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][147], [FAIL][148], [FAIL][149], [FAIL][150]) ([i915#1814] / [i915#2426] / [i915#2724] / [i915#3002]) -> ([FAIL][151], [FAIL][152], [FAIL][153], [FAIL][154]) ([i915#2426] / [i915#2724] / [i915#3002])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb8/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb3/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb2/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-t

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/index.html

--===============1146154068573340492==
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
<tr><td><b>Series:</b></td><td>tests/kms_content_protection: Initialize fb =
height width to 0 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/88114/">https://patchwork.freedesktop.org/series/88114/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5628/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9875_full -&gt; IGTPW_5628_full</h=
1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/index.=
html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5628_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb2/igt@feature_discovery@chamelium.html">=
SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-glk6/igt@feature_discovery@display-3x.html">=
SKIP</a> ([fdo#109271]) +58 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl8/igt@gem_create@create-massive.html">DME=
SG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-snb5/igt@gem_ctx_persistence@clone.html">SKI=
P</a> ([fdo#109271] / [i915#1099]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@hang:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb6/igt@gem_exec_balancer@hang.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb1/ig=
t@gem_exec_balancer@hang.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl2/igt@gem_exec_fair@basic-deadline.html">=
FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/s=
hard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#28=
42])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-kbl4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-k=
bl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) +1 simi=
lar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shar=
d-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb5/igt@gem_exec_params@no-vebox.html">SKI=
P</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> ([fdo#112283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl2/igt@gem_exec_reloc@basic-parallel.html"=
>TIMEOUT</a> ([i915#3183])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@u-fairslice@rcs0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-apl1/igt@gem_exec_schedule@u-fairslice@rcs0.h=
tml">DMESG-WARN</a> ([i915#1610])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9875/shard-iclb2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/sha=
rd-iclb3/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915=
#2803])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk3/igt@gem_exec_whisper@basic-fds-all.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-g=
lk2/igt@gem_exec_whisper@basic-fds-all.html">DMESG-WARN</a> ([i915#118] / [=
i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk5/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_56=
28/shard-glk6/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">FAIL</a> (=
[i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-snb6/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-apl6/igt@gem_pwrite@basic-exhaustion.html">WA=
RN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-glk6/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-snb5/igt@gem_userptr_blits@input-checking.htm=
l">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@gem_userptr_blits@mmap-offset-inva=
lidate-active@gtt.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@gem_userptr_blits@mmap-offset-inval=
idate-active@wb.html">SKIP</a> ([fdo#109271]) +79 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@gem_userptr_blits@mmap-offset-inva=
lidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@gem_workarounds@suspend-resume-cont=
ext.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb=
6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-270.=
html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-18=
0.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_big_joiner@invalid-modeset.html=
">SKIP</a> ([fdo#109271] / [i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm-disable:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-glk5/igt@kms_chamelium@dp-hpd-storm-disable.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_chamelium@dp-hpd-storm-disable.h=
tml">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-fast:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_chamelium@vga-hpd-fast.html">S=
KIP</a> ([fdo#109284] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@kms_color@pipe-b-degamma.html">FAI=
L</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_color@pipe-d-ctm-0-25.html">SK=
IP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-blue-=
to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-blue=
-to-red.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-snb2/igt@kms_color_chamelium@pipe-c-ctm-red-=
to-blue.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_content_protection@uevent.html"=
>FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-rapid-movement.html">SKIP</a> ([fdo#109279]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128=
-right-edge.html">SKIP</a> ([fdo#109271]) +352 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb6/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5628/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vb=
lank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb.html">SKI=
P</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5628/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DM=
ESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytileccs.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 si=
milar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile=
-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
e-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([i915#2587])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +15 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109280]) +11 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb3/igt@kms_invalid_dotclock.html">SKIP</a=
> ([fdo#110577])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_pipe_crc_basic@disable-crc-afte=
r-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-kbl7/igt@kms_pipe_crc_basic@read-crc-pipe-d.=
html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-o=
paque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-constant-alpha-min:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb1/igt@kms_plane_alpha_blend@pipe-d-const=
ant-alpha-min.html">SKIP</a> ([fdo#109278]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-c=
lipping-clamping:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl1/igt@kms_plane_scaling@scaler-with-clipp=
ing-clamping@pipe-c-scaler-with-clipping-clamping.html">SKIP</a> ([fdo#1092=
71] / [i915#2733])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-glk4/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area=
-1.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-ic=
lb7/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-snb2/igt@kms_setmode@basic.html">FAIL</a> ([=
i915#31])</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a=
> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_vblank@pipe-d-ts-continuation-i=
dle.html">SKIP</a> ([fdo#109271]) +217 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl2/igt@kms_writeback@writeback-check-outpu=
t.html">SKIP</a> ([fdo#109271] / [i915#2437]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb2/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb6/igt@nouveau_crc@pipe-c-source-rg.html"=
>SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@buffer-fill:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb4/igt@perf@buffer-fill.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@per=
f@buffer-fill.html">DMESG-WARN</a> ([i915#1226])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-tglb8/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-tglb2/igt@prime_vgem@sync@vcs0.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-tglb1/igt@=
prime_vgem@sync@vcs0.html">INCOMPLETE</a> ([i915#409])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-snb7/igt@sysfs_clients@recycle.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-snb7/igt@s=
ysfs_clients@recycle.html">FAIL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-snb2/igt@sysfs_clients@recycle-many.html">FA=
IL</a> ([i915#3028])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5628/shard-apl3/igt@sysfs_clients@split-10@bcs0.html">S=
KIP</a> ([fdo#109271] / [i915#3026])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb7/igt@feature_discovery@psr2.html">SKIP</a> ([i915#6=
58]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/s=
hard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i=
915#2846]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5628/shard-kbl2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk4/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5628/shard-glk7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5628/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb7/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a>=
 ([i915#307]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5628/shard-iclb8/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@client:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk2/igt@i915_selftest@live@client.html">DMESG-FAIL</a> =
([i915#3047]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5628/shard-glk3/igt@i915_selftest@live@client.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x21-random:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9875/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">=
FAIL</a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5628/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.htm=
l">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9875/shard-glk8/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.html">=
FAIL</a> ([i915#54]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_5628/shard-glk9/igt@kms_cursor_crc@pipe-a-cursor-64x21-random.htm=
l">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> =
([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5628/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-tglb7/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.=
html">DMESG-WARN</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411]=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shar=
d-tglb1/igt@kms_flip@flip-vs-suspend-interruptible@a-edp1.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.ht=
ml">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5628/shard-apl8/igt@kms_flip@flip-vs-suspend-interrupt=
ible@c-dp1.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb8/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fd=
o#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5628/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +3 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> ([i915#155]) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_5628/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuatio=
n-dpms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-tglb8/igt@perf@polling-parameterized.html">FAIL</a> ([i9=
15#1542]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
628/shard-tglb1/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-glk4/igt@sysfs_clients@recycle.html">FAIL</a> ([i915#302=
8]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/sh=
ard-glk5/igt@sysfs_clients@recycle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-tglb5/igt@sysfs_clients@recycle-many.html">FAIL</a> ([i9=
15#3028]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
628/shard-tglb5/igt@sysfs_clients@recycle-many.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb6/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 ([i915#1804] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5628/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html=
">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
([i915#2681] / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5628/shard-tglb5/igt@i915_pm_rc6_residency@rc6-idle.html">=
FAIL</a> ([i915#2681] / [i915#2692])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb1/igt@kms_content_protection@legacy.html">FAIL</a> (=
[i915#3144]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5628/shard-iclb5/igt@kms_content_protection@legacy.html">SKIP</a> ([fdo#1=
09300] / [fdo#111066])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_9875/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-kbl6/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_98=
75/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#180] / [i915#1814] =
/ [i915#2505] / [i915#2724] / [i915#3002]) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/sha=
rd-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl1=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5628/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5628/shard-kbl2/igt@runner@aborted.html">FAIL</a>) ([i915#180] =
/ [i915#1814] / [i915#2724] / [i915#3002])</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9875/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9875/shard-iclb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9875/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-t">FAIL</a>) ([i915#1814] / [i915#2426] / [i9=
15#2724] / [i915#3002]) -&gt; ([FAIL][151], [FAIL][152], [FAIL][153], [FAIL=
][154]) ([i915#2426] / [i915#2724] / [i915#3002])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1146154068573340492==--

--===============1100034677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1100034677==--
