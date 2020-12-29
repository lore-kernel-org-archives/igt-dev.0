Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Dec 2020 12:45:33 -0000
Message-ID: <160924593352.17550.4055708836501470901@emeril.freedesktop.org>
References: <20201229103852.234352-1-chris@chris-wilson.co.uk>
In-Reply-To: <20201229103852.234352-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fctx=5Fengines=3A_Exercise_independence_across_all_physical?=
 =?utf-8?q?_engines_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1294335318=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1294335318==
Content-Type: multipart/alternative;
 boundary="===============3637813440380036474=="

--===============3637813440380036474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/gem_ctx_engines: Exercise independence across all physical engines (rev3)
URL   : https://patchwork.freedesktop.org/series/85293/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9530_full -> IGTPW_5338_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5338_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5338_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5338_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@gem_ctx_engines@independent@vcs1} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb3/igt@gem_ctx_engines@independent@vcs1.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-iclb:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  
New tests
---------

  New tests have been introduced between CI_DRM_9530_full and IGTPW_5338_full:

### New IGT tests (6) ###

  * igt@gem_ctx_engines@independent-all:
    - Statuses : 5 pass(s) 2 skip(s)
    - Exec time: [0.0, 0.71] s

  * igt@gem_ctx_engines@independent@bcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.29] s

  * igt@gem_ctx_engines@independent@rcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.26] s

  * igt@gem_ctx_engines@independent@vcs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.06, 0.22] s

  * igt@gem_ctx_engines@independent@vcs1:
    - Statuses : 3 skip(s)
    - Exec time: [0.00] s

  * igt@gem_ctx_engines@independent@vecs0:
    - Statuses : 5 pass(s)
    - Exec time: [0.05, 0.21] s

  

