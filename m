Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4282087286971297026=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Fri, 26 Nov 2021 09:14:43 -0000
Message-ID: <163791808320.11079.11982460145751799967@emeril.freedesktop.org>
References: <20211124095002.130684-1-jouni.hogander@intel.com>
In-Reply-To: <20211124095002.130684-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgQmlwbGFu?=
 =?utf-8?q?ar_testcases_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============4282087286971297026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Biplanar testcases (rev2)
URL   : https://patchwork.freedesktop.org/series/97232/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10929_full -> IGTPW_6439_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6439_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6439_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6439_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:
    - shard-kbl:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html

  * {igt@kms_psr2_sf@overlay-plane-update-continuous-sf} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][3] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * {igt@kms_psr2_su@frontbuffer-xrgb8888} (NEW):
    - shard-iclb:         NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * {igt@kms_psr2_su@page_flip-nv12} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][5] +4 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_psr2_su@page_flip-nv12.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10929_full and IGTPW_6439_full:

### New IGT tests (5) ###

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - Statuses : 1 fail(s) 5 skip(s)
    - Exec time: [0.0, 0.11] s

  * igt@kms_psr2_su@page_flip-nv12:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_su@page_flip-p010:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_6439_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#658]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][7] ([fdo#109271] / [i915#1099]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][8] -> [TIMEOUT][9] ([i915#3063] / [i915#3648])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb3/igt@gem_eio@unwedge-stress.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#4525])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gem_exec_balancer@parallel-contexts.html
    - shard-iclb:         NOTRUN -> [SKIP][11] ([i915#4525])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][12] ([i915#2842]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][13] ([i915#2842]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [PASS][15] -> [SKIP][16] ([fdo#109271])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][17] -> [FAIL][18] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][19] ([i915#4613]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gem_lmem_swapping@random-engines.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#4613]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@gem_lmem_swapping@random-engines.html
    - shard-kbl:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#4613]) +3 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][22] ([i915#4613]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gem_lmem_swapping@verify-random.html
    - shard-apl:          NOTRUN -> [SKIP][23] ([fdo#109271] / [i915#4613])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pread@exhaustion:
    - shard-snb:          NOTRUN -> [WARN][24] ([i915#2658])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([i915#4270]) +1 similar issue
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([i915#4270])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][27] ([i915#3297]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@readonly-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#3297])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.html

  * igt@gen3_mixed_blits:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([fdo#109289])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gen3_mixed_blits.html
    - shard-tglb:         NOTRUN -> [SKIP][30] ([fdo#109289])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gen3_mixed_blits.html

  * igt@gen9_exec_parse@bb-large:
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#2856]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][32] ([i915#2856])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-tglb:         NOTRUN -> [WARN][33] ([i915#2681] / [i915#2684])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html
    - shard-iclb:         NOTRUN -> [WARN][34] ([i915#2684])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#111644] / [i915#1397] / [i915#2411])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#110892])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_suspend@forcewake:
    - shard-tglb:         [PASS][37] -> [INCOMPLETE][38] ([i915#2411] / [i915#456])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb2/igt@i915_suspend@forcewake.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@i915_suspend@forcewake.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#404])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#111614])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-270.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([fdo#110725] / [fdo#111614])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          [PASS][42] -> [DMESG-WARN][43] ([i915#118])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#3777]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-snb:          NOTRUN -> [SKIP][45] ([fdo#109271]) +112 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#111615]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([fdo#110723])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3689] / [i915#3886]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#3689]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][50] ([fdo#109271] / [i915#3886]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109278] / [i915#3886]) +4 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([fdo#111615] / [i915#3689]) +3 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][53] ([fdo#109271] / [i915#3886]) +4 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271] / [i915#3886]) +7 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109278]) +15 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +93 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl7/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3742])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@hdmi-hpd:
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk9/igt@kms_chamelium@hdmi-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_chamelium@hdmi-hpd.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-mode-timings:
    - shard-snb:          NOTRUN -> [SKIP][61] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html

  * igt@kms_chamelium@vga-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][62] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl6/igt@kms_chamelium@vga-hpd-after-suspend.html

  * igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html

  * igt@kms_content_protection@lic:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111828])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][65] ([i915#1319])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([i915#3359]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-random:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3319])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][68] ([i915#180])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#109278] / [fdo#109279])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
    - shard-kbl:          NOTRUN -> [SKIP][70] ([fdo#109271]) +143 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#109279] / [i915#3359]) +3 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-iclb:         NOTRUN -> [FAIL][73] ([i915#2346])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([i915#426])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3528])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3528])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][77] -> [INCOMPLETE][78] ([i915#180] / [i915#636])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-fences:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109274])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@kms_flip@2x-flip-vs-fences.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][80] -> [FAIL][81] ([i915#2122])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:
    - shard-apl:          [PASS][82] -> [FAIL][83] ([i915#79])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [PASS][84] -> [DMESG-WARN][85] ([i915#180]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-tglb:         [PASS][86] -> [INCOMPLETE][87] ([i915#456])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          [PASS][88] -> [INCOMPLETE][89] ([i915#636])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
    - shard-kbl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#2672])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
    - shard-iclb:         [PASS][91] -> [SKIP][92] ([i915#3701])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#2587])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109280]) +8 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> [SKIP][95] ([fdo#111825]) +20 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_hdr@static-swap:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#1187])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_hdr@static-swap.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#1187])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb4/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [i915#533]) +1 similar issue
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#533])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#533]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][101] ([i915#265])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][103] ([fdo#108145] / [i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_cursor@pipe-d-viewport-size-256:
    - shard-glk:          NOTRUN -> [SKIP][104] ([fdo#109271]) +50 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk9/igt@kms_plane_cursor@pipe-d-viewport-size-256.html

  * igt@kms_plane_lowres@pipe-b-tiling-x:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#3536])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-x.html

  * igt@kms_plane_lowres@pipe-c-tiling-x:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#3536]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_plane_lowres@pipe-c-tiling-x.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#658]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#658]) +1 similar issue
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html
    - shard-glk:          NOTRUN -> [SKIP][109] ([fdo#109271] / [i915#658])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2920]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109441])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
    - shard-tglb:         NOTRUN -> [FAIL][112] ([i915#132] / [i915#3467])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [PASS][113] -> [SKIP][114] ([fdo#109441]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-iclb2/igt@kms_psr@psr2_primary_blt.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          [PASS][115] -> [DMESG-WARN][116] ([i915#180] / [i915#295])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#109502])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_vrr@flip-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109502])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-check-output:
    - shard-apl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#2437]) +1 similar issue
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#2437])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2437])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-glk:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2437])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#2437])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#2530])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#2530]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@perf@polling-parameterized:
    - shard-apl:          [PASS][126] -> [FAIL][127] ([i915#1542])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl6/igt@perf@polling-parameterized.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl1/igt@perf@polling-parameterized.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#109291]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][129] (

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/index.html

--===============4282087286971297026==
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
<tr><td><b>Series:</b></td><td>Biplanar testcases (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97232/">https://patchwork.freedesktop.org/series/97232/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10929_full -&gt; IGTPW_6439_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6439_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6439_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/index.html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6439_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl2/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_cursor_edge_walk@pipe-a-128x128-bottom-edge.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_sf@overlay-plane-update-continuous-sf} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_su@frontbuffer-xrgb8888} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_psr2_su@page_flip-nv12} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10929_full and IGTPW_6439_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>Statuses : 1 fail(s) 5 skip(s)</li>
<li>Exec time: [0.0, 0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6439_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb3/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html">SKIP</a> ([i915#4525])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@gem_exec_fair@basic-pace@vcs0.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl7/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html">SKIP</a> ([i915#4270]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@gem_pxp@verify-pxp-stale-buf-execution.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@gem_userptr_blits@readonly-unsync.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_mixed_blits:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gen3_mixed_blits.html">SKIP</a> ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@gen9_exec_parse@bb-large.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#110892])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb2/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@i915_suspend@forcewake.html">INCOMPLETE</a> ([i915#2411] / [i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk1/igt@kms_big_fb@linear-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271]) +112 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@kms_ccs@pipe-d-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> ([fdo#109278]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl7/igt@kms_cdclk@mode-transition.html">SKIP</a> ([fdo#109271]) +93 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk9/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_chamelium@hdmi-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-mode-timings:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-snb2/igt@kms_chamelium@hdmi-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl6/igt@kms_chamelium@vga-hpd-after-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-blue-to-red:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_color_chamelium@pipe-a-ctm-blue-to-red.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-random.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_cursor_crc@pipe-a-cursor-suspend.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-512x170-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl2/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html">SKIP</a> ([fdo#109271]) +143 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> ([i915#2346])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> ([i915#3528])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-fences:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb1/igt@kms_flip@2x-flip-vs-fences.html">SKIP</a> ([fdo#109274])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-glk2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk5/igt@kms_flip@2x-plain-flip-ts-check-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> ([i915#2122])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-tglb3/igt@kms_flip@flip-vs-suspend@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb7/igt@kms_flip@flip-vs-suspend@a-edp1.html">INCOMPLETE</a> ([i915#456])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">INCOMPLETE</a> ([i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html">SKIP</a> ([i915#3701])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([i915#2587])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> ([fdo#111825]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb6/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb4/igt@kms_hdr@static-swap.html">SKIP</a> ([i915#1187])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk6/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl3/igt@kms_pipe_crc_basic@read-crc-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@pipe-d-viewport-size-256:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk9/igt@kms_plane_cursor@pipe-d-viewport-size-256.html">SKIP</a> ([fdo#109271]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb5/igt@kms_plane_lowres@pipe-b-tiling-x.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_plane_lowres@pipe-c-tiling-x.html">SKIP</a> ([i915#3536]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb3/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb1/igt@kms_psr@psr2_no_drrs.html">FAIL</a> ([i915#132] / [i915#3467])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb7/igt@kms_psr@psr2_primary_blt.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-kbl7/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#295])</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_vrr@flip-basic.html">SKIP</a> ([fdo#109502])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl2/igt@kms_writeback@writeback-check-output.html">SKIP</a> ([fdo#109271] / [i915#2437]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-kbl4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-glk2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([fdo#109271] / [i915#2437])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> ([i915#2437])</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-tglb2/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10929/shard-apl6/igt@perf@polling-parameterized.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-apl1/igt@perf@polling-parameterized.html">FAIL</a> ([i915#1542])</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6439/shard-iclb3/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html">SKIP</a> ([fdo#109291]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; [SKIP][129] (</li>
</ul>
</li>
</ul>

</body>
</html>

--===============4282087286971297026==--
