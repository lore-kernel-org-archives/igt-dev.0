Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0781222880923002168=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Date: Wed, 09 Nov 2022 03:51:43 -0000
Message-ID: <166796590313.3410.3067269704120727513@emeril.freedesktop.org>
References: <20221108190603.2174441-1-ashutosh.dixit@intel.com>
In-Reply-To: <20221108190603.2174441-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?perf=5Fpmu=3A_Compare_against_requested_freq_in_frequency_subte?=
 =?utf-8?b?c3QgKHJldjIp?=
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

--===============0781222880923002168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/perf_pmu: Compare against requested freq in frequency subtest (rev2)
URL   : https://patchwork.freedesktop.org/series/110574/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12356_full -> IGTPW_8069_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/index.html

Participating hosts (11 -> 8)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8069_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@perf_pmu@busy-check-all@vcs1:
    - {shard-dg1}:        NOTRUN -> [FAIL][1] +3 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-dg1-12/igt@perf_pmu@busy-check-all@vcs1.html

  
Known issues
------------

  Here are the changes found in IGTPW_8069_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][2] ([i915#1839])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@feature_discovery@display-4x.html
    - shard-tglb:         NOTRUN -> [SKIP][3] ([i915#1839])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-apl:          NOTRUN -> [DMESG-WARN][4] ([i915#4991])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@hang:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099]) +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-snb5/igt@gem_ctx_persistence@hang.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#280])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2842])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][9] ([i915#2842])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#2190])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl1/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-apl:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#4613]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl1/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][12] ([i915#4613])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@gem_lmem_swapping@verify.html
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#4613])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@gem_lmem_swapping@verify.html
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk6/igt@gem_lmem_swapping@verify.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4270])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#4270])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#768])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs.html

  * igt@gem_softpin@evict-single-offset:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#4171])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb2/igt@gem_softpin@evict-single-offset.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb5/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([fdo#109290])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][21] ([fdo#110542])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#3297])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#3297])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#2527] / [i915#2856]) +2 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-apl:          NOTRUN -> [FAIL][26] ([i915#7036])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][27] -> [SKIP][28] ([i915#4281])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html
    - shard-apl:          [PASS][29] -> [SKIP][30] ([fdo#109271])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl7/igt@i915_pm_dc@dc9-dpms.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl1/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-tglb:         NOTRUN -> [WARN][31] ([i915#2681]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#111644] / [i915#1397] / [i915#2411])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#110892])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4387])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4387])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][36] -> [DMESG-WARN][37] ([i915#5591])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-tglb8/igt@i915_selftest@live@hangcheck.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb3/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#5286])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][39] ([i915#5286])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([fdo#111614]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [PASS][42] -> [FAIL][43] ([i915#3743])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([fdo#111615]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#110723])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109278]) +8 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3689] / [i915#6095])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([fdo#111615] / [i915#3689]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#6095]) +2 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][51] ([fdo#109271] / [i915#3886]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3689] / [i915#3886])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#109278] / [i915#3886]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#3689]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-glk:          NOTRUN -> [SKIP][56] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk5/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_color_chamelium@ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109284] / [fdo#111827])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_color_chamelium@ctm-0-75.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109284] / [fdo#111827])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_color_chamelium@ctm-0-75.html

  * igt@kms_color_chamelium@ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][59] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-snb6/igt@kms_color_chamelium@ctm-red-to-blue.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][60] ([i915#7121] / [i915#7173])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl6/igt@kms_content_protection@atomic-dpms@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-edp-1:
    - shard-iclb:         [PASS][61] -> [DMESG-WARN][62] ([i915#402])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb5/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-edp-1.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([fdo#109274] / [fdo#111825])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-tglb:         NOTRUN -> [FAIL][64] ([i915#4767])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_fbcon_fbt@fbc.html
    - shard-glk:          NOTRUN -> [FAIL][65] ([i915#4767])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk3/igt@kms_fbcon_fbt@fbc.html
    - shard-iclb:         NOTRUN -> [FAIL][66] ([i915#4767])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          NOTRUN -> [FAIL][67] ([i915#4767]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109274] / [fdo#111825] / [i915#3637]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109274]) +3 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:
    - shard-glk:          [PASS][70] -> [FAIL][71] ([i915#2122])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-glk9/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#2587] / [i915#2672]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([i915#2672]) +5 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3555]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#2672] / [i915#3555])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109280]) +7 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#6497]) +7 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([fdo#109280] / [fdo#111825]) +8 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271]) +101 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271]) +196 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:
    - shard-iclb:         [PASS][81] -> [FAIL][82] ([i915#2546])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render.html

  * igt@kms_hdr@bpc-switch:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([i915#3555])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_hdr@bpc-switch.html

  * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109289])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-iclb:         [PASS][85] -> [DMESG-WARN][86] ([i915#2867])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [FAIL][87] ([i915#4573]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [SKIP][88] ([fdo#109271]) +157 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-snb7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-vga-1.html

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#5176]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#5176]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb2/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#658])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
    - shard-apl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#658]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2920])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271] / [i915#658])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][95] ([i915#5939]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][96] -> [SKIP][97] ([fdo#109441]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109441]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-tglb:         NOTRUN -> [FAIL][99] ([i915#132] / [i915#3467]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_psr@psr2_suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         NOTRUN -> [SKIP][100] ([i915#5519])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [PASS][101] -> [SKIP][102] ([i915#5519])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-iclb:         [PASS][103] -> [SKIP][104] ([i915#5519])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][105] ([i915#5465]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_vblank@pipe-a-accuracy-idle:
    - shard-glk:          [PASS][106] -> [FAIL][107] ([i915#43])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-glk1/igt@kms_vblank@pipe-a-accuracy-idle.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html

  * igt@perf@gen12-mi-rpc:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109289]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@perf@gen12-mi-rpc.html

  * igt@sysfs_clients@fair-0:
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#2994])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk2/igt@sysfs_clients@fair-0.html

  
#### Possible fixes ####

  * igt@gem_bad_reloc@negative-reloc-lut:
    - {shard-rkl}:        [SKIP][110] ([i915#3281]) -> [PASS][111] +3 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][112] ([i915#2846]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [FAIL][114] ([i915#2842]) -> [PASS][115] +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][116] ([i915#2842]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][118] ([i915#2190]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][120] ([i915#4936]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - {shard-rkl}:        [SKIP][122] ([i915#3282]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@i915_pm_backlight@fade:
    - {shard-rkl}:        [SKIP][124] ([i915#3012]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-1/igt@i915_pm_backlight@fade.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-rkl}:        [SKIP][126] ([i915#3361]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rps@min-max-config-idle:
    - {shard-rkl}:        [FAIL][128] ([i915#7142]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-5/igt@i915_pm_rps@min-max-config-idle.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - {shard-rkl}:        [SKIP][130] ([i915#1845] / [i915#4098]) -> [PASS][131] +17 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][132] ([i915#2346]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-apl:          [DMESG-WARN][134] ([i915#180]) -> [PASS][135] +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - {shard-rkl}:        [SKIP][136] ([i915#1849] / [i915#4098]) -> [PASS][137] +11 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_psr@cursor_blt:
    - {shard-rkl}:        [SKIP][138] ([i915#1072]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-rkl-4/igt@kms_psr@cursor_blt.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@kms_psr@cursor_blt.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [SKIP][140] ([fdo#109441]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb5/igt@kms_psr@psr2_dpms.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_psr@psr2_dpms.html

  * igt@perf_pmu@busy-double-start@vcs0:
    - {shard-dg1}:        [FAIL][142] ([i915#4349]) -> [PASS][143] +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs0.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs0.html

  * igt@sysfs_timeslice_duration@timeout@vcs1:
    - {shard-dg1}:        [FAIL][144] ([i915#1755]) -> [PASS][145] +3 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-dg1-15/igt@sysfs_timeslice_duration@timeout@vcs1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vcs1.html

  
#### Warnings ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [SKIP][146] ([fdo#109271]) -> [DMESG-WARN][147] ([i915#5090])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          [INCOMPLETE][148] ([i915#7248]) -> [WARN][149] ([i915#2658])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl7/igt@gem_pread@exhaustion.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl6/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-tglb:         [WARN][150] ([i915#2658]) -> [INCOMPLETE][151] ([i915#7248])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][152] ([i915#2920]) -> [SKIP][153] ([fdo#111068] / [i915#658])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][154], [FAIL][155], [FAIL][156], [FAIL][157], [FAIL][158]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312]) -> ([FAIL][159], [FAIL][160], [FAIL][161]) ([i915#3002] / [i915#4312])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl8/igt@runner@aborted.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl3/igt@runner@aborted.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl2/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl1/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl8/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2532]: https://gitlab.freedesktop.org/drm/intel/issues/2532
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#402]: https://gitlab.freedesktop.org/drm/intel/issues/402
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#43]: https://gitlab.freedesktop.org/drm/intel/issues/43
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5090]: https://gitlab.freedesktop.org/drm/intel/issues/5090
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#7036]: https://gitlab.freedesktop.org/drm/intel/issues/7036
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7121]: https://gitlab.freedesktop.org/drm/intel/issues/7121
  [i915#7142]: https://gitlab.freedesktop.org/drm/intel/issues/7142
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7248]: https://gitlab.freedesktop.org/drm/intel/issues/7248
  [i915#7390]: https://gitlab.freedesktop.org/drm/intel/issues/7390
  [i915#7456]: https://gitlab.freedesktop.org/drm/intel/issues/7456
  [i915#7468]: https://gitlab.freedesktop.org/drm/intel/issues/7468
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7048 -> IGTPW_8069
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12356: 1278975de8debde9eb1f5d86fd2fbe533361e456 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8069: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/index.html
  IGT_7048: 5edd5c539f1fdf1c02157bf43fa1fd22d4ad2c75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/index.html

--===============0781222880923002168==
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
<tr><td><b>Series:</b></td><td>tests/perf_pmu: Compare against requested fr=
eq in frequency subtest (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/110574/">https://patchwork.freedesktop.org/series/110574/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_8069/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12356_full -&gt; IGTPW_8069_full</=
h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/index.=
html</p>
<h2>Participating hosts (11 -&gt; 8)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8069=
_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@perf_pmu@busy-check-all@vcs1:<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-dg1-12/igt@perf_pmu@busy-check-all@vcs1.html=
">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8069_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb7/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb6/igt@feature_discovery@display-4x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl2/igt@gem_create@create-massive.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/499=
1">i915#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-snb5/igt@gem_ctx_persistence@hang.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/10=
99">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-glk3/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-=
glk3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190"=
>i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl1/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb7/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb6/igt@gem_lmem_swapping@verify.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-glk6/igt@gem_lmem_swapping@verify.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb5/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-yf-tiled-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-=
yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb2/igt@gem_softpin@evict-single-offset.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shar=
d-iclb5/igt@gem_softpin@evict-single-offset.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4171">i915#4171</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb2/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb3/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb7/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb8/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
527">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2856">i915#2856</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb3/igt@gen9_exec_parse@cmd-crossing-page.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
856">i915#2856</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl8/igt@i915_pipe_stress@stress-xrgb8888-un=
tiled.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/7036">i915#7036</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12356/shard-iclb2/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@i=
915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4281">i915#4281</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12356/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-apl1/igt@i91=
5_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@i915_pm_rc6_residency@rc6-idle@rcs=
0.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2681">i915#2681</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb5/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fd=
o#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb1/igt@i915_pm_rpm@dpms-non-lpsp.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fd=
o#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb6/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb1/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-tglb8/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-t=
glb3/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_big_fb@4-tiled-16bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_big_fb@4-tiled-16bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_big_fb@linear-8bpp-rotate-90.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
0725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb2/igt@kms_big_fb@x-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-tglb5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_big_fb@y-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb7/igt@kms_ccs@pipe-a-bad-pixel-format-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_ccs@pipe-a-bad-pixel-format-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/6095">i915#6095</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_ccs@pipe-c-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_ccs@pipe-d-missing-ccs-buffer-=
y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-glk5/igt@kms_chamelium@dp-edid-read.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-75:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb8/igt@kms_color_chamelium@ctm-0-75.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_color_chamelium@ctm-0-75.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-snb6/igt@kms_color_chamelium@ctm-red-to-blue=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl6/igt@kms_content_protection@atomic-dpms@=
pipe-a-dp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/7121">i915#7121</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/7173">i915#7173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb5/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe-a=
-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_8069/shard-iclb8/igt@kms_cursor_crc@cursor-onscreen-128x128@pipe=
-a-edp-1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/402">i915#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@kms_cursor_legacy@2x-long-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb6/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</=
a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-glk3/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a=
>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb1/igt@kms_fbcon_fbt@fbc.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i91=
5#4767</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_flip@2x-modeset-vs-vblank-race=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3637">i915#3637</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_flip@2x-wf_vblank-ts-check.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-glk9/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8069/shard-glk5/igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a1.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2122">i915#21=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) =
+7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@p=
ipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i91=
5#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/6497">i915#6497</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +8 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-glk8/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +101 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl3/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +196 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-r=
ender.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8069/shard-iclb8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-=
render.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2546">i915#2546</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb5/igt@kms_hdr@bpc-switch.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb1/igt@kms_pipe_b_c_ivb@disable-pipe-b-en=
able-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb1/igt@kms_plane@plane-panning-bottom-right-suspend@=
pipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_8069/shard-iclb5/igt@kms_plane@plane-panning-bottom-right=
-suspend@pipe-b-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2867">i915#2867</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-apl3/igt@kms_plane_alpha_blend@alpha-opaque-=
fb@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4573">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-=
a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-snb7/igt@kms_plane_scaling@plane-scaler-with=
-clipping-clamping-rotation@pipe-a-vga-1.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +157 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-a-ed=
p-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_plane_scaling@plane-scaler-wit=
h-rotation-unity-scaling@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-b-ed=
p-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb2/igt@kms_plane_scaling@plane-scaler-wit=
h-rotation-unity-scaling@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +3 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-iclb5/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-apl2/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-tglb3/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8069/shard-glk6/igt@kms_psr2_sf@overlay-plane-move-conti=
nuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@kms_psr2_su@page_flip-nv12@pipe-b-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5939">i915#5939</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb8/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10944=
1">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-tglb7/igt@kms_psr@psr2_suspend.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">i91=
5#3467</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb3/igt@kms_psr_stress_test@flip-primary-i=
nvalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12356/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8069/shard-tglb7/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5519">i915#5519</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12356/shard-iclb3/igt@kms_psr_stress_test@invalidate-primary-flip-ov=
erlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8069/shard-iclb6/igt@kms_psr_stress_test@invalidate-primary-flip-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5519">i915#5519</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-snb4/igt@kms_setmode@basic@pipe-a-vga-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5465=
">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-glk1/igt@kms_vblank@pipe-a-accuracy-idle.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard=
-glk3/igt@kms_vblank@pipe-a-accuracy-idle.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/43">i915#43</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen12-mi-rpc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-iclb2/igt@perf@gen12-mi-rpc.html">SKIP</a> (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#10928=
9</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8069/shard-glk2/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_bad_reloc@negative-reloc-lut:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-4/igt@gem_bad_reloc@negative-reloc-lut.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3=
281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_80=
69/shard-rkl-5/igt@gem_bad_reloc@negative-reloc-lut.html">PASS</a> +3 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/s=
hard-rkl-3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-glk7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8=
069/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069=
/shard-iclb1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-tg=
lb8/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4936"=
>i915#4936</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8069/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-6/igt@gem_partial_pwrite_pread@reads-uncached.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282"=
>i915#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8069/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-1/igt@i915_pm_backlight@fade.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/3012">i915#3012</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-r=
kl-6/igt@i915_pm_backlight@fade.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-5/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3361">i915#3361</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rk=
l-4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-1/igt@i915_pm_rps@min-max-config-idle.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7142">i915#71=
42</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_806=
9/shard-rkl-5/igt@i915_pm_rps@min-max-config-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@kms_big_fb@y-tiled=
-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> +17 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8069/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-apl8/igt@kms_frontbuffer_tracking@fbc-suspend.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180=
">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8069/shard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a=
> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6/igt@kms_frontbuffer_tracking@=
psr-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-rkl-4/igt@kms_psr@cursor_blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-rkl-6=
/igt@kms_psr@cursor_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb5/igt@kms_psr@psr2_dpms.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-iclb=
2/igt@kms_psr@psr2_dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-double-start@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-dg1-12/igt@perf_pmu@busy-double-start@vcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4=
349</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_80=
69/shard-dg1-17/igt@perf_pmu@busy-double-start@vcs0.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vcs1:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-dg1-15/igt@sysfs_timeslice_duration@timeout@vcs1.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755">=
i915#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8069/shard-dg1-17/igt@sysfs_timeslice_duration@timeout@vcs1.html">PASS<=
/a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8069/shard-snb2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5090"=
>i915#5090</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-apl7/igt@gem_pread@exhaustion.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shar=
d-apl6/igt@gem_pread@exhaustion.html">WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2658">i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-tglb8/igt@gem_pwrite@basic-exhaustion.html">WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/sh=
ard-tglb8/igt@gem_pwrite@basic-exhaustion.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/7248">i915#7248</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12356/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8069/shard-iclb3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12356/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12356/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12356/shard-apl1/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12356/shard-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/s=
hard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_8069/shard-apl2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/shard-ap=
l3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/4312">i915#4312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7048 -&gt; IGTPW_8069</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12356: 1278975de8debde9eb1f5d86fd2fbe533361e456 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_8069: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8069/index.htm=
l<br />
  IGT_7048: 5edd5c539f1fdf1c02157bf43fa1fd22d4ad2c75 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============0781222880923002168==--
