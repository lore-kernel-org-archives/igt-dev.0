Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Dec 2020 11:01:20 -0000
Message-ID: <160923968059.17553.7153449809488866608@emeril.freedesktop.org>
References: <20201229074604.24064-1-jeevan.b@intel.com>
In-Reply-To: <20201229074604.24064-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_reduce_execution_time_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0738622600=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0738622600==
Content-Type: multipart/alternative;
 boundary="===============3542458643747994719=="

--===============3542458643747994719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_rotation_crc: reduce execution time (rev2)
URL   : https://patchwork.freedesktop.org/series/85060/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9530_full -> IGTPW_5337_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5337_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_exec_fair@basic-none-rrul@rcs0}:
    - shard-iclb:         [FAIL][1] ([i915#2842]) -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_5337_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-tglb:         [PASS][3] -> [DMESG-WARN][4] ([i915#1602])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@core_hotunplug@unbind-rebind.html
    - shard-apl:          [PASS][5] -> [DMESG-WARN][6] ([i915#2283])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl8/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@core_hotunplug@unbind-rebind.html
    - shard-glk:          [PASS][7] -> [DMESG-WARN][8] ([i915#2283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk7/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@core_hotunplug@unbind-rebind.html
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#2283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl7/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@core_hotunplug@unbind-rebind.html
    - shard-iclb:         [PASS][11] -> [DMESG-WARN][12] ([i915#2283]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@core_hotunplug@unbind-rebind.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2389])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_whisper@basic-contexts-forked-all:
    - shard-glk:          [PASS][15] -> [DMESG-WARN][16] ([i915#118] / [i915#95]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked-all.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109289])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][18] ([fdo#112306])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][19] ([fdo#112306])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#658])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#658])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-iclb:         NOTRUN -> [SKIP][22] ([i915#658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html
    - shard-kbl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#658])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#110892])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][25] -> [FAIL][26] ([i915#2574])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@kms_async_flips@test-time-stamp.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([i915#1769])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#1769])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109284] / [fdo#111827])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [fdo#111827])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109284] / [fdo#111827])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - shard-snb:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb5/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html

  * igt@kms_concurrent@pipe-c:
    - shard-kbl:          [PASS][35] -> [DMESG-WARN][36] ([i915#180] / [i915#78])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@kms_concurrent@pipe-c.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@kms_concurrent@pipe-c.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([fdo#109300] / [fdo#111066])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#111828])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-a-cursor-dpms:
    - shard-kbl:          [PASS][39] -> [FAIL][40] ([i915#54])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
    - shard-apl:          [PASS][41] -> [FAIL][42] ([i915#54])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [fdo#109279])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#109279])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109274] / [fdo#109278])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [FAIL][46] ([i915#2346])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109274])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-tglb:         [PASS][48] -> [FAIL][49] ([i915#2598])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][50] ([fdo#109271]) +66 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:
    - shard-kbl:          NOTRUN -> [FAIL][51] ([i915#2641])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [i915#2672])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-glk:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#2672])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#2587])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#2672])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-apl:          [PASS][56] -> [FAIL][57] ([i915#49])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
    - shard-kbl:          [PASS][58] -> [FAIL][59] ([i915#49])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-hsw:          NOTRUN -> [SKIP][60] ([fdo#109271]) +8 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109280]) +11 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-glk:          [PASS][62] -> [FAIL][63] ([i915#49])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-tglb:         [PASS][64] -> [INCOMPLETE][65] ([i915#456])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111825]) +12 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][67] -> [SKIP][68] ([i915#433])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-pipe-c-planes:
    - shard-apl:          [PASS][69] -> [FAIL][70] ([i915#2472])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl7/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl8/igt@kms_plane@plane-position-hole-pipe-c-planes.html
    - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#2472])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk4/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk2/igt@kms_plane@plane-position-hole-pipe-c-planes.html
    - shard-kbl:          [PASS][73] -> [FAIL][74] ([i915#2472])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl3/igt@kms_plane@plane-position-hole-pipe-c-planes.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][75] ([fdo#108145] / [i915#265])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-basic:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-alpha-basic.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][77] -> [SKIP][78] ([fdo#109642] / [fdo#111068])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][79] -> [SKIP][80] ([fdo#109441]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#109309])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109309])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +54 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][84] ([fdo#109271]) +30 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271]) +21 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk8/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109502])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#2530])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2530])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109289]) +1 similar issue
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@perf@mi-rpc.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@prime_nv_pcopy@test3_2.html
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@prime_nv_pcopy@test3_2.html

  
#### Possible fixes ####

  * {igt@gem_exec_balancer@fairslice}:
    - shard-iclb:         [FAIL][92] ([i915#2802]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@gem_exec_balancer@fairslice.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@waits:
    - shard-kbl:          [INCOMPLETE][94] -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl2/igt@gem_exec_balancer@waits.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@gem_exec_balancer@waits.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-tglb:         [FAIL][96] ([i915#2842]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-snb:          [SKIP][98] ([fdo#109271]) -> [PASS][99] +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb4/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         [FAIL][100] ([i915#2346]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][102] ([i915#2598]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [FAIL][104] ([i915#2122]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk9/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [INCOMPLETE][106] ([i915#1185] / [i915#1602] / [i915#250]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][108] ([i915#1602] / [i915#2635]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][110] ([i915#1602] / [i915#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-hsw:          [DMESG-WARN][112] ([i915#2637]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [DMESG-WARN][114] ([i915#1602]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117] +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-hsw:          [WARN][118] ([i915#2283]) -> [DMESG-WARN][119] ([i915#2283])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw2/igt@core_hotunplug@unbind-rebind.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw7/igt@core_hotunplug@unbind-rebind.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][120] ([i915#2681] / [i915#2684]) -> [WARN][121] ([i915#1804] / [i915#2684])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][122] ([i915#1804] / [i915#2684]) -> [WARN][123] ([i915#2684])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][124] ([i915#2295]) -> [FAIL][125] ([i915#2283] / [i915#2295])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][126], [FAIL][127]) ([i915#1814] / [i915#2295] / [i915#483]) -> ([FAIL][128], [FAIL][129], [FAIL][130]) ([i915#2283] / [i915#2295] / [i915#2426] / [i915#483])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][133], [FAIL][134], [FAIL][135]) ([i915#2283] / [i915#2295] / [i915#2724] / [i915#483])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295]) -> ([FAIL][138], [FAIL][139]) ([i915#2283] / [i915#2295])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl7/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl7/igt@runner@aborted.html
    - shard-glk:          ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][142], [FAIL][143]) ([i915#2283] / [i915#2295] / [k.org#202321])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk3/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk5/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][144], [FAIL][145]) ([i915#1814] / [i915#2295] / [i915#2667]) -> ([FAIL][146], [FAIL][147]) ([i915#1602] / [i915#2295] / [i915#2667])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

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
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1185]: https://gitlab.freedesktop.org/drm/intel/issues/1185
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/index.html

--===============3542458643747994719==
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
<tr><td><b>Series:</b></td><td>tests/kms_rotation_crc: reduce execution time (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85060/">https://patchwork.freedesktop.org/series/85060/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9530_full -&gt; IGTPW_5337_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5337_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@gem_exec_fair@basic-none-rrul@rcs0}:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5337_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl8/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@gem_exec_whisper@basic-contexts-forked-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a> / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb1/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2574])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1769">i915#1769</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@kms_color_chamelium@pipe-a-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb5/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_concurrent@pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@kms_concurrent@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@kms_concurrent@pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#78])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111828">fdo#111828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-dpms:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl1/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl6/igt@kms_cursor_crc@pipe-a-cursor-dpms.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> ([i915#2598])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +66 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile.html">FAIL</a> ([i915#2641])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([i915#2587])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / [i915#2672])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#49])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> ([i915#49])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> ([i915#49])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433])</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-pipe-c-planes:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl7/igt@kms_plane@plane-position-hole-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl8/igt@kms_plane@plane-position-hole-pipe-c-planes.html">FAIL</a> ([i915#2472])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk4/igt@kms_plane@plane-position-hole-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk2/igt@kms_plane@plane-position-hole-pipe-c-planes.html">FAIL</a> ([i915#2472])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl3/igt@kms_plane@plane-position-hole-pipe-c-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_plane@plane-position-hole-pipe-c-planes.html">FAIL</a> ([i915#2472])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb8/igt@kms_plane_alpha_blend@pipe-d-alpha-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109309">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +54 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl3/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk8/igt@kms_vblank@pipe-d-ts-continuation-idle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109502">fdo#109502</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@nouveau_crc@pipe-b-source-rg.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb2/igt@prime_nv_pcopy@test3_2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb6/igt@prime_nv_pcopy@test3_2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@gem_exec_balancer@fairslice.html">FAIL</a> ([i915#2802]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@gem_exec_balancer@fairslice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@waits:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl2/igt@gem_exec_balancer@waits.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@gem_exec_balancer@waits.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-snb4/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> ([i915#2598]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk9/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">FAIL</a> ([i915#2122]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk4/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1185">i915#1185</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#250]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb7/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw2/igt@core_hotunplug@unbind-rebind.html">WARN</a> ([i915#2283]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> ([i915#2283])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-hsw7/igt@runner@aborted.html">FAIL</a> ([i915#2283] / [i915#2295])</p>
</li>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-kbl1/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [i915#2426] / [i915#483])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-iclb5/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [i915#2724] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-apl7/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk3/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-glk5/igt@runner@aborted.html">FAIL</a>) ([i915#2283] / [i915#2295] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2667]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5337/shard-tglb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2295] / [i915#2667])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3542458643747994719==--

--===============0738622600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0738622600==--
