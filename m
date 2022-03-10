Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9042715197610935666=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomeu Vizoso" <tomeu.vizoso@collabora.com>
Date: Thu, 10 Mar 2022 13:15:34 -0000
Message-ID: <164691813407.17007.3393457961177103040@emeril.freedesktop.org>
References: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
In-Reply-To: <20220310073800.22067-1-tomeu.vizoso@collabora.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUnVuIENJ?=
 =?utf-8?q?_on_Qualcomm_devices_=28rev2=29?=
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

--===============9042715197610935666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Run CI on Qualcomm devices (rev2)
URL   : https://patchwork.freedesktop.org/series/101195/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11347_full -> IGTPW_6770_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6770_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6770_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/index.html

Participating hosts (13 -> 7)
------------------------------

  Missing    (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6770_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_whisper@basic-fds-forked-all:
    - shard-apl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_setmode@basic@pipe-b-vga-1}:
    - shard-snb:          [FAIL][2] ([i915#31]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-snb7/igt@kms_setmode@basic@pipe-b-vga-1.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb5/igt@kms_setmode@basic@pipe-b-vga-1.html

  
Known issues
------------

  Here are the changes found in IGTPW_6770_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-apl:          NOTRUN -> [SKIP][4] ([fdo#109271]) +235 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@feature_discovery@display-4x.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][5] ([fdo#109271] / [i915#1099])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@invalid-args:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#280])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [FAIL][7] ([i915#232]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][8] ([i915#5076]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][9] -> [SKIP][10] ([i915#4525])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][11] ([i915#5076])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@gem_exec_balancer@parallel-contexts.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][12] ([i915#5076])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-iclb:         [PASS][13] -> [FAIL][14] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][15] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][16] ([i915#2842])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-tglb:         NOTRUN -> [FAIL][17] ([i915#2842]) +11 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2851])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-apl:          [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_params@no-vebox:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109283] / [i915#4877])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@gem_exec_params@no-vebox.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][26] ([fdo#109271] / [i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][27] ([fdo#109271] / [i915#2190])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi:
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#4613])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          NOTRUN -> [SKIP][29] ([fdo#109271] / [i915#4613]) +2 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl7/igt@gem_lmem_swapping@random.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#4270]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4270]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271]) +159 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-tglb:         NOTRUN -> [SKIP][33] ([fdo#109312])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@create-destroy-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#3297]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_userptr_blits@create-destroy-unsync.html

  * igt@gem_userptr_blits@unsync-overlap:
    - shard-iclb:         NOTRUN -> [SKIP][35] ([i915#3297])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html

  * igt@gen7_exec_parse@basic-allocation:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([fdo#109289])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@gen7_exec_parse@basic-allocation.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#2856]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#2527] / [i915#2856]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][39] ([i915#454])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-iclb:         [PASS][40] -> [SKIP][41] ([i915#4281])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([fdo#111644] / [i915#1397] / [i915#2411])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([fdo#110892])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          NOTRUN -> [SKIP][44] ([fdo#109271]) +130 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#4387])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-iclb:         [PASS][46] -> [DMESG-WARN][47] ([i915#2867]) +6 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb6/igt@i915_selftest@live@gt_lrc.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb8/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          NOTRUN -> [DMESG-WARN][48] ([i915#180])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-glk:          NOTRUN -> [FAIL][49] ([i915#2521])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#1769])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#5286]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#5286]) +8 similar issues
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#111614]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][55] ([fdo#109271] / [i915#3777]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3777]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-glk:          NOTRUN -> [SKIP][57] ([fdo#109271] / [i915#3777])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111615]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110723])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][60] ([fdo#109271] / [i915#3886]) +10 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][61] ([fdo#109271] / [i915#3886]) +8 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3689] / [i915#3886]) +3 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3689]) +7 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([fdo#111615] / [i915#3689]) +5 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#3886]) +5 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#3742])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> [SKIP][68] ([i915#3742]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][69] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@kms_chamelium@vga-hpd.html
    - shard-tglb:         NOTRUN -> [SKIP][70] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@kms_chamelium@vga-hpd.html
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-gamma:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#109278] / [i915#1149])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_color@pipe-d-gamma.html

  * igt@kms_color_chamelium@pipe-a-degamma:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +6 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3116])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-tglb:         NOTRUN -> [SKIP][77] ([i915#3116] / [i915#3299])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-apl:          NOTRUN -> [TIMEOUT][78] ([i915#1319])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109278] / [fdo#109279]) +1 similar issue
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([fdo#109279] / [i915#3359]) +6 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([i915#3359]) +9 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#4103])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@pipe-d-single-move:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278]) +23 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109274]) +4 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([i915#5287]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#5287]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
    - shard-glk:          [PASS][89] -> [FAIL][90] ([i915#5160])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109274] / [fdo#111825] / [i915#3966])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:
    - shard-glk:          NOTRUN -> [FAIL][92] ([i915#79])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109280]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][94] ([fdo#109280] / [fdo#111825]) +29 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
    - shard-glk:          NOTRUN -> [SKIP][95] ([fdo#109271]) +68 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#3555])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][97] ([i915#3555])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([i915#1839])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [PASS][99] -> [DMESG-WARN][100] ([i915#180] / [i915#1982])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          NOTRUN -> [FAIL][101] ([fdo#108145] / [i915#265]) +2 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-glk:          NOTRUN -> [FAIL][102] ([i915#265])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-apl:          NOTRUN -> [FAIL][103] ([i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][104] ([i915#265])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][105] ([fdo#108145] / [i915#265])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-kbl:          NOTRUN -> [FAIL][106] ([fdo#108145] / [i915#265]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_lowres@pipe-a-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#5288])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-none:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([i915#3536])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_plane_lowres@pipe-d-tiling-none.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([i915#5176]) +1 similar issue
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-kbl:          NOTRUN -> [SKIP][111] ([fdo#109271] / [i915#658]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#658])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#111068] / [i915#658]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#2920]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][115] ([i915#132] / [i915#3467]) +3 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][116] -> [SKIP][117] ([fdo#109441]) +1 similar issue
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109441]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][119] ([fdo#109271] / [i915#533])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@nouveau_crc@pipe-c-source-outp-complete:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#2530]) +3 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@nouveau_crc@pipe-c-source-outp-complete.html
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#2530]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@nouveau_crc@pipe-c-source-outp-complete.html

  * igt@perf@mi-rpc:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109289]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@perf@mi-rpc.html

  * igt@prime_nv_api@i915_self_import:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291]) +6 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@prime_nv_api@i915_self_import.html

  * igt@prime_udl:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109291]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb1/igt@prime_udl.html

  * igt@prime_vgem@fence-flip-hang:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([fdo#109295])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@prime_vgem@fence-flip-hang.html

  * igt@syncobj_timeline@transfer-timeline-point:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][126] ([i915#5098])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@syncobj_timeline@transfer-timeline-point.html

  * igt@sysfs_clients@fair-3:
    - shard-tglb:         NOTRUN -> [SKIP][127] ([i915#2994]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@fair-7:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([i915#2994])

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/index.html

--===============9042715197610935666==
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
<tr><td><b>Series:</b></td><td>Run CI on Qualcomm devices (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101195/">https://patchwork.freedesktop.org/series/101195/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11347_full -&gt; IGTPW_6770_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6770_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6770_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/index.html</p>
<h2>Participating hosts (13 -&gt; 7)</h2>
<p>Missing    (6): pig-kbl-iris shard-tglu pig-glk-j5005 pig-skl-6260u shard-rkl shard-dg1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6770_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_exec_whisper@basic-fds-forked-all:<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@gem_exec_whisper@basic-fds-forked-all.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_setmode@basic@pipe-b-vga-1}:<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-snb7/igt@kms_setmode@basic@pipe-b-vga-1.html">FAIL</a> ([i915#31]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb5/igt@kms_setmode@basic@pipe-b-vga-1.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6770_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@feature_discovery@display-4x.html">SKIP</a> ([fdo#109271]) +235 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed-process.html">SKIP</a> ([fdo#109271] / [i915#1099])</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_ctx_sseu@invalid-args.html">SKIP</a> ([i915#280])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> ([i915#232]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@gem_exec_balancer@parallel.html">DMESG-WARN</a> ([i915#5076]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> ([i915#4525])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> ([i915#2842]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-kbl7/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2851])</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-apl1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk4/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk7/igt@gem_lmem_swapping@heavy-verify-multi.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl7/igt@gem_lmem_swapping@random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb2/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([fdo#109271]) +159 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@create-destroy-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gem_userptr_blits@create-destroy-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-overlap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@gem_userptr_blits@unsync-overlap.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-allocation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@gen7_exec_parse@basic-allocation.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@gen9_exec_parse@bb-start-far.html">SKIP</a> ([i915#2856]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@gen9_exec_parse@bb-start-out.html">SKIP</a> ([i915#2527] / [i915#2856]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb4/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> ([fdo#109271]) +130 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([i915#4387])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb6/igt@i915_selftest@live@gt_lrc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb8/igt@i915_selftest@live@gt_lrc.html">DMESG-WARN</a> ([i915#2867]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> ([i915#2521])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> ([i915#5286]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> ([i915#5286]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl4/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb5/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb5/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +16 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +13 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_chamelium@vga-hpd.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-snb7/igt@kms_chamelium@vga-hpd-without-ddc.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-gamma:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_color@pipe-d-gamma.html">SKIP</a> ([fdo#109278] / [i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_color_chamelium@pipe-a-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> ([i915#3116] / [i915#3299])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_content_protection@srm.html">TIMEOUT</a> ([i915#1319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html">SKIP</a> ([i915#3359]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> ([i915#4103])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#111825]) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-single-move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_cursor_legacy@pipe-d-single-move.html">SKIP</a> ([fdo#109278]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> ([fdo#109274]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html">SKIP</a> ([i915#5287]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-4tiled.html">SKIP</a> ([i915#5287]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-xtiled:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-glk1/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-render-xtiled.html">FAIL</a> ([i915#5160])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> ([fdo#109274] / [fdo#111825] / [i915#3966])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk9/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a2.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#109280]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> ([fdo#109280] / [fdo#111825]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk1/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html">SKIP</a> ([fdo#109271]) +68 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> ([i915#3555])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> ([i915#1839])</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html">DMESG-WARN</a> ([i915#180] / [i915#1982])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk8/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl4/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl3/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk4/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl4/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@kms_plane_lowres@pipe-a-tiling-4.html">SKIP</a> ([i915#5288])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-none:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@kms_plane_lowres@pipe-d-tiling-none.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html">SKIP</a> ([i915#5176]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl8/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> ([fdo#109271] / [i915#658])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([fdo#111068] / [i915#658]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> ([i915#2920]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@kms_psr@psr2_basic.html">FAIL</a> ([i915#132] / [i915#3467]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11347/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_psr@psr2_no_drrs.html">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> ([fdo#109271] / [i915#533])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-source-outp-complete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb6/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb4/igt@nouveau_crc@pipe-c-source-outp-complete.html">SKIP</a> ([i915#2530]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb3/igt@perf@mi-rpc.html">SKIP</a> ([fdo#109289]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_self_import:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@prime_nv_api@i915_self_import.html">SKIP</a> ([fdo#109291]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-iclb1/igt@prime_udl.html">SKIP</a> ([fdo#109291]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-flip-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb8/igt@prime_vgem@fence-flip-hang.html">SKIP</a> ([fdo#109295])</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@transfer-timeline-point:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-apl2/igt@syncobj_timeline@transfer-timeline-point.html">DMESG-FAIL</a> ([i915#5098])</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6770/shard-tglb2/igt@sysfs_clients@fair-3.html">SKIP</a> ([i915#2994]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; [SKIP][128] ([i915#2994])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============9042715197610935666==--
