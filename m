Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============1790869211824620773=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Sat, 23 Jul 2022 20:57:29 -0000
Message-ID: <165860984923.27984.11898937175723156175@emeril.freedesktop.org>
References: <20220723191255.2700675-1-lucas.demarchi@intel.com>
In-Reply-To: <20220723191255.2700675-1-lucas.demarchi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliOiBG?=
 =?utf-8?q?orce_rescan_when_module_is_loaded?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1790869211824620773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib: Force rescan when module is loaded
URL   : https://patchwork.freedesktop.org/series/106635/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6595_full -> IGTPW_7554_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7554_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7554_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.html

Participating hosts (9 -> 10)
------------------------------

  Additional (1): shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7554_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@api_intel_allocator@fork-simple-stress-signal.html

  
#### Warnings ####

  * igt@kms_vrr@flipline:
    - shard-kbl:          [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl4/igt@kms_vrr@flipline.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@kms_vrr@flipline.html

  
New tests
---------

  New tests have been introduced between IGT_6595_full and IGTPW_7554_full:

### New IGT tests (8) ###

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [0.59] s

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a1:
    - Statuses : 2 pass(s)
    - Exec time: [7.60, 7.82] s

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [7.73] s

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [7.61] s

  * igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [7.60] s

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:
    - Statuses : 2 pass(s)
    - Exec time: [7.74, 7.95] s

  * igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [0.60] s

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:
    - Statuses : 1 pass(s)
    - Exec time: [7.75] s

  

Known issues
------------

  Here are the changes found in IGTPW_7554_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@api_intel_bb@crc32.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#6230])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@api_intel_bb@crc32.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][7] -> [FAIL][8] ([i915#6268])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-kbl:          [PASS][9] -> [DMESG-WARN][10] ([i915#180]) +4 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [PASS][12] -> [FAIL][13] ([i915#5784]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb2/igt@gem_eio@reset-stress.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-kbl:          [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk5/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][20] -> [FAIL][21] ([i915#2849])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][22] ([fdo#109271] / [i915#2190])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl2/igt@gem_lmem_swapping@verify-random.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4613]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#4613]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk9/igt@gem_lmem_swapping@verify-random.html
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4613]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@gem_lmem_swapping@verify-random.html
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#4613]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl4/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#4270])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb2/igt@gem_pxp@create-regular-context-1.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4270])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb8/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#3323])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-snb:          NOTRUN -> [SKIP][31] ([fdo#109271]) +119 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-snb7/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109289])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109289])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#2527] / [i915#2856])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#2856])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@gen9_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          [PASS][36] -> [TIMEOUT][37] ([i915#4639])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl7/igt@gen9_exec_parse@bb-large.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl1/igt@gen9_exec_parse@bb-large.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][38] -> [DMESG-WARN][39] ([i915#5591])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb1/igt@i915_selftest@live@hangcheck.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#5903])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#5903])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#5286]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#5286]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111614]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +2 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3886]) +8 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#6095]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#6095]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3689]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@dp-frame-dump:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_chamelium@dp-frame-dump.html

  * igt@kms_color_chamelium@pipe-a-ctm-limited-range:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-25:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-glk:          NOTRUN -> [SKIP][54] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-0-25.html
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +6 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-snb6/igt@kms_color_chamelium@pipe-d-ctm-0-25.html

  * igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([i915#3359]) +11 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170.html

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#4462]) +15 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32.html

  * igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3359]) +15 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:
    - shard-glk:          NOTRUN -> [SKIP][61] ([fdo#109271]) +72 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk1/igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#4462]) +11 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109274])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@kms_display_modes@extended-mode-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#109274])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#5287]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#5287]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][67] -> [FAIL][68] ([i915#79])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-iclb:         [PASS][69] -> [DMESG-WARN][70] ([i915#2867]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb7/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb8/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:
    - shard-glk:          [PASS][71] -> [FAIL][72] ([i915#2122])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-glk3/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk8/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#2672]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3555])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#2672] / [i915#3555])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109285])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_force_connector_basic@force-load-detect.html
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109285])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#160])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109280]) +12 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109280] / [fdo#111825]) +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +245 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#1839])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([i915#1839])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][84] ([fdo#108145] / [i915#265])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([i915#5176]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb1/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#5176]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@primary_render:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +74 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl4/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-iclb:         [PASS][89] -> [SKIP][90] ([fdo#109441]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-tglb:         NOTRUN -> [FAIL][91] ([i915#132] / [i915#3467])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][92] ([i915#180])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-ts-continuation-idle:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109278]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_vblank@pipe-d-ts-continuation-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#2437])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([i915#2530])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][96] ([i915#2530])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@prime_nv_test@i915_import_gtt_mmap:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109291])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@prime_nv_test@i915_import_gtt_mmap.html
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109291])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb7/igt@prime_nv_test@i915_import_gtt_mmap.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#2994])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl2/igt@sysfs_clients@fair-1.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][100] ([i915#2582]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-2/igt@fbdev@unaligned-write.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][102] ([i915#6268]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hostile:
    - {shard-tglu}:       [FAIL][104] ([i915#2410]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglu-4/igt@gem_ctx_persistence@hostile.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglu-2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@many-contexts:
    - {shard-rkl}:        [FAIL][106] ([i915#2410]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-1/igt@gem_ctx_persistence@many-contexts.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][108] ([i915#4525]) -> [PASS][109] +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][110] ([i915#2842]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][112] ([i915#2842]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][114] ([i915#2842]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][116] ([i915#2842]) -> [PASS][117] +4 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-write-read-noreloc:
    - {shard-rkl}:        [SKIP][118] ([i915#3281]) -> [PASS][119] +10 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html

  * igt@gem_exec_whisper@basic-fds-priority:
    - {shard-rkl}:        [FAIL][120] -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@gem_exec_whisper@basic-fds-priority.html

  * igt@gem_readwrite@beyond-eob:
    - {shard-rkl}:        [SKIP][122] ([i915#3282]) -> [PASS][123] +4 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-1/igt@gem_readwrite@beyond-eob.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@gem_readwrite@beyond-eob.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [FAIL][124] ([i915#4171]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb2/igt@gem_softpin@evict-single-offset.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@gem_softpin@evict-single-offset.html

  * igt@gen9_exec_parse@bb-chained:
    - {shard-rkl}:        [SKIP][126] ([i915#2527]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_module_load@reload-no-display:
    - shard-snb:          [DMESG-WARN][128] ([i915#4528]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-snb2/igt@i915_module_load@reload-no-display.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-snb2/igt@i915_module_load@reload-no-display.html

  * igt@i915_pm_backlight@basic-brightness:
    - {shard-rkl}:        [SKIP][130] ([i915#3012]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@i915_pm_backlight@basic-brightness.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][132] ([i915#454]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb4/igt@i915_pm_dc@dc6-psr.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [SKIP][134] ([i915#4281]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-rkl}:        [SKIP][136] ([i915#1397]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          [FAIL][138] ([i915#1888]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-glk5/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk9/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:
    - {shard-rkl}:        [SKIP][140] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][141] +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:
    - {shard-rkl}:        [SKIP][142] ([i915#4098] / [i915#4369]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][144] ([i915#180] / [i915#1982] / [i915#4939]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-apl:          [DMESG-WARN][146] ([i915#180]) -> [PASS][147] +5 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-badstride:
    - {shard-rkl}:        [SKIP][148] ([i915#1849] / [i915#4098]) -> [PASS][149] +9 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-badstride.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-1:
    - shard-kbl:          [FAIL][150] ([i915#1188]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html

  * igt@kms_plane@plane-position-hole@pipe-b-planes:
    - {shard-rkl}:        [SKIP][152] ([i915#3558]) -> [PASS][153] +3 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - {shard-rkl}:        [SKIP][154] ([i915#1849] / [i915#3546] / [i915#4098]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][156] ([i915#5176]) -> [PASS][157] +2 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb6/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         [SKIP][158] ([fdo#109441]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [SKIP][160] ([i915#5519]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vblank@pipe-b-query-forked:
    - {shard-rkl}:        [SKIP][162] ([i915#1845] / [i915#4098]) -> [PASS][163] +20 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-4/igt@kms_vblank@pipe-b-query-forked.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html

  * igt@perf@gen12-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][164] ([fdo#109289]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - {shard-rkl}:        [SKIP][166] ([i915#2436]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][168] ([i915#1722]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-rkl-2/igt@perf@polling-small-buf.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-1/igt@perf@polling-small-buf.html

  
#### Warnings ####

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][170] ([i915#1063]) -> [SKIP][171] ([fdo#109300])
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-tglb1/igt@kms_content_protection@mei_interface.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][172] ([fdo#109300] / [fdo#111066]) -> [SKIP][173] ([fdo#109300])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb1/igt@kms_content_protection@mei_interface.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_content_protection@mei_interface.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][174] ([i915#658]) -> [SKIP][175] ([i915#2920])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][176] ([i915#2920]) -> [SKIP][177] ([fdo#111068] / [i915#658]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][178] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][179] ([i915#5939])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-iclb4/igt@kms_psr2_su@page_flip-p010.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][180], [FAIL][181], [FAIL][182], [FAIL][183], [FAIL][184], [FAIL][185], [FAIL][186], [FAIL][187], [FAIL][188]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][189], [FAIL][190], [FAIL][191]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl3/igt@runner@aborted.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@runner@aborted.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl2/igt@runner@aborted.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl4/igt@runner@aborted.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl8/igt@runner@aborted.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@runner@aborted.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@runner@aborted.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl2/igt@runner@aborted.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl1/igt@runner@aborted.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@runner@aborted.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl8/igt@runner@aborted.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][192], [FAIL][193]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl7/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl6/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl6/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#160]: https://gitlab.freedesktop.org/drm/intel/issues/160
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4639]: https://gitlab.freedesktop.org/drm/intel/issues/4639
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6251]: https://gitlab.freedesktop.org/drm/intel/issues/6251
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6595 -> IGTPW_7554

  CI-20190529: 20190529
  CI_DRM_11935: 2df3752997eeeba0843b7b1b9a27204a4e831355 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.html
  IGT_6595: a0e2b99ed37499c68504f837c2b351162e0e1f34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.html

--===============1790869211824620773==
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
<tr><td><b>Series:</b></td><td>lib: Force rescan when module is loaded</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/106635/">https://patchwork.freedesktop.org/series/106635/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7554/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6595_full -&gt; IGTPW_7554_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7554_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7554_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.=
html</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7554=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@api_intel_allocator@fork-simple-stress-signal:<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7554/shard-tglb1/igt@api_intel_allocator@fork-simple-stress-signal.html">I=
NCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_vrr@flipline:<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl4/igt@kms_vrr@flipline.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@k=
ms_vrr@flipline.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6595_full and IGTPW_7554_full=
:</p>
<h3>New IGT tests (8)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.60, 7.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [7.74, 7.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.60] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [7.75] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7554_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@api_intel_bb@crc32.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230<=
/a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb2/igt@api_intel_bb@crc32.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230<=
/a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tgl=
b3/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@vcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sh=
ard-kbl1/igt@gem_ctx_isolation@preservation-s3@vcs0.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-snb5/igt@gem_ctx_persistence@legacy-engines-=
mixed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglb2/igt@gem_eio@reset-stress.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@gem=
_eio@reset-stress.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5784">i915#5784</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-=
kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-glk5/=
igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-=
iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl8/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-apl2/igt@gem_lmem_swapping@verify-random.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gem_lmem_swapping@verify-random.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-glk9/igt@gem_lmem_swapping@verify-random.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb2/igt@gem_lmem_swapping@verify-random.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-kbl4/igt@gem_lmem_swapping@verify-random.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb2/igt@gem_pxp@create-regular-context-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb8/igt@gem_pxp@create-regular-context-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl2/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-snb7/igt@gen7_exec_parse@oacontrol-tracking.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) +119 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb5/igt@gen7_exec_parse@oacontrol-tracking.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb2/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-apl7/igt@gen9_exec_parse@bb-large.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl1/igt@g=
en9_exec_parse@bb-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/4639">i915#4639</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglb1/igt@i915_selftest@live@hangcheck.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-tglb1=
/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb3/igt@i915_suspend@basic-s3-without-i915.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5903">i915#5903</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_big_fb@4-tiled-max-hw-stride-64=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5286">i915#5286</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_chamelium@dp-frame-dump.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-limited-range:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl7/igt@kms_color_chamelium@pipe-a-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-25:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb1/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-glk2/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-25=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-snb6/igt@kms_color_chamelium@pipe-d-ctm-0-25.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-b-edp-1-512x170:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_cursor_crc@cursor-random@pipe-=
b-edp-1-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-=
c-edp-1-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4462">i915#4462</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random@pipe-c-edp-1-512x170:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_cursor_crc@cursor-random@pipe-=
c-edp-1-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3359">i915#3359</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-a-hdmi-a-1-512x512:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-glk1/igt@kms_cursor_crc@cursor-sliding@pipe-=
a-hdmi-a-1-512x512.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +72 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-c-edp-1-32x10:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_cursor_crc@cursor-sliding@pipe=
-c-edp-1-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4462">i915#4462</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb3/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_display_modes@extended-mode-bas=
ic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb210101=
0-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7554/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblan=
k-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb7/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-ic=
lb8/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2867">i915#2867</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-glk3/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sh=
ard-glk8/igt@kms_flip@plain-flip-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +6=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#=
3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb3/igt@kms_force_connector_basic@force-loa=
d-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109285">fdo#109285</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-pri-indfb-multidraw.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/160">i915#160</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb4/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +12 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +245 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb7/igt@kms_multipipe_modeset@basic-max-pip=
e-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1839">i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb1/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-5@pipe-d-e=
dp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb8/igt@kms_plane_scaling@plane-downscale-=
with-modifiers-factor-0-5@pipe-d-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl1/igt@kms_psr2_sf@cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-kbl4/igt@kms_psr@primary_render.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_gtt.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4=
/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-tglb5/igt@kms_psr@psr2_primary_blt.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915=
#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467"=
>i915#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@kms_vblank@pipe-c-ts-continuation-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-ts-continuation-idle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-iclb2/igt@kms_vblank@pipe-d-ts-continuation-=
idle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109278">fdo#109278</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl3/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb7/igt@nouveau_crc@pipe-c-source-outp-comp=
lete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb3/igt@nouveau_crc@pipe-c-source-outp-comp=
lete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_gtt_mmap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-tglb5/igt@prime_nv_test@i915_import_gtt_mmap.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7554/shard-iclb7/igt@prime_nv_test@i915_import_gtt_mmap.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7554/shard-apl2/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-2/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/=
igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sha=
rd-rkl-5/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglu-4/igt@gem_ctx_persistence@hostile.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard=
-tglu-2/igt@gem_ctx_persistence@hostile.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@many-contexts:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-1/igt@gem_ctx_persistence@many-contexts.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/=
shard-rkl-5/igt@gem_ctx_persistence@many-contexts.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525=
">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7554/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.htm=
l">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shar=
d-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554=
/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/=
shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shar=
d-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +4 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-write-read-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i91=
5#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7554/shard-rkl-5/igt@gem_exec_reloc@basic-write-read-noreloc.html">PASS</a=
> +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-5/igt@gem_exec_whisper@basic-fds-priority.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shar=
d-rkl-6/igt@gem_exec_whisper@basic-fds-priority.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-1/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rk=
l-5/igt@gem_readwrite@beyond-eob.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb2/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sh=
ard-iclb2/igt@gem_softpin@evict-single-offset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@gen9_exec_parse@bb-chained.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-r=
kl-5/igt@gen9_exec_parse@bb-chained.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-no-display:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-snb2/igt@i915_module_load@reload-no-display.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4528">i91=
5#4528</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7554/shard-snb2/igt@i915_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@i915_pm_backlight@basic-brightness.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#301=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554=
/shard-rkl-6/igt@i915_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb6/igt@i=
915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb4/ig=
t@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-1/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/s=
hard-rkl-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-glk5/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/s=
hard-glk9/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-5/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-ytile=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_draw_crc@draw-method-x=
rgb2101010-pwrite-ytiled.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-untiled.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb8888-pwri=
te-untiled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#198=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i9=
15#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7554/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-apl6/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/=
shard-apl8/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> +5 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-badstride:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-badstride.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i915=
#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098=
">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7554/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-badstride.html">PAS=
S</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl6/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shar=
d-kbl4/igt@kms_hdr@bpc-switch@pipe-a-dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-b-planes:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@kms_plane@plane-position-hole@pipe-b-planes.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3558"=
>i915#3558</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7554/shard-rkl-6/igt@kms_plane@plane-position-hole@pipe-b-planes.html"=
>PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1849">i9=
15#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/35=
46">i915#3546</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7554/shard-rkl-6/igt@kms_plane_alpha_blend@pipe-b-alpha-basic=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5@pipe-=
a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb2/igt@kms_plane_scaling@plane-downscale-with-pixel-form=
at-factor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-iclb6/igt@kms_plane_scaling=
@plane-downscale-with-pixel-format-factor-0-5@pipe-a-edp-1.html">PASS</a> +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sha=
rd-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7554/shard-iclb8/igt@kms_psr_stress_test@invalidate-primary-fl=
ip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-query-forked:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-4/igt@kms_vblank@pipe-b-query-forked.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4=
098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_75=
54/shard-rkl-6/igt@kms_vblank@pipe-b-query-forked.html">PASS</a> +20 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-5/igt@perf@gen12-unprivileged-single-ctx-counters.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7554/shard-rkl-6/igt@perf@gen12-unprivileged-single-ctx-counters.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2436">=
i915#2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7554/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-rkl-2/igt@perf@polling-small-buf.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-rkl-1=
/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6595/shard-tglb1/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i915#10=
63</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_755=
4/shard-tglb1/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300</a=
>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGT_6595/shard-iclb1/igt@kms_content_protection@mei_interface.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#10=
9300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111066=
">fdo#111066</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7554/shard-iclb3/igt@kms_content_protection@mei_interface.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo=
#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">=
i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7554/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i=
915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7554/shard-iclb4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-iclb4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7554/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/s=
hard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6595/shard-apl4/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl8/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6595/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl6/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6595/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-apl1/igt@runner@aborted.ht=
ml">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/sh=
ard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7554/shard-apl3/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6595/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6595/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/30=
02">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7554/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@=
aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7554/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/shard-kbl1/igt@runner@aborted=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6595 -&gt; IGTPW_7554</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11935: 2df3752997eeeba0843b7b1b9a27204a4e831355 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7554: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7554/index.htm=
l<br />
  IGT_6595: a0e2b99ed37499c68504f837c2b351162e0e1f34 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============1790869211824620773==--
