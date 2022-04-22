Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8670842027330055698=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Fri, 22 Apr 2022 09:29:50 -0000
Message-ID: <165061979056.14004.15534813105856408259@emeril.freedesktop.org>
References: <20220422060240.3193599-1-jouni.hogander@intel.com>
In-Reply-To: <20220422060240.3193599-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Iga21zX3Bz?=
 =?utf-8?q?r2=5Fsu=3A_Skip_page-flip_tests_if_FB=5FDAMAGE=5FCLIPS_not_supp?=
 =?utf-8?q?orted?=
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

--===============8670842027330055698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kms_psr2_su: Skip page-flip tests if FB_DAMAGE_CLIPS not supported
URL   : https://patchwork.freedesktop.org/series/102972/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11539_full -> IGTPW_6975_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6975_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6975_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/index.html

Participating hosts (10 -> 9)
------------------------------

  Additional (3): shard-rkl shard-dg1 shard-tglu 
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6975_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-snb:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-snb2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb6/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0}:
    - {shard-dg1}:        NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html

  * igt@kms_vblank@pipe-b-wait-busy-hang:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-dg1-12/igt@kms_vblank@pipe-b-wait-busy-hang.html

  * igt@perf_pmu@busy-idle-check-all@vecs0:
    - {shard-dg1}:        NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vecs0.html

  
