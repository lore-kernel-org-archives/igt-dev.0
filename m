Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 26 Jul 2021 07:33:54 -0000
Message-ID: <162728483402.2616.14775148033175528493@emeril.freedesktop.org>
References: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20210705125617.4631-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTGltaXQg?=
 =?utf-8?q?the_HANG_tests_to_two_pipes_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0239063569=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============0239063569==
Content-Type: multipart/alternative;
 boundary="===============3464491703671553754=="

--===============3464491703671553754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Limit the HANG tests to two pipes (rev3)
URL   : https://patchwork.freedesktop.org/series/92187/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10392_full -> IGTPW_6054_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6054_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6054_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6054_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_softpin@noreloc-s3:
    - shard-snb:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb2/igt@gem_softpin@noreloc-s3.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl7/igt@perf_pmu@rc6-suspend.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@perf_pmu@rc6-suspend.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10392_full and IGTPW_6054_full:

### New IGT tests (41) ###

  * igt@kms_busy@basic-hang:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@basic-hang@flip-pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.40, 0.87] s

  * igt@kms_busy@basic-hang@flip-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.29] s

  * igt@kms_busy@basic-hang@flip-pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.38, 1.39] s

  * igt@kms_busy@basic-hang@flip-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.32] s

  * igt@kms_busy@basic-hang@modeset-pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [0.45, 3.64] s

  * igt@kms_busy@basic-hang@modeset-pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_busy@basic-hang@modeset-pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.70, 3.67] s

  * igt@kms_busy@basic-hang@modeset-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [3.59] s

  * igt@kms_busy@extended-modeset-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [12.58, 26.96] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [12.02] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [17.92, 22.03] s

  * igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [28.13] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [17.01, 26.89] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [17.41, 22.02] s

  * igt@kms_busy@extended-modeset-hang-newfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [28.14] s

  * igt@kms_busy@extended-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:
    - Statuses : 6 pass(s)
    - Exec time: [5.83, 16.08] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.02] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [6.96, 8.94] s

  * igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [17.01] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-a:
    - Statuses : 4 pass(s)
    - Exec time: [6.94, 16.69] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [6.93, 8.94] s

  * igt@kms_busy@extended-modeset-hang-oldfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [17.00] s

  * igt@kms_busy@extended-pageflip-hang-newfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [5.80, 15.42] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [5.95] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [6.99, 11.22] s

  * igt@kms_busy@extended-pageflip-hang-newfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [15.98] s

  * igt@kms_busy@extended-pageflip-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.10, 0.51] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-c:
    - Statuses : 3 pass(s)
    - Exec time: [0.23, 1.24] s

  * igt@kms_busy@extended-pageflip-hang-oldfb@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.21] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [6.34, 13.36] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:
    - Statuses : 1 pass(s)
    - Exec time: [6.03] s

  * igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [12.99, 14.02] s

  

