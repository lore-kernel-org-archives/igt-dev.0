Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Sun, 10 Jan 2021 13:22:20 -0000
Message-ID: <161028494018.22035.1328788729455936886@emeril.freedesktop.org>
References: <20210110112153.476908-1-apoorva1.singh@intel.com>
In-Reply-To: <20210110112153.476908-1-apoorva1.singh@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9p?=
 =?utf-8?q?915=5Fhangman=3A_Added_test_description_for_test_case_=28rev2?=
 =?utf-8?q?=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0785806481=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0785806481==
Content-Type: multipart/alternative;
 boundary="===============2678548770379601250=="

--===============2678548770379601250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/i915_hangman: Added test description for test case (rev2)
URL   : https://patchwork.freedesktop.org/series/83160/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_9573_full -> IGTPW_5375_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5375_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5375_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5375_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@in-flight-suspend:
    - shard-apl:          [PASS][1] -> [CRASH][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@gem_eio@in-flight-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl1/igt@gem_eio@in-flight-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5}:
    - shard-iclb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5.html

  * {igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1}:
    - shard-iclb:         [SKIP][4] ([i915#2920]) -> [SKIP][5] +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_5375_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][6] -> [SKIP][7] ([i915#658])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@feature_discovery@psr2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-hsw:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#1099]) +3 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#280])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([fdo#109283])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb3/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([fdo#109283])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_reloc@basic-wide-active@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][12] ([i915#2389])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@vcs1.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][13] ([i915#2658])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-hsw:          NOTRUN -> [SKIP][14] ([fdo#109271]) +241 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-hsw2/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#1317]) +3 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@gem_userptr_blits@mmap-offset-invalidate-active@wc.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#110426] / [i915#1704])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([fdo#109289]) +2 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([fdo#109289])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb7/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([fdo#112306]) +2 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb5/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#112306])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][21] ([fdo#110725] / [fdo#111614])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#111614]) +2 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#110723])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([fdo#111615]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([fdo#109278]) +8 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@kms_ccs@pipe-d-ccs-on-another-bo.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_color@pipe-b-ctm-0-25:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#1149] / [i915#315])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html
    - shard-tglb:         NOTRUN -> [FAIL][28] ([i915#1149] / [i915#315]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_color@pipe-b-ctm-0-25.html

  * igt@kms_color@pipe-b-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][29] ([i915#1149])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_color@pipe-b-degamma.html
    - shard-iclb:         NOTRUN -> [FAIL][30] ([i915#1149])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_color@pipe-b-degamma.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-hsw:          NOTRUN -> [SKIP][34] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@srm:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#111828])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb3/igt@kms_content_protection@srm.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][38] ([i915#1319])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl6/igt@kms_content_protection@srm.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109300] / [fdo#111066])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_content_protection@srm.html
    - shard-apl:          NOTRUN -> [TIMEOUT][40] ([i915#1319])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-kbl:          [PASS][41] -> [INCOMPLETE][42] ([i915#155])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-apl:          [PASS][43] -> [DMESG-WARN][44] ([i915#1602] / [i915#2635])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-glk:          [PASS][45] -> [DMESG-WARN][46] ([i915#1602] / [i915#2635])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk9/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-iclb:         [PASS][47] -> [DMESG-WARN][48] ([i915#1602])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
    - shard-tglb:         [PASS][49] -> [INCOMPLETE][50] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109279])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [FAIL][52] ([i915#2346])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109274])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109280]) +13 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][55] ([fdo#109271]) +28 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([fdo#111825]) +30 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][57] ([fdo#109271]) +33 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][58] ([fdo#109271] / [i915#533])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [i915#533])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#533])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][61] ([i915#265])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][62] ([i915#265])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][63] ([i915#265])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-x:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271]) +33 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-x.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109441])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][66] -> [SKIP][67] ([fdo#109441]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
    - shard-tglb:         [PASS][68] -> [DMESG-WARN][69] ([i915#1436] / [i915#1602] / [i915#1887] / [i915#2411])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.html

  * igt@kms_vrr@flipline:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109502])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb7/igt@kms_vrr@flipline.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109278] / [i915#2530])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@perf@polling-parameterized:
    - shard-iclb:         [PASS][72] -> [FAIL][73] ([i915#1542])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb1/igt@perf@polling-parameterized.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109291]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice_check_flink_name.html

  * igt@prime_nv_test@nv_write_i915_gtt_mmap_read:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109291]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mmap_read.html

  * igt@prime_vgem@sync@vcs0:
    - shard-tglb:         [PASS][76] -> [INCOMPLETE][77] ([i915#409])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@prime_vgem@sync@vcs0.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@prime_vgem@sync@vcs0.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-iclb:         [INCOMPLETE][78] ([i915#2483]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@close-replace-race:
    - shard-kbl:          [TIMEOUT][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html

  * {igt@gem_exec_fair@basic-none-share@rcs0}:
    - shard-glk:          [FAIL][82] ([i915#2842]) -> [PASS][83] +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * {igt@gem_exec_fair@basic-pace-solo@rcs0}:
    - shard-tglb:         [FAIL][84] ([i915#2842]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * {igt@gem_exec_schedule@u-fairslice@vcs0}:
    - shard-tglb:         [DMESG-WARN][86] ([i915#2803]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb3/igt@gem_exec_schedule@u-fairslice@vcs0.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-tglb:         [INCOMPLETE][88] ([i915#750]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctx0.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@i915_pm_rpm@gem-execbuf-stress:
    - shard-glk:          [SKIP][90] ([fdo#109271]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-apl:          [SKIP][92] ([fdo#109271]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl7/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-tglb:         [SKIP][94] ([i915#579]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-kbl:          [SKIP][96] ([fdo#109271]) -> [PASS][97] +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl6/igt@i915_pm_rpm@gem-execbuf-stress.html
    - shard-iclb:         [SKIP][98] ([i915#579]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-glk:          [DMESG-FAIL][100] ([i915#118] / [i915#70] / [i915#95]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-glk:          [FAIL][102] ([i915#72]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-hsw:          [INCOMPLETE][104] ([i915#2055] / [i915#2295]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][106] ([i915#433]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:
    - shard-iclb:         [DMESG-WARN][108] ([i915#1602]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-apl:          [DMESG-WARN][110] ([i915#1602] / [i915#2635]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl1/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-glk:          [DMESG-WARN][112] ([i915#1602] / [i915#2635]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-tglb:         [INCOMPLETE][114] ([i915#1436] / [i915#1798] / [i915#1982] / [i915#456]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb8/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
    - shard-kbl:          [INCOMPLETE][116] ([i915#155]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl2/igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][118] ([fdo#109642] / [fdo#111068]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb5/igt@kms_psr2_su@frontbuffer.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][120] ([fdo#109441]) -> [PASS][121] +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-iclb3/igt@kms_psr@psr2_no_drrs.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  
#### Warnings ####

  * igt@kms_async_flips@test-time-stamp:
    - shard-tglb:         [FAIL][122] ([i915#2597]) -> [FAIL][123] ([i915#2574])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@kms_async_flips@test-time-stamp.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_async_flips@test-time-stamp.html

  * igt@runner@aborted:
    - shard-kbl:          [FAIL][124] ([i915#2295]) -> ([FAIL][125], [FAIL][126]) ([i915#2295] / [i915#2426])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-kbl3/igt@runner@aborted.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl1/igt@runner@aborted.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl4/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][127], [FAIL][128], [FAIL][129], [FAIL][130]) ([i915#1814] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803]) -> ([FAIL][131], [FAIL][132], [FAIL][133], [FAIL][134], [FAIL][135]) ([i915#1602] / [i915#1764] / [i915#2295] / [i915#2426] / [i915#2667] / [i915#2803] / [i915#409])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@runner@aborted.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb1/igt@runner@aborted.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@runner@aborted.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@runner@aborted.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@runner@aborted.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@runner@aborted.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb3/igt@runner@aborted.html

  
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
  [fdo#109502]: https://bugs.freedesktop.org/show_bug.cgi?id=109502
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110426]: https://bugs.freedesktop.org/show_bug.cgi?id=110426
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#111828]: https://bugs.freedesktop.org/show_bug.cgi?id=111828
  [fdo#112306]: https://bugs.freedesktop.org/show_bug.cgi?id=112306
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1317]: https://gitlab.freedesktop.org/drm/intel/issues/1317
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1436]: https://gitlab.freedesktop.org/drm/intel/issues/1436
  [i915#1542]: https://gitlab.freedesktop.org/drm/intel/issues/1542
  [i915#155]: https://gitlab.freedesktop.org/drm/intel/issues/155
  [i915#1602]: https://gitlab.freedesktop.org/drm/intel/issues/1602
  [i915#1610]: https://gitlab.freedesktop.org/drm/intel/issues/1610
  [i915#1704]: https://gitlab.freedesktop.org/drm/intel/issues/1704
  [i915#1764]: https://gitlab.freedesktop.org/drm/intel/issues/1764
  [i915#1798]: https://gitlab.freedesktop.org/drm/intel/issues/1798
  [i915#1814]: https://gitlab.freedesktop.org/drm/intel/issues/1814
  [i915#1887]: https://gitlab.freedesktop.org/drm/intel/issues/1887
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2055]: https://gitlab.freedes

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/index.html

--===============2678548770379601250==
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
<tr><td><b>Series:</b></td><td>i915/i915_hangman: Added test description fo=
r test case (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/83160/">https://patchwork.freedesktop.org/series/83160/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5375/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_9573_full -&gt; IGTPW_5375_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5375_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_5375_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5375=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_eio@in-flight-suspend:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-apl4/igt@gem_eio@in-flight-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl1/i=
gt@gem_eio@in-flight-suspend.html">CRASH</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-5}:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-5.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1}:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-1.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5375_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb3/ig=
t@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-hsw6/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@gem_ctx_sseu@engines.html">SKIP</a=
> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-tglb3/igt@gem_exec_params@no-blt.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-iclb3/igt@gem_exec_params@no-blt.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@gem_exec_reloc@basic-wide-active@v=
cs1.html">FAIL</a> ([i915#2389])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-hsw2/igt@gem_render_copy@y-tiled-to-vebox-li=
near.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +241 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@gem_userptr_blits@mmap-offset-inva=
lidate-active@wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1317">i915#1317</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D110426">fdo#110426</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1704">i915#1704</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb7/igt@gen7_exec_parse@basic-rejected.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
89">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb5/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112306">f=
do#112306</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
12306">fdo#112306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_big_fb@linear-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_big_fb@x-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_big_fb@yf-tiled-64bpp-rotate-1=
80.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb-size-ove=
rflow.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@kms_ccs@pipe-d-ccs-on-another-bo.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb5/igt@kms_chamelium@hdmi-cmp-planar-form=
ats.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-ctm-0-25:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-iclb7/igt@kms_color@pipe-b-ctm-0-25.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i91=
5#1149</a> / [i915#315])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_color@pipe-b-ctm-0-25.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i91=
5#1149</a> / [i915#315]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-degamma:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-tglb6/igt@kms_color@pipe-b-degamma.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915=
#1149</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-iclb6/igt@kms_color@pipe-b-degamma.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1149">i915=
#1149</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-glk7/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-kbl4/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-hsw4/igt@kms_color_chamelium@pipe-d-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-max=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_color_chamelium@pipe-d-gamma.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-tglb3/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111828">f=
do#111828</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-kbl6/igt@kms_content_protection@srm.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_content_protection@srm.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">f=
do#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-apl3/igt@kms_content_protection@srm.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319">=
i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/sh=
ard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/sh=
ard-apl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
 / [i915#2635])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-glk8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/sh=
ard-glk9/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
 / [i915#2635])</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/s=
hard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</=
a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/s=
hard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1798">i915#=
1798</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982"=
>i915#1982</a> / [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-onscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb5/igt@kms_flip@2x-dpms-vs-vblank-race-in=
terruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109274">fdo#109274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-1p-=
offscren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +28 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-apl4/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-apl8/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-glk4/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-kbl7/igt@kms_pipe_crc_basic@compare-crc-sanit=
ycheck-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5375/shard-kbl2/igt@kms_plane_alpha_blend@pipe-b-alpha-t=
ransparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-x:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-ti=
ling-x.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +33 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb3/igt@kms_psr@psr2_cursor_render.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">=
fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-i=
clb3/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb8/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5375/shard-tglb1/igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1887">i915#1887</a> / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb7/igt@kms_vrr@flipline.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109502">fdo#109502=
</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb2/igt@nouveau_crc@pipe-d-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb1/igt@perf@polling-parameterized.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-iclb=
3/igt@perf@polling-parameterized.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/1542">i915#1542</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@prime_nv_api@i915_nv_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_write_i915_gtt_mmap_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@prime_nv_test@nv_write_i915_gtt_mm=
ap_read.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109291">fdo#109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@sync@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb6/igt@prime_vgem@sync@vcs0.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@=
prime_vgem@sync@vcs0.html">INCOMPLETE</a> ([i915#409])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">I=
NCOMPLETE</a> ([i915#2483]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5375/shard-iclb8/igt@gem_ctx_isolation@preservation-s3@bcs=
0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-kbl6/igt@gem_ctx_persistence@close-replace-race.html">TI=
MEOUT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
375/shard-kbl3/igt@gem_ctx_persistence@close-replace-race.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-none-share@rcs0}:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5375/shard-glk5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</=
a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_fair@basic-pace-solo@rcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5375/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>{igt@gem_exec_schedule@u-fairslice@vcs0}:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb1/igt@gem_exec_schedule@u-fairslice@vcs0.html">DMESG=
-WARN</a> ([i915#2803]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5375/shard-tglb3/igt@gem_exec_schedule@u-fairslice@vcs0.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb5/igt@gem_ppgtt@blt-vs-render-ctx0.html">INCOMPLETE<=
/a> ([i915#750]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5375/shard-tglb6/igt@gem_ppgtt@blt-vs-render-ctx0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-glk1/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/=
shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-apl3/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/=
shard-apl7/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (=
[i915#579]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5375/shard-tglb3/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-kbl4/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/=
shard-kbl6/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a> +1 similar iss=
ue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-iclb6/igt@i915_pm_rpm@gem-execbuf-stress.html">SKIP</a> (=
[i915#579]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_5375/shard-iclb1/igt@i915_pm_rpm@gem-execbuf-stress.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-glk8/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.ht=
ml">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/118">i915#118</a> / [i915#70] / [i915#95]) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk8/igt@kms_cursor_edge_wal=
k@pipe-a-256x256-top-edge.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">FAIL</a> ([i915#72]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_5375/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-curs=
or-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a=
1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes">i915#2055</a> / =
[i915#2295]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5375/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([=
i915#433]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5375/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend-pipe-b-planes:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-iclb7/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1602">i915#1602</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5375/shard-iclb4/igt@kms_plane@plane-panning-bo=
ttom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-apl1/igt@kms_plane@plan=
e-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1602">i915#1602</a> / [i915#2635]) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-glk8/igt@kms_plane@plan=
e-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-tglb3/igt@kms_plane@plane-panning-bottom-right-suspend-pi=
pe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/1982">i915#1982</a> / [i915#456]) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb8/igt@k=
ms_plane@plane-panning-bottom-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-kbl3/igt@kms_plane@plane-panning-bottom-right-suspend-pip=
e-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/155">i915#155</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5375/shard-kbl2/igt@kms_plane@plane-panning-bottom=
-right-suspend-pipe-b-planes.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb5/igt@kms_psr2_su@frontbuffer.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_53=
75/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-iclb3/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb3/igt@kms_async_flips@test-time-stamp.html">FAIL</a>=
 ([i915#2597]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5375/shard-tglb6/igt@kms_async_flips@test-time-stamp.html">FAIL</a> ([i=
915#2574])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9573/shard-kbl3/igt@runner@aborted.html">FAIL</a> ([i915#2295]) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-kbl=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5375/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i9=
15#2295] / [i915#2426])</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9573/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_9573/shard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9573/shard-tglb6/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1814">i915#1814</a> / [i915#2295] / [i915#2426] / [i915#2667] / [i915#28=
03]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/=
shard-tglb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb2/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard=
-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_5375/shard-tglb1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5375/shard-tglb=
3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/1764">i915#1764</a> / [i915#2295] / [i915#2426]=
 / [i915#2667] / [i915#2803] / [i915#409])</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>

</body>
</html>

--===============2678548770379601250==--

--===============0785806481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0785806481==--
