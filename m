Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 09 Dec 2020 05:51:01 -0000
Message-ID: <160749306107.4257.9581436287193277658@emeril.freedesktop.org>
References: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201207161150.1841453-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_i915/query=3A_Cross-check_engi?=
 =?utf-8?q?ne_list_against_execbuf_interface?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1647142652=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1647142652==
Content-Type: multipart/alternative;
 boundary="===============3980658654634861035=="

--===============3980658654634861035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] i915/query: Cross-check engine list against execbuf interface
URL   : https://patchwork.freedesktop.org/series/84646/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9455_full -> IGTPW_5256_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/index.html

Known issues
------------

  Here are the changes found in IGTPW_5256_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@hostile:
    - shard-hsw:          NOTRUN -> [SKIP][1] ([fdo#109271] / [i915#1099])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw5/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_shared@q-smoketest-all:
    - shard-tglb:         [PASS][2] -> [INCOMPLETE][3] ([i915#1889])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb5/igt@gem_ctx_shared@q-smoketest-all.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@gem_ctx_shared@q-smoketest-all.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][4] ([i915#280])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_capture@pi@vcs1:
    - shard-kbl:          [PASS][5] -> [INCOMPLETE][6] ([i915#2295])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@gem_exec_capture@pi@vcs1.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl7/igt@gem_exec_capture@pi@vcs1.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([fdo#112283])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][8] ([fdo#112283])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb8/igt@gem_exec_params@secure-non-root.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][9] ([i915#2389])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][10] ([i915#2389])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][11] ([i915#2658])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gem_pread@exhaustion.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([fdo#109289])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@gen3_mixed_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][13] ([fdo#109289])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][14] -> [DMESG-WARN][15] ([i915#1436] / [i915#716])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#112306]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@gen9_exec_parse@bb-start-out.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#112306])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-tglb:         NOTRUN -> [FAIL][18] ([i915#454])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][19] -> [FAIL][20] ([i915#454])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-hsw:          [PASS][21] -> [FAIL][22] ([i915#2768])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw6/igt@i915_pm_lpsp@screens-disabled.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw5/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-kbl:          [PASS][25] -> [SKIP][26] ([fdo#109271]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [PASS][29] -> [SKIP][30] ([fdo#109271]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#109293] / [fdo#109506])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109506] / [i915#2411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-iclb:         [PASS][33] -> [SKIP][34] ([i915#579]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [PASS][35] -> [FAIL][36] ([i915#2597])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb2/igt@kms_async_flips@test-time-stamp.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_atomic_transition@4x-modeset-transitions-nonblocking:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112022] / [fdo#112041])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb7/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking.html

  * igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([fdo#112016] / [fdo#112025])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111614])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#2705])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-storm-disable:
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm-disable.html
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl4/igt@kms_chamelium@hdmi-hpd-storm-disable.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][44] ([i915#1149] / [i915#315])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb1/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][45] ([i915#1149] / [i915#315])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278] / [i915#1149])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-random:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271]) +44 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109274] / [fdo#109278])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         [PASS][52] -> [FAIL][53] ([i915#2346])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-tglb:         NOTRUN -> [FAIL][54] ([i915#2346])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#426])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#426])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:
    - shard-hsw:          [PASS][57] -> [INCOMPLETE][58] ([CI#80])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109274]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111825]) +23 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109280]) +9 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-hsw:          NOTRUN -> [SKIP][62] ([fdo#109271]) +14 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#1187])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#1187])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][65] -> [INCOMPLETE][66] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][67] ([fdo#108145] / [i915#265])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-apl:          NOTRUN -> [FAIL][68] ([fdo#108145] / [i915#265])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-kbl:          NOTRUN -> [FAIL][69] ([fdo#108145] / [i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][70] -> [SKIP][71] ([fdo#109642] / [fdo#111068])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [PASS][72] -> [SKIP][73] ([fdo#109441]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@kms_psr@psr2_primary_render.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb3/igt@kms_psr@psr2_primary_render.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271]) +30 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][75] -> [DMESG-WARN][76] ([i915#295])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-apl:          [PASS][77] -> [DMESG-WARN][78] ([i915#2635] / [i915#295])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-glk:          [PASS][79] -> [DMESG-WARN][80] ([i915#2635] / [i915#295])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-iclb:         [PASS][81] -> [DMESG-WARN][82] ([i915#2759])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
    - shard-hsw:          [PASS][83] -> [DMESG-WARN][84] ([i915#2637])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-forked:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271]) +30 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@kms_vblank@pipe-d-wait-forked.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb8/igt@kms_vblank@pipe-d-wait-forked.html

  * igt@kms_vrr@flip-suspend:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#109502])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@kms_vrr@flip-suspend.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][88] ([i915#2530]) +2 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2530])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([fdo#109291]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_pcopy@test3_4:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109291])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@prime_nv_pcopy@test3_4.html

  
#### Possible fixes ####

  * {igt@gem_ctx_exec@basic-close-race}:
    - shard-glk:          [DMESG-FAIL][92] ([i915#2245]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk4/igt@gem_ctx_exec@basic-close-race.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@gem_ctx_exec@basic-close-race.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][94] ([i915#2190]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][96] ([i915#454]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c:
    - shard-kbl:          [DMESG-WARN][98] ([i915#165] / [i915#180]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:
    - shard-apl:          [FAIL][100] ([i915#54]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
    - shard-kbl:          [FAIL][102] ([i915#54]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-hsw:          [FAIL][104] ([i915#2370]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-move:
    - shard-tglb:         [INCOMPLETE][106] ([i915#2781]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@kms_cursor_legacy@pipe-d-torture-move.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_cursor_legacy@pipe-d-torture-move.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][108] ([i915#2055] / [i915#2295]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][110] ([i915#433]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:
    - shard-hsw:          [DMESG-WARN][112] ([i915#2637]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html

  * igt@kms_plane_lowres@pipe-a-tiling-x:
    - shard-kbl:          [DMESG-WARN][114] ([i915#165] / [i915#180] / [i915#78]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [SKIP][116] ([fdo#109441]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb6/igt@kms_psr@psr2_sprite_render.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@kms_psr@psr2_sprite_render.html

  
#### Warnings ####

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][118] ([i915#588]) -> [SKIP][119] ([i915#658])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          [FAIL][120] ([i915#545]) -> [FAIL][121] ([i915#454])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         [SKIP][122] ([fdo#110892]) -> [SKIP][123] ([i915#579])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][124] ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][125], [FAIL][126]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [i915#602])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl4/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl3/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@runner@aborted.html
    - shard-iclb:         [FAIL][127] ([i915#2295] / [i915#2722] / [i915#483]) -> ([FAIL][128], [FAIL][129]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@runner@aborted.html
    - shard-apl:          [FAIL][130] ([i915#2295] / [i915#2722]) -> ([FAIL][131], [FAIL][132]) ([i915#1814] / [i915#2295] / [i915#2722])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl7/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@runner@aborted.html
    - shard-glk:          ([FAIL][133], [FAIL][134]) ([i915#2295] / [i915#2722] / [k.org#202321]) -> ([FAIL][135], [FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk9/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk4/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk3/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk2/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][138], [FAIL][139]) ([i915#1602] / [i915#2295] / [i915#2722]) -> ([FAIL][140], [FAIL][141], [FAIL][142], [FAIL][143]) ([i915#1602] / [i915#1889] / [i915#2295] / [i915#2722])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb8/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112016]: https://bugs.freedesktop.org/show_bug.cgi?id=112016
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112025]: https://bugs.freedesktop.org/show_bug.cgi?id=112025
  [fdo#112041]: https://bugs.freedesktop.org/show_bug.cgi?id=112041
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1187]: https://gitlab.freedesktop.org/drm/intel/issues/1187
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#165]: https://gitlab.freedesktop.org/drm/intel/issues/165
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1889]: https://gitlab.freed

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/index.html

--===============3980658654634861035==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] i915/query: Cross-check engine list against execbuf interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/84646/">https://patchwork.freedesktop.org/series/84646/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9455_full -&gt; IGTPW_5256_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5256_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw5/igt@gem_ctx_persistence@hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_shared@q-smoketest-all:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb5/igt@gem_ctx_shared@q-smoketest-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@gem_ctx_shared@q-smoketest-all.html">INCOMPLETE</a> (<a href="https://gitlab.freed">i915#1889</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@vcs1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@gem_exec_capture@pi@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl7/igt@gem_exec_capture@pi@vcs1.html">INCOMPLETE</a> ([i915#2295])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb8/igt@gem_exec_params@secure-non-root.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb1/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@gen3_mixed_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk1/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#716])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@gen9_exec_parse@unaligned-jump.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112306">fdo#112306</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw6/igt@i915_pm_lpsp@screens-disabled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw5/igt@i915_pm_lpsp@screens-disabled.html">FAIL</a> ([i915#2768])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109293">fdo#109293</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a> / [i915#2411])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_rpm@system-suspend-devices.html">SKIP</a> ([i915#579]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb2/igt@kms_async_flips@test-time-stamp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i915#2597])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@4x-modeset-transitions-nonblocking:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb7/igt@kms_atomic_transition@4x-modeset-transitions-nonblocking.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112022">fdo#112022</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112041">fdo#112041</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@kms_atomic_transition@6x-modeset-transitions-nonblocking-fencing.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=112016">fdo#112016</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=112025">fdo#112025</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> ([i915#2705])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm-disable:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl4/igt@kms_chamelium@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb1/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a> / [i915#315])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb5/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109284">fdo#109284</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk2/igt@kms_cursor_crc@pipe-d-cursor-256x85-random.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-vga1-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80">CI#80</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-pwrite.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1187">i915#1187</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#1798</a> / [i915#1982] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=108145">fdo#108145</a> / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109642">fdo#109642</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb3/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#295])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2635] / [i915#295])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk3/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2635] / [i915#295])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb8/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2759])</p>
</li>
<li>
<p>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#2637])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@kms_vblank@pipe-d-wait-forked.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb8/igt@kms_vblank@pipe-d-wait-forked.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109278">fdo#109278</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109502">fdo#109502</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html">SKIP</a> ([i915#2530]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@prime_nv_pcopy@test1_macro.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb6/igt@prime_nv_pcopy@test3_4.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_ctx_exec@basic-close-race}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk4/igt@gem_ctx_exec@basic-close-race.html">DMESG-FAIL</a> ([i915#2245]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@gem_ctx_exec@basic-close-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@dp-1-pipe-c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl8/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl1/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl6/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">FAIL</a> ([i915#54]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_cursor_crc@pipe-b-cursor-64x21-sliding.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> ([i915#2370]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-move:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@kms_cursor_legacy@pipe-d-torture-move.html">INCOMPLETE</a> ([i915#2781]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@kms_cursor_legacy@pipe-d-torture-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">INCOMPLETE</a> ([i915#2055] / [i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-hsw2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">DMESG-WARN</a> ([i915#2637]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-hsw6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-a-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-x:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/165">i915#165</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / [i915#78]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@kms_plane_lowres@pipe-a-tiling-x.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb6/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109441">fdo#109441</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#588]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#545]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110892">fdo#110892</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-kbl4/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-kbl2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722] / [i915#483] / [i915#602])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-iclb5/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722] / [i915#483]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-iclb7/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722] / [i915#483])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-apl6/igt@runner@aborted.html">FAIL</a> ([i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-apl6/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-glk4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-glk2/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> / [i915#2295] / [i915#2722] / [i915#483] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9455/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / [i915#2295] / [i915#2722]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5256/shard-tglb5/igt@runner@aborted.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href="https://gitlab.freed">i915#1889</a> / [i915#2295] / [i915#2722])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============3980658654634861035==--

--===============1647142652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1647142652==--
