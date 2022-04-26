Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6394895274810854269=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 26 Apr 2022 21:33:26 -0000
Message-ID: <165100880639.12383.17194048218406386448@emeril.freedesktop.org>
References: <20220426194111.5990-1-ashutosh.dixit@intel.com>
In-Reply-To: <20220426194111.5990-1-ashutosh.dixit@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915=5Fpm=5Ffreq=5Fmult=3A_New_test_for_media_freq_factor?=
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

--===============6394895274810854269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915_pm_freq_mult: New test for media freq factor
URL   : https://patchwork.freedesktop.org/series/103175/
State : failure

== Summary ==

CI Bug Log - changes from IGT_6455_full -> IGTPW_7009_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7009_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7009_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/index.html

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): shard-skl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7009_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@i915_pm_freq_mult@media-freq@gt0} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-iclb:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@i915_pm_freq_mult@media-freq@gt0.html
    - {shard-tglu}:       NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.html
    - shard-tglb:         NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb5/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  
New tests
---------

  New tests have been introduced between IGT_6455_full and IGTPW_7009_full:

### New IGT tests (2) ###

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - Statuses : 8 skip(s)
    - Exec time: [0.0] s

  * igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [1.23] s

  

Known issues
------------

  Here are the changes found in IGTPW_7009_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][7] ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#1839])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#5327])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_ccs@block-copy-inplace.html
    - shard-tglb:         NOTRUN -> [SKIP][10] ([i915#3555] / [i915#5325])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb8/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][11] ([fdo#109271] / [i915#1099]) +2 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb7/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([i915#280])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][13] ([i915#5076] / [i915#5614])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb5/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][14] ([i915#5076] / [i915#5614])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@gem_exec_balancer@parallel-keep-in-fence.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#4525])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][16] -> [FAIL][17] ([i915#2846])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-glk2/igt@gem_exec_fair@basic-deadline.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk4/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][20] ([i915#2842]) +5 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          NOTRUN -> [FAIL][21] ([i915#2842]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2842]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk2/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [PASS][25] -> [FAIL][26] ([i915#2849])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_lmem_swapping@basic:
    - shard-kbl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +3 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_lmem_swapping@heavy-multi.html
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk4/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([i915#4613]) +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#284])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@gem_media_vme.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#4270]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#4270]) +2 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271]) +198 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#768]) +3 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][39] ([fdo#109312])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][40] ([fdo#109312])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#3297])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.html
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#3297]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([fdo#109289]) +4 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][44] -> [DMESG-WARN][45] ([i915#5566] / [i915#716])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-glk4/igt@gen9_exec_parse@allowed-all.html
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#2856]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#2527] / [i915#2856]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_hangman@engine-engine-hang:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271]) +259 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb5/igt@i915_hangman@engine-engine-hang.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][49] ([i915#454])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][50] ([i915#454])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#4281])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][52] ([fdo#109271]) +171 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109506] / [i915#2411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109293] / [fdo#109506])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][55] ([i915#2373])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][56] ([i915#1759])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#5286]) +3 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][58] ([fdo#109271]) +97 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#5286]) +3 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111614]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][62] ([fdo#109271] / [i915#3777]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#3777]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][64] ([fdo#110723]) +2 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777]) +2 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111615]) +9 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#109278] / [i915#3886]) +9 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [i915#3886]) +5 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3689]) +10 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +6 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#111615] / [i915#3689]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#3689] / [i915#3886]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([i915#3742])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@hdmi-aspect-ratio:
    - shard-glk:          NOTRUN -> [SKIP][75] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#109284] / [fdo#111827]) +17 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@hdmi-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][77] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb2/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278] / [i915#3555])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [i915#1149]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color@pipe-d-deep-color:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3555]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_color@pipe-d-deep-color.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-75:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-b-gamma:
    - shard-apl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl1/igt@kms_color_chamelium@pipe-b-gamma.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][84] ([i915#1319])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_content_protection@atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#1063])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109300] / [fdo#111066])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#3319]) +4 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109278] / [fdo#109279] / [i915#5691])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
    - shard-apl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#5691])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [i915#5691])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109279] / [i915#3359] / [i915#5691])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [i915#5691])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html
    - shard-snb:          NOTRUN -> [SKIP][93] ([fdo#109271] / [i915#5691])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109279] / [i915#3359]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109278]) +37 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3359]) +7 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109274] / [fdo#109278]) +4 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][99] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-iclb:         NOTRUN -> [FAIL][100] ([i915#2346])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#533])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][102] ([fdo#109271] / [i915#533]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-glk:          NOTRUN -> [SKIP][103] ([fdo#109271] / [i915#533]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([i915#5287]) +2 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@kms_draw_crc@draw-method-rgb565-blt-4tiled.html

  * igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#5287]) +4 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled.html

  * igt@kms_dsc@basic-dsc-enable:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#3840])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][107] ([i915#79])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109274]) +9 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#2587])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109280]) +36 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#109280] / [fdo#111825]) +41 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#4278])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_invalid_mode@clock-too-high.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#4278])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb4/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109289])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][115] -> [DMESG-WARN][116] ([i915#180]) +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          NOTRUN -> [DMESG-WARN][117] ([i915#180])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][118] -> [SKIP][119] ([fdo#109271]) +65 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][120] ([fdo#108145] / [i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][121] ([i915#265]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][122] ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#5288])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-4.html
    - shard-tglb:         NOTRUN -> [SKIP][124] ([i915#5288]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-4.html

  * igt@kms_plane_lowres@pipe-a-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#3536]) +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-none.html
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#3536]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-none.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][127] ([fdo#111615] / [fdo#112054])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#5176]) +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format:
    - shard-iclb:         [PASS][129] -> [INCOMPLETE][130] ([i915#5395])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb6/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-with-pixel-format.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][131] ([fdo#109271] / [i915#658])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#658])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#111068] / [i915#658])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-apl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#658])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][135] ([i915#2920])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][136] ([i915#132] / [i915#3467]) +4 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_render:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([fdo#109441]) +3 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_psr@psr2_cursor_render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-iclb:         [PASS][138] -> [SKIP][139] ([i915#5519])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#5030]) +3 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([i915#5030]) +2 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [PASS][142] -> [DMESG-WARN][143] ([i915#180])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][144] ([i915#2530]) +3 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][145] ([i915#2530]) +3 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_import_twice:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([fdo#109291]) +3 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([fdo#109291]) +6 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@prime_vgem@fence-read-hang:
    - shard-iclb:         NOTRUN -> [SKIP][148] ([fdo#109295])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@create:
    - shard-glk:          NOTRUN -> [SKIP][149] ([fdo#109271] / [i915#2994]) +1 similar issue
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk1/igt@sysfs_clients@create.html
    - shard-tglb:         NOTRUN -> [SKIP][150] ([i915#2994]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@sysfs_clients@create.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#2994]) +2 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl4/igt@sysfs_clients@fair-7.html
    - shard-iclb:         NOTRUN -> [SKIP][152] ([i915#2994]) +2 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@split-25:
    - shard-kbl:          NOTRUN -> [SKIP][153] ([fdo#109271] / [i915#2994]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [DMESG-WARN][154] ([i915#180]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][156] ([i915#2842]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-snb:          [SKIP][158] ([fdo#109271]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb4/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [INCOMPLETE][160] ([i915#3921]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-snb2/igt@i915_selftest@live@hangcheck.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-snb2/igt@i915_selftest@live@hangcheck.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-glk:          [FAIL][162] ([i915#1888] / [i915#5138]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [FAIL][164] ([i915#4767]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-glk:          [FAIL][166] ([i915#4911]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format:
    - shard-iclb:         [INCOMPLETE][168] ([i915#5293]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][170] ([fdo#109441]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][172] ([i915#3063] / [i915#3648]) -> [FAIL][173] ([i915#232])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][174] ([i915#4525]) -> [DMESG-FAIL][175] ([i915#5614])
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [DMESG-WARN][176] ([i915#5614]) -> [SKIP][177] ([i915#4525]) +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][178] ([i915#658]) -> [SKIP][179] ([i915#588])
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-apl:          [SKIP][180] ([fdo#109271] / [i915#3777]) -> [SKIP][181] ([fdo#109271]) +2 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          [SKIP][182] ([fdo#109271] / [i915#3886]) -> [SKIP][183] ([fdo#109271]) +5 similar issues
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-iclb:         [SKIP][184] ([i915#2920]) -> [SKIP][185] ([fdo#111068] / [i915#658])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][186] ([fdo#111068] / [i915#658]) -> [SKIP][187] ([i915#2920])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [SKIP][188] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [FAIL][189] ([i915#4148])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          [SKIP][190] ([fdo#109271] / [i915#533]) -> [SKIP][191] ([fdo#109271])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][192], [FAIL][193], [FAIL][194], [FAIL][195], [FAIL][196], [FAIL][197], [FAIL][198], [FAIL][199], [FAIL][200], [FAIL][201]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl6/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl4/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl7/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl6/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl7/igt@runner@aborted.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl3/igt@runner@aborted.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl7/igt@runner@aborted.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl4/igt@runner@aborted.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl4/igt@runner@aborted.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl1/igt@runner@aborted.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl6/igt@runner@aborted.html
    - shard-apl:          ([FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl3/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl2/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl8/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl3/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl7/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl6/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl2/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl1/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl4/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl8/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl8/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112022]: https://bugs.freedesktop.org/show_bug.cgi?id=112022
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3648]: https://gitlab.freedesktop.org/drm/intel/issues/3648
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4148]: https://gitlab.freedesktop.org/drm/intel/issues/4148
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5293]: https://gitlab.freedesktop.org/drm/intel/issues/5293
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5395]: https://gitlab.freedesktop.org/drm/intel/issues/5395
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6455 -> IGTPW_7009

  CI-20190529: 20190529
  CI_DRM_11550: 56b089ae03ef8ea8ab7f474eaa70367898891ef0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7009: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/index.html
  IGT_6455: 044a22804d5145dfdefa9e0a805478f26e9e002b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/index.html

--===============6394895274810854269==
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
<tr><td><b>Series:</b></td><td>tests/i915_pm_freq_mult: New test for media =
freq factor</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103175/">https://patchwork.freedesktop.org/series/103175/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7009/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_6455_full -&gt; IGTPW_7009_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7009_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7009_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/index.=
html</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): shard-skl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7009=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@i915_pm_freq_mult@media-freq@gt0} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-rkl-2/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a></p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb2/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglu-4/igt@i915_pm_freq_mult@media-freq@gt0.h=
tml">SKIP</a></p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb5/igt@i915_pm_freq_mult@media-freq@gt0.ht=
ml">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-yti=
leccs-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-y=
tile-to-32bpp-ytileccs-downscaling.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_6455_full and IGTPW_7009_full=
:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>Statuses : 8 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy@hdmi-a-1-pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.23] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7009_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb1/igt@feature_discovery@display-2x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb8/igt@feature_discovery@display-2x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i9=
15#5327</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb8/igt@gem_ccs@block-copy-inplace.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i9=
15#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
25">i915#5325</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-snb7/igt@gem_ctx_persistence@smoketest.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@gem_ctx_sseu@invalid-args.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i91=
5#280</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb5/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl7/igt@gem_exec_balancer@parallel-keep-in-f=
ence.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5614">i915#5614</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb3/igt@gem_exec_balancer@parallel-keep-in-=
fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4525">i915#4525</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk4/i=
gt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-=
apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-glk5/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk2/=
igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-=
iclb4/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2849">i915#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
009/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl1/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_lmem_swapping@heavy-multi.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-glk4/igt@gem_lmem_swapping@heavy-multi.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gem_pxp@verify-pxp-execution-after=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +198 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb1/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo#=
109312</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb3/igt@gem_softpin@evict-snoop.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109312">fdo#=
109312</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb1/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb8/igt@gem_userptr_blits@dmabuf-unsync.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-glk4/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-glk9/ig=
t@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@gen9_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i9=
15#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/28=
56">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-hang:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-snb5/igt@i915_hangman@engine-engine-hang.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +259 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a=
>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#428=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl4/igt@i915_pm_rpm@modeset-pc8-residency-st=
ress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +171 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb7/igt@i915_pm_rpm@modeset-pc8-residency-s=
tress.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109506">fdo#109506</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_big_fb@4-tiled-addfb.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5286">i91=
5#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-glk2/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +97 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb3/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5286">i915#5286</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_big_fb@linear-16bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-glk7/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_big_fb@yf-tiled-max-hw-stride-3=
2bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D111615">fdo#111615</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb8/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl6/igt@kms_ccs@pipe-a-bad-aux-stride-y_tile=
d_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-glk7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_ccs@pipe-b-crc-primary-basic-y=
f_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-aspect-ratio:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-glk8/igt@kms_chamelium@hdmi-aspect-ratio.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb8/igt@kms_chamelium@hdmi-edid-read.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-snb2/igt@kms_chamelium@hdmi-hpd-with-enabled=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_color@pipe-b-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_color@pipe-d-ctm-negative.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
8">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/1149">i915#1149</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-deep-color:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_color@pipe-d-deep-color.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">=
i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-75:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_color_chamelium@pipe-a-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_color_chamelium@pipe-b-ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-gamma:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-apl1/igt@kms_color_chamelium@pipe-b-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_content_protection@mei_interfa=
ce.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111066">fdo#111066</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5691">i915#5691</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-512x170=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5691">i915#5691</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-glk1/igt@kms_cursor_crc@pipe-c-cursor-512x170=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5691">i915#5691</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x17=
0-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5691">i915#5691</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-512x170=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5691">i915#5691</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-snb4/igt@kms_cursor_crc@pipe-c-cursor-512x170=
-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5691">i915#5691</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3359">i915#3359</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x51=
2-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109279">fdo#109279</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +37 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-max-size-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-max-s=
ize-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-t=
oggle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl4/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-glk1/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-blt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@kms_draw_crc@draw-method-rgb565-bl=
t-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_draw_crc@draw-method-rgb565-pw=
rite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5287">i915#5287</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_dsc@basic-dsc-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3840">i91=
5#3840</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a1-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank@=
bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_flip@2x-flip-vs-rmfb-interrupt=
ible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-sh=
rfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a>) +36 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +41 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_invalid_mode@clock-too-high.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/427=
8">i915#4278</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb4/igt@kms_invalid_mode@clock-too-high.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/427=
8">i915#4278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-=
with-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_700=
9/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-b.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-=
a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7009/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspe=
nd@pipe-a-planes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +65 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-4:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
88">i915#5288</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
88">i915#5288</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-none:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb3/igt@kms_plane_lowres@pipe-a-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3536">i915#3536</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-none=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3536">i915#3536</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb1/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-b-edp-1-d=
ownscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-75@pipe-b-edp-1-downscale-with-rotation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-=
1-scaler-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb6/igt@kms_plane_scaling@scaler-with-pixel-format-unity-=
scaling@pipe-b-edp-1-scaler-with-pixel-format.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@kms=
_plane_scaling@scaler-with-pixel-format-unity-scaling@pipe-b-edp-1-scaler-w=
ith-pixel-format.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5395">i915#5395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl3/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb4/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@kms_psr@psr2_basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#=
3467</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_psr@psr2_cursor_render.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">=
fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb4/igt@kms_psr_stress_test@invalidate-primary-flip-overl=
ay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7009/shard-iclb5/igt@kms_psr_stress_test@invalidate-primary-flip-ove=
rlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb7/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb7/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009=
/shard-apl1/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_import_twice:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb2/igt@prime_nv_api@i915_nv_import_twice.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-tglb2/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-iclb6/igt@prime_vgem@fence-read-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@create:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-glk1/igt@sysfs_clients@create.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-tglb6/igt@sysfs_clients@create.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-apl4/igt@sysfs_clients@fair-7.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-iclb6/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@sysfs_clients@split-25.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7009/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard=
-apl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_700=
9/shard-snb4/igt@gem_exec_flush@basic-wb-ro-default.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-snb2/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/=
shard-snb2/igt@i915_selftest@live@hangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-glk7/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138">i915=
#5138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7009/shard-glk1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-ap=
l8/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-y=
tile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7009/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp=
-ytileccs-to-64bpp-ytile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-b-edp=
-1-downscale-with-pixel-format:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb2/igt@kms_plane_scaling@downscale-with-pixel-format-fac=
tor-0-75@pipe-b-edp-1-downscale-with-pixel-format.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5293">i915#5293</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shar=
d-iclb3/igt@kms_plane_scaling@downscale-with-pixel-format-factor-0-75@pipe-=
b-edp-1-downscale-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb1/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-=
iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3648">i915#3648</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/sh=
ard-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/232">i915#232</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_700=
9/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5614=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">=
i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7009/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#45=
25</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb1/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shar=
d-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/588">i915#588</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-h=
flip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3777">i915#3777</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl8/igt@kms_ccs@pipe-b-missing-ccs-buffer-y_tiled_gen12_rc=
_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3886">i915#3886</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7009/shard-apl3/igt@kms_ccs@pipe-b-missing-ccs-bu=
ffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/29=
20">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7009/shard-iclb6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11106=
8">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7009/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-ar=
ea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-iclb1/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> =
/ <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111=
068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7009/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4148">i915#4148</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/s=
hard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl4/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6455/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl7/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGT_6455/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl7/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGT_6455/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-kbl4/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/=
shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7009/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7009/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
009/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/sha=
rd-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7009/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-kbl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7009/shard-kbl6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#=
5257</a>)</p>
</li>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_6455/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl2/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/s=
hard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGT_6455/shard-apl3/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6455/shard-apl7/i=
gt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7009/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl1/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
09/shard-apl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7009/shard-apl8/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/shar=
d-apl8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
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
<li>IGT: IGT_6455 -&gt; IGTPW_7009</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11550: 56b089ae03ef8ea8ab7f474eaa70367898891ef0 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7009: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7009/index.htm=
l<br />
  IGT_6455: 044a22804d5145dfdefa9e0a805478f26e9e002b @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============6394895274810854269==--
