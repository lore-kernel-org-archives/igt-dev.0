Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6931530151638430733=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>
Date: Tue, 17 May 2022 17:24:23 -0000
Message-ID: <165280826392.31031.12484689086886326289@emeril.freedesktop.org>
References: <20220516150824.3535-1-jeevan.b@intel.com>
In-Reply-To: <20220516150824.3535-1-jeevan.b@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2lu?=
 =?utf-8?q?tel=5Fbatchbuffer=3A_Fix_typo_from_src=5Ftiling_to_dst=5Ftiling?=
 =?utf-8?q?_=28rev2=29?=
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

--===============6931530151638430733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/intel_batchbuffer: Fix typo from src_tiling to dst_tiling (rev2)
URL   : https://patchwork.freedesktop.org/series/104031/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11665_full -> IGTPW_7123_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7123_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7123_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7123_full:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_color@pipe-c-deep-color:
    - shard-tglb:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_color@pipe-c-deep-color.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_schedule@u-semaphore-user:
    - {shard-rkl}:        [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@gem_exec_schedule@u-semaphore-user.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-5/igt@gem_exec_schedule@u-semaphore-user.html

  * igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
    - {shard-dg1}:        [SKIP][6] ([fdo#111827]) -> [SKIP][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-dg1-15/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-19/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - {shard-dg1}:        NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-19/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * {igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1}:
    - shard-tglb:         NOTRUN -> [SKIP][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html

  * {igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1}:
    - {shard-tglu}:       NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_lease@possible-crtcs-filtering:
    - {shard-dg1}:        [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-dg1-17/igt@kms_lease@possible-crtcs-filtering.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-19/igt@kms_lease@possible-crtcs-filtering.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier:
    - {shard-dg1}:        NOTRUN -> [SKIP][13] +4 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-15/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier.html

  * igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled:
    - {shard-rkl}:        [PASS][14] -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-5/igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled.html

  
Known issues
------------

  Here are the changes found in IGTPW_7123_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([i915#1839])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@feature_discovery@display-4x.html

  * igt@gem_ccs@block-copy-inplace:
    - shard-tglb:         NOTRUN -> [SKIP][17] ([i915#3555] / [i915#5325]) +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_ccs@block-copy-inplace.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-iclb:         NOTRUN -> [SKIP][18] ([i915#5327])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_ccs@suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][19] ([i915#5325])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@gem_ccs@suspend-resume.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#1099])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb4/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_eio@kms:
    - shard-tglb:         NOTRUN -> [FAIL][21] ([i915#5784])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@gem_eio@kms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         NOTRUN -> [TIMEOUT][22] ([i915#3063]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][24] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#2842]) +2 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-kbl:          [PASS][26] -> [FAIL][27] ([i915#2842]) +1 similar issue
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [PASS][30] -> [FAIL][31] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk3/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#109313])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-snb:          [PASS][33] -> [SKIP][34] ([fdo#109271]) +3 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#112283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@basic:
    - shard-apl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#4613]) +1 similar issue
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl8/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-kbl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613]) +5 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_lmem_swapping@verify:
    - shard-iclb:         NOTRUN -> [SKIP][38] ([i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@gem_lmem_swapping@verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4613]) +5 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_pxp@reject-modify-context-protection-off-1:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#4270]) +4 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_pxp@reject-modify-context-protection-off-1.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][41] ([i915#4270]) +4 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#768])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][43] ([fdo#109271] / [i915#3323])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#3297]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][45] ([i915#3297]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-iclb:         NOTRUN -> [FAIL][46] ([i915#3318])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@gem_userptr_blits@vma-merge.html
    - shard-kbl:          NOTRUN -> [FAIL][47] ([i915#3318])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@gem_userptr_blits@vma-merge.html
    - shard-tglb:         NOTRUN -> [FAIL][48] ([i915#3318])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109289]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109289]) +7 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([i915#2527] / [i915#2856]) +2 similar issues
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109293] / [fdo#109506])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([fdo#109506] / [i915#2411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-snb:          NOTRUN -> [SKIP][54] ([fdo#109271]) +90 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([fdo#111644] / [i915#1397] / [i915#2411])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#4387])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#109302])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109302])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@i915_query@query-topology-unsupported.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglb:         NOTRUN -> [SKIP][59] ([i915#5723])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@i915_query@test-query-geometry-subslices.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          [PASS][60] -> [DMESG-WARN][61] ([i915#180])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl3/igt@i915_suspend@forcewake.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@i915_suspend@forcewake.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#5286]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#5286]) +9 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-glk:          NOTRUN -> [SKIP][64] ([fdo#109271]) +53 similar issues
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([fdo#111614]) +5 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111615]) +7 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271]) +150 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [SKIP][69] ([fdo#110723])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#2705])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#2705])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][72] ([fdo#109271] / [i915#3886]) +6 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-kbl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +10 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689] / [i915#3886]) +4 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615] / [i915#3689]) +14 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([fdo#109278] / [i915#3886]) +4 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3689]) +4 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk4/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +13 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.html
    - shard-apl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl8/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [i915#1149])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-5:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109284] / [fdo#111827]) +20 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-snb:          NOTRUN -> [SKIP][86] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][87] ([i915#1319])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][88] ([i915#1319])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl4/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content_type_change:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#1063])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#3116])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3116] / [i915#3299]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3359]) +13 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#3319]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278] / [fdo#109279])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-suspend:
    - shard-apl:          NOTRUN -> [DMESG-WARN][95] ([i915#180]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109278]) +16 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109279] / [i915#3359]) +9 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109274] / [fdo#109278])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [PASS][99] -> [FAIL][100] ([i915#2346] / [i915#533])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#4103]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#426])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#5287])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#5287]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109274] / [fdo#111825] / [i915#3966])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][106] -> [FAIL][107] ([i915#2122])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109274] / [fdo#111825]) +14 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#109274]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#2587]) +1 similar issue
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#2587])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([i915#3701])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109280]) +18 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#109280] / [fdo#111825]) +59 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +251 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#533])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html
    - shard-apl:          NOTRUN -> [SKIP][118] ([fdo#109271] / [i915#533])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-apl:          [PASS][119] -> [DMESG-WARN][120] ([i915#180]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][121] ([fdo#108145] / [i915#265])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][122] ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#3536])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-y.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([i915#3536]) +5 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([fdo#111615] / [fdo#112054]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-c-edp-1-downscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#5176]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-c-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][127] ([i915#5235]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#5235]) +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [PASS][129] -> [SKIP][130] ([i915#5176]) +1 similar issue
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#5176]) +7 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-with-rotation.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-kbl:          NOTRUN -> [SKIP][132] ([fdo#109271] / [i915#658]) +1 similar issue
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#2920])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#1911])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-apl:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#658])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][136] ([i915#132] / [i915#3467]) +5 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][137] -> [SKIP][138] ([fdo#109441])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#109441])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#5289])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([fdo#111615] / [i915#5289])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-iclb:         NOTRUN -> [SKIP][142] ([i915#3555]) +1 similar issue
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][143] ([IGT#2])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][144] ([IGT#2])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][145] ([i915#3555]) +2 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_vrr@flip-basic.html

  * igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([i915#2530])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@nouveau_crc@ctx-flip-threshold-reset-after-capture.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([i915#2530]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@prime_nv_api@nv_i915_import_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][148] ([fdo#109291]) +3 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-tglb:         NOTRUN -> [SKIP][149] ([fdo#109291]) +8 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@prime_nv_pcopy@test3_2.html

  * igt@syncobj_timeline@invalid-transfer-non-existent-point:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][150] ([i915#5098])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][151] ([i915#5098])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][152] ([i915#5098])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@syncobj_timeline@invalid-transfer-non-existent-point.html

  * igt@sysfs_clients@fair-0:
    - shard-tglb:         NOTRUN -> [SKIP][153] ([i915#2994]) +3 similar issues
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@fair-3:
    - shard-kbl:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#2994]) +3 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl3/igt@sysfs_clients@fair-3.html
    - shard-apl:          NOTRUN -> [SKIP][155] ([fdo#109271] / [i915#2994])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl4/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle:
    - shard-iclb:         NOTRUN -> [SKIP][156] ([i915#2994])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@sysfs_clients@recycle.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][157] ([i915#2582]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@fbdev@unaligned-write.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-apl:          [DMESG-WARN][159] ([i915#180]) -> [PASS][160] +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][161] ([i915#5784]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-dg1-12/igt@gem_eio@reset-stress.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-19/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][163] ([i915#2846]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - {shard-tglu}:       [FAIL][165] ([i915#2842]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - {shard-rkl}:        [FAIL][167] ([i915#2842]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - {shard-rkl}:        ([FAIL][169], [PASS][170]) ([i915#2842]) -> [PASS][171]
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-kbl:          [FAIL][172] ([i915#2842]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][174] ([i915#2849]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-set-default:
    - shard-snb:          [SKIP][176] ([fdo#109271]) -> [PASS][177] +1 similar issue
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-tglb:         [INCOMPLETE][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-tglb8/igt@gem_exec_whisper@basic-fds-priority-all.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_exec_whisper@basic-queues-all:
    - shard-glk:          [DMESG-WARN][180] ([i915#118]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
    - {shard-rkl}:        [INCOMPLETE][182] ([i915#5080]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][184] ([i915#644]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - {shard-rkl}:        [SKIP][186] ([fdo#109308]) -> [PASS][187] +1 similar issue
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-2/igt@i915_pm_rpm@drm-resources-equal.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_rpm@modeset-lpsp-stress:
    - {shard-rkl}:        [SKIP][188] ([i915#1397]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:
    - {shard-rkl}:        [SKIP][190] ([i915#1845] / [i915#4098]) -> [PASS][191] +11 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - {shard-rkl}:        [SKIP][192] ([fdo#112022] / [i915#4070]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:
    - {shard-rkl}:        [SKIP][194] ([i915#1849] / [i915#4070] / [i915#4098]) -> [PASS][195] +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {shard-rkl}:        [SKIP][196] ([fdo#111825] / [i915#4070]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@pipe-c-forked-move:
    - {shard-rkl}:        [SKIP][198] ([i915#4070]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-forked-move.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-forked-move.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:
    - {shard-rkl}:        [SKIP][200] ([fdo#111314] / [i915#4098] / [i915#4369]) -> [PASS][201] +3 similar issues
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled.html

  * igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a:
    - shard-tglb:         [FAIL][202] ([i915#1385]) -> [PASS][203] +3 similar issues
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-tglb7/igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-kbl:          [FAIL][204] ([i915#79]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - {shard-rkl}:        [SKIP][206] ([i915#1849] / [i915#4098]) -> [PASS][207] +16 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-kbl:          [DMESG-WARN][208] ([i915#180]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@no_drrs:
    - {shard-rkl}:        [SKIP][210] ([i915#1072]) -> [PASS][211] +2 similar issues
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-5/igt@kms_psr@no_drrs.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_psr@no_drrs.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         [SKIP][212] ([fdo#109441]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][214] ([i915#5519]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:
    - {shard-rkl}:        [SKIP][216] ([i915#1845] / [i915#4070] / [i915#4098]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-b.html

  * igt@perf@stress-open-close:
    - shard-glk:          [INCOMPLETE][218] ([i915#5213]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk5/igt@perf@stress-open-close.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk1/igt@perf@stress-open-close.html

  * igt@prime_vgem@basic-fence-flip:
    - {shard-rkl}:        [SKIP][220] ([i915#3708] / [i915#4098]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - {shard-dg1}:        [FAIL][222] ([i915#1755]) -> [PASS][223] +4 similar issues
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-dg1-16/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg1-13/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [DMESG-WARN][224] ([i915#5614]) -> [SKIP][225] ([i915#4525])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb2/igt@gem_exec_balancer@parallel.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [SKIP][226] ([i915#4525]) -> [DMESG-WARN][227] ([i915#5614]) +1 similar issue
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [FAIL][228] ([i915#4767]) -> [INCOMPLETE][229] ([i915#180])
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
    - shard-glk:          [SKIP][230] ([fdo#109271]) -> [SKIP][231] ([fdo#109271] / [i915#1888])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-glk4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-iclb:         [SKIP][232] ([fdo#111068] / [i915#658]) -> [SKIP][233] ([i915#2920])
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][248], [FAIL][249], [FAIL][250], [FAIL][251], [FAIL][252], [FAIL][253], [FAIL][254], [FAIL][255], [FAIL][256], [FAIL][257], [FAIL][258]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#92])
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl3/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl1/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl4/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl3/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl4/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl4/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@aborted.html
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@aborted.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@runner@aborted.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@aborted.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@aborted.html
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@runner@aborted.html

  
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
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
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
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1385]: https://gitlab.freedesktop.org/drm/intel/issues/1385
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2029]: https://gitlab.freedesktop.org/drm/intel/issues/2029
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
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
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3810]: https://gitlab.freedesktop.org/drm/intel/issues/3810
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4241]: https://gitlab.freedesktop.org/drm/intel/issues/4241
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4886]: https://gitlab.freedesktop.org/drm/intel/issues/4886
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4904]: https://gitlab.freedesktop.org/drm/intel/issues/4904
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5080]: https://gitlab.freedesktop.org/drm/intel/issues/5080
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5264]: https://gitlab.freedesktop.org/drm/intel/issues/5264
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5303]: https://gitlab.freedesktop.org/drm/intel/issues/5303
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5721]: https://gitlab.freedesktop.org/drm/intel/issues/5721
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5857]: https://gitlab.freedesktop.org/drm/intel/issues/5857
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6476 -> IGTPW_7123
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11665: 685b5d812e88829c72fcb4e72af28e3bef107209 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/index.html
  IGT_6476: 08aa9296163b94cf4c529fc890ae3e90e21c3cdb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/index.html

--===============6931530151638430733==
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
<tr><td><b>Series:</b></td><td>lib/intel_batchbuffer: Fix typo from src_til=
ing to dst_tiling (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/104031/">https://patchwork.freedesktop.org/series/104031/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7123/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11665_full -&gt; IGTPW_7123_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7123_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7123_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7123=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-snb7/igt@i915_module_load@reload-with-fault-injection.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7123/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">D=
MESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_color@pipe-c-deep-color.html">=
SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_schedule@u-semaphore-user:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@gem_exec_schedule@u-semaphore-user.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/s=
hard-rkl-5/igt@gem_exec_schedule@u-semaphore-user.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-dg1-15/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1827">fdo#111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7123/shard-dg1-19/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-dg1-19/igt@kms_cursor_legacy@long-nonblockin=
g-modeset-vs-cursor-atomic.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1}:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_hdr@bpc-switch-suspend@pipe-a-=
edp-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1}:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend@pipe-a=
-hdmi-a-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_lease@possible-crtcs-filtering:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-dg1-17/igt@kms_lease@possible-crtcs-filtering.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/=
shard-dg1-19/igt@kms_lease@possible-crtcs-filtering.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-hdmi-a-=
1-downscale-with-modifier:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-dg1-15/igt@kms_plane_scaling@downscale-with-=
modifier-factor-0-25@pipe-b-hdmi-a-1-downscale-with-modifier.html">SKIP</a>=
 +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@etime-multi-wait-all-for-submit-submitted-signaled:=
</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@syncobj_timeline@etime-multi-wait-all-for-sub=
mit-submitted-signaled.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-5/igt@syncobj_timeline@etime-mult=
i-wait-all-for-submit-submitted-signaled.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7123_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@feature_discovery@display-4x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-inplace:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_ccs@block-copy-inplace.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
325">i915#5325</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#=
5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@gem_ccs@suspend-resume.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#=
5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-snb4/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@gem_eio@kms.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEO=
UT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i9=
15#3063</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_fair@basic-none-vip@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11665/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kb=
l7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11665/shard-apl6/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-ap=
l7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk4/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-g=
lk3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_flush@basic-batch-kernel-=
default-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109313">fdo#109313</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-snb4/igt@gem_exec_flush@basic-batch-kernel-default-uc.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7123/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@gem_exec_params@secure-non-root.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112=
283">fdo#112283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl8/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@gem_lmem_swapping@smem-oom.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4613">i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@gem_lmem_swapping@verify.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i91=
5#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@gem_lmem_swapping@verify-ccs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613"=
>i915#4613</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_pxp@reject-modify-context-prot=
ection-off-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@gem_pxp@verify-pxp-execution-after=
-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@gem_render_copy@y-tiled-mc-ccs-to-=
vebox-yf-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/768">i915#768</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl1/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-off=
set-unsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3297">i915#3297</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3297">i915#3297</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb4/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl6/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@gen7_exec_parse@batch-without-end.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb7/igt@gen7_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@gen9_exec_parse@allowed-single.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb8/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-snb5/igt@i915_pm_rpm@modeset-lpsp-stress-no-=
wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +90 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644=
">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb1/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb8/igt@i915_query@query-topology-unsupport=
ed.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109302">fdo#109302</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-kbl3/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt=
@i915_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_big_fb@4-tiled-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_big_fb@4-tiled-8bpp-rotate-0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
286">i915#5286</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-glk7/igt@kms_big_fb@4-tiled-max-hw-stride-32=
bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb7/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111=
614">fdo#111614</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_big_fb@linear-8bpp-rotate-90.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111614">fdo#111614</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-64=
bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +150 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb4/igt@kms_big_fb@yf-tiled-max-hw-stride-6=
4bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D110723">fdo#110723</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb5/igt@kms_big_joiner@invalid-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705=
">i915#2705</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_big_joiner@invalid-modeset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705=
">i915#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_ccs@pipe-a-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-rotation=
-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +10 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-glk4/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_ccs@pipe-b-bad-rotation-90-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_ccs@pipe-c-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb5/igt@kms_ccs@pipe-d-crc-sprite-planes-b=
asic-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-glk4/igt@kms_chamelium@dp-hpd-with-enabled-m=
ode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl1/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +13 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl8/igt@kms_chamelium@vga-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-5:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_color_chamelium@pipe-a-ctm-0-5=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_color_chamelium@pipe-b-ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-snb7/igt@kms_color_chamelium@pipe-d-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl4/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_content_protection@content_typ=
e_change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1063">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb5/igt@kms_content_protection@dp-mst-lic-t=
ype-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/3299">i915#3299</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3359">i915#3359</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-onscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3319">i915#3319</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl1/igt@kms_cursor_crc@pipe-c-cursor-suspen=
d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@kms_cursor_crc@pipe-d-cursor-256x8=
5-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359">i915#3359</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_cursor_legacy@cursora-vs-flipb=
-toggle.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7123/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor=
-atomic-transitions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_dp_tiled_display@basic-test-pa=
ttern.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/426">i915#426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-blt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_draw_crc@draw-method-xrgb8888-=
blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_flip@2x-absolute-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ab-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7123/shard-glk6/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ab-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_flip@2x-flip-vs-rmfb.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fd=
o#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1825">fdo#111825</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb5/igt@kms_flip@2x-flip-vs-rmfb-interrupt=
ible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109274">fdo#109274</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_flip_scaled_crc@flip-32b=
pp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-2p-sh=
rfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109280">fdo#109280</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +59 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_frontbuffer_tracking@psr-rgb101=
010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +251 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl7/igt@kms_pipe_crc_basic@hang-read-crc-pip=
e-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/533">i915#533</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl6/igt@kms_pipe_crc_basic@hang-read-crc-pip=
e-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/533">i915#533</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-apl6/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-a-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7123/shard-apl4/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-a-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/180">i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl3/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-kbl1/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_plane_lowres@pipe-a-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_plane_lowres@pipe-b-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-75@pipe-c-edp-1-d=
ownscale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb1/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-75@pipe-c-edp-1-downscale-with-rotation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-b-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-d-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-=
with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clampi=
ng@pipe-b-edp-1-scaler-with-clipping-clamping.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb3/igt@kms=
_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipp=
ing-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5176">i915#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-20x20@pipe-b-edp-1-upscale-w=
ith-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_plane_scaling@upscale-with-rot=
ation-20x20@pipe-b-edp-1-upscale-with-rotation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb1/igt@kms_psr2_su@page_flip-nv12.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i=
915#1911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_psr2_su@page_flip-p010.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-iclb1/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@kms_psr@psr2_sprite_mmap_gtt.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb7/igt@kms_setmode@invalid-clone-single-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3555">i915#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl4/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@kms_vrr@flip-basic.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555=
</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@ctx-flip-threshold-reset-after-capture:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb6/igt@nouveau_crc@ctx-flip-threshold-res=
et-after-capture.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb6/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_import_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb4/igt@prime_nv_api@nv_i915_import_twice_=
check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109291">fdo#109291</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb8/igt@prime_nv_pcopy@test3_2.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@syncobj_timeline@invalid-transfer-non-existent-point:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-iclb7/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl6/igt@syncobj_timeline@invalid-transfer-no=
n-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-tglb6/igt@syncobj_timeline@invalid-transfer-n=
on-existent-point.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/5098">i915#5098</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-tglb3/igt@sysfs_clients@fair-0.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-kbl3/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7123/shard-apl4/igt@sysfs_clients@fair-3.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7123/shard-iclb8/igt@sysfs_clients@recycle.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rk=
l-6/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-apl3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7123/shard-apl7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-dg1-12/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-dg=
1-19/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/sh=
ard-glk3/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-tglu-5/igt@gem_exec_fair@basic-none-share@rcs0.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i9=
15#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7123/shard-tglu-6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7123/shard-rkl-2/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>{shard-rkl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11665/shard-rkl-2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/sh=
ard-rkl-4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rk=
l-5/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-kbl7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/s=
hard-kbl6/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
123/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-set-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-snb6/igt@gem_exec_flush@basic-uc-set-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7123/shard-snb5/igt@gem_exec_flush@basic-uc-set-default.html">PASS</a> +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-tglb8/igt@gem_exec_whisper@basic-fds-priority-all.html"=
>INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7123/shard-tglb2/igt@gem_exec_whisper@basic-fds-priority-all.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk2/igt@gem_exec_whisper@basic-queues-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7123/shard-glk1/igt@gem_exec_whisper@basic-queues-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@gem_fenced_exec_thrash@no-spare-fences-interr=
uptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5080">i915#5080</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@gem_fenced_exec_thrash@no-spar=
e-fences-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk6/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#6=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_712=
3/shard-glk5/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-2/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109308">fdo#10=
9308</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
123/shard-rkl-6/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a> +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-2/igt@i915_pm_rpm@modeset-lpsp-stress.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_712=
3/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@kms_ccs@pipe-b-bad-pixel-format-y_tiled_gen12=
_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_ccs@pipe-b-bad-pixel-fo=
rmat-y_tiled_gen12_rc_ccs_cc.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1120=
22">fdo#112022</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaq=
ue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@kms_cursor_edge_walk@pipe-a-128x128-left-edge=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_edge_walk@pipe-a-128=
x128-left-edge.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-leg=
acy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4070">i915#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-aft=
er-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-c-forked-move:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-6/igt@kms_cursor_legacy@pipe-c-forked-move.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4070">i9=
15#4070</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7123/shard-rkl-4/igt@kms_cursor_legacy@pipe-c-forked-move.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu-ytiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-cpu=
-ytiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111314">fdo#111314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4098">i915#4098</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4369">i915#4369</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_draw_crc@draw-meth=
od-xrgb2101010-mmap-cpu-ytiled.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-tglb7/igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1385">i=
915#1385</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7123/shard-tglb7/igt@kms_dsc@basic-dsc-enable@edp-1-pipe-a.html">PASS</a=
> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">i915=
#79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
23/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-=
shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1849">i915#1849</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_frontbuffer_tra=
cking@psr-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a> +16 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7123/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@no_drrs:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-5/igt@kms_psr@no_drrs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/ig=
t@kms_psr@no_drrs.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb4/igt@kms_psr@psr2_sprite_blt.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shar=
d-iclb2/igt@kms_psr@psr2_sprite_blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7123/shard-iclb3/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@kms_universal_plane@disable-primary-vs-flip-p=
ipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1845">i915#1845</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4070">i915#4070</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7123/shard-rkl-6/igt@kms_universal_plane@disabl=
e-primary-vs-flip-pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk5/igt@perf@stress-open-close.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/sh=
ard-glk1/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-fence-flip:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-rkl-1/igt@prime_vgem@basic-fence-flip.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#=
4098</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
123/shard-rkl-6/igt@prime_vgem@basic-fence-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-dg1-16/igt@sysfs_heartbeat_interval@precise@vecs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1755"=
>i915#1755</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7123/shard-dg1-13/igt@sysfs_heartbeat_interval@precise@vecs0.html">PAS=
S</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb2/igt@gem_exec_balancer@parallel.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#5=
614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_71=
23/shard-iclb3/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb7/igt@gem_exec_balancer@parallel-out-fence.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7123/shard-iclb4/igt@gem_exec_balancer@parallel-out-fence.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i91=
5#5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-kbl3/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard=
-kbl4/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-glk4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-bl=
t.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7123/shard-glk3/igt@kms_frontbuffer_tracking@psr-rgb101010-=
draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1888">i915#1888</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11665/shard-iclb8/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7123/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11665/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11665/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11665/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
11665/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_116=
65/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/=
shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/CI_DRM_11665/shard-kbl6/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11665/sha=
rd-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/CI_DRM_11665/shard-kbl4/igt@runner@aborted.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i=
915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7123/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7123/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl7/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123=
/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-=
kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7123/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/shard-kbl1/ig=
t@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6476 -&gt; IGTPW_7123</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11665: 685b5d812e88829c72fcb4e72af28e3bef107209 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7123/index.htm=
l<br />
  IGT_6476: 08aa9296163b94cf4c529fc890ae3e90e21c3cdb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============6931530151638430733==--