Known issues
------------

  Here are the changes found in IGTPW_6054_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@engines-hostile-preempt:
    - shard-snb:          NOTRUN -> [SKIP][4] ([fdo#109271] / [i915#1099]) +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb7/igt@gem_ctx_persistence@engines-hostile-preempt.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-iclb:         [PASS][5] -> [TIMEOUT][6] ([i915#3070])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb7/igt@gem_eio@in-flight-contexts-10ms.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][7] -> [FAIL][8] ([i915#2846])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@gem_exec_fair@basic-deadline.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][9] -> [FAIL][10] ([i915#2842]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-glk:          [PASS][11] -> [FAIL][12] ([i915#2842]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-kbl:          [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_schedule@independent@vcs0:
    - shard-tglb:         [PASS][16] -> [FAIL][17] ([i915#3795])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_exec_schedule@independent@vcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@gem_exec_schedule@independent@vcs0.html

  * igt@gem_mmap_gtt@cpuset-big-copy-xy:
    - shard-iclb:         [PASS][18] -> [FAIL][19] ([i915#2428])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html

  * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][20] ([i915#768]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb7/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271]) +63 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
    - shard-glk:          NOTRUN -> [SKIP][22] ([fdo#109271]) +32 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html

  * igt@gen3_render_mixed_blits:
    - shard-tglb:         NOTRUN -> [SKIP][23] ([fdo#109289]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@gen3_render_mixed_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][24] ([fdo#109289]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@gen3_render_mixed_blits.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-iclb:         NOTRUN -> [SKIP][25] ([i915#2856])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@gen9_exec_parse@valid-registers.html
    - shard-tglb:         NOTRUN -> [SKIP][26] ([i915#2856])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#1937])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#1937])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#1937])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#579])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][31] -> [DMESG-WARN][32] ([i915#118] / [i915#95]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#3777])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#111615]) +2 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#110723])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#3777]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([i915#3689]) +2 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [fdo#111827]) +25 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@kms_chamelium@vga-hpd.html
    - shard-glk:          NOTRUN -> [SKIP][41] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk9/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][42] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#109278] / [i915#1149])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-a-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@kms_color_chamelium@pipe-a-gamma.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][45] ([i915#1319])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl7/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([fdo#109300] / [fdo#111066])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][47] ([fdo#111828])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][48] ([i915#1319])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@uevent:
    - shard-apl:          NOTRUN -> [FAIL][49] ([i915#2105])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-random:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#3359]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#3319])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-random:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109279] / [i915#3359]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +416 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109274] / [fdo#109278])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#109278]) +8 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109274]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:
    - shard-glk:          [PASS][58] -> [FAIL][59] ([i915#79])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109280]) +6 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#111825]) +12 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#533]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#533])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#533]) +1 similar issue
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          NOTRUN -> [DMESG-WARN][65] ([i915#180])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][66] ([fdo#108145] / [i915#265]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:
    - shard-iclb:         [PASS][67] -> [SKIP][68] ([fdo#109278])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb6/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#112054]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#658]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#658]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#658]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#2920]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-iclb:         [PASS][75] -> [SKIP][76] ([fdo#109441]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109441])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_psr@psr2_no_drrs.html
    - shard-tglb:         NOTRUN -> [FAIL][78] ([i915#132] / [i915#3467])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb3/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [PASS][79] -> [DMESG-WARN][80] ([i915#180])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-d-wait-forked-hang:
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271]) +300 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@kms_vblank@pipe-d-wait-forked-hang.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#2437]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl1/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109295])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@prime_vgem@fence-flip-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109295])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@prime_vgem@fence-flip-hang.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#2994]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([i915#2994])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb8/igt@sysfs_clients@recycle-many.html
    - shard-glk:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#2994])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@sysfs_clients@recycle-many.html
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [i915#2994])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl3/igt@sysfs_clients@recycle-many.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#2994])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-kbl:          [PASS][90] -> [FAIL][91] ([i915#1755])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@sysfs_timeslice_duration@timeout@vecs0.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [TIMEOUT][92] ([i915#3063]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][94] ([i915#2369] / [i915#3063] / [i915#3648]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][96] ([i915#2842]) -> [PASS][97] +4 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [FAIL][98] ([i915#2842]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [FAIL][100] ([i915#2842]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [SKIP][102] ([fdo#109271]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][104] ([i915#2849]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [DMESG-WARN][106] ([i915#118] / [i915#95]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          [DMESG-WARN][108] ([i915#180]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@d-edp1:
    - shard-tglb:         [FAIL][110] ([i915#79]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-kbl:          [INCOMPLETE][112] ([i915#155]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-glk:          [FAIL][114] ([i915#2546]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:
    - shard-iclb:         [SKIP][116] ([fdo#109278]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html

  * igt@kms_psr@psr2_primary_page_flip:
    - shard-iclb:         [SKIP][118] ([fdo#109441]) -> [PASS][119]

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/index.html

--===============3464491703671553754==
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
<tr><td><b>Series:</b></td><td>Limit the HANG tests to two pipes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/92187/">https://patchwork.freedesktop.org/series/92187/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10392_full -&gt; IGTPW_6054_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6054_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6054_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6054_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb2/igt@gem_softpin@noreloc-s3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl7/igt@perf_pmu@rc6-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@perf_pmu@rc6-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10392_full and IGTPW_6054_full:</p>
<h3>New IGT tests (41)</h3>
<ul>
<li>
<p>igt@kms_busy@basic-hang:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.40, 0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.38, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@flip-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.45, 3.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.70, 3.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@basic-hang@modeset-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [12.58, 26.96] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [12.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [17.92, 22.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb-with-reset@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [17.01, 26.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [17.41, 22.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-newfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [28.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-a:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [5.83, 16.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.96, 8.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb-with-reset@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [6.94, 16.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.93, 8.94] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-modeset-hang-oldfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [17.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.80, 15.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [5.95] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [6.99, 11.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-newfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [15.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.10, 0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.23, 1.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-hang-oldfb@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [6.34, 13.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-b:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_busy@extended-pageflip-modeset-hang-oldfb@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [12.99, 14.02] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6054_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile-preempt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb7/igt@gem_ctx_persistence@engines-hostile-preempt.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb7/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3070])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl2/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@independent@vcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_exec_schedule@independent@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@gem_exec_schedule@independent@vcs0.html">FAIL</a> ([i915#3795])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-big-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@gem_mmap_gtt@cpuset-big-copy-xy.html">FAIL</a> ([i915#2428])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb7/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +63 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk7/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html">SKIP</a> ([fdo#109271]) +32 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_mixed_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@gen3_render_mixed_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@gen9_exec_parse@valid-registers.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> ([i915#579])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk8/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl4/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk9/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb2/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@kms_color_chamelium@pipe-a-gamma.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl7/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb3/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl6/igt@kms_content_protection@uevent.html">FAIL</a> ([i915#2105])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb8/igt@kms_cursor_crc@pipe-a-cursor-512x512-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-32x10-random.html">SKIP</a> ([i915#3359]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@kms_cursor_crc@pipe-d-cursor-512x170-random.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-snb5/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +416 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb5/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> ([fdo#109274]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> ([fdo#109280]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb6/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb2/igt@kms_plane_alpha_blend@pipe-c-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_plane_lowres@pipe-b-tiling-yf.html">SKIP</a> ([fdo#112054]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html">SKIP</a> ([fdo#109271] / [i915#658]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-3.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_psr@psr2_cursor_plane_onoff.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb4/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb3/igt@kms_psr@psr2_no_drrs.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-forked-hang:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl8/igt@kms_vblank@pipe-d-wait-forked-hang.html">SKIP</a> ([fdo#109271]) +300 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb6/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@sysfs_clients@fair-1.html">SKIP</a> ([fdo#109271] / [i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb8/igt@sysfs_clients@recycle-many.html">SKIP</a> ([i915#2994])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk4/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl3/igt@sysfs_clients@recycle-many.html">SKIP</a> ([fdo#109271] / [i915#2994])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb1/igt@sysfs_clients@recycle-many.html">SKIP</a> ([i915#2994])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl4/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@sysfs_timeslice_duration@timeout@vecs0.html">FAIL</a> ([i915#1755])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#2369] / [i915#3063] / [i915#3648]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl2/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl1/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">SKIP</a> ([fdo#109271]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl6/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2849]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk9/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-apl6/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">DMESG-WARN</a> ([i915#180]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-tglb3/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html">FAIL</a> ([i915#79]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-kbl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">INCOMPLETE</a> ([i915#155]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-kbl7/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-glk5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">FAIL</a> ([i915#2546]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-glk2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10392/shard-iclb2/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html">SKIP</a> ([fdo#109278]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6054/shard-iclb1/igt@kms_plane_alpha_blend@pipe-a-coverage-vs-premult-vs-constant.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_page_flip:</p>
<ul>
<li>shard-iclb:         [SKIP][118] ([fdo#109441]) -&gt; [PASS][119]</li>
</ul>
</li>
</ul>

</body>
</html>

--===============3464491703671553754==--

--===============0239063569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0239063569==--
