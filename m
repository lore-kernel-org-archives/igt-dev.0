Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 05 Jan 2021 21:15:06 -0000
Message-ID: <160988130693.13808.12964533444855038082@emeril.freedesktop.org>
References: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?avoid_recalculating_refecence_crcs_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1582233805=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1582233805==
Content-Type: multipart/alternative;
 boundary="===============3105184555906367629=="

--===============3105184555906367629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs (rev2)
URL   : https://patchwork.freedesktop.org/series/85490/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9547_full -> IGTPW_5358_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/index.html

New tests
---------

  New tests have been introduced between CI_DRM_9547_full and IGTPW_5358_full:

### New IGT tests (2) ###

  * igt@gem_spin_batch@legacy:
    - Statuses :
    - Exec time: [None] s

  * igt@gem_spin_batch@legacy-resubmit:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in IGTPW_5358_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099]) +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_persistence@replace-hostile:
    - shard-hsw:          NOTRUN -> [SKIP][2] ([fdo#109271]) +219 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@gem_ctx_persistence@replace-hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#280])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_params@no-bsd:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([fdo#109283])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb5/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#109283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@gem_exec_params@rsvd2-dirt.html

  * igt@gem_exec_reloc@basic-wide-active@bcs0:
    - shard-hsw:          NOTRUN -> [FAIL][6] ([i915#2389]) +3 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw6/igt@gem_exec_reloc@basic-wide-active@bcs0.html

  * igt@gem_exec_whisper@basic-contexts-priority-all:
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#118] / [i915#95])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk8/igt@gem_exec_whisper@basic-contexts-priority-all.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#2190])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pread@exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][10] ([i915#2658])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@gem_pread@exhaustion.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#109312])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@huge-split:
    - shard-kbl:          [PASS][12] -> [INCOMPLETE][13] ([i915#2502])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl3/igt@gem_userptr_blits@huge-split.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@gem_userptr_blits@huge-split.html

  * igt@gem_userptr_blits@readonly-mmap-unsync@wb:
    - shard-iclb:         NOTRUN -> [SKIP][14] ([i915#1704]) +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([fdo#112306])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([fdo#112306])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb8/igt@gen9_exec_parse@secure-batches.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-kbl:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-hsw:          [PASS][19] -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw6/igt@i915_pm_rpm@drm-resources-equal.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-iclb:         [PASS][21] -> [SKIP][22] ([i915#579])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb8/igt@i915_pm_rpm@drm-resources-equal.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html
    - shard-tglb:         [PASS][23] -> [SKIP][24] ([i915#579])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-apl:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-glk:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@i915_pm_rpm@modeset-non-lpsp.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_selftest@live@requests:
    - shard-hsw:          [PASS][29] -> [INCOMPLETE][30] ([i915#2782])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@i915_selftest@live@requests.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@i915_selftest@live@requests.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#1769])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([fdo#110725] / [fdo#111614])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#111614])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#110723])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_chamelium@hdmi-audio-edid:
    - shard-hsw:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw6/igt@kms_chamelium@hdmi-audio-edid.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-glk:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_color@pipe-a-ctm-0-75:
    - shard-iclb:         NOTRUN -> [FAIL][40] ([i915#1149] / [i915#315])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb5/igt@kms_color@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271]) +18 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [fdo#109279]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109279]) +3 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271]) +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111825]) +7 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109274] / [fdo#109278])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109278]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#426])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][50] -> [INCOMPLETE][51] ([i915#1185] / [i915#1602])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [PASS][52] -> [INCOMPLETE][53] ([i915#1602] / [i915#2635]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          [PASS][54] -> [INCOMPLETE][55] ([i915#1602] / [i915#2635])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-tglb:         [PASS][56] -> [INCOMPLETE][57] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#79])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [PASS][61] -> [FAIL][62] ([i915#2598])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#2642])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#2642])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#2642])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +7 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-tglb:         [PASS][67] -> [DMESG-WARN][68] ([i915#1982])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109280]) +12 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1187])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109289]) +1 similar issue
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:
    - shard-iclb:         [PASS][72] -> [DMESG-WARN][73] ([i915#1602])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-kbl:          [PASS][74] -> [INCOMPLETE][75] ([i915#155] / [i915#1602])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-hsw:          NOTRUN -> [DMESG-WARN][76] ([i915#2637])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-glk:          [PASS][77] -> [DMESG-WARN][78] ([i915#1602] / [i915#2635])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
    - shard-tglb:         [PASS][79] -> [INCOMPLETE][80] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][81] ([fdo#108145] / [i915#265])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#111615])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_psr@psr2_sprite_mmap_cpu:
    - shard-iclb:         [PASS][83] -> [SKIP][84] ([fdo#109441])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109441])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb6/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@cursor-rotation-180:
    - shard-hsw:          [PASS][86] -> [FAIL][87] ([i915#65]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@kms_rotation_crc@cursor-rotation-180.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@kms_rotation_crc@cursor-rotation-180.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2530])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109278] / [i915#2530])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@nouveau_crc@pipe-d-source-rg.html

  * igt@prime_nv_api@i915_nv_import_vs_close:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +1 similar issue
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_close.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109291]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@prime_nv_api@i915_self_import.html

  * igt@runner@aborted:
    - shard-hsw:          NOTRUN -> [FAIL][92] ([i915#2295] / [i915#2505])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@runner@aborted.html

  
#### Possible fixes ####

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-apl:          [SKIP][93] ([fdo#109271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none-solo@rcs0}:
    - shard-glk:          [FAIL][95] ([i915#2842]) -> [PASS][96] +5 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * {igt@gem_exec_fair@basic-none@vcs1}:
    - shard-kbl:          [FAIL][97] ([i915#2842]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html

  * {igt@gem_exec_fair@basic-pace@rcs0}:
    - shard-iclb:         [FAIL][99] ([i915#2842]) -> [PASS][100] +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@rcs0}:
    - shard-kbl:          [DMESG-WARN][101] ([i915#1610] / [i915#2803]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@gem_exec_schedule@u-fairslice@rcs0.html

  * igt@gem_exec_whisper@basic-queues-forked-all:
    - shard-glk:          [DMESG-WARN][103] ([i915#118] / [i915#95]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html

  * {igt@gem_vm_create@destroy-race}:
    - shard-tglb:         [INCOMPLETE][105] -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@gem_vm_create@destroy-race.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@gem_vm_create@destroy-race.html

  * igt@i915_selftest@live@execlists:
    - shard-iclb:         [INCOMPLETE][107] ([i915#1037] / [i915#2276]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@i915_selftest@live@execlists.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb6/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-glk:          [DMESG-FAIL][109] ([i915#2291]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@i915_selftest@live@gt_heartbeat.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][111] ([i915#2055]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:
    - shard-glk:          [FAIL][113] ([i915#49]) -> [PASS][114] +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-kbl:          [FAIL][115] ([i915#49]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
    - shard-apl:          [FAIL][117] ([i915#49]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][119] ([fdo#109441]) -> [PASS][120] +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  * igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:
    - shard-kbl:          [DMESG-WARN][121] ([i915#165] / [i915#180]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html

  
#### Warnings ####

  * igt@gem_exec_params@rsvd2-dirt:
    - shard-hsw:          [INCOMPLETE][123] -> [SKIP][124] ([fdo#109271])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@gem_exec_params@rsvd2-dirt.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@gem_exec_params@rsvd2-dirt.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][125] ([i915#1804] / [i915#2684]) -> [WARN][126] ([i915#2684])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][127] ([i915#2681] / [i915#2684]) -> [WARN][128] ([i915#1804] / [i915#2684])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         [SKIP][129] ([fdo#110892]) -> [SKIP][130] ([i915#579])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html
    - shard-tglb:         [SKIP][131] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][132] ([i915#579])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][133], [FAIL][134]) ([i915#2295] / [i915#2426] / [i915#2505] / [i915#483]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#483])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl6/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         [FAIL][138] ([i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][139], [FAIL][140], [FAIL][141], [FAIL][142]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724] / [i915#483])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          [FAIL][143] ([i915#2295]) -> ([FAIL][144], [FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl7/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl6/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl1/igt@runner@aborted.html
    - shard-glk:          [FAIL][148] ([i915#2295] / [k.org#202321]) -> ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152]) ([i915#1814] / [i915#2295] / [i915#2426] / [k.org#202321])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk8/igt@runner@aborted.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk7/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk8/igt@runner@aborted.html
    - shard-tglb:         [FAIL][153] ([i915#2295] / [i915#2667]) -> ([FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb7/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/index.html

--===============3105184555906367629==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: avoid recalculating refecence crcs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85490/">https://patchwork.freedesktop.org/series/85490/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9547_full -&gt; IGTPW_5358_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9547_full and IGTPW_5358_full:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@gem_spin_batch@legacy:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5358_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@gem_ctx_persistence@legacy-engines-persistence.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@replace-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@gem_ctx_persistence@replace-hostile.html">SKIP</a> ([fdo#109271]) +219 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb5/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw6/igt@gem_exec_reloc@basic-wide-active@bcs0.html">FAIL</a> ([i915#2389]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk8/igt@gem_exec_whisper@basic-contexts-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_whisper@basic-contexts-priority-all.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl3/igt@gem_userptr_blits@huge-split.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@gem_userptr_blits@huge-split.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-mmap-unsync@wb:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@gem_userptr_blits@readonly-mmap-unsync@wb.html">SKIP</a> ([i915#1704]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb7/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb8/igt@gen9_exec_parse@secure-batches.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([fdo#109271])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb8/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@i915_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#109271]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@requests:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@i915_selftest@live@requests.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@i915_selftest@live@requests.html">INCOMPLETE</a> ([i915#2782])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio-edid:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw6/igt@kms_chamelium@hdmi-audio-edid.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl1/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk7/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl3/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109271] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_chamelium@vga-edid-read.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb5/igt@kms_color@pipe-a-ctm-0-75.html">FAIL</a> ([i915#1149] / [i915#315])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb6/igt@kms_color_chamelium@pipe-a-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-512x170-sliding.html">SKIP</a> ([fdo#109271]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-rapid-movement.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk5/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109271]) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#111825]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1185] / [i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1602] / [i915#2635]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb4/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb3/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> ([i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#1187])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#1602])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">INCOMPLETE</a> ([i915#155] / [i915#1602])</p>
</li>
<li>
<p>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#2637])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-c-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@kms_plane_lowres@pipe-a-tiling-yf.html">SKIP</a> ([fdo#111615])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@kms_psr@psr2_sprite_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@kms_psr@psr2_sprite_mmap_cpu.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb6/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@cursor-rotation-180:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@kms_rotation_crc@cursor-rotation-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@kms_rotation_crc@cursor-rotation-180.html">FAIL</a> ([i915#65]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@nouveau_crc@pipe-d-source-rg.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_vs_close:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@prime_nv_api@i915_nv_import_vs_close.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@prime_nv_api@i915_self_import.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2505])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl1/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-solo@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vcs1}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@rcs0}:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@gem_exec_schedule@u-fairslice@rcs0.html">DMESG-WARN</a> ([i915#1610] / [i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@gem_exec_schedule@u-fairslice@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@gem_exec_whisper@basic-queues-forked-all.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_vm_create@destroy-race}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb5/igt@gem_vm_create@destroy-race.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb8/igt@gem_vm_create@destroy-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@execlists:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@i915_selftest@live@execlists.html">INCOMPLETE</a> ([i915#1037] / [i915#2276]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb6/igt@i915_selftest@live@execlists.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk6/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> ([i915#2291]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">INCOMPLETE</a> ([i915#2055]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw4/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-vga1-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">FAIL</a> ([i915#49]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-cpu.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-modeset-hang:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">DMESG-WARN</a> ([i915#165] / [i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-modeset-hang.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_params@rsvd2-dirt:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-hsw7/igt@gem_exec_params@rsvd2-dirt.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-hsw7/igt@gem_exec_params@rsvd2-dirt.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-tglb2/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2426] / [i915#2505] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-iclb5/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2724] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-apl7/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-apl1/igt@runner@aborted.html">FAIL</a>) ([i915#1610] / [i915#1814] / [i915#2295] / [i915#2426])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-glk8/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5358/shard-glk8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9547/shard-tglb7/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2667]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5">FAIL</a>, [FAIL][155], [FAIL][156], [FAIL][157]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3105184555906367629==--

--===============1582233805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1582233805==--
