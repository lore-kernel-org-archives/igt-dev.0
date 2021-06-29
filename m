Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 29 Jun 2021 07:56:26 -0000
Message-ID: <162495338683.9054.5300648537649084901@emeril.freedesktop.org>
References: <20210618104927.20061-1-venkata.sai.patnana@intel.com>
In-Reply-To: <20210618104927.20061-1-venkata.sai.patnana@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcdclk_=3A_Add_test_to_validate_cdclk_crawling?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1919239292=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1919239292==
Content-Type: multipart/alternative;
 boundary="===============4318957585333302976=="

--===============4318957585333302976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_cdclk : Add test to validate cdclk crawling
URL   : https://patchwork.freedesktop.org/series/91671/
State : success

== Summary ==

CI Bug Log - changes from IGT_6113_full -> IGTPW_5938_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5938_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_cdclk@basic} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_cdclk@basic.html

  * {igt@kms_cdclk@plane-scaling} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb6/igt@kms_cdclk@plane-scaling.html

  
New tests
---------

  New tests have been introduced between IGT_6113_full and IGTPW_5938_full:

### New IGT tests (3) ###

  * igt@kms_cdclk@basic:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cdclk@mode-transition:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_cdclk@plane-scaling:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_5938_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][4] ([i915#3002])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][6] -> [FAIL][7] ([i915#2842])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-apl:          [PASS][8] -> [SKIP][9] ([fdo#109271])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][10] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][11] ([i915#2842])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][14] -> [FAIL][15] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +2 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-wide-active@rcs0:
    - shard-snb:          NOTRUN -> [FAIL][18] ([i915#3633]) +2 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][19] -> [SKIP][20] ([i915#2190])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@gem_huc_copy@huc-copy.html
    - shard-apl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#2190])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-snb:          NOTRUN -> [WARN][22] ([i915#2658])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb7/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#768]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][24] ([fdo#109271] / [i915#3323])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#3323])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#3323])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#3323])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][28] ([i915#3323])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#3297]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109289])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([fdo#112306])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@gen9_exec_parse@bb-chained.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][32] -> [DMESG-WARN][33] ([i915#3389])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#1937])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_suspend@sysfs-reader:
    - shard-apl:          [PASS][36] -> [DMESG-WARN][37] ([i915#180]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl6/igt@i915_suspend@sysfs-reader.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl2/igt@i915_suspend@sysfs-reader.html
    - shard-kbl:          [PASS][38] -> [INCOMPLETE][39] ([i915#155])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl4/igt@i915_suspend@sysfs-reader.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl4/igt@i915_suspend@sysfs-reader.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          NOTRUN -> [DMESG-WARN][42] ([i915#118] / [i915#95])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][43] -> [DMESG-WARN][44] ([i915#118] / [i915#95]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#2705])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_big_joiner@2x-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#2705])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@hdmi-audio:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_chamelium@hdmi-audio.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][49] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [fdo#111827]) +31 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl1/igt@kms_chamelium@vga-hpd.html

  * igt@kms_color@pipe-a-degamma:
    - shard-glk:          [PASS][51] -> [FAIL][52] ([fdo#108145] / [i915#71])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_color@pipe-a-degamma.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@kms_color@pipe-a-degamma.html
    - shard-apl:          NOTRUN -> [FAIL][53] ([fdo#108145] / [i915#71])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_color@pipe-a-degamma.html
    - shard-kbl:          [PASS][54] -> [FAIL][55] ([fdo#108145] / [i915#71])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@kms_color@pipe-a-degamma.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@kms_color@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:
    - shard-snb:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +23 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html
    - shard-kbl:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][58] ([i915#1319])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl7/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#109278]) +14 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#3359]) +2 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109279] / [i915#3359]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([fdo#109278] / [fdo#109279])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3319]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][64] ([fdo#109271]) +387 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109274] / [fdo#109278])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][66] -> [INCOMPLETE][67] ([i915#180] / [i915#1982])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111825]) +16 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#2672]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109280]) +13 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:
    - shard-glk:          NOTRUN -> [SKIP][72] ([fdo#109271]) +75 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271]) +44 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_invalid_dotclock:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#110577])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb2/igt@kms_invalid_dotclock.html
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109310])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@kms_invalid_dotclock.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][76] ([fdo#108145] / [i915#265]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-glk:          NOTRUN -> [FAIL][77] ([fdo#108145] / [i915#265])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][78] ([fdo#108145] / [i915#265])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#3536])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#111615]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#658]) +6 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-2:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#2920]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html

  * igt@kms_psr2_su@page_flip:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#658]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk3/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         [PASS][84] -> [SKIP][85] ([fdo#109441]) +3 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_sprite_plane_onoff:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109441])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#533]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2437]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@kms_writeback@writeback-check-output.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2530])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271]) +270 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278] / [i915#2530])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@nv_self_import:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109291])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@prime_nv_api@nv_self_import.html

  * igt@prime_vgem@coherency-blt:
    - shard-glk:          [PASS][93] -> [INCOMPLETE][94] ([i915#2944])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk5/igt@prime_vgem@coherency-blt.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk6/igt@prime_vgem@coherency-blt.html

  * igt@prime_vgem@coherency-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109292])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@prime_vgem@coherency-gtt.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#2994]) +5 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@sysfs_clients@fair-1.html

  
#### Possible fixes ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         [SKIP][97] ([i915#658]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb8/igt@feature_discovery@psr2.html
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_create@create-clear:
    - shard-glk:          [FAIL][99] ([i915#1888] / [i915#3160]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk7/igt@gem_create@create-clear.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@gem_create@create-clear.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          [DMESG-WARN][101] ([i915#180]) -> [PASS][102] +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][103] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][105] ([i915#2842]) -> [PASS][106] +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         [FAIL][107] ([i915#2842]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_mmap_gtt@big-copy:
    - shard-glk:          [FAIL][109] ([i915#307]) -> [PASS][110] +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk6/igt@gem_mmap_gtt@big-copy.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk9/igt@gem_mmap_gtt@big-copy.html

  * igt@gem_mmap_gtt@cpuset-big-copy-odd:
    - shard-iclb:         [FAIL][111] ([i915#307]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html

  * igt@i915_selftest@perf@request:
    - shard-iclb:         [DMESG-WARN][113] ([i915#2867]) -> [PASS][114] +3 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@i915_selftest@perf@request.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@i915_selftest@perf@request.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-iclb:         [DMESG-WARN][115] ([i915#3621]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-random-ccs-data:
    - shard-iclb:         [DMESG-WARN][117] ([i915#3219]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_ccs@pipe-a-random-ccs-data.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x128-random:
    - shard-kbl:          [FAIL][119] ([i915#3444]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html

  * igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:
    - shard-tglb:         [INCOMPLETE][121] ([i915#3673]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb6/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
    - shard-iclb:         [SKIP][123] ([i915#668]) -> [PASS][124] +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [SKIP][125] ([i915#433]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:
    - shard-glk:          [FAIL][127] ([i915#2472]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html

  * igt@kms_psr2_su@frontbuffer:
    - shard-iclb:         [SKIP][129] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb4/igt@kms_psr2_su@frontbuffer.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr2_su@frontbuffer.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][131] ([fdo#109441]) -> [PASS][132] +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-kbl:          [INCOMPLETE][133] ([i915#155] / [i915#2828]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][135] ([i915#2851]) -> [FAIL][136] ([i915#2842])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:
    - shard-iclb:         [SKIP][137] ([i915#658]) -> [SKIP][138] ([i915#2920])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][139] ([i915#2920]) -> [SKIP][140] ([i915#658]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][141], [FAIL][142]) ([i915#2505] / [i915#3002] / [i915#3363]) -> ([FAIL][143], [FAIL][144]) ([i915#3002] / [i915#3363])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl6/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl3/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][145], [FAIL][146], [FAIL][147]) ([i915#1814] / [i915#3002]) -> ([FAIL][148], [FAIL][149]) ([i915#3002])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb8/igt@runner@aborted.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@runner@aborted.ht

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/index.html

--===============4318957585333302976==
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
<tr><td><b>Series:</b></td><td>tests/kms_cdclk : Add test to validate cdclk crawling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/91671/">https://patchwork.freedesktop.org/series/91671/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6113_full -&gt; IGTPW_5938_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5938_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_cdclk@basic} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_cdclk@basic.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_cdclk@plane-scaling} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb6/igt@kms_cdclk@plane-scaling.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6113_full and IGTPW_5938_full:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@kms_cdclk@basic:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5938_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl2/igt@gem_exec_fair@basic-none-share@rcs0.html">SKIP</a> ([fdo#109271])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@rcs0:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html">FAIL</a> ([i915#3633]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([i915#2190])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb7/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([i915#3323])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb4/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb7/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@gen9_exec_parse@bb-chained.html">SKIP</a> ([fdo#112306])</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> ([i915#3389])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@sysfs-reader:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl6/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl2/igt@i915_suspend@sysfs-reader.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl4/igt@i915_suspend@sysfs-reader.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl4/igt@i915_suspend@sysfs-reader.html">INCOMPLETE</a> ([i915#155])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb5/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk7/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@kms_big_joiner@2x-modeset.html">SKIP</a> ([i915#2705])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_chamelium@dp-crc-multiple.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-audio:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_chamelium@hdmi-audio.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@kms_chamelium@hdmi-crc-single.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-degamma:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_color@pipe-a-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@kms_color@pipe-a-degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@kms_color@pipe-a-degamma.html">FAIL</a> ([fdo#108145] / [i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl6/igt@kms_color_chamelium@pipe-invalid-ctm-matrix-sizes.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl7/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_cursor_crc@pipe-a-cursor-max-size-sliding.html">SKIP</a> ([fdo#109278]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-onscreen.html">SKIP</a> ([i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-32x32-onscreen.html">SKIP</a> ([i915#3319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +387 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl7/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> ([fdo#111825]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> ([fdo#109280]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109271]) +75 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +44 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_dotclock:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb2/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#110577])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@kms_invalid_dotclock.html">SKIP</a> ([fdo#109310])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html">FAIL</a> ([fdo#108145] / [i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb7/igt@kms_plane_multiple@atomic-pipe-b-tiling-yf.html">SKIP</a> ([fdo#111615]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk3/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html">SKIP</a> ([fdo#109441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_onoff:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@kms_psr@psr2_sprite_plane_onoff.html">SKIP</a> ([fdo#109441])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl6/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</a> ([i915#2530])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html">SKIP</a> ([fdo#109271]) +270 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-detection.html">SKIP</a> ([fdo#109278] / [i915#2530])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@prime_nv_api@nv_self_import.html">SKIP</a> ([fdo#109291])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk5/igt@prime_vgem@coherency-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk6/igt@prime_vgem@coherency-blt.html">INCOMPLETE</a> ([i915#2944])</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@coherency-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@prime_vgem@coherency-gtt.html">SKIP</a> ([fdo#109292])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl8/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +5 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_create@create-clear:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk7/igt@gem_create@create-clear.html">FAIL</a> ([i915#1888] / [i915#3160]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk2/igt@gem_create@create-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-apl3/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb6/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb6/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk6/igt@gem_mmap_gtt@big-copy.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk9/igt@gem_mmap_gtt@big-copy.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb3/igt@gem_mmap_gtt@cpuset-big-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@request:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@i915_selftest@perf@request.html">DMESG-WARN</a> ([i915#2867]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb5/igt@i915_selftest@perf@request.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">DMESG-WARN</a> ([i915#3621]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_ccs@pipe-a-random-ccs-data.html">DMESG-WARN</a> ([i915#3219]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x128-random:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">FAIL</a> ([i915#3444]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@kms_cursor_crc@pipe-c-cursor-128x128-random.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank@c-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb6/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html">INCOMPLETE</a> ([i915#3673]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb3/igt@kms_flip@blocking-absolute-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">SKIP</a> ([i915#668]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> ([i915#433]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-planes:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-glk9/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">FAIL</a> ([i915#2472]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-glk3/igt@kms_plane@plane-position-hole-dpms@pipe-b-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb4/igt@kms_psr2_su@frontbuffer.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr2_su@frontbuffer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb5/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#2828]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2851]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-iclb8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#2505] / [i915#3002] / [i915#3363]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5938/shard-kbl7/igt@runner@aborted.html">FAIL</a>) ([i915#3002] / [i915#3363])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6113/shard-iclb2/igt@runner@aborted.ht">FAIL</a>, [FAIL][147]) ([i915#1814] / [i915#3002]) -&gt; ([FAIL][148], [FAIL][149]) ([i915#3002])</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4318957585333302976==--

--===============1919239292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1919239292==--
