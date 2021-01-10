Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 10 Jan 2021 00:43:20 -0000
Message-ID: <161023940005.22035.3897880800714435054@emeril.freedesktop.org>
References: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210109191013.9858-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Frotation=5Fcrc=3A_?=
 =?utf-8?q?fix_crc_buffer_overflow_for_slow_platforms_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1989021675=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1989021675==
Content-Type: multipart/alternative;
 boundary="===============6263053826755231203=="

--===============6263053826755231203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_rotation_crc: fix crc buffer overflow for slow platforms (rev2)
URL   : https://patchwork.freedesktop.org/series/85659/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_9573_full -> IGTPW_5374_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5374_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1}:
    - shard-iclb:         [SKIP][1] ([i915#2920]) -> [SKIP][2] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5374_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][3] -> [SKIP][4] ([i915#658])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@feature_discovery@psr2.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-hsw:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#280])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_flush@basic-uc-rw-default:
    - shard-glk:          [PASS][7] -> [INCOMPLETE][8] ([i915#2369])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@gem_exec_flush@basic-uc-rw-default.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@gem_exec_flush@basic-uc-rw-default.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([fdo#109283])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-many-active@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2389]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@gem_exec_reloc@basic-many-active@rcs0.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2389])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][13] ([i915#2658])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-hsw:          NOTRUN -> [SKIP][14] ([fdo#109271]) +245 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#1317]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#110426] / [i915#1704])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109289]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109289])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#112306]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#112306])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110725] / [fdo#111614])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111614]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-iclb:         [PASS][23] -> [DMESG-WARN][24] ([i915#1226])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#110723])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][26] ([fdo#111615]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo:
    - shard-iclb:         NOTRUN -> [SKIP][27] ([fdo#109278]) +8 similar issues
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@kms_ccs@pipe-d-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][29] ([i915#1149] / [i915#315])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][30] ([i915#1149] / [i915#315]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][31] ([i915#1149])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][32] ([i915#1149])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-5:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][35] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-hsw:          NOTRUN -> [SKIP][37] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([fdo#111828])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][40] ([i915#1319])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#109300] / [fdo#111066])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][42] ([i915#1319])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x85-random:
    - shard-kbl:          [PASS][43] -> [FAIL][44] ([i915#54])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
    - shard-apl:          [PASS][45] -> [FAIL][46] ([i915#54])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109279]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109274] / [fdo#109278])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [FAIL][49] ([i915#2346])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-iclb:         [PASS][50] -> [INCOMPLETE][51] ([i915#1185] / [i915#1602])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb6/igt@kms_fbcon_fbt@fbc-suspend.html
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-apl:          [PASS][52] -> [INCOMPLETE][53] ([i915#1602] / [i915#2635])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-glk:          [PASS][54] -> [INCOMPLETE][55] ([i915#1602] / [i915#2635])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-tglb:         [PASS][56] -> [INCOMPLETE][57] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html
    - shard-kbl:          [PASS][58] -> [INCOMPLETE][59] ([i915#155] / [i915#1602] / [i915#636])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109274])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-tglb:         NOTRUN -> [FAIL][61] ([i915#2122])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109280]) +14 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271]) +30 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111825]) +36 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271]) +36 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#533])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#533])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#533])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][69] ([i915#265])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][70] ([i915#265])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][71] ([i915#265])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-kbl:          NOTRUN -> [SKIP][72] ([fdo#109271]) +36 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109441])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][74] -> [SKIP][75] ([fdo#109441]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109502])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@kms_vrr@flipline.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [i915#2530])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2530])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109291]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109291]) +2 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-iclb:         [INCOMPLETE][81] ([i915#2483]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [TIMEOUT][83] -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-iclb:         [FAIL][85] ([i915#2842]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-none-solo@rcs0}:
    - shard-glk:          [FAIL][87] ([i915#2842]) -> [PASS][88] +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * {igt@gem_exec_fair@basic-none@vecs0}:
    - shard-apl:          [FAIL][89] ([i915#2842]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html

  * {igt@gem_exec_fair@basic-pace@bcs0}:
    - shard-tglb:         [FAIL][91] ([i915#2842]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs0}:
    - shard-tglb:         [DMESG-WARN][93] ([i915#2803]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglb:         [INCOMPLETE][95] ([i915#750]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][97] ([fdo#109271]) -> [PASS][98] +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][99] ([fdo#109271]) -> [PASS][100] +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][101] ([i915#579]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [SKIP][103] ([i915#579]) -> [PASS][104] +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@i915_pm_rpm@system-suspend:
    - shard-kbl:          [SKIP][105] ([fdo#109271]) -> [PASS][106] +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl4/igt@i915_pm_rpm@system-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@i915_pm_rpm@system-suspend.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-glk:          [DMESG-FAIL][107] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][109] ([i915#72]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][111] ([i915#2055] / [i915#2295]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][113] ([i915#433]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [DMESG-WARN][115] ([i915#1602]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][117] ([i915#1602] / [i915#2635]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][119] ([i915#1602] / [i915#2635]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][121] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [INCOMPLETE][123] ([i915#155]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [SKIP][125] ([fdo#109441]) -> [PASS][126] +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb1/igt@kms_psr@psr2_suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_psr@psr2_suspend.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-kbl:          [FAIL][127] ([i915#1041] / [i915#65]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-snb:          [SKIP][129] ([fdo#109271]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-snb6/igt@kms_rotation_crc@sprite-rotation-180.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-snb5/igt@kms_rotation_crc@sprite-rotation-180.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][131] ([i915#2684]) -> [WARN][132] ([i915#1804] / [i915#2684])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][133] ([i915#2295]) -> ([FAIL][134], [FAIL][135]) ([i915#2295] / [i915#92])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][136], [FAIL][137]) ([i915#1814] / [i915#2295] / [i915#2724]) -> ([FAIL][138], [FAIL][139]) ([i915#2295] / [i915#2724])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb7/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@runner@aborted.html
    - shard-apl:          ([FAIL][140], [FAIL][141]) ([i915#1814] / [i915#2295]) -> ([FAIL][142], [FAIL][143]) ([i915#2295])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@runner@aborted.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl6/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl2/igt@runner@aborted.html
    - shard-glk:          ([FAIL][144], [FAIL][145]) ([i915#1814] / [i915#2295] / [k.org#202321]) -> ([FAIL][146], [FAIL][147], [FAIL][148]) ([i915#2295] / [i915#2722] / [k.org#202321])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk3/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk7/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@runner@aborted.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@runner@aborted.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][149], [FAIL][150], [FAIL][151], [FAIL][152]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][153], [FAIL][154]) ([i915#1602] / [i915#2295] / [i915#2667])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@runner@aborted.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@runner@aborted.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@runner@aborted.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/index.html

--===============6263053826755231203==
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
<tr><td><b>Series:</b></td><td>series starting with [i-g-t,1/2] tests/kms_rotation_crc: fix crc buffer overflow for slow platforms (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/85659/">https://patchwork.freedesktop.org/series/85659/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9573_full -&gt; IGTPW_5374_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5374_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1}:<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5374_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@gem_ctx_persistence@idempotent.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_ctx_sseu@engines.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-rw-default:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@gem_exec_flush@basic-uc-rw-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@gem_exec_flush@basic-uc-rw-default.html">INCOMPLETE</a> ([i915#2369])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> ([i915#2389]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@gem_exec_reloc@basic-wide-active@vcs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@gem_render_copy@y-tiled-to-vebox-linear.html">SKIP</a> ([fdo#109271]) +245 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html">SKIP</a> ([i915#1317]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html">SKIP</a> ([fdo#110426] / [i915#1704])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@gen7_exec_parse@basic-rejected.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@gen9_exec_parse@bb-secure.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#1226])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@kms_ccs@pipe-d-ccs-on-another-bo.html">SKIP</a> ([fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@kms_chamelium@hdmi-cmp-planar-formats.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_color@pipe-b-ctm-0-25.html">FAIL</a> ([i915#1149] / [i915#315]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_color@pipe-b-degamma.html">FAIL</a> ([i915#1149])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-5:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-5.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw6/igt@kms_color_chamelium@pipe-d-ctm-0-75.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@kms_color_chamelium@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_content_protection@srm.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x85-random:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html">FAIL</a> ([i915#54])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl2/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@kms_cursor_crc@pipe-a-cursor-256x85-random.html">FAIL</a> ([i915#54])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-random.html">SKIP</a> ([fdo#109279]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1185] / [i915#1602])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk6/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1602] / [i915#2635])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411] / [i915#456])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#1602] / [i915#636])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> ([fdo#111825]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html">SKIP</a> ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-x:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html">SKIP</a> ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@kms_vrr@flipline.html">SKIP</a> ([fdo#109502])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb6/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html">SKIP</a> ([fdo#109291]) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">INCOMPLETE</a> ([i915#2483]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb4/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-solo@rcs0}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none@vecs0}:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl8/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace@bcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0}:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG-WARN</a> ([i915#2803]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_exec_schedule@u-fairslice@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctx0.html">INCOMPLETE</a> ([i915#750]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb5/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> ([i915#579]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl4/igt@i915_pm_rpm@system-suspend.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@i915_pm_rpm@system-suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html">DMESG-FAIL</a> ([i915#118] / [i915#70] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk7/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">FAIL</a> ([i915#72]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">INCOMPLETE</a> ([i915#2055] / [i915#2295]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-hsw2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">DMESG-WARN</a> ([i915#1602] / [i915#2635]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb1/igt@kms_psr@psr2_suspend.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> ([i915#1041] / [i915#65]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl6/igt@kms_rotation_crc@multiplane-rotation.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-snb6/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-snb5/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#92])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2724]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-iclb5/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2724])</p>
</li>
<li>
<p>shard-apl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-apl2/igt@runner@aborted.html">FAIL</a>) ([i915#2295])</p>
</li>
<li>
<p>shard-glk:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk7/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [k.org#202321]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk9/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-glk4/igt@runner@aborted.html">FAIL</a>) ([i915#2295] / [i915#2722] / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5374/shard-tglb2/igt@runner@aborted.html">FAIL</a>) ([i915#1602] / [i915#2295] / [i915#2667])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it</p>

</body>
</html>

--===============6263053826755231203==--

--===============1989021675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1989021675==--