Known issues
------------

  Here are the changes found in IGTPW_5338_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@gem_ctx_engines@independent@vcs1} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#109276])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb1/igt@gem_ctx_engines@independent@vcs1.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2389])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([fdo#109289])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb1/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#112306])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#112306])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-hsw:          [PASS][12] -> [SKIP][13] ([fdo#109271])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-kbl:          [PASS][14] -> [SKIP][15] ([fdo#109271])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-apl:          [PASS][16] -> [SKIP][17] ([fdo#109271])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-glk:          [PASS][18] -> [SKIP][19] ([fdo#109271])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#1769])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb6/igt@kms_atomic_transition@plane-all-modeset-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([i915#1769])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][22] ([fdo#109284] / [fdo#111827])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [fdo#111827])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl3/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#109284] / [fdo#111827])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb5/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [fdo#111827])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk2/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
    - shard-snb:          NOTRUN -> [SKIP][27] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-snb5/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html

  * igt@kms_content_protection@content_type_change:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109300] / [fdo#111066])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_content_protection@content_type_change.html
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#111828])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@kms_content_protection@content_type_change.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109278] / [fdo#109279])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109279])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-hsw:          [PASS][32] -> [FAIL][33] ([i915#96]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-glk:          [PASS][34] -> [FAIL][35] ([i915#72])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109274] / [fdo#109278])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-tglb:         NOTRUN -> [FAIL][37] ([i915#2346])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109274])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb3/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271]) +65 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-kbl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#2672])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#2672])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#2587])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#2672])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:
    - shard-hsw:          NOTRUN -> [SKIP][44] ([fdo#109271]) +9 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109280]) +11 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111825]) +13 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-tglb:         [PASS][47] -> [INCOMPLETE][48] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-glk:          [PASS][49] -> [DMESG-WARN][50] ([i915#2635])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-apl:          [PASS][51] -> [DMESG-WARN][52] ([i915#2635])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-kbl:          [PASS][53] -> [INCOMPLETE][54] ([CI#80])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
    - shard-hsw:          [PASS][55] -> [DMESG-WARN][56] ([i915#2637])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][57] ([fdo#108145] / [i915#265])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-basic:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109278]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-alpha-basic.html

  * igt@kms_plane_lowres@pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#111615])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [PASS][60] -> [SKIP][61] ([fdo#109642] / [fdo#111068])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr2_su@frontbuffer.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb3/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [PASS][62] -> [SKIP][63] ([fdo#109441]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109309])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb6/igt@kms_tv_load_detect@load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109309])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][66] ([fdo#109271]) +56 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl2/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-apl:          NOTRUN -> [SKIP][67] ([fdo#109271]) +30 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-idle.html
    - shard-glk:          NOTRUN -> [SKIP][68] ([fdo#109271]) +21 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk8/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109502])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_vrr@flip-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109502])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@pipe-b-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#2530])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@nouveau_crc@pipe-b-source-rg.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#2530])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#109289]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb8/igt@perf@mi-rpc.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#109291])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@prime_nv_pcopy@test3_2.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109291])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@prime_nv_pcopy@test3_2.html

  
#### Possible fixes ####

  * {igt@gem_exec_balancer@fairslice}:
    - shard-tglb:         [FAIL][76] ([i915#2802]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@gem_exec_balancer@fairslice.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@gem_exec_balancer@fairslice.html
    - shard-iclb:         [FAIL][78] ([i915#2802]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@gem_exec_balancer@fairslice.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb3/igt@gem_exec_balancer@fairslice.html

  * igt@gem_exec_balancer@waits:
    - shard-kbl:          [INCOMPLETE][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl2/igt@gem_exec_balancer@waits.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl3/igt@gem_exec_balancer@waits.html

  * {igt@gem_exec_fair@basic-pace-share@rcs0}:
    - shard-tglb:         [FAIL][82] ([i915#2842]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html
    - shard-glk:          [FAIL][84] ([i915#2842]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:
    - shard-snb:          [SKIP][86] ([fdo#109271]) -> [PASS][87] +1 similar issue
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
    - shard-tglb:         [FAIL][88] ([i915#2122]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [FAIL][90] ([i915#2122]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk9/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [SKIP][92] ([fdo#109441]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@kms_psr@psr2_cursor_render.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_psr@psr2_cursor_render.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         [WARN][94] ([i915#2681] / [i915#2684]) -> [WARN][95] ([i915#1804] / [i915#2684])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         [SKIP][96] ([fdo#111644] / [i915#1397] / [i915#2411]) -> [SKIP][97] ([i915#579])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         [SKIP][98] ([fdo#110892]) -> [SKIP][99] ([i915#579])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-kbl:          [DMESG-WARN][100] ([i915#1602]) -> [INCOMPLETE][101] ([i915#155])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@runner@aborted:
    - shard-hsw:          [FAIL][102] ([i915#2295]) -> ([FAIL][103], [FAIL][104]) ([fdo#109271] / [i915#2295])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-hsw4/igt@runner@aborted.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw6/igt@runner@aborted.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw7/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][105], [FAIL][106]) ([i915#1814] / [i915#2295] / [i915#483]) -> ([FAIL][107], [FAIL][108]) ([i915#2295] / [i915#2426] / [i915#483])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl1/igt@runner@aborted.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@runner@aborted.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl7/igt@runner@aborted.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl4/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][109], [FAIL][110]) ([i915#1814] / [i915#2295] / [i915#2724] / [i915#483]) -> ([FAIL][111], [FAIL][112], [FAIL][113]) ([i915#1814] / [i915#2295] / [i915#2724])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb1/igt@runner@aborted.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@runner@aborted.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@runner@aborted.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@runner@aborted.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@runner@aborted.html
    - shard-apl:          ([FAIL][114], [FAIL][115]) ([i915#1814] / [i915#2295]) -> ([FAIL][116], [FAIL][117], [FAIL][118]) ([fdo#109271] / [i915#1814] / [i915#2295])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl7/igt@runner@aborted.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@runner@aborted.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl3/igt@runner@aborted.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl2/igt@runner@aborted.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][119], [FAIL][120]) ([i915#1814] / [i915#2295] / [i915#483] / [k.org#202321]) -> ([FAIL][121], [FAIL][122], [FAIL][123]) ([i915#1814] / [i915#2295] / [k.org#202321])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk5/igt@runner@aborted.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk3/igt@runner@aborted.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk9/igt@runner@aborted.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk2/igt@runner@aborted.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][124], [FAIL][125]) ([i915#1814] / [i915#2295] / [i915#2667]) -> ([FAIL][126], [FAIL][127], [FAIL][128]) ([i915#1602] / [i915#1814] / [i915#2295] / [i915#2667])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@runner@aborted.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb5/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [CI#80]: https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues/80
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109276]: https://bugs.freedesktop.org/show_bug.cgi?id=109276
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
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1804]: https://gitlab.freedesktop.org/drm/intel/issues/1804
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2389]: https://gitlab.freedesktop.org/drm/intel/issues/2389
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2426]: https://gitlab.freedesktop.org/drm/intel/issues/2426
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2635]: https://gitlab.freedesktop.org/drm/intel/issues/2635
  [i915#2637]: https://gitlab.freedesktop.org/drm/intel/issues/2637
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2667]: https://gitlab.freedesktop.org/drm/intel/issues/2667
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#2733]: https://gitlab.freedesktop.org/drm/intel/issues/2733
  [i915#2795]: https://gitlab.freedesktop.org/drm/intel/issues/2795
  [i915#2802]: https://gitlab.freedesktop.org/drm/intel/issues/2802
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#456]: https://gitlab.freedesktop.org/drm/intel/issues/456
  [i915#483]: https://gitlab.freedesktop.org/drm/intel/issues/483
  [i915#579]: https://gitlab.freedesktop.org/drm/intel/issues/579
  [i915#72]: https://gitlab.freedesktop.org/drm/intel/issues/72
  [i915#96]: https://gitlab.freedesktop.org/drm/intel/issues/96
  [k.org#202321]: https://bugzilla.kernel.org/show_bug.cgi?id=202321


Participating hosts (10 -> 8)
------------------------------

  Missing    (2): pig-skl-6260u pig-glk-j5005 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5926 -> IGTPW_5338
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_9530: 4b094e30c7d79e59faef5ce793d6ebbcdbede5a2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTP

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.html

--===============3637813440380036474==
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
<tr><td><b>Series:</b></td><td>i915/gem_ctx_engines: Exercise independence =
across all physical engines (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/85293/">https://patchwork.freedesktop.org/series/85293/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5338/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9530_full -&gt; IGTPW_5338_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5338_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5338_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5338=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@gem_ctx_engines@independent@vcs1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-tglb3/igt@gem_ctx_engines@independent@vcs1.h=
tml">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-snb4/igt@i915_module_load@reload-with-fault-injection.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5338/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">IN=
COMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5338/shard-iclb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMES=
G-WARN</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_9530_full and IGTPW_5338_f=
ull:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@gem_ctx_engines@independent-all:</p>
<ul>
<li>Statuses : 5 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 0.71] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@bcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.29] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@rcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.26] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.06, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vcs1:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_engines@independent@vecs0:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.05, 0.21] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5338_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@gem_ctx_engines@independent@vcs1} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb1/igt@gem_ctx_engines@independent@vcs1.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9276">fdo#109276</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-glk1/igt@gem_exec_reloc@basic-many-active@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/=
shard-glk7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb1/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb5/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb2/igt@gen9_exec_parse@bb-start-cmd.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306"=
>fdo#112306</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-hsw4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-hsw6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-kbl6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-apl3/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-apl2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-glk5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-glk9/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)<=
/p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb6/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1769">i915#1769</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1769">i915#1769</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-apl3/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb5/igt@kms_chamelium@hdmi-hpd-enable-disab=
le-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-glk2/igt@kms_chamelium@hdmi-hpd-enable-disabl=
e-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-kbl4/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-snb5/igt@kms_color_chamelium@pipe-invalid-ga=
mma-lut-sizes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_content_protection@content_type=
_change.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb7/igt@kms_content_protection@content_type=
_change.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111828">fdo#111828</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-onscreen:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x51=
2-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb1/igt@kms_cursor_crc@pipe-b-cursor-512x51=
2-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-hsw2/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5338/shard-hsw6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/96">i915#96<=
/a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-glk4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5338/shard-glk7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/72=
">i915#72</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb5/igt@kms_cursor_legacy@2x-long-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-tglb5/igt@kms_cursor_legacy@flip-vs-cursor-l=
egacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb3/igt@kms_flip@2x-flip-vs-panning-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-snb2/igt@kms_flip_scaled_crc@flip-32bpp-ytil=
eccs-to-64bpp-ytile.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-kbl4/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-glk5/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2587">i915#2587</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-32bpp-ytilercccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2672">i915#2672</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-hsw1/igt@kms_frontbuffer_tracking@fbc-1p-shr=
fb-fliptrack.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +13 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-tglb1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5338/shard-tglb2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436"=
>i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/456">i915#456</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
338/shard-glk1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-apl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
338/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2635">i=
915#2635</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-kbl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
338/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/gfx-ci/i915-infra/issues=
/80">CI#80</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-hsw2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
338/shard-hsw7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2637">i=
915#2637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-kbl7/igt@kms_plane_alpha_blend@pipe-a-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_plane_alpha_blend@pipe-d-alpha=
-basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-tglb1/igt@kms_plane_lowres@pipe-c-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb3/i=
gt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs.=
freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-=
iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar =
issue</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb6/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb3/igt@kms_tv_load_detect@load-detect.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
9">fdo#109309</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-kbl2/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +56 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-apl1/igt@kms_vblank@pipe-d-ts-continuation-id=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +30 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-glk8/igt@kms_vblank@pipe-d-ts-continuation-id=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#10950=
2</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb2/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#10950=
2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-rg:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb7/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb7/igt@nouveau_crc@pipe-b-source-rg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530">=
i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5338/shard-tglb8/igt@perf@mi-rpc.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>)=
 +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-tglb7/igt@prime_nv_pcopy@test3_2.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#1=
09291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5338/shard-iclb7/igt@prime_nv_pcopy@test3_2.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#1=
09291</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@gem_exec_balancer@fairslice}:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-tglb6/igt@gem_exec_balancer@fairslice.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2802">i915#2802</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shar=
d-tglb7/igt@gem_exec_balancer@fairslice.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-iclb4/igt@gem_exec_balancer@fairslice.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2802">i915#2802</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shar=
d-iclb3/igt@gem_exec_balancer@fairslice.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@waits:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-kbl2/igt@gem_exec_balancer@waits.html">INCOMPLETE</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kb=
l3/igt@gem_exec_balancer@waits.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-share@rcs0}:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-tglb6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
338/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-glk2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
38/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-snb7/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscreen.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_5338/shard-snb5/igt@kms_cursor_crc@pipe-b-cursor-256x256-onscree=
n.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-tglb6/igt@kms_flip@flip-vs-absolute-wf_vblank-interrupti=
ble@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2122">i915#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vbla=
nk-interruptible@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-glk9/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i9=
15#2122</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5338/shard-glk6/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb4/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb1/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#268=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5338/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo=
#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
97">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2411">i915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5338/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579=
">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo=
#110892</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5338/shard-iclb2/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-kbl6/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5338/shard-kbl6/igt@kms_plane@plane-panning-bot=
tom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9530/shard-hsw4/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-hsw6/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5338/shard-hsw7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>=
)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-kbl6/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5338/shard-kbl7/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-kbl4/=
igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2426">i915#2426</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-iclb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-iclb4/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2724">i915#2724</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/483">i915#483</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5338/shard-iclb2/igt@runner@aborted.html">FAIL<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915=
#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295=
">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2724">i915#2724</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-apl3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5338/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-apl2/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_5338/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i91=
5#2295</a>)</p>
</li>
<li>
<p>shard-glk:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-glk5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-glk3/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://bugzilla.kernel.org/=
show_bug.cgi?id=3D202321">k.org#202321</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-glk9/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/sh=
ard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5338/shard-glk1/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1=
814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D20=
2321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9530/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9530/shard-tglb8/igt@runner@abo=
rted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2667">i915#2667</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5338/shard-tglb7/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5338/shard-=
tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5338/shard-tglb2/igt@runner@aborted.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#160=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i9=
15#1814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/22=
95">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2667">i915#2667</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5926 -&gt; IGTPW_5338</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_9530: 4b094e30c7d79e59faef5ce793d6ebbcdbede5a2 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br />
  IGTPW_5338: https://intel-gfx-ci.01.org/tree/drm-tip/IGTP</p>

</body>
</html>

--===============3637813440380036474==--

--===============1294335318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1294335318==--
