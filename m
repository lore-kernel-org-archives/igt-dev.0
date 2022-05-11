Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4520886894616825841=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anshuman Gupta" <anshuman.gupta@intel.com>
Date: Wed, 11 May 2022 15:39:48 -0000
Message-ID: <165228358850.2697.9480721336812227288@emeril.freedesktop.org>
References: <20220511113734.27776-1-anshuman.gupta@intel.com>
In-Reply-To: <20220511113734.27776-1-anshuman.gupta@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUlBNIFRl?=
 =?utf-8?q?st_on_HEADLESS_=28rev2=29?=
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

--===============4520886894616825841==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RPM Test on HEADLESS (rev2)
URL   : https://patchwork.freedesktop.org/series/102947/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11635_full -> IGTPW_7077_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7077_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7077_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/index.html

Participating hosts (10 -> 9)
------------------------------

  Additional (2): shard-rkl shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7077_full:

### IGT changes ###

#### Possible regressions ####

  * igt@sysfs_heartbeat_interval@mixed@vcs0:
    - shard-apl:          [PASS][1] -> [WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_balancer@full-late:
    - {shard-rkl}:        NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-rkl-5/igt@gem_exec_balancer@full-late.html

  * igt@kms_vblank@pipe-a-ts-continuation-suspend:
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglu-1/igt@kms_vblank@pipe-a-ts-continuation-suspend.html

  
Known issues
------------

  Here are the changes found in IGTPW_7077_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][5] ([fdo#111827])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@feature_discovery@chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][6] ([fdo#111827])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#658])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@feature_discovery@psr2.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglb:         NOTRUN -> [SKIP][8] ([i915#3555] / [i915#5325])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_ccs@ctrl-surf-copy-new-ctx:
    - shard-iclb:         NOTRUN -> [SKIP][9] ([i915#5327])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.html

  * igt@gem_ctx_persistence@legacy-engines-persistence:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099]) +2 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb4/igt@gem_ctx_persistence@legacy-engines-persistence.html

  * igt@gem_ctx_sseu@engines:
    - shard-tglb:         NOTRUN -> [SKIP][11] ([i915#280])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gem_ctx_sseu@engines.html

  * igt@gem_exec_balancer@parallel:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][12] ([i915#5076] / [i915#5614])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl4/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][13] ([i915#3778])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][14] ([i915#2842]) +1 similar issue
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][15] ([i915#2842]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][16] ([i915#2842]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_exec_fair@basic-none-solo@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][17] ([i915#2842])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-snb:          NOTRUN -> [SKIP][22] ([fdo#109271]) +306 similar issues
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_flush@basic-batch-kernel-default-wb:
    - shard-snb:          [PASS][23] -> [SKIP][24] ([fdo#109271]) +1 similar issue
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][25] ([fdo#109283])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][26] ([fdo#109283])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][27] ([fdo#109283] / [i915#4877])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_whisper@basic-contexts-forked:
    - shard-glk:          [PASS][28] -> [DMESG-WARN][29] ([i915#118]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html

  * igt@gem_huc_copy@huc-copy:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#2190])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][31] ([i915#4613]) +3 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl3/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613]) +2 similar issues
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-kbl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#4613]) +1 similar issue
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][35] ([i915#4613]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][36] ([i915#284])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_media_vme.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][37] ([i915#2658])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][38] ([i915#2658])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb6/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_pread@exhaustion.html
    - shard-tglb:         NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk7/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#4270]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_pxp@verify-pxp-stale-buf-execution:
    - shard-tglb:         NOTRUN -> [SKIP][44] ([i915#4270]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@gem_pxp@verify-pxp-stale-buf-execution.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-kbl:          NOTRUN -> [SKIP][45] ([fdo#109271]) +328 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html
    - shard-iclb:         NOTRUN -> [SKIP][46] ([i915#768]) +3 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][47] ([i915#3297]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3297]) +5 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([fdo#109289]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([fdo#109289]) +2 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [PASS][51] -> [DMESG-WARN][52] ([i915#5566] / [i915#716])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk4/igt@gen9_exec_parse@allowed-all.html
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#2856]) +2 similar issues
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-far:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#2527] / [i915#2856]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#1904])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#454])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_lpsp@screens-disabled:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([i915#1902])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110892])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#109293] / [fdo#109506])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html
    - shard-tglb:         NOTRUN -> [SKIP][61] ([fdo#109506] / [i915#2411])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_sseu@full-enable:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#4387])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@i915_pm_sseu@full-enable.html

  * igt@i915_query@test-query-geometry-subslices:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#5723])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@i915_query@test-query-geometry-subslices.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][64] ([i915#3826])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#3826])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-kbl:          [PASS][66] -> [DMESG-WARN][67] ([i915#62] / [i915#92]) +8 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#4765])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#1769]) +1 similar issue
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([i915#1769])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([i915#5286]) +4 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#5286]) +7 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111614]) +6 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#110725] / [fdo#111614]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#110723]) +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615]) +8 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#2705]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_big_joiner@basic.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#2705])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_joiner@basic.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#3689]) +14 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [i915#3886]) +7 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#3886] / [i915#92])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][82] ([fdo#109271] / [i915#3886]) +4 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [i915#3886]) +9 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615] / [i915#3689]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([i915#3689] / [i915#3886]) +4 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][86] ([fdo#109271] / [i915#3886]) +4 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271]) +175 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@kms_cdclk@mode-transition.html
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#3742])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_cdclk@mode-transition.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#3742])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][90] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_chamelium@dp-crc-multiple.html
    - shard-tglb:         NOTRUN -> [SKIP][91] ([fdo#109284] / [fdo#111827]) +21 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109284] / [fdo#111827]) +10 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@hdmi-cmp-planar-formats:
    - shard-kbl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [fdo#111827] / [i915#92])
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_chamelium@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-kbl:          NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +21 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_chamelium@vga-hpd-without-ddc.html
    - shard-snb:          NOTRUN -> [SKIP][95] ([fdo#109271] / [fdo#111827]) +16 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-b-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109278] / [i915#3555])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb8/igt@kms_color@pipe-b-deep-color.html

  * igt@kms_color@pipe-d-ctm-max:
    - shard-iclb:         NOTRUN -> [SKIP][97] ([fdo#109278] / [i915#1149])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html

  * igt@kms_color_chamelium@pipe-d-ctm-0-75:
    - shard-apl:          NOTRUN -> [SKIP][98] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-75.html
    - shard-iclb:         NOTRUN -> [SKIP][99] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-75.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3116] / [i915#3299]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_content_protection@dp-mst-type-0.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3116]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][102] ([i915#1319])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@mei_interface:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109300] / [fdo#111066])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_content_protection@mei_interface.html
    - shard-tglb:         NOTRUN -> [SKIP][104] ([i915#1063])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([fdo#109278] / [fdo#109279]) +7 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-suspend:
    - shard-apl:          [PASS][106] -> [DMESG-WARN][107] ([i915#180]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109278]) +47 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([fdo#109279] / [i915#3359] / [i915#5691])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([i915#3319]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#3359]) +11 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#109279] / [i915#3359]) +11 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][113] ([i915#62] / [i915#92])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-iclb:         NOTRUN -> [SKIP][114] ([fdo#109274] / [fdo#109278]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][115] -> [FAIL][116] ([i915#2346])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#4103]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#5287]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([i915#5287]) +4 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([fdo#109274] / [fdo#111825]) +10 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109274]) +4 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][122] -> [DMESG-WARN][123] ([i915#180]) +3 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][124] ([i915#180])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl1/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#2587])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#2587])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-tglb:         NOTRUN -> [SKIP][127] ([fdo#109280] / [fdo#111825]) +51 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
    - shard-iclb:         [PASS][128] -> [DMESG-WARN][129] ([i915#4391])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
    - shard-kbl:          NOTRUN -> [SKIP][130] ([fdo#109271] / [i915#92]) +5 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([fdo#109280]) +39 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][132] -> [SKIP][133] ([i915#433])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:
    - shard-apl:          NOTRUN -> [SKIP][134] ([fdo#109271] / [i915#533]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html
    - shard-glk:          NOTRUN -> [SKIP][135] ([fdo#109271] / [i915#533]) +2 similar issues
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d.html

  * igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:
    - shard-kbl:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#533]) +3 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-kbl:          NOTRUN -> [FAIL][137] ([fdo#108145] / [i915#265]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-kbl:          NOTRUN -> [FAIL][138] ([i915#265])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@pipe-b-tiling-4:
    - shard-tglb:         NOTRUN -> [SKIP][139] ([i915#5288]) +1 similar issue
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-4.html
    - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#5288]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_plane_lowres@pipe-b-tiling-4.html

  * igt@kms_plane_lowres@pipe-b-tiling-y:
    - shard-iclb:         NOTRUN -> [SKIP][141] ([i915#3536]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-y.html

  * igt@kms_plane_lowres@pipe-c-tiling-4:
    - shard-glk:          NOTRUN -> [SKIP][142] ([fdo#109271]) +143 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_plane_lowres@pipe-c-tiling-4.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][143] ([i915#3536]) +2 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-edp-1-downscale-with-modifier:
    - shard-iclb:         NOTRUN -> [SKIP][144] ([i915#5176]) +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-edp-1-downscale-with-modifier.html

  * igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier:
    - shard-tglb:         NOTRUN -> [SKIP][145] ([i915#5176]) +7 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([i915#5235]) +2 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale:
    - shard-tglb:         NOTRUN -> [SKIP][147] ([i915#5235]) +7 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale:
    - shard-iclb:         [PASS][148] -> [SKIP][149] ([i915#5235]) +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-tglb:         NOTRUN -> [SKIP][150] ([i915#2920]) +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html
    - shard-iclb:         NOTRUN -> [SKIP][151] ([fdo#111068] / [i915#658]) +2 similar issues
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-kbl:          NOTRUN -> [SKIP][152] ([fdo#109271] / [i915#658]) +5 similar issues
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl7/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][153] ([fdo#109271] / [i915#658]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#658])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk3/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2_cursor_mmap_cpu:
    - shard-iclb:         NOTRUN -> [SKIP][155] ([fdo#109441]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html

  * igt@kms_psr@psr2_cursor_plane_onoff:
    - shard-tglb:         NOTRUN -> [FAIL][156] ([i915#132] / [i915#3467]) +5 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-glk:          NOTRUN -> [FAIL][157] ([i915#1888] / [i915#65])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][158] ([i915#5289])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:
    - shard-tglb:         NOTRUN -> [SKIP][159] ([i915#5030]) +3 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a.html

  * igt@kms_sysfs_edid_timing:
    - shard-apl:          NOTRUN -> [FAIL][160] ([IGT#2])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@kms_sysfs_edid_timing.html
    - shard-kbl:          NOTRUN -> [FAIL][161] ([IGT#2])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_sysfs_edid_timing.html

  * igt@kms_vrr@flip-basic:
    - shard-tglb:         NOTRUN -> [SKIP][162] ([i915#3555]) +4 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_vrr@flip-basic.html
    - shard-iclb:         NOTRUN -> [SKIP][163] ([i915#3555]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-tglb:         NOTRUN -> [SKIP][164] ([i915#2437]) +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-kbl:          NOTRUN -> [SKIP][165] ([fdo#109271] / [i915#2437])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-iclb:         NOTRUN -> [SKIP][166] ([i915#2437])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@nouveau_crc@pipe-b-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][167] ([i915#2530]) +3 similar issues
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-iclb:         NOTRUN -> [SKIP][168] ([i915#2530]) +2 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@prime_nv_api@i915_nv_double_export:
    - shard-iclb:         NOTRUN -> [SKIP][169] ([fdo#109291]) +7 similar issues
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@prime_nv_api@i915_nv_double_export.html

  * igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][170] ([fdo#109291]) +11 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name.html

  * igt@prime_vgem@fence-write-hang:
    - shard-tglb:         NOTRUN -> [SKIP][171] ([fdo#109295])
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@prime_vgem@fence-write-hang.html

  * igt@sysfs_clients@recycle:
    - shard-kbl:          NOTRUN -> [SKIP][172] ([fdo#109271] / [i915#2994]) +3 similar issues
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl3/igt@sysfs_clients@recycle.html

  * igt@sysfs_clients@recycle-many:
    - shard-iclb:         NOTRUN -> [SKIP][173] ([i915#2994]) +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@sysfs_clients@recycle-many.html

  * igt@sysfs_clients@sema-50:
    - shard-tglb:         NOTRUN -> [SKIP][174] ([i915#2994]) +4 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@sysfs_clients@sema-50.html

  * igt@sysfs_heartbeat_interval@mixed@vecs0:
    - shard-apl:          [PASS][175] -> [FAIL][176] ([i915#1731])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl6/igt@sysfs_heartbeat_interval@mixed@vecs0.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl7/igt@sysfs_heartbeat_interval@mixed@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-iclb:         NOTRUN -> [SKIP][177] ([fdo#109307])
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@tools_test@sysfs_l3_parity.html

  
#### Possible fixes ####

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          [DMESG-WARN][178] ([i915#180]) -> [PASS][179] +1 similar issue
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl4/igt@gem_eio@in-flight-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [FAIL][180] ([i915#2842]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][182] ([i915#2842]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][184] ([i915#2849]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-uc-prw-default:
    - shard-snb:          [SKIP][186] ([fdo#109271]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb7/igt@gem_exec_flush@basic-uc-prw-default.html

  * igt@gem_ppgtt@flink-and-close-vma-leak:
    - shard-glk:          [FAIL][188] ([i915#644]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html

  * igt@i915_suspend@system-suspend-without-i915:
    - shard-snb:          [DMESG-WARN][190] -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-snb7/igt@i915_suspend@system-suspend-without-i915.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-snb5/igt@i915_suspend@system-suspend-without-i915.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-tglb:         [FAIL][192] ([i915#3743]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [FAIL][194] ([i915#79]) -> [PASS][195] +1 similar issue
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-glk:          [FAIL][196] ([i915#4911]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - shard-apl:          [DMESG-WARN][198] ([i915#180]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         [SKIP][200] ([fdo#109441]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][202] ([i915#5519]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@perf@polling-parameterized:
    - shard-tglb:         [FAIL][204] ([i915#5639]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-tglb2/igt@perf@polling-parameterized.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@perf@polling-parameterized.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [DMESG-WARN][206] ([i915#5614]) -> [SKIP][207] ([i915#4525])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][208] ([i915#4525]) -> [DMESG-WARN][209] ([i915#5614]) +1 similar issue
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [DMESG-FAIL][210] ([i915#5614]) -> [SKIP][211] ([i915#4525])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-tglb:         [SKIP][212] ([i915#2848]) -> [FAIL][213] ([i915#2842]) +4 similar issues
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-kbl:          [SKIP][214] ([fdo#109271]) -> [SKIP][215] ([fdo#109271] / [i915#92]) +3 similar issues
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_chamelium@dp-edid-read:
    - shard-kbl:          [SKIP][216] ([fdo#109271] / [fdo#111827]) -> [SKIP][217] ([fdo#109271] / [fdo#111827] / [i915#92])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl7/igt@kms_chamelium@dp-edid-read.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_chamelium@dp-edid-read.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
    - shard-kbl:          [DMESG-WARN][218] ([i915#180]) -> [DMESG-WARN][219] ([i915#62] / [i915#92])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         [SKIP][220] ([fdo#111068] / [i915#658]) -> [SKIP][221] ([i915#2920])
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225], [FAIL][226]) ([fdo#109271] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl2/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl7/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl7/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl6/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl1/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl8/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl3/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl7/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl1/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@runner@aborted.html

  
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
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
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
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
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
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1731]: https://gitlab.freedesktop.org/drm/intel/issues/1731
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1904]: https://gitlab.freedesktop.org/drm/intel/issues/1904
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
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
  [i915#2848]: https://gitlab.freedesktop.org/drm/intel/issues/2848
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3012]: https://gitlab.freedesktop.org/drm/intel/issues/3012
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3319]: https://gitlab.freedesktop.org/drm/intel/issues/3319
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3376]: https://gitlab.freedesktop.org/drm/intel/issues/3376
  [i915#3464]: https://gitlab.freedesktop.org/drm/intel/issues/3464
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4911]: https://gitlab.freedesktop.org/drm/intel/issues/4911
  [i915#4941]: https://gitlab.freedesktop.org/drm/intel/issues/4941
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5030]: https://gitlab.freedesktop.org/drm/intel/issues/5030
  [i915#5076]: https://gitlab.freedesktop.org/drm/intel/issues/5076
  [i915#5080]: https://gitlab.freedesktop.org/drm/intel/issues/5080
  [i915#5098]: https://gitlab.freedesktop.org/drm/intel/issues/5098
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5614]: https://gitlab.freedesktop.org/drm/intel/issues/5614
  [i915#5639]: https://gitlab.freedesktop.org/drm/intel/issues/5639
  [i915#5691]: https://gitlab.freedesktop.org/drm/intel/issues/5691
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#644]: https://gitlab.freedesktop.org/drm/intel/issues/644
  [i915#65]: https://gitlab.freedesktop.org/drm/intel/issues/65
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6471 -> IGTPW_7077
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11635: aa0155fd1466e1ee5e649ec07562dd93623fad8d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7077: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/index.html
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/index.html

--===============4520886894616825841==
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
<tr><td><b>Series:</b></td><td>RPM Test on HEADLESS (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102947/">https://patchwork.freedesktop.org/series/102947/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7077/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11635_full -&gt; IGTPW_7077_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7077_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7077_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/index.=
html</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Additional (2): shard-rkl shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7077=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@sysfs_heartbeat_interval@mixed@vcs0:<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl6/igt@sysfs_heartbeat_interval@mixed@vcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/s=
hard-apl7/igt@sysfs_heartbeat_interval@mixed@vcs0.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_balancer@full-late:</p>
<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-rkl-5/igt@gem_exec_balancer@full-late.html">=
INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglu-1/igt@kms_vblank@pipe-a-ts-continuation=
-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7077_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb3/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb3/igt@feature_discovery@chamelium.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@feature_discovery@psr2.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#6=
58</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
">i915#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gem_ccs@ctrl-surf-copy-new-ctx.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/532=
7">i915#5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-snb4/igt@gem_ctx_persistence@legacy-engines-=
persistence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/1099">i915#1099</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@engines:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gem_ctx_sseu@engines.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/280">i915#280=
</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl4/igt@gem_exec_balancer@parallel.html">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/50=
76">i915#5076</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5614">i915#5614</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-apl2/igt@gem_exec_endless@dispatch@rcs0.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-glk1/igt@gem_exec_fair@basic-none-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_exec_fair@basic-none-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/s=
hard-apl6/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/sha=
rd-glk2/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-d=
efault-cmd.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +306 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-wb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-snb2/igt@gem_exec_flush@basic-batch-kernel-default-wb.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7077/shard-snb6/igt@gem_exec_flush@basic-batch-kernel-default-wb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@gem_exec_params@no-bsd.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#=
109283</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb7/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_exec_params@no-vebox.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo=
#109283</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/48=
77">i915#4877</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-contexts-forked:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk6/igt@gem_exec_whisper@basic-contexts-forked.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_707=
7/shard-glk4/igt@gem_exec_whisper@basic-contexts-forked.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gem_huc_copy@huc-copy.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2=
190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-mult=
i-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl3/igt@gem_lmem_swapping@heavy-verify-multi=
-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4613">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-glk1/igt@gem_lmem_swapping@parallel-multi.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@gem_lmem_swapping@verify-random-cc=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@gem_media_vme.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/284">i915#284</a>)</=
li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-glk7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@gem_pxp@reject-modify-context-prot=
ection-off-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-stale-buf-execution:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@gem_pxp@verify-pxp-stale-buf-execu=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@gem_render_copy@x-tiled-to-vebox-yf-=
tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a>) +328 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb2/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/768">i915#768</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-cyc=
les.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/3297">i915#3297</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gen3_render_linear_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@gen3_render_linear_blits.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo=
#109289</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11635/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-glk4=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/716">i915#716</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb3/igt@gen9_exec_parse@allowed-all.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">i=
915#2856</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-far:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@gen9_exec_parse@bb-start-far.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527"=
>i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2856">i915#2856</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@i915_pm_dc@dc3co-vpb-simulation.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/19=
04">i915#1904</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@i915_pm_dc@dc6-psr.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@screens-disabled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@i915_pm_lpsp@screens-disabled.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1902=
">i915#1902</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb7/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2411">i915#2411</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb1/igt@i915_pm_rpm@dpms-mode-unset-non-lps=
p.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110892">fdo#110892</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109506">fdo#109506</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@i915_pm_rpm@gem-execbuf-stress-pc8.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09506">fdo#109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@i915_pm_sseu@full-enable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4387">i91=
5#4387</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@test-query-geometry-subslices:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@i915_query@test-query-geometry-sub=
slices.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5723">i915#5723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_addfb_basic@invalid-smem-bo-on-=
discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3826">i915#3826</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl4/igt@kms_async_flips@async-flip-with-page-flip-even=
ts.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7077/shard-kbl6/igt@kms_async_flips@async-flip-with-page-flip-events=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/62">i915#62</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/92">i915#92</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1769">i915#1769</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1769">i915#1769</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/5286">i915#5286</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5286">i915#5286</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_big_fb@x-tiled-64bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_big_fb@yf-tiled-64bpp-rotate-2=
70.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110723">fdo#110723</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D111615">fdo#111615</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_big_joiner@basic.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i915#270=
5</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/3689">i915#3689</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_ccs@pipe-a-crc-primary-basic-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_ccs@pipe-a-crc-sprite-planes-bas=
ic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-yf_=
tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl2/igt@kms_cdclk@mode-transition.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) +175 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i91=
5#3742</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_cdclk@mode-transition.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i91=
5#3742</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-multiple:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_chamelium@dp-crc-multiple.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +12 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_chamelium@dp-crc-multiple.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +21 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_chamelium@dp-crc-single.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284"=
>fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_chamelium@hdmi-cmp-planar-forma=
ts.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +21 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-snb6/igt@kms_chamelium@vga-hpd-without-ddc.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111827">fdo#111827</a>) +16 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-b-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb8/igt@kms_color@pipe-b-deep-color.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278"=
>fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-max:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_color@pipe-d-ctm-max.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109278">fd=
o#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-0-75:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl3/igt@kms_color_chamelium@pipe-d-ctm-0-75.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +15 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb8/igt@kms_color_chamelium@pipe-d-ctm-0-75=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3299">i915#3299</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_content_protection@dp-mst-type-=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3116">i915#3116</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_content_protection@mei_interfac=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109300">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111066">fdo#111066</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_content_protection@mei_interfac=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/1063">i915#1063</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_cursor_crc@pipe-b-cursor-512x5=
12-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109279">fdo#109279</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl3/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/=
shard-apl6/igt@kms_cursor_crc@pipe-b-cursor-suspend.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a>) +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-sliding.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3359">i915#3359</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5691">i915#5691</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x32=
-sliding.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3319">i915#3319</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_cursor_crc@pipe-d-cursor-512x1=
70-rapid-movement.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_cursor_crc@pipe-d-cursor-512x5=
12-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109279">fdo#109279</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3359">i915#3359</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-c-128x128-bottom-edge:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_cursor_edge_walk@pipe-c-128x128=
-bottom-edge.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/62">i915#62</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/92">i915#92</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_cursor_legacy@2x-long-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109278">fdo#109278</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transi=
tions.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7077/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>) +1 simil=
ar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5287">i915#5287</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_flip@2x-modeset-vs-vblank-race=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111825">fdo#111825</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race=
-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109274">fdo#109274</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7077/shard-kbl4/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-apl1/igt@kms_flip@flip-vs-suspend-interrupti=
ble@b-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_flip_scaled_crc@flip-32bpp-yti=
leccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling:<=
/p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-32bpp-ytilercccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2587">i915#2587</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +51 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-p=
ri-indfb-draw-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@kms_frontbuffer_tracking@fbcpsr-=
1p-primscrn-pri-indfb-draw-blt.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/4391">i915#4391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_frontbuffer_tracking@psr-1p-off=
scren-pri-shrfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/92">i915#92</a>) +5 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +39 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-tglb5/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-t=
glb6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl3/igt@kms_pipe_crc_basic@disable-crc-after=
-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/533">i915#533</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_pipe_crc_basic@disable-crc-after=
-crtc-pipe-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/533">i915#533</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_pipe_crc_basic@read-crc-pipe-d-=
frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/533">i915#533</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl1/igt@kms_plane_alpha_blend@pipe-b-consta=
nt-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl3/igt@kms_plane_alpha_blend@pipe-c-alpha-=
transparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/265">i915#265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-4:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_plane_lowres@pipe-b-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
88">i915#5288</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_plane_lowres@pipe-b-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/52=
88">i915#5288</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-b-tiling-y:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_plane_lowres@pipe-b-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-c-tiling-4:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-glk8/igt@kms_plane_lowres@pipe-c-tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a>) +143 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_plane_lowres@pipe-d-tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-b-edp-1-d=
ownscale-with-modifier:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_plane_scaling@downscale-with-m=
odifier-factor-0-25@pipe-b-edp-1-downscale-with-modifier.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@downscale-with-modifier-factor-0-25@pipe-d-edp-1-d=
ownscale-with-modifier:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_plane_scaling@downscale-with-m=
odifier-factor-0-25@pipe-d-edp-1-downscale-with-modifier.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a=
>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-edp-1-planes-d=
ownscale:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@kms_plane_scaling@planes-downscale=
-factor-0-25@pipe-b-edp-1-planes-downscale.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
edp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@kms_plane_scaling@planes-unity-sca=
ling-downscale-factor-0-25@pipe-a-edp-1-planes-upscale-downscale.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915=
#5235</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-e=
dp-1-planes-upscale-downscale:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb1/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-a-edp-1-planes-upscale-downscale.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-iclb2/i=
gt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a-edp-1=
-planes-upscale-downscale.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb5/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl7/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-glk3/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@kms_psr@psr2_cursor_mmap_cpu.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441=
">fdo#109441</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_psr@psr2_cursor_plane_onoff.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
2">i915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/3467">i915#3467</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-glk5/igt@kms_rotation_crc@multiplane-rotatio=
n-cropping-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/1888">i915#1888</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/65">i915#65</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-none@edp-1-pipe-a:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@kms_scaling_modes@scaling-mode-non=
e@edp-1-pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/5030">i915#5030</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-apl2/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_sysfs_edid_timing.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2">IGT=
#2</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-tglb2/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb3/igt@kms_vrr@flip-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555<=
/a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@kms_writeback@writeback-invalid-pa=
rameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-kbl6/igt@kms_writeback@writeback-pixel-format=
s.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_writeback@writeback-pixel-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb5/igt@nouveau_crc@pipe-b-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb1/igt@nouveau_crc@pipe-b-source-outp-ina=
ctive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2530">i915#2530</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_double_export:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb5/igt@prime_nv_api@i915_nv_double_export=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109291">fdo#109291</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@i915_nv_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb8/igt@prime_nv_api@i915_nv_reimport_twic=
e_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109291">fdo#109291</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-write-hang:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb3/igt@prime_vgem@fence-write-hang.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295"=
>fdo#109295</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-kbl3/igt@sysfs_clients@recycle.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle-many:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb4/igt@sysfs_clients@recycle-many.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-tglb6/igt@sysfs_clients@sema-50.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@mixed@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl6/igt@sysfs_heartbeat_interval@mixed@vecs0.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/=
shard-apl7/igt@sysfs_heartbeat_interval@mixed@vecs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1731">i915#1731</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb7/igt@tools_test@sysfs_l3_parity.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109307">=
fdo#109307</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl4/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/s=
hard-kbl6/igt@gem_eio@in-flight-suspend.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/=
shard-apl6/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7077/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
077/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-uc-prw-default:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-snb6/igt@gem_exec_flush@basic-uc-prw-default.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7077/shard-snb7/igt@gem_exec_flush@basic-uc-prw-default.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@flink-and-close-vma-leak:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk7/igt@gem_ppgtt@flink-and-close-vma-leak.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/644">i915#6=
44</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_707=
7/shard-glk1/igt@gem_ppgtt@flink-and-close-vma-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@system-suspend-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-snb7/igt@i915_suspend@system-suspend-without-i915.html"=
>DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7077/shard-snb5/igt@i915_suspend@system-suspend-without-i915.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-tglb2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3743">i915#3743</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7077/shard-tglb7/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk9/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html">PASS</a> +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-=
ytile-upscaling.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/4911">i915#4911</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7077/shard-glk1/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7077/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb7/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_70=
77/shard-iclb2/igt@kms_psr@psr2_sprite_plane_move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb5/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7077/shard-iclb6/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-tglb2/igt@perf@polling-parameterized.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5639">i915#5639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/sha=
rd-tglb5/igt@perf@polling-parameterized.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb4/igt@gem_exec_balancer@parallel-bb-first.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/561=
4">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7077/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#=
4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb3/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7077/shard-iclb4/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5614">i915#5614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/561=
4">i915#5614</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7077/shard-iclb8/igt@gem_exec_balancer@parallel-ordering.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#=
4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-tglb2/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2848">i915#2848=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/=
shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +4 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7077/shard-kbl6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/92">i915#92</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-edid-read:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl7/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</=
a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#=
111827</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7077/shard-kbl6/igt@kms_chamelium@dp-edid-read.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/92">i915#92=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-kbl7/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7077/shard-kbl6/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/62">i915#62</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/92">i915#92</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11635/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-continuous-s=
f.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7077/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_11635/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_11635/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11635/shard-apl6/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_11635/shard-apl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077=
/shard-apl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl2/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-=
apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7077/shard-apl3/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl7/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7077/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@runn=
er@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7077/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/shard-apl6/igt@runner@abor=
ted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/5257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6471 -&gt; IGTPW_7077</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11635: aa0155fd1466e1ee5e649ec07562dd93623fad8d @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7077: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7077/index.htm=
l<br />
  IGT_6471: 1d6816f1200520f936a799b7b0ef2e6f396abb16 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4520886894616825841==--
