Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 30 Jul 2021 01:34:27 -0000
Message-ID: <162760886711.590.1074015367080657772@emeril.freedesktop.org>
References: <20210723093844.22352-1-vidya.srinivas@intel.com>
In-Reply-To: <20210723093844.22352-1-vidya.srinivas@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbig=5Ffb=3A_Fix_hw_stride_length_tests_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2042740363=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============2042740363==
Content-Type: multipart/alternative;
 boundary="===============2486191710721860109=="

--===============2486191710721860109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_big_fb: Fix hw stride length tests (rev3)
URL   : https://patchwork.freedesktop.org/series/92936/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10405_full -> IGTPW_6067_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html

Known issues
------------

  Here are the changes found in IGTPW_6067_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> ([SKIP][1], [SKIP][2]) ([fdo#111827])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@feature_discovery@chamelium.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> ([SKIP][3], [SKIP][4]) ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@feature_discovery@chamelium.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][5] -> ([SKIP][6], [SKIP][7]) ([i915#658])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@feature_discovery@psr2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@feature_discovery@psr2.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@feature_discovery@psr2.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][8] ([i915#180])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_ctx_persistence@engines-mixed:
    - shard-snb:          NOTRUN -> ([SKIP][9], [SKIP][10]) ([fdo#109271] / [i915#1099]) +3 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html

  * igt@gem_ctx_persistence@engines-queued:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +6 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb5/igt@gem_ctx_persistence@engines-queued.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> ([SKIP][12], [SKIP][13]) ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][14] -> ([TIMEOUT][15], [PASS][16]) ([i915#2369] / [i915#3063] / [i915#3648])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gem_eio@unwedge-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][19] -> ([FAIL][20], [FAIL][21]) ([i915#2842]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][22] -> ([FAIL][23], [PASS][24]) ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html
    - shard-iclb:         [PASS][25] -> ([FAIL][26], [PASS][27]) ([i915#2849])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> ([SKIP][28], [SKIP][29]) ([fdo#109283])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gem_exec_params@no-blt.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_exec_params@no-blt.html
    - shard-iclb:         NOTRUN -> ([SKIP][30], [SKIP][31]) ([fdo#109283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_params@no-blt.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_whisper@basic-fds-forked:
    - shard-iclb:         [PASS][32] -> ([PASS][33], [INCOMPLETE][34]) ([i915#1895])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@gem_exec_whisper@basic-fds-forked.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_exec_whisper@basic-fds-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][35] -> ([SKIP][36], [PASS][37]) ([i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_huc_copy@huc-copy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gem_huc_copy@huc-copy.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_huc_copy@huc-copy.html
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#2190])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-apl:          NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_userptr_blits@access-control:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#3297])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-snb:          NOTRUN -> ([FAIL][41], [FAIL][42]) ([i915#2724])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@gem_userptr_blits@vma-merge.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@basic-allowed:
    - shard-tglb:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([fdo#109289])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gen7_exec_parse@basic-allowed.html
    - shard-iclb:         NOTRUN -> ([SKIP][45], [SKIP][46]) ([fdo#109289]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([fdo#109271]) +106 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gen7_exec_parse@basic-offset.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> ([SKIP][49], [SKIP][50]) ([i915#2856])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html
    - shard-tglb:         NOTRUN -> ([SKIP][51], [SKIP][52]) ([i915#2856])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gen9_exec_parse@bb-start-far.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          NOTRUN -> ([FAIL][53], [FAIL][54]) ([i915#3343])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> ([SKIP][55], [SKIP][56]) ([fdo#109289] / [fdo#111719])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@basic-rte:
    - shard-kbl:          NOTRUN -> ([FAIL][57], [FAIL][58]) ([i915#579])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@i915_pm_rpm@basic-rte.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl3/igt@i915_pm_rpm@basic-rte.html
    - shard-apl:          NOTRUN -> [FAIL][59] ([i915#579])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@i915_pm_rpm@basic-rte.html
    - shard-tglb:         NOTRUN -> ([FAIL][60], [FAIL][61]) ([i915#579])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@basic-rte.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_pm_rpm@fences:
    - shard-tglb:         NOTRUN -> ([SKIP][62], [SKIP][63]) ([i915#579]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@fences.html
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@pc8-residency:
    - shard-iclb:         NOTRUN -> ([SKIP][64], [SKIP][65]) ([i915#579])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][66] -> ([DMESG-WARN][67], [PASS][68]) ([i915#180])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> ([DMESG-WARN][69], [DMESG-WARN][70]) ([i915#118] / [i915#95])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-glk:          [PASS][71] -> ([DMESG-WARN][72], [DMESG-WARN][73]) ([i915#118] / [i915#95])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-iclb:         [PASS][74] -> ([PASS][75], [DMESG-WARN][76]) ([i915#3621])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> ([SKIP][77], [SKIP][78]) ([fdo#109271] / [i915#3777]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-glk:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([fdo#109271] / [i915#3777])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
    - shard-kbl:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([fdo#109271] / [i915#3777])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#3777]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> ([SKIP][84], [SKIP][85]) ([fdo#111615])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-iclb:         NOTRUN -> ([SKIP][86], [SKIP][87]) ([fdo#110723])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-snb:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([fdo#109271]) +246 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([fdo#109278]) +11 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([i915#3689]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([i915#3689]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][97] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-fast:
    - shard-iclb:         NOTRUN -> ([SKIP][98], [SKIP][99]) ([fdo#109284] / [fdo#111827])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_chamelium@hdmi-hpd-fast.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html

  * igt@kms_color@pipe-a-gamma:
    - shard-tglb:         [PASS][100] -> ([FAIL][101], [FAIL][102]) ([i915#1149])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@kms_color@pipe-a-gamma.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_color@pipe-a-gamma.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color@pipe-a-gamma.html

  * igt@kms_color@pipe-b-legacy-gamma:
    - shard-kbl:          [PASS][103] -> ([FAIL][104], [FAIL][105]) ([i915#71])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color@pipe-b-legacy-gamma.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-glk:          [PASS][106] -> ([FAIL][107], [FAIL][108]) ([i915#71])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk4/igt@kms_color@pipe-b-legacy-gamma.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_color@pipe-b-legacy-gamma.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_color@pipe-b-legacy-gamma.html
    - shard-apl:          [PASS][109] -> [FAIL][110] ([i915#71])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl1/igt@kms_color@pipe-b-legacy-gamma.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_color@pipe-b-legacy-gamma.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> ([SKIP][111], [SKIP][112]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-b-ctm-limited-range:
    - shard-tglb:         NOTRUN -> ([SKIP][113], [SKIP][114]) ([fdo#109284] / [fdo#111827]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-glk:          NOTRUN -> ([SKIP][115], [SKIP][116]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109284] / [fdo#111827])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-ctm-max:
    - shard-apl:          NOTRUN -> ([SKIP][118], [SKIP][119]) ([fdo#109271] / [fdo#111827]) +7 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-max.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> ([SKIP][120], [SKIP][121]) ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-negative.html
    - shard-kbl:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([fdo#109271] / [fdo#111827]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-negative.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-negative.html
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109284] / [fdo#111827])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> ([TIMEOUT][125], [TIMEOUT][126]) ([i915#1319])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_content_protection@legacy.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][127] ([i915#2105])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen:
    - shard-tglb:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([fdo#109279] / [i915#3359]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109278] / [fdo#109279])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:
    - shard-tglb:         NOTRUN -> ([SKIP][131], [SKIP][132]) ([i915#3359])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-offscreen:
    - shard-kbl:          NOTRUN -> [SKIP][133] ([fdo#109271]) +11 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-128x128-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#3319])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][135] ([fdo#109271]) +257 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> ([SKIP][136], [SKIP][137]) ([fdo#109274] / [fdo#109278]) +1 similar issue
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][138] -> [INCOMPLETE][139] ([i915#155] / [i915#180] / [i915#636])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][140] -> ([FAIL][141], [PASS][142]) ([i915#2122])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-iclb:         NOTRUN -> ([SKIP][143], [SKIP][144]) ([fdo#109274]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][145] -> [DMESG-WARN][146] ([i915#180]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([fdo#111825])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          [PASS][148] -> ([PASS][149], [DMESG-WARN][150]) ([i915#180]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-tglb:         NOTRUN -> ([SKIP][151], [SKIP][152]) ([fdo#111825]) +14 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-iclb:         NOTRUN -> ([SKIP][153], [SKIP][154]) ([fdo#109280]) +7 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> ([SKIP][155], [SKIP][156]) ([fdo#109271]) +36 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:
    - shard-kbl:          NOTRUN -> ([SKIP][157], [SKIP][158]) ([fdo#109271]) +38 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html
    - shard-iclb:         NOTRUN -> [SKIP][159] ([fdo#109280]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-iclb:         [PASS][160] -> ([PASS][161], [INCOMPLETE][162]) ([i915#1185] / [i915#1373] / [i915#2828])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitych

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html

--===============2486191710721860109==
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
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10405_full -&gt; IGTPW_6067_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/index.html</p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6067_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@feature_discovery@chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@feature_discovery@chamelium.html">SKIP</a>) ([fdo#111827])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@feature_discovery@chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@feature_discovery@chamelium.html">SKIP</a>) ([fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@feature_discovery@psr2.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@feature_discovery@psr2.html">SKIP</a>) ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@gem_ctx_persistence@engines-mixed.html">SKIP</a>) ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-queued:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb5/igt@gem_ctx_persistence@engines-queued.html">SKIP</a> ([fdo#109271] / [i915#1099]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_ctx_sseu@mmap-args.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP</a>) ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gem_eio@unwedge-stress.html">PASS</a>) ([i915#2369] / [i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a>) ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>) ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>) ([i915#2849])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gem_exec_params@no-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_exec_params@no-blt.html">SKIP</a>) ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gem_exec_params@no-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@gem_exec_params@no-blt.html">SKIP</a>) ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-forked:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb8/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@gem_exec_whisper@basic-fds-forked.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@gem_exec_whisper@basic-fds-forked.html">INCOMPLETE</a>) ([i915#1895])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gem_huc_copy@huc-copy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@gem_huc_copy@huc-copy.html">PASS</a>) ([i915#2190])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
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
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@gem_userptr_blits@vma-merge.html">FAIL</a>) ([i915#2724])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allowed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>) ([fdo#109289])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@gen7_exec_parse@basic-allowed.html">SKIP</a>) ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@gen7_exec_parse@basic-offset.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@gen7_exec_parse@basic-offset.html">SKIP</a>) ([fdo#109271]) +106 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@gen9_exec_parse@bb-start-far.html">SKIP</a>) ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@gen9_exec_parse@bb-start-far.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@gen9_exec_parse@bb-start-far.html">SKIP</a>) ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">FAIL</a>) ([i915#3343])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a>) ([fdo#109289] / [fdo#111719])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@basic-rte:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@i915_pm_rpm@basic-rte.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl3/igt@i915_pm_rpm@basic-rte.html">FAIL</a>) ([i915#579])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@i915_pm_rpm@basic-rte.html">FAIL</a> ([i915#579])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@basic-rte.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@basic-rte.html">FAIL</a>) ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb5/igt@i915_pm_rpm@fences.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb7/igt@i915_pm_rpm@fences.html">SKIP</a>) ([i915#579]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pc8-residency:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@i915_pm_rpm@pc8-residency.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@i915_pm_rpm@pc8-residency.html">SKIP</a>) ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a>) ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a>) ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk1/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">DMESG-WARN</a>) ([i915#118] / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">DMESG-WARN</a>) ([i915#3621])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>) ([fdo#111615])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>) ([fdo#110723])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a>) ([fdo#109271]) +246 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([fdo#109278]) +11 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([i915#3689]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb7/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_chamelium@hdmi-hpd-fast.html">SKIP</a>) ([fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-gamma:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-tglb3/igt@kms_color@pipe-a-gamma.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_color@pipe-a-gamma.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color@pipe-a-gamma.html">FAIL</a>) ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl3/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl7/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a>) ([i915#71])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk4/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk8/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a>) ([i915#71])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl1/igt@kms_color@pipe-b-legacy-gamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl3/igt@kms_color@pipe-b-legacy-gamma.html">FAIL</a> ([i915#71])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb6/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a>) ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk6/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl7/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl1/igt@kms_color_chamelium@pipe-d-ctm-max.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>) ([fdo#109278] / [fdo#109284] / [fdo#111827])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb3/igt@kms_color_chamelium@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109284] / [fdo#111827])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_content_protection@legacy.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl8/igt@kms_content_protection@legacy.html">TIMEOUT</a>) ([i915#1319])</li>
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
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb1/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a>) ([fdo#109279] / [i915#3359]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb6/igt@kms_cursor_crc@pipe-a-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_cursor_crc@pipe-b-cursor-max-size-sliding.html">SKIP</a>) ([i915#3359])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-offscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl3/igt@kms_cursor_crc@pipe-d-cursor-128x128-offscreen.html">SKIP</a> ([fdo#109271]) +11 similar issues</li>
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
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-snb2/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +257 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a>) ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#155] / [i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a>) ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a>) ([fdo#109274]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-apl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-apl6/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a>) ([i915#180]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a>) ([fdo#111825]) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html">SKIP</a>) ([fdo#109280]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-glk5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html">SKIP</a>) ([fdo#109271]) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a>) ([fdo#109271]) +38 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-pwrite.html">SKIP</a> ([fdo#109280]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10405/shard-iclb7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6067/shard-iclb3/igt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a>) ([i915#1185] / [i915#1373] / [i915#2828])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitych</p>
</li>
</ul>

</body>
</html>

--===============2486191710721860109==--

--===============2042740363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2042740363==--
