Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8288383129969931322=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nidhi Gupta" <nidhi1.gupta@intel.com>
Date: Thu, 12 May 2022 09:20:32 -0000
Message-ID: <165234723217.6459.7850026184447815949@emeril.freedesktop.org>
References: <20220512073549.5535-1-nidhi1.gupta@intel.com>
In-Reply-To: <20220512073549.5535-1-nidhi1.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fbw_=3A_IGT_cleanup?=
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

--===============8288383129969931322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw : IGT cleanup
URL   : https://patchwork.freedesktop.org/series/103917/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11638_full -> IGTPW_7083_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7083_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7083_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/index.html

Participating hosts (12 -> 8)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7083_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@legacy-engines-hostile@render:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl4/igt@gem_ctx_persistence@legacy-engines-hostile@render.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@gem_ctx_persistence@legacy-engines-hostile@render.html

  * igt@gem_spin_batch@legacy-resubmit-new@bsd:
    - shard-glk:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk9/igt@gem_spin_batch@legacy-resubmit-new@bsd.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk4/igt@gem_spin_batch@legacy-resubmit-new@bsd.html

  
Known issues
------------

  Here are the changes found in IGTPW_7083_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@feature_discovery@psr2.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - shard-apl:          NOTRUN -> [DMESG-WARN][9] ([i915#180])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl3/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hostile@bsd:
    - shard-apl:          [PASS][10] -> [FAIL][11] ([i915#2410])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-apl4/igt@gem_ctx_persistence@legacy-engines-hostile@bsd.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl4/igt@gem_ctx_persistence@legacy-engines-hostile@bsd.html

  * igt@gem_ctx_persistence@legacy-engines-mixed-process:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb7/igt@gem_ctx_persistence@legacy-engines-mixed-process.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#280])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_ctx_sseu@engines.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> [FAIL][14] ([i915#5784])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-iclb:         [PASS][15] -> [TIMEOUT][16] ([i915#3070])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb2/igt@gem_eio@unwedge-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][20] ([i915#2842]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace@vcs1:
    - shard-tglb:         [PASS][21] -> [FAIL][22] ([i915#2842])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs1.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gem_exec_fair@basic-pace@vcs1.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [PASS][23] -> [FAIL][24] ([i915#2842]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html
    - shard-glk:          [PASS][25] -> [FAIL][26] ([i915#2842]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk2/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-snb:          [PASS][27] -> [SKIP][28] ([fdo#109271]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-snb7/igt@gem_exec_flush@basic-uc-prw-default.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@gem_exec_params@no-bsd.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([i915#4613]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk8/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@random:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613]) +5 similar issues
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl7/igt@gem_lmem_swapping@random.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#284])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][37] ([i915#2658])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk5/igt@gem_pread@exhaustion.html
    - shard-apl:          NOTRUN -> [WARN][38] ([i915#2658])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl1/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb5/igt@gem_pread@exhaustion.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][41] ([i915#2658]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-tglb:         NOTRUN -> [SKIP][42] ([i915#4270]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][44] ([fdo#109271]) +297 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#768]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-glk:          NOTRUN -> [SKIP][46] ([fdo#109271]) +140 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_softpin@evict-single-offset:
    - shard-kbl:          NOTRUN -> [FAIL][47] ([i915#4171])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_softpin@evict-single-offset.html
    - shard-glk:          NOTRUN -> [FAIL][48] ([i915#4171])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk2/igt@gem_softpin@evict-single-offset.html
    - shard-apl:          NOTRUN -> [FAIL][49] ([i915#4171])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl4/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3297]) +3 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#3297]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109289]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2527] / [i915#2856]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gen9_exec_parse@allowed-single.html
    - shard-apl:          [PASS][54] -> [DMESG-WARN][55] ([i915#5566] / [i915#716])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-apl7/igt@gen9_exec_parse@allowed-single.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl4/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#454])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][59] ([fdo#109506] / [i915#2411]) +1 similar issue
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110892])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#4387])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@i915_pm_sseu@full-enable.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#4387])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb4/igt@i915_pm_sseu@full-enable.html

  * igt@i915_selftest@live@gt_lrc:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][63] ([i915#2373])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@i915_selftest@live@gt_lrc.html

  * igt@i915_selftest@live@gt_pm:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][64] ([i915#1759])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@i915_selftest@live@gt_pm.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][65] -> [DMESG-WARN][66] ([i915#180])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@i915_suspend@forcewake.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3826])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#3826])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#1769])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#1769]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-snb:          NOTRUN -> [SKIP][71] ([fdo#109271]) +300 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#5286]) +3 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5286]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111614]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#110725] / [fdo#111614]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615]) +6 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#110723]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2705])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@kms_big_joiner@basic.html
    - shard-iclb:         NOTRUN -> [SKIP][79] ([i915#2705])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][80] ([i915#3689]) +8 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#3886]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [i915#3886]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#3886]) +11 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615] / [i915#3689]) +9 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3689] / [i915#3886]) +3 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3886]) +8 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +239 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([fdo#109284] / [fdo#111827]) +13 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@hdmi-edid-read:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_chamelium@hdmi-edid-read.html

  * igt@kms_chamelium@vga-edid-read:
    - shard-apl:          NOTRUN -> [SKIP][90] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl8/igt@kms_chamelium@vga-edid-read.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][91] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-snb:          NOTRUN -> [SKIP][92] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109278] / [i915#3555])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [i915#1149])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][96] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3116] / [i915#3299]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][98] ([i915#1319])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl4/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109300])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb4/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         NOTRUN -> [SKIP][100] ([fdo#109300])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_content_protection@uevent:
    - shard-kbl:          NOTRUN -> [FAIL][101] ([i915#2105])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_content_protection@uevent.html
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#1063])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109278]) +42 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#3319]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109278] / [fdo#109279]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([fdo#109279] / [i915#3359]) +11 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#3359]) +10 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109274] / [fdo#109278])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-iclb:         [PASS][109] -> [FAIL][110] ([i915#2346])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          NOTRUN -> [FAIL][111] ([i915#2346] / [i915#533])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([i915#4103])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-rgb565-render-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#5287]) +2 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_draw_crc@draw-method-rgb565-render-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][114] ([i915#5287]) +5 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][115] -> [FAIL][116] ([i915#79])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109274]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([fdo#109274] / [fdo#111825]) +8 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-suspend@b-vga1:
    - shard-snb:          [PASS][119] -> [INCOMPLETE][120] ([i915#4839])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#2587]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][122] ([fdo#109280] / [fdo#111825]) +47 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([fdo#109280]) +31 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109289]) +2 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#533]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][126] ([fdo#109271] / [i915#533]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#533]) +1 similar issue
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl4/igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][128] ([fdo#108145] / [i915#265]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html

  * igt@kms_plane_lowres@pipe-a-tiling-yf:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#3536]) +3 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-yf.html

  * igt@kms_plane_lowres@pipe-b-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#5288]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-4.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#5288])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#3536]) +1 similar issue
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([i915#5235]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale:
    - shard-iclb:         [PASS][135] -> [SKIP][136] ([i915#5235]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb3/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([i915#5235]) +7 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][138] ([i915#2920]) +2 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#658]) +3 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][140] ([fdo#109271] / [i915#658]) +2 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([fdo#111068] / [i915#658]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271] / [i915#658])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-iclb:         [PASS][143] -> [SKIP][144] ([fdo#109441]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb2/igt@kms_psr@psr2_basic.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][145] ([fdo#109441]) +2 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][146] ([i915#132] / [i915#3467]) +4 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [PASS][147] -> [SKIP][148] ([i915#5519])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][149] ([i915#5030]) +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][150] ([i915#5030]) +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][151] ([i915#3555]) +2 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][152] ([IGT#2])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl1/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][153] ([IGT#2])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_sysfs_edid_timing.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][154] ([i915#180]) +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][155] ([i915#3555]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][156] ([fdo#109271] / [i915#2437])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-tglb:         NOTRUN -> [SKIP][157] ([i915#2437])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][158] ([i915#2530]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][159] ([i915#2530]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@prime_nv_pcopy@test1_macro:
    - shard-tglb:         NOTRUN -> [SKIP][160] ([fdo#109291]) +6 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html

  * igt@prime_nv_test@nv_i915_sharing:
    - shard-iclb:         NOTRUN -> [SKIP][161] ([fdo#109291]) +4 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@prime_nv_test@nv_i915_sharing.html

  * igt@prime_vgem@fence-write-hang:
    - shard-iclb:         NOTRUN -> [SKIP][162] ([fdo#109295])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@prime_vgem@fence-write-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][163] ([fdo#109295])
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@busy:
    - shard-tglb:         NOTRUN -> [SKIP][164] ([i915#2994]) +3 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@sysfs_clients@busy.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][165] ([fdo#109271] / [i915#2994]) +3 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][166] ([i915#2994])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@sysfs_clients@recycle-many.html

  
#### Possible fixes ####

  * igt@gem_eio@suspend:
    - shard-snb:          [INCOMPLETE][167] -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-snb6/igt@gem_eio@suspend.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb7/igt@gem_eio@suspend.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [FAIL][169] ([i915#2842]) -> [PASS][170] +2 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][171] ([i915#2842]) -> [PASS][172] +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][173] ([i915#2842]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [SKIP][175] ([fdo#109271]) -> [PASS][176] +3 similar issues
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-iclb:         [FAIL][177] ([i915#454]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_selftest@live@gt_pm:
    - {shard-tglu}:       [DMESG-FAIL][179] ([i915#3987]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglu-8/igt@i915_selftest@live@gt_pm.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglu-6/igt@i915_selftest@live@gt_pm.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-iclb:         [FAIL][181] ([i915#5072]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][183] ([i915#4767]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][185] ([i915#79]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip@flip-vs-suspend@a-dp1:
    - shard-apl:          [DMESG-WARN][187] ([i915#180]) -> [PASS][188] +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-iclb:         [SKIP][189] ([i915#3701]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [FAIL][191] ([i915#4911]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-glk6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_lease@lease_revoke:
    - {shard-tglu}:       [WARN][193] -> [PASS][194] +1 similar issue
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglu-1/igt@kms_lease@lease_revoke.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglu-5/igt@kms_lease@lease_revoke.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-kbl:          [DMESG-WARN][195] ([i915#180]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][197] ([fdo#109441]) -> [PASS][198] +1 similar issue
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][199] ([i915#5784]) -> [TIMEOUT][200] ([i915#3063])
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][201] ([i915#4525]) -> [DMESG-WARN][202] ([i915#5614])
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [DMESG-WARN][203] ([i915#5614]) -> [SKIP][204] ([i915#4525]) +1 similar issue
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][205] ([i915#4525]) -> [DMESG-FAIL][206] ([i915#5614])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         [FAIL][207] ([i915#2842]) -> [FAIL][208] ([i915#2852])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232]) ([i915#180] / [i915#4312] / [i915#5257])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl3/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl7/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl4/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl3/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html
    - shard-tglb:         ([FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243]) ([i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251]) ([i915#4312] / [i915#5257])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb7/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb8/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb5/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb7/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb3/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb6/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb5/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb6/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb8/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb5/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb8/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1759]: https://gitlab.freedesktop.org/drm/intel/issues/1759
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#2105]: https://gitlab.freedesktop.org/drm/intel/issues/2105
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2373]: https://gitlab.freedesktop.org/drm/intel/issues/2373
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2852]: https://gitlab.freedesktop.org/drm/intel/issues/2852
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3987]: https://gitlab.freedesktop.org/drm/intel/issues/3987
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4839]: https://gitlab.freedesktop.org/drm/intel/issues/4839
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5072]: https://gitlab.freedesktop.org/drm/intel/issues/5072
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6471 -> IGTPW_7083
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11638: cbc8debff0e9aa1c100f5523aff24e0115a77a27 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7083: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/index.html
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/index.html

--===============8288383129969931322==
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
<tr><td><b>Series:</b></td><td>tests/kms_bw : IGT cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/103917/">https://patchwork.freedesktop.org/series/103917/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7083/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11638_full -&gt; IGTPW_7083_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7083_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7083_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/index.=
html</p>
<h2>Participating hosts (12 -&gt; 8)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7083=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@render:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl4/igt@gem_ctx_persistence@legacy-engines-hostile@ren=
der.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7083/shard-kbl1/igt@gem_ctx_persistence@legacy-engines-hostile@rend=
er.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_spin_batch@legacy-resubmit-new@bsd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-glk9/igt@gem_spin_batch@legacy-resubmit-new@bsd.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_708=
3/shard-glk4/igt@gem_spin_batch@legacy-resubmit-new@bsd.html">INCOMPLETE</a=
></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7083_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb3/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl3/igt@gem_ctx_isolation@preservation-s3@v=
cs0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hostile@bsd:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-apl4/igt@gem_ctx_persistence@legacy-engines-hostile@bsd=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7083/shard-apl4/igt@gem_ctx_persistence@legacy-engines-hostile@bsd.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
0">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed-process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-snb7/igt@gem_ctx_persistence@legacy-engines-=
mixed-process.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gem_eio@kms.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb8/i=
gt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3070">i915#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl7/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-=
tglb8/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11638/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-k=
bl4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +3 similar issu=
es</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11638/shard-glk4/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-g=
lk2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +2 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-snb7/igt@gem_exec_flush@basic-uc-prw-default.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/s=
hard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb8/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-glk8/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl7/igt@gem_lmem_swapping@random.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb6/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-glk5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-apl1/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_pxp@protected-raw-src-copy-not-=
readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +297 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb5/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-glk7/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a>) +140 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl4/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-glk2/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-apl4/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3297">i915#3297</a>) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb3/igt@gem_userptr_blits@unsync-unmap-cycl=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3297">i915#3297</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@gen9_exec_parse@allowed-single.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11638/shard-apl7/igt@gen9_exec_parse@allowed-single.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-a=
pl4/igt@gen9_exec_parse@allowed-single.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@i915_pm_rpm@dpms-mode-unset-non-lp=
sp.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892=
">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb4/igt@i915_pm_sseu@full-enable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i915=
#4387</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_lrc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@i915_selftest@live@gt_lrc.html">DM=
ESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/23=
73">i915#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@i915_selftest@live@gt_pm.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/175=
9">i915#1759</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl6/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt=
@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_atomic_transition@plane-all-mo=
deset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-snb4/igt@kms_big_fb@4-tiled-8bpp-rotate-0.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a>) +300 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_big_fb@4-tiled-8bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
86">i915#5286</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111615">fdo#111615</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb8/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl3/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +11 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_ccs@pipe-a-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl1/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl2/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a>) +239 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@kms_chamelium@dp-hpd-storm.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_chamelium@hdmi-edid-read.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl8/igt@kms_chamelium@vga-edid-read.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +22 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-snb4/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +15 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_color@pipe-b-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb6/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_content_protection@dp-mst-lic-=
type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3299">i915#3299</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl4/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb4/igt@kms_content_protection@mei_interfac=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_content_protection@mei_interfac=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109300">fdo#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_content_protection@uevent.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2105">=
i915#2105</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_content_protection@uevent.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-32x10=
-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>) +42 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_cursor_legacy@cursorb-vs-flipb=
-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7083/shard-iclb7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-tra=
nsitions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor-at=
omic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb3/igt@kms_draw_crc@draw-method-rgb565-re=
nder-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-render-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb21010=
10-render-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@bc-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7083/shard-glk3/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_flip@2x-plain-flip.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#=
109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1118=
25">fdo#111825</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-vga1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard=
-snb6/igt@kms_flip@flip-vs-suspend@b-vga1.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4839">i915#4839</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +47 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_pipe_b_c_ivb@enable-pipe-c-whi=
le-b-has-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-afte=
r-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/533">i915#533</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_pipe_crc_basic@nonblocking-crc-p=
ipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-apl4/igt@kms_pipe_crc_basic@nonblocking-crc-p=
ipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-yf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_plane_lowres@pipe-a-tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3536">i915#3536</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_plane_lowres@pipe-b-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_plane_lowres@pipe-b-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_plane_lowres@pipe-c-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-d=
ownscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1-planes-do=
wnscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb3/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1-planes-downscale.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_plane_scaling@p=
lanes-downscale-factor-0-5@pipe-a-edp-1-planes-downscale.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb3/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@kms_psr2_sf@cursor-plane-update-sf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2920">i915#2920</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb7/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-glk1/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb2/igt@kms_psr@psr2_basic.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@k=
ms_psr@psr2_basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglb2/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7083/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb8/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb2/igt@kms_setmode@basic-clone-single-crt=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-apl1/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl7/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@kms_vblank@pipe-a-ts-continuation-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl6/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb6/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb5/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb8/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test1_macro:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@prime_nv_pcopy@test1_macro.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">=
fdo#109291</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@nv_i915_sharing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb7/igt@prime_nv_test@nv_i915_sharing.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-iclb2/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb7/igt@prime_vgem@fence-write-hang.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">=
fdo#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@busy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@sysfs_clients@busy.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2994=
</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@sysfs_clients@recycle-many.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-snb6/igt@gem_eio@suspend.html">INCOMPLETE</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-snb7/igt@=
gem_eio@suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/s=
hard-kbl4/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7083/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
083/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7083/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb=
.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb=
1/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_pm:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglu-8/igt@i915_selftest@live@gt_pm.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3987">i915#39=
87</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_708=
3/shard-tglu-6/igt@i915_selftest@live@gt_pm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5072"=
>i915#5072</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7083/shard-iclb2/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard=
-kbl1/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-glk6/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7083/shard-glk4/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-apl3/igt@kms_flip@flip-vs-suspend@a-dp1.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
083/shard-apl2/igt@kms_flip@flip-vs-suspend@a-dp1.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-iclb1/igt@kms_flip_scaled_crc@fl=
ip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7083/shard-glk6/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_revoke:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglu-1/igt@kms_lease@lease_revoke.html">WARN</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglu-5=
/igt@kms_lease@lease_revoke.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7083/shard-kbl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
83/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a> +1 similar=
 issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglb5/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-t=
glb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7083/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5614">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7083/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4525">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7083/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-iclb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7083/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2852">i915#2852</a>=
)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11638/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl6/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11638/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1638/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1163=
8/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11638/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shar=
d-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7083/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl7/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7083/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
083/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl4/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/sha=
rd-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-kbl6=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915=
#5257</a>)</p>
</li>
<li>
<p>shard-tglb:         (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11638/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb8/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11638/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11638/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb6/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11638/shard-tglb5/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb6/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_=
DRM_11638/shard-tglb8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11638/shard-tglb5/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11638/shard-tglb8/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-=
tglb7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7083/shard-tglb5/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb8=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7083/shard-tglb7/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@=
runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7083/shard-tglb3/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/shard-tglb2/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7083/shard-tglb6/igt@runner@aborted.html">FAIL</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)<=
/p>
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
<li>IGT: IGT_6471 -&gt; IGTPW_7083</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11638: cbc8debff0e9aa1c100f5523aff24e0115a77a27 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7083: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7083/index.htm=
l<br />
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8288383129969931322==--
