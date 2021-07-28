Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 28 Jul 2021 05:54:17 -0000
Message-ID: <162745165732.22807.6065307095592032831@emeril.freedesktop.org>
References: <20210723093844.22352-1-vidya.srinivas@intel.com>
In-Reply-To: <20210723093844.22352-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Fix_hw_stride_length_tests_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1354331771=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1354331771==
Content-Type: multipart/alternative;
 boundary="===============2666364760359971483=="

--===============2666364760359971483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Fix hw stride length tests (rev3)
URL   : https://patchwork.freedesktop.org/series/92936/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10405_full -> IGTPW_6067_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6067_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6067_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6067_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_selftest@all@damage_iter_no_damage:
    - shard-apl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@kms_selftest@all@damage_iter_no_damage.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10405_full and IGTPW_6067_full:

### New IGT tests (1) ###

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  

Known issues
------------

  Here are the changes found in IGTPW_6067_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][2] ([fdo#111827])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][4] -> [SKIP][5] ([i915#658])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@feature_discovery@psr2.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099]) +6 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#280])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][8] -> [FAIL][9] ([i915#2842])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][12] -> [FAIL][13] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([fdo#109283])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([fdo#109283])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-iclb:         [PASS][16] -> [INCOMPLETE][17] ([i915#1895])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#2190])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][19] ([i915#2658])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][20] ([i915#3297])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> [FAIL][21] ([i915#2724])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([fdo#109289])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([fdo#109289]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][24] ([fdo#109271]) +296 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#2856])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          NOTRUN -> [FAIL][27] ([i915#3343])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl2/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> [SKIP][28] ([fdo#109289] / [fdo#111719])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-kbl:          NOTRUN -> [FAIL][29] ([i915#579])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@i915_pm_rpm@basic-rte.html
    - shard-tglb:         NOTRUN -> [FAIL][30] ([i915#579])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#579]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#579])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][33] -> [DMESG-WARN][34] ([i915#180]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][35] ([i915#118] / [i915#95])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][36] -> [DMESG-WARN][37] ([i915#118] / [i915#95])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-iclb:         [PASS][38] -> [DMESG-WARN][39] ([i915#3621])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#3777]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [i915#3777])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#3777])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#111615])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#110723])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109278]) +12 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([i915#3689]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][49] -> [FAIL][50] ([i915#1149])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@kms_color@pipe-a-gamma.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color@pipe-a-gamma.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][51] -> [FAIL][52] ([i915#71])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-glk:          [PASS][53] -> [FAIL][54] ([i915#71])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk4/igt@kms_color@pipe-b-legacy-gamma.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][55] -> [FAIL][56] ([i915#71])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl1/igt@kms_color@pipe-b-legacy-gamma.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][57] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-glk:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-negative.html
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][62] ([i915#1319])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][63] ([i915#2105])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#109279] / [i915#3359]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([fdo#109278] / [fdo#109279])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3359])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][68] ([fdo#109271]) +388 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][70] -> [INCOMPLETE][71] ([i915#155] / [i915#180] / [i915#636])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111825]) +15 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109280]) +9 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271]) +36 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-kbl:          NOTRUN -> [SKIP][76] ([fdo#109271]) +49 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-iclb:         [PASS][77] -> [INCOMPLETE][78] ([i915#1185] / [i915#1373] / [i915#2828])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#533])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#533])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#533]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][82] ([fdo#108145] / [i915#265]) +3 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][83] ([i915#265])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#112054])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#658]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-1:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([i915#2920])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#658])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#658])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2920])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-tglb:         NOTRUN -> [FAIL][90] ([i915#132] / [i915#3467])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([fdo#109441]) +2 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@kms_psr@psr2_cursor_render.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#2437])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#2530])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@nouveau_crc@pipe-a-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#2530])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@nouveau_crc@pipe-a-source-outp-complete.html

  * igt@perf_pmu@rc6-suspend:
    - shard-kbl:          [PASS][96] -> [DMESG-WARN][97] ([i915#180])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@perf_pmu@rc6-suspend.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@perf_pmu@rc6-suspend.html

  * igt@prime_nv_api@nv_self_import_to_different_fd:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109291])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@prime_nv_api@nv_self_import_to_different_fd.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109291])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@prime_nv_api@nv_self_import_to_different_fd.html

  * igt@sysfs_clients@create:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#2994]) +3 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@sysfs_clients@create.html

  * igt@sysfs_clients@pidname:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#2994])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@sysfs_clients@pidname.html
    - shard-glk:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#2994])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk4/igt@sysfs_clients@pidname.html
    - shard-tglb:         NOTRUN -> [SKIP][103] ([i915#2994])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@sysfs_clients@pidname.html
    - shard-kbl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#2994])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@sysfs_clients@pidname.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [TIMEOUT][105] ([i915#2369] / [i915#2481] / [i915#3070]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb4/igt@gem_eio@unwedge-stress.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [FAIL][107] ([i915#2846]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [FAIL][109] ([i915#2842]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][111] ([i915#2842]) -> [PASS][112] +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][113] ([i915#2842]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_mmap_gtt@cpuset-medium-copy:
    - shard-iclb:         [FAIL][115] ([i915#2428]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-odd:
    - shard-iclb:         [FAIL][117] ([i915#307]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         [WARN][119] ([i915#2681]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         [WARN][121] ([i915#1804] / [i915#2684]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-apl:          [DMESG-WARN][123] ([i915#180]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_psr2_su@page_flip:
    - shard-iclb:         [SKIP][125] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_psr2_su@page_flip.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_su@page_flip.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][127] ([fdo#109441]) -> [PASS][128] +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-iclb:         [WARN][129] ([i915#1804] / [i915#2684]) -> [WARN][130] ([i915#2684])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][131] ([i915#2920]) -> [SKIP][132] ([i915#658]) +2 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:
    - shard-iclb:         [SKIP][133] ([i915#658]) -> [SKIP][134] ([i915#2920])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][135], [FAIL][136]) ([i915#2426] / [i915#3002] / [i915#3363]) -> ([FAIL][137], [FAIL][138], [FAIL][139], [FAIL][140]) ([i915#180] / [i915#2292] / [i915#2426] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#92])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl4/igt@runner@aborted.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl4/igt@runner@aborted.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@runner@aborted.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@runner@aborted.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@runner@aborted.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@runner@aborted.html
    - shard-iclb:         ([FAIL][141], [FAIL][142]) ([i915#2426] / [i915#3002] / [i915#3690]) -> ([FAIL][143], [FAIL][144], [FAIL][145]) ([i915#1814] / [i915#2426] / [i915#3002] / [i915#3690])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@runner@aborted.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@runner@aborted.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@runner@aborted.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@runner@aborted.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@runner@aborted.html
    - shard-apl:          ([FAIL][146], [FAIL][147], [FAIL][148]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -> ([FAIL][149], [FAIL][150], [FAIL][15

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html

--===============2666364760359971483==
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
<tr><td><b>Series:</b></td><td>tests/kms_big_fb: Fix hw stride length tests (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92936/">https://patchwork.freedesktop.org/series/92936/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10405_full -&gt; IGTPW_6067_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6067_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6067_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6067_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_selftest@all@damage_iter_no_damage:<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@kms_selftest@all@damage_iter_no_damage.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10405_full and IGTPW_6067_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6067_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_exec_whisper@basic-fds-forked.html">INCOMPLETE</a> ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@gem_pwrite@basic-exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@gem_userptr_blits@access-control.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +296 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@fences.html">SKIP</a> ([i915#579]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#3621])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#111615])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@kms_color@pipe-a-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color@pipe-a-gamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk4/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl1/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_content_protection@legacy.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html">SKIP</a> ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +388 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#111825]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109271]) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> ([i915#1185] / [i915#1373] / [i915#2828])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-c-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@kms_plane_multiple@atomic-pipe-c-tiling-yf.html">SKIP</a> ([fdo#112054])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([fdo#109271] / [i915#658]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([i915#2920])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-1.html">SKIP</a> ([i915#2920])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_psr@psr2_cursor_plane_move.html">FAIL</a> ([i915#132] / [i915#3467])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@nouveau_crc@pipe-a-source-outp-complete.html">SKIP</a> ([i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_self_import_to_different_fd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@prime_nv_api@nv_self_import_to_different_fd.html">SKIP</a> ([fdo#109291])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@prime_nv_api@nv_self_import_to_different_fd.html">SKIP</a> ([fdo#109291])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@sysfs_clients@create.html">SKIP</a> ([fdo#109271] / [i915#2994]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@pidname:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@sysfs_clients@pidname.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk4/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@sysfs_clients@pidname.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@sysfs_clients@pidname.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb4/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#2481] / [i915#3070]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl4/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@gem_mmap_gtt@cpuset-medium-copy.html">FAIL</a> ([i915#2428]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_mmap_gtt@cpuset-medium-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-odd:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb4/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">FAIL</a> ([i915#307]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@gem_mmap_gtt@cpuset-medium-copy-odd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_psr2_su@page_flip.html">SKIP</a> ([fdo#109642] / [fdo#111068] / [i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_su@page_flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@kms_psr@psr2_primary_page_flip.html">SKIP</a> ([fdo#109441]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#2920]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> ([i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html">SKIP</a> ([i915#658]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-2.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl4/igt@runner@aborted.html">FAIL</a>) ([i915#2426] / [i915#3002] / [i915#3363]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@runner@aborted.html">FAIL</a>) ([i915#180] / [i915#2292] / [i915#2426] / [i915#2505] / [i915#3002] / [i915#3363] / [i915#92])</p>
</li>
<li>
<p>shard-iclb:         (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#2426] / [i915#3002] / [i915#3690]) -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@runner@aborted.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@runner@aborted.html">FAIL</a>) ([i915#1814] / [i915#2426] / [i915#3002] / [i915#3690])</p>
</li>
<li>
<p>shard-apl:          ([FAIL][146], [FAIL][147], [FAIL][148]) ([fdo#109271] / [i915#180] / [i915#1814] / [i915#3002] / [i915#3363]) -&gt; ([FAIL][149], [FAIL][150], [FAIL][15</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============2666364760359971483==--

--===============1354331771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1354331771==--