Known issues
------------

  Here are the changes found in IGTPW_6975_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][7] ([fdo#111827])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#1839])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#658])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@feature_discovery@psr2.html

  * igt@gem_ccs@block-copy-uncompressed:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#5327]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@gem_ccs@block-copy-uncompressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#5325])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ctx_persistence@engines-hostile:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +1 similar issue
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb5/igt@gem_ctx_persistence@engines-hostile.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-tglb:         NOTRUN -> [SKIP][13] ([i915#280])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@kms:
    - shard-tglb:         [PASS][14] -> [FAIL][15] ([i915#232])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb7/igt@gem_eio@kms.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][16] ([i915#5076] / [i915#5614]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@gem_exec_balancer@parallel.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_exec_balancer@parallel.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][18] ([i915#5076] / [i915#5614])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-balancer:
    - shard-iclb:         [PASS][19] -> [SKIP][20] ([i915#4525])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][21] ([i915#5076] / [i915#5614])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [PASS][23] -> [FAIL][24] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          NOTRUN -> [FAIL][25] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [PASS][26] -> [FAIL][27] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl4/igt@gem_exec_fair@basic-none@vcs0.html
    - shard-kbl:          [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][30] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][31] -> [FAIL][32] ([i915#2842]) +1 similar issue
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][33] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-wb-ro-default:
    - shard-snb:          [PASS][34] -> [SKIP][35] ([fdo#109271]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([fdo#109283])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@secure-non-master:
    - shard-tglb:         NOTRUN -> [SKIP][37] ([fdo#112283])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_exec_params@secure-non-master.html
    - shard-iclb:         NOTRUN -> [SKIP][38] ([fdo#112283])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_exec_params@secure-non-master.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#2190])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#2190])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk5/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#2190])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@gem_huc_copy@huc-copy.html
    - shard-kbl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#2190])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#4613])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#4613]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-glk:          NOTRUN -> [SKIP][45] ([fdo#109271] / [i915#4613])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][46] ([fdo#109271] / [i915#4613]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#4613]) +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#284])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][49] ([i915#2658])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][50] ([i915#2658])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][51] ([i915#2658])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk5/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#4270]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@gem_pxp@create-regular-context-1.html
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#4270])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][54] ([fdo#109271]) +342 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#768]) +2 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271] / [i915#3323])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#3297])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#109289]) +3 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][59] -> [DMESG-WARN][60] ([i915#5566] / [i915#716])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk8/igt@gen9_exec_parse@allowed-all.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk6/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#2527] / [i915#2856]) +5 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@gen9_exec_parse@bb-start-out:
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#2856]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@gen9_exec_parse@bb-start-out.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-tglb:         [PASS][63] -> [TIMEOUT][64] ([i915#3953])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][65] ([i915#1904])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#1937])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-kbl:          NOTRUN -> [SKIP][67] ([fdo#109271] / [i915#1937])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#109506] / [i915#2411])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111644] / [i915#1397] / [i915#2411])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3826])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#1769])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([i915#5286]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([i915#5286]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-glk:          NOTRUN -> [DMESG-WARN][74] ([i915#118])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111614]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][76] ([fdo#109271] / [i915#3777]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#3777]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-glk:          NOTRUN -> [SKIP][78] ([fdo#109271] / [i915#3777]) +2 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111615]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110723])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109278] / [i915#3886]) +2 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#3689]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#3886]) +5 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk9/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3689] / [i915#3886]) +5 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][85] ([fdo#109271] / [i915#3886]) +13 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3886]) +3 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][87] ([fdo#111615] / [i915#3689]) +7 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd-for-each-pipe:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271] / [fdo#111827]) +22 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_chamelium@dp-hpd-for-each-pipe.html
    - shard-iclb:         NOTRUN -> [SKIP][89] ([fdo#109284] / [fdo#111827]) +5 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_chamelium@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-crc-single:
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk8/igt@kms_chamelium@hdmi-crc-single.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([fdo#109278] / [i915#1149])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color_chamelium@pipe-b-ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109284] / [fdo#111827]) +14 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-gamma:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb4/igt@kms_color_chamelium@pipe-d-gamma.html
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +1 similar issue
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb7/igt@kms_color_chamelium@pipe-d-gamma.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-kbl:          NOTRUN -> [TIMEOUT][96] ([i915#1319])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([i915#3116] / [i915#3299])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109278] / [fdo#109279])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278]) +29 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3319]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][101] ([i915#3359]) +6 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([fdo#109279] / [i915#3359]) +4 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-tglb:         NOTRUN -> [SKIP][103] ([fdo#109274] / [fdo#111825]) +12 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109274] / [fdo#109278]) +3 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#4103]) +3 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#5287]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#5287]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109274]) +2 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
    - shard-glk:          [PASS][109] -> [FAIL][110] ([i915#79])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2587])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([i915#3701])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109280]) +23 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][115] ([fdo#109271]) +141 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:
    - shard-apl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +179 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([fdo#109280] / [fdo#111825]) +46 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         NOTRUN -> [SKIP][118] ([i915#433])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:
    - shard-apl:          [PASS][119] -> [FAIL][120] ([i915#1188])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl3/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl4/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][121] ([i915#3555]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([fdo#109289]) +2 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-apl:          [PASS][123] -> [DMESG-WARN][124] ([i915#180]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][125] ([fdo#108145] / [i915#265]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
    - shard-apl:          NOTRUN -> [FAIL][126] ([fdo#108145] / [i915#265])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][127] ([i915#265])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][128] ([fdo#108145] / [i915#265])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max.html

  * igt@kms_plane_lowres@pipe-a-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#5288])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_plane_lowres@pipe-a-tiling-4.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#3536])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][131] ([i915#5288]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][132] ([fdo#111615] / [fdo#112054]) +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.html

  * igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation:
    - shard-tglb:         NOTRUN -> [SKIP][133] ([i915#5176]) +7 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-downscale-with-rotation.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][134] ([i915#5235]) +7 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-upscale-with-rotation:
    - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#5176]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-upscale-with-rotation.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-kbl:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#658]) +2 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][137] ([fdo#109271] / [i915#658]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][138] ([i915#2920])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-glk:          NOTRUN -> [SKIP][139] ([fdo#109271] / [i915#658]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#2920])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2_basic:
    - shard-tglb:         NOTRUN -> [FAIL][141] ([i915#132] / [i915#3467]) +3 similar issues
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_psr@psr2_basic.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109441])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_suspend:
    - shard-iclb:         [PASS][143] -> [SKIP][144] ([fdo#109441]) +1 similar issue
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_psr@psr2_suspend.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_psr@psr2_suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [PASS][145] -> [SKIP][146] ([i915#5519])
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_sysfs_edid_timing:
    - shard-kbl:          NOTRUN -> [FAIL][147] ([IGT#2])
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl1/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:
    - shard-snb:          NOTRUN -> [SKIP][148] ([fdo#109271]) +187 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-d.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-kbl:          NOTRUN -> [SKIP][149] ([fdo#109271] / [i915#533]) +2 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-glk:          NOTRUN -> [SKIP][150] ([fdo#109271] / [i915#533]) +1 similar issue
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk9/igt@kms_vblank@pipe-d-wait-idle.html
    - shard-apl:          NOTRUN -> [SKIP][151] ([fdo#109271] / [i915#533]) +1 similar issue
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-glk:          NOTRUN -> [SKIP][152] ([fdo#109271] / [i915#2437])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk8/igt@kms_writeback@writeback-fb-id.html
    - shard-kbl:          NOTRUN -> [SKIP][153] ([fdo#109271] / [i915#2437])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_writeback@writeback-fb-id.html
    - shard-tglb:         NOTRUN -> [SKIP][154] ([i915#2437])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - shard-iclb:         NOTRUN -> [SKIP][155] ([i915#2530])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][156] ([i915#2530]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][157] ([fdo#109291]) +5 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-iclb:         NOTRUN -> [SKIP][158] ([fdo#109291]) +2 similar issues
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@prime_nv_pcopy@test3_2.html

  * igt@sysfs_clients@fair-3:
    - shard-glk:          NOTRUN -> [SKIP][159] ([fdo#109271] / [i915#2994]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk2/igt@sysfs_clients@fair-3.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][160] ([i915#2994]) +2 similar issues
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@split-50:
    - shard-kbl:          NOTRUN -> [SKIP][161] ([fdo#109271] / [i915#2994]) +7 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl1/igt@sysfs_clients@split-50.html
    - shard-apl:          NOTRUN -> [SKIP][162] ([fdo#109271] / [i915#2994]) +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl1/igt@sysfs_clients@split-50.html
    - shard-tglb:         NOTRUN -> [SKIP][163] ([i915#2994]) +5 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@sysfs_clients@split-50.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-tglb:         NOTRUN -> [SKIP][164] ([fdo#109307])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@tools_test@sysfs_l3_parity.html
    - shard-iclb:         NOTRUN -> [SKIP][165] ([fdo#109307])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][166] ([i915#3063] / [i915#3648]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [FAIL][168] ([i915#2842]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][170] ([i915#2842]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl4/igt@gem_exec_fair@basic-none@vecs0.html
    - shard-kbl:          [FAIL][172] ([i915#2842]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_flush@basic-wb-ro-before-default:
    - shard-snb:          [SKIP][174] ([fdo#109271]) -> [PASS][175] +2 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-snb5/igt@gem_exec_flush@basic-wb-ro-before-default.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-kbl:          [DMESG-WARN][176] ([i915#5566] / [i915#716]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@gen9_exec_parse@allowed-all.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][178] ([fdo#109271]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl1/igt@i915_pm_dc@dc9-dpms.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:
    - shard-iclb:         [FAIL][180] ([i915#1888]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-glk:          [FAIL][182] ([i915#2346] / [i915#533]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-iclb:         [TIMEOUT][184] -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1:
    - shard-glk:          [FAIL][186] -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk8/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk5/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [DMESG-WARN][188] ([i915#180]) -> [PASS][189] +2 similar issues
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
    - shard-iclb:         [FAIL][190] ([i915#2546]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.html

  * igt@kms_plane_lowres@pipe-b-tiling-yf:
    - shard-glk:          [FAIL][192] ([i915#1888]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk3/igt@kms_plane_lowres@pipe-b-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale:
    - shard-iclb:         [SKIP][194] ([i915#5235]) -> [PASS][195] +2 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping:
    - shard-iclb:         [INCOMPLETE][196] ([i915#5243]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-with-clipping-clamping.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][198] ([fdo#109441]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb8/igt@kms_psr@psr2_primary_render.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-apl:          [DMESG-WARN][200] ([i915#180]) -> [PASS][201] +1 similar issue
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][202] ([i915#4525]) -> [DMESG-WARN][203] ([i915#5614]) +1 similar issue
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][204] ([i915#4525]) -> [DMESG-FAIL][205] ([i915#5614])
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [DMESG-WARN][206] ([i915#180]) -> [INCOMPLETE][207] ([i915#3614])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:
    - shard-kbl:          [DMESG-WARN][208] ([i915#180]) -> [FAIL][209] ([i915#1188])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-iclb:         [SKIP][210] ([fdo#111068] / [i915#658]) -> [SKIP][211] ([i915#2920])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][212] ([i915#2920]) -> [SKIP][213] ([fdo#111068] / [i915#658])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][214], [FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl8/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl8/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl3/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl3/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl8/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][240], [FAIL][241], [FAIL][242], [FAIL][243], [FAIL][244], [FAIL][245], [FAIL][246], [FAIL][247], [FAIL][248], [FAIL][249]) ([i915#3002] / [i915#4312] / [i915#5257])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl7/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@runner@aborted.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@runner@aborted.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@runner@aborted.html
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@runner@aborted.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@runner@aborted.html
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@runner@aborted.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@runner@aborted.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl1/igt@runner@aborted.html
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
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
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#232]: https://gitlab.freedesktop.org/drm/intel/issues/232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2546]: https://gitlab.freedesktop.org/drm/intel/issues/2546
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3648]: https://gitlab.freedesktop.org/drm/intel/issues/3648
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3736]: https://gitlab.freedesktop.org/drm/intel/issues/3736
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3777]: https://gitlab.freedesktop.org/drm/intel/issues/3777
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3953]: https://gitlab.freedesktop.org/drm/intel/issues/3953
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3963]: https://gitlab.freedesktop.org/drm/intel/issues/3963
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4807]: https://gitlab.freedesktop.org/drm/intel/issues/4807
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4842]: https://gitlab.freedesktop.org/drm/intel/issues/4842
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4886]: https://gitlab.freedesktop.org/drm/intel/issues/4886
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4929]: https://gitlab.freedesktop.org/drm/intel/issues/4929
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5115]: https://gitlab.freedesktop.org/drm/intel/issues/5115
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5243]: https://gitlab.freedesktop.org/drm/intel/issues/5243
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
  [i915#5341]: https://gitlab.freedesktop.org/drm/intel/issues/5341
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6445 -> IGTPW_6975
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11539: 6cb847509fe9aa278324a4f9662df271c42851f8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_6975: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/index.html
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/index.html

--===============8670842027330055698==
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
<tr><td><b>Series:</b></td><td>kms_psr2_su: Skip page-flip tests if FB_DAMA=
GE_CLIPS not supported</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102972/">https://patchwork.freedesktop.org/series/102972/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6975/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11539_full -&gt; IGTPW_6975_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6975_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_6975_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/index.=
html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Additional (3): shard-rkl shard-dg1 shard-tglu <br />
  Missing    (4): pig-skl-6260u shard-skl pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6975=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-snb2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-sn=
b6/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-ra=
ndom-ccs@lmem0.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-wait-busy-hang:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-dg1-12/igt@kms_vblank@pipe-b-wait-busy-hang.=
html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@vecs0:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-dg1-19/igt@perf_pmu@busy-idle-check-all@vecs=
0.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6975_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb3/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb4/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@gem_ccs@block-copy-uncompressed.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/53=
27">i915#5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_ccs@ctrl-surf-copy-new-ctx.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/532=
5">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-snb5/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_ctx_sseu@mmap-args.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#2=
80</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb7/igt@gem_eio@kms.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_eio@=
kms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/232">i915#232</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl6/igt@gem_exec_balancer@parallel.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/507=
6">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/5614">i915#5614</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_exec_balancer@parallel.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i9=
15#4525</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_exec_balancer@parallel.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/50=
76">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5614">i915#5614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-balancer:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb1/igt@gem_exec_balancer@parallel-balancer.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/=
shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@gem_exec_balancer@parallel-ordering=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5076">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_exec_fair@basic-flow@rcs0.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/=
shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-ap=
l4/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-kbl7/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kb=
l7/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/s=
hard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk9/igt@gem_exec_fair@basic-throttle@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-snb7/igt@gem_exec_flush@basic-wb-ro-default.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/sh=
ard-snb6/igt@gem_exec_flush@basic-wb-ro-default.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-master:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_exec_params@secure-non-master.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
2283">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk5/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb3/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl3/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk4/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb1/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk5/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb1/igt@gem_pxp@create-regular-context-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb2/igt@gem_pxp@create-regular-context-1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +342 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-y-t=
iled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/768">i915#768</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl7/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gem_userptr_blits@dmabuf-unsync.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/32=
97">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09289">fdo#109289</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk=
6/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@gen9_exec_parse@bb-start-cmd.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@gen9_exec_parse@bb-start-out.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856"=
>i915#2856</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb3/igt@i915_module_load@reload-with-fault-injection.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6975/shard-tglb2/igt@i915_module_load@reload-with-fault-injection.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/39=
53">i915#3953</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
04">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1937">i915#1937</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl6/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/1937">i915#1937</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@i915_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644=
">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_atomic_transition@plane-all-mo=
deset-transition.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1769">i915#1769</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@kms_big_fb@4-tiled-32bpp-rotate-18=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk6/igt@kms_big_fb@linear-32bpp-rotate-180.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_big_fb@linear-8bpp-rotate-270.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_big_fb@x-tiled-max-hw-stride-32=
bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@kms_big_fb@x-tiled-max-hw-stride-64=
bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk2/igt@kms_big_fb@y-tiled-max-hw-stride-32=
bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/3777">i915#3777</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_ccs@pipe-a-bad-rotation-90-y_t=
iled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk9/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl2/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3689">i915#3689</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-for-each-pipe:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_chamelium@dp-hpd-for-each-pipe.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +22 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_chamelium@dp-hpd-for-each-pipe.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-single:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk8/igt@kms_chamelium@hdmi-crc-single.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb5/igt@kms_color@pipe-d-ctm-blue-to-red.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-max:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-max=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111827">fdo#111827</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-red-=
to-blue.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-gamma:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-snb4/igt@kms_color_chamelium@pipe-d-gamma.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb7/igt@kms_color_chamelium@pipe-d-gamma.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_content_protection@atomic-dpms.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1319">i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_content_protection@dp-mst-type=
-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x32-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_cursor_crc@pipe-c-cursor-32x32=
-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3319">i915#3319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-max-size-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_cursor_crc@pipe-c-cursor-max-s=
ize-offscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3359">i915#3359</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359">i915#3359</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_cursor_legacy@2x-long-cursor-v=
s-flip-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D111825">fdo#111825</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_cursor_legacy@cursora-vs-flipb=
-varying-size.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/4103">i915#4103</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-4tiled:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb6/igt@kms_draw_crc@draw-method-xrgb210101=
0-blt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5287">i915#5287</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@kms_flip@2x-dpms-vs-vblank-race.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk9/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6975/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interrupt=
ible@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb8/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp=
-ytile-downscaling.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-=
ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3701">i915#3701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@kms_frontbuffer_tracking@fbc-2p-sc=
ndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk2/igt@kms_frontbuffer_tracking@psr-2p-pri=
mscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +141 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-pwrite:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-pwrite.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +179 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb1/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/433">=
i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl3/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-=
dp-1-pipe-a.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_6975/shard-apl4/igt@kms_hdr@bpc-switch-suspend@bpc-switch-s=
uspend-dp-1-pipe-a.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_hdr@static-toggle-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i=
915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-=
with-3-lanes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6975/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl6/igt@kms_plane_alpha_blend@pipe-a-alpha-=
basic.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk5/igt@kms_plane_alpha_blend@pipe-c-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-a-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_plane_lowres@pipe-a-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_lowres@pipe-c-tiling-4.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
288">i915#5288</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb5/igt@kms_plane_lowres@pipe-d-tiling-yf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11615">fdo#111615</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D112054">fdo#112054</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-rotation-factor-0-25@pipe-c-edp-1-d=
ownscale-with-rotation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_plane_scaling@downscale-with-r=
otation-factor-0-25@pipe-c-edp-1-downscale-with-rotation.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb7/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@upscale-with-rotation-factor-0-25@pipe-b-edp-1-ups=
cale-with-rotation:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb1/igt@kms_plane_scaling@upscale-with-rot=
ation-factor-0-25@pipe-b-edp-1-upscale-with-rotation.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +=
2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl3/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_basic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@kms_psr@psr2_basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i915#132</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3467">i915#=
3467</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb8/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_psr@psr2_suspend.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-iclb1/igt=
@kms_psr@psr2_suspend.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb6/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6975/shard-tglb1/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl1/igt@kms_sysfs_edid_timing.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IG=
T#2</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@disable-primary-vs-flip-pipe-d:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-snb6/igt@kms_universal_plane@disable-primary=
-vs-flip-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +187 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk9/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl8/igt@kms_vblank@pipe-d-wait-idle.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
533">i915#533</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-glk8/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_writeback@writeback-fb-id.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb3/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437"=
>i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb3/igt@nouveau_crc@pipe-a-source-rg.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2530"=
>i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-tglb6/igt@prime_nv_api@i915_nv_reimport_twic=
e_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109291">fdo#109291</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb4/igt@prime_nv_pcopy@test3_2.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-3:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-glk2/igt@sysfs_clients@fair-3.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-iclb6/igt@sysfs_clients@recycle-many.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-kbl1/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +7 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-apl1/igt@sysfs_clients@split-50.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb5/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-tglb8/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6975/shard-iclb5/igt@tools_test@sysfs_l3_parity.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">f=
do#109307</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3648">i915#36=
48</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_697=
5/shard-tglb7/igt@gem_eio@unwedge-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6975/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-apl2/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/s=
hard-apl4/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11539/shard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/s=
hard-kbl7/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-ro-before-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-snb6/igt@gem_exec_flush@basic-wb-ro-before-default.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10927=
1">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6975/shard-snb5/igt@gem_exec_flush@basic-wb-ro-before-default.html"=
>PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl3/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6975/shard-kbl7/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl1/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl=
4/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1888">i915#1888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6975/shard-iclb6/igt@kms_cursor_edge_walk@pipe-a-256x256-top-edge=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/533">i915#533</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-glk6/igt@kms_cursor_legacy@flip=
-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb1/igt@kms_fbcon_fbt@psr-suspend.html">TIMEOUT</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-i=
clb3/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk8/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html">F=
AIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_697=
5/shard-glk5/igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6975/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@a-d=
p1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2546">i915#2546</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6975/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-modesetfrombusy=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-yf:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-glk4/igt@kms_plane_lowres@pipe-b-tiling-yf.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1=
888</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_69=
75/shard-glk3/igt@kms_plane_lowres@pipe-b-tiling-yf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-b-edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@planes-upscale-factor-0-25-=
downscale-factor-0-5@pipe-b-edp-1-planes-upscale-downscale.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/s=
hard-iclb5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-facto=
r-0-5@pipe-b-edp-1-planes-upscale-downscale.html">PASS</a> +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler-=
with-clipping-clamping:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_plane_scaling@scaler-with-clipping-clampi=
ng@pipe-b-edp-1-scaler-with-clipping-clamping.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5243">i915#5243</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-ic=
lb1/igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-edp-1-scaler=
-with-clipping-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb8/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/=
shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6975/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-suspend.htm=
l">PASS</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb8/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6975/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb3/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_6975/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5614">i915#=
5614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6975/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@c-d=
p1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3614">i915#3614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-dp-1-pipe-a:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl4/igt@kms_hdr@bpc-switch-suspend@bpc-switch-suspend-=
dp-1-pipe-a.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@kms_hdr@bpc-switch-suspend@bp=
c-switch-suspend-dp-1-pipe-a.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/1188">i915#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb6/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6975/shard-iclb2/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#29=
20</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_6975/shard-iclb1/igt@kms_psr2_sf@overlay-plane-update-continuou=
s-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11539/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl7/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11539/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-apl6/igt@runner@aborted.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl=
6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl6/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6975/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-apl8/igt@runner@a=
borted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11539/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11539/shard-kbl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11539/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl3/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1539/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1153=
9/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/s=
hard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11539/shar=
d-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11539/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/716">i915#716</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl=
6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl7/igt@r=
unner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6975/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6975/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl4/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6=
975/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6975/shard-kbl3/igt@runner@aborted.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">=
i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/5257">i915#5257</a>)</p>
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
<li>IGT: IGT_6445 -&gt; IGTPW_6975</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11539: 6cb847509fe9aa278324a4f9662df271c42851f8 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_6975: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6975/index.htm=
l<br />
  IGT_6445: 8c2ac78f0d80a2af3c7b47dd2df064cdd07f24b6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8670842027330055698==--
