Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8219147172057612242=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Date: Mon, 28 Mar 2022 13:27:46 -0000
Message-ID: <164847406600.2849.7622333145221752890@emeril.freedesktop.org>
References: <20220328100859.13550-1-matthew.auld@intel.com>
In-Reply-To: <20220328100859.13550-1-matthew.auld@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Flmem=5Fswapping=3A_limit_lmem_to_4G_=28rev2=29?=
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

--===============8219147172057612242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_lmem_swapping: limit lmem to 4G (rev2)
URL   : https://patchwork.freedesktop.org/series/101864/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_11409_full -> IGTPW_6837_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/index.html

Participating hosts (12 -> 7)
------------------------------

  Missing    (5): shard-skl pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6837_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_lmem_swapping@heavy-verify-random:
    - {shard-tglu}:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random.html

  
Known issues
------------

  Here are the changes found in IGTPW_6837_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-keep-cache:
    - shard-apl:          NOTRUN -> [INCOMPLETE][2] ([i915#5441])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl7/igt@api_intel_bb@blit-noreloc-keep-cache.html

  * igt@feature_discovery@chamelium:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([fdo#111827])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@feature_discovery@chamelium.html

  * igt@feature_discovery@display-3x:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#1839]) +1 similar issue
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@feature_discovery@display-3x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#658]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@feature_discovery@psr2.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-tglb:         NOTRUN -> [SKIP][6] ([i915#3555] / [i915#5325]) +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_ccs@block-copy-compressed.html
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][8] ([i915#4991]) +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_create@create-massive.html
    - shard-snb:          NOTRUN -> [DMESG-WARN][9] ([i915#4991]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][10] ([i915#4991])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@gem_create@create-massive.html
    - shard-apl:          NOTRUN -> [DMESG-WARN][11] ([i915#4991])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl8/igt@gem_create@create-massive.html

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][12] ([fdo#109314])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][13] ([fdo#109314])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@legacy-engines-mixed:
    - shard-snb:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#1099]) +4 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html

  * igt@gem_ctx_sseu@invalid-sseu:
    - shard-tglb:         NOTRUN -> [SKIP][15] ([i915#280]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         NOTRUN -> [SKIP][16] ([i915#4525]) +1 similar issue
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][17] ([i915#5076])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][18] ([i915#5076])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-tglb:         NOTRUN -> [DMESG-FAIL][19] ([i915#5076])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][20] -> [FAIL][21] ([i915#2846])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-kbl7/igt@gem_exec_fair@basic-deadline.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][22] ([i915#2842]) +1 similar issue
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][23] ([i915#2842])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][24] -> [FAIL][25] ([i915#2842])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][26] ([i915#2842]) +2 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - shard-iclb:         NOTRUN -> [SKIP][28] ([fdo#109313])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_exec_params@no-blt:
    - shard-tglb:         NOTRUN -> [SKIP][29] ([fdo#109283])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_exec_params@no-blt.html

  * igt@gem_exec_params@no-vebox:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([fdo#109283])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@gem_exec_params@no-vebox.html
    - shard-tglb:         NOTRUN -> [SKIP][31] ([fdo#109283] / [i915#4877])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_exec_params@no-vebox.html

  * igt@gem_exec_params@secure-non-root:
    - shard-tglb:         NOTRUN -> [SKIP][32] ([fdo#112283])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb3/igt@gem_exec_params@secure-non-root.html
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#112283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_lmem_swapping@heavy-verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-glk:          NOTRUN -> [SKIP][35] ([fdo#109271] / [i915#4613]) +2 similar issues
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@random-engines:
    - shard-iclb:         NOTRUN -> [SKIP][36] ([i915#4613]) +3 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_lmem_swapping@random-engines.html
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#4613])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl1/igt@gem_lmem_swapping@random-engines.html

  * igt@gem_media_vme:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#284])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_media_vme.html

  * igt@gem_pipe_control_store_loop@reused-buffer:
    - shard-glk:          NOTRUN -> [INCOMPLETE][39] ([i915#5441]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk4/igt@gem_pipe_control_store_loop@reused-buffer.html

  * igt@gem_ppgtt@blt-vs-render-ctx0:
    - shard-snb:          NOTRUN -> [DMESG-FAIL][40] ([i915#5441])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb4/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - shard-kbl:          NOTRUN -> [DMESG-FAIL][41] ([i915#5441])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - shard-glk:          NOTRUN -> [DMESG-FAIL][42] ([i915#5441])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctx0.html
    - shard-apl:          NOTRUN -> [DMESG-FAIL][43] ([i915#5441])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@gem_ppgtt@blt-vs-render-ctx0.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][44] ([i915#2658]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][45] ([i915#2658]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][46] ([i915#2658])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][47] ([i915#2658])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@fail-invalid-protected-context:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#4270]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@gem_pxp@fail-invalid-protected-context.html

  * igt@gem_pxp@reject-modify-context-protection-off-3:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#4270]) +4 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#768]) +8 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([fdo#109312])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109290])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb1/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> [DMESG-WARN][53] ([i915#4991]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_userptr_blits@input-checking.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][54] ([i915#4991])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk4/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-cycles:
    - shard-tglb:         NOTRUN -> [SKIP][55] ([i915#3297]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html
    - shard-iclb:         NOTRUN -> [SKIP][56] ([i915#3297]) +3 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][57] ([fdo#109289]) +10 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@bitmasks:
    - shard-iclb:         NOTRUN -> [SKIP][58] ([fdo#109289]) +12 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gen7_exec_parse@bitmasks.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([i915#2856]) +8 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][60] ([i915#2527] / [i915#2856]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][61] ([i915#4281])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [SKIP][62] ([i915#4281])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-kbl:          NOTRUN -> [SKIP][63] ([fdo#109271] / [i915#1937])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html
    - shard-apl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#1937])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#1937])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         NOTRUN -> [WARN][66] ([i915#1804] / [i915#2684])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110892]) +1 similar issue
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-tglb:         NOTRUN -> [SKIP][68] ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#109303])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109303])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_query@query-topology-unsupported:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109302])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@i915_query@query-topology-unsupported.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([fdo#109302])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@i915_query@query-topology-unsupported.html

  * igt@i915_selftest@mock@sanitycheck:
    - shard-snb:          [PASS][73] -> [SKIP][74] ([fdo#109271])
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-snb7/igt@i915_selftest@mock@sanitycheck.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb7/igt@i915_selftest@mock@sanitycheck.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3826])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#3826])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#4765])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#404])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([i915#1769])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#1769]) +1 similar issue
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([i915#5286]) +7 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][82] ([i915#5286]) +5 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-kbl:          NOTRUN -> [SKIP][83] ([fdo#109271]) +207 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111614]) +4 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#110725] / [fdo#111614]) +7 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-0:
    - shard-glk:          [PASS][86] -> [DMESG-WARN][87] ([i915#118])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-snb:          [PASS][88] -> [INCOMPLETE][89] ([i915#5441])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
    - shard-iclb:         [PASS][90] -> [INCOMPLETE][91] ([i915#5441]) +2 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-iclb5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-glk:          [PASS][92] -> [INCOMPLETE][93] ([i915#5441]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][94] ([i915#2828] / [i915#5441])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][95] ([i915#1373] / [i915#5441])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][96] ([i915#1373] / [i915#5441])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][97] ([i915#5441]) +5 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-snb:          NOTRUN -> [INCOMPLETE][98] ([i915#5441]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-apl:          NOTRUN -> [SKIP][99] ([fdo#109271] / [i915#3777]) +3 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglb:         [PASS][100] -> [INCOMPLETE][101] ([i915#5441])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][102] ([i915#5441]) +7 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-kbl:          [PASS][103] -> [INCOMPLETE][104] ([i915#5441])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][105] ([i915#5441] / [i915#794]) +1 similar issue
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-kbl:          NOTRUN -> [SKIP][106] ([fdo#109271] / [i915#3777]) +4 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-glk:          NOTRUN -> [SKIP][107] ([fdo#109271] / [i915#3777]) +1 similar issue
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#110723]) +3 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][109] ([i915#1982] / [i915#5441]) +2 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][110] ([i915#5441]) +5 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([fdo#111615]) +8 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-apl:          NOTRUN -> [SKIP][112] ([fdo#109271]) +275 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][113] ([fdo#109271] / [i915#3886]) +13 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][114] ([fdo#109271] / [i915#3886]) +8 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([i915#3689]) +6 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#3886]) +7 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][117] ([i915#3689] / [i915#3886]) +6 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109278] / [i915#3886]) +15 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#111615] / [i915#3689]) +17 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-tglb:         NOTRUN -> [SKIP][120] ([i915#3742])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium@dp-hpd-storm:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([fdo#109284] / [fdo#111827]) +28 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_chamelium@dp-hpd-storm.html

  * igt@kms_chamelium@dp-mode-timings:
    - shard-apl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@kms_chamelium@dp-mode-timings.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [fdo#111827]) +20 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([fdo#109284] / [fdo#111827]) +25 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@pipe-c-deep-color:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([fdo#109278] / [i915#3555])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_color@pipe-c-deep-color.html

  * igt@kms_color@pipe-d-ctm-negative:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([fdo#109278] / [i915#1149]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@kms_color@pipe-d-ctm-negative.html

  * igt@kms_color_chamelium@pipe-a-ctm-0-25:
    - shard-snb:          NOTRUN -> [SKIP][127] ([fdo#109271] / [fdo#111827]) +27 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-glk:          NOTRUN -> [SKIP][128] ([fdo#109271] / [fdo#111827]) +17 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([i915#3116]) +1 similar issue
   [

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/index.html

--===============8219147172057612242==
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
<tr><td><b>Series:</b></td><td>tests/gem_lmem_swapping: limit lmem to 4G (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/101864/">https://patchwork.freedesktop.org/series/101864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11409_full -&gt; IGTPW_6837_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/index.html</p>
<h2>Participating hosts (12 -&gt; 7)</h2>
<p>Missing    (5): shard-skl pig-kbl-iris pig-glk-j5005 pig-skl-6260u shard-rkl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6837_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_lmem_swapping@heavy-verify-random:<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6837_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-keep-cache:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl7/igt@api_intel_bb@blit-noreloc-keep-cache.html">INCOMPLETE</a> ([i915#5441])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@chamelium:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@feature_discovery@chamelium.html">SKIP</a> ([fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@feature_discovery@display-3x.html">SKIP</a> ([i915#1839]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@feature_discovery@psr2.html">SKIP</a> ([i915#658]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#3555] / [i915#5325]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@gem_ccs@block-copy-compressed.html">SKIP</a> ([i915#5327]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991]) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@gem_ctx_param@set-priority-not-supported.html">SKIP</a> ([fdo#109314])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_ctx_persistence@legacy-engines-mixed.html">SKIP</a> ([fdo#109271] / [i915#1099]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@invalid-sseu:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_ctx_sseu@invalid-sseu.html">SKIP</a> ([i915#280]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_balancer@parallel-keep-submit-fence.html">SKIP</a> ([i915#4525]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@gem_exec_balancer@parallel-keep-submit-fence.html">DMESG-WARN</a> ([i915#5076])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_exec_balancer@parallel-ordering.html">DMESG-FAIL</a> ([i915#5076])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html">SKIP</a> ([fdo#109313])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-vebox:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_exec_params@no-vebox.html">SKIP</a> ([fdo#109283] / [i915#4877])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb3/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_exec_params@secure-non-root.html">SKIP</a> ([fdo#112283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-random.html">SKIP</a> ([i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk2/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random-engines:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([i915#4613]) +3 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl1/igt@gem_lmem_swapping@random-engines.html">SKIP</a> ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_media_vme:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_media_vme.html">SKIP</a> ([i915#284])</li>
</ul>
</li>
<li>
<p>igt@gem_pipe_control_store_loop@reused-buffer:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk4/igt@gem_pipe_control_store_loop@reused-buffer.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ppgtt@blt-vs-render-ctx0:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb4/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#5441])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#5441])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk2/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#5441])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@gem_ppgtt@blt-vs-render-ctx0.html">DMESG-FAIL</a> ([i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658]) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@fail-invalid-protected-context:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@gem_pxp@fail-invalid-protected-context.html">SKIP</a> ([i915#4270]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@gem_pxp@reject-modify-context-protection-off-3.html">SKIP</a> ([i915#4270]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html">SKIP</a> ([i915#768]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb1/igt@gem_userptr_blits@coherency-sync.html">SKIP</a> ([fdo#109290])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991]) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk4/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#4991])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@gem_userptr_blits@unsync-unmap-cycles.html">SKIP</a> ([i915#3297]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@bitmasks:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb3/igt@gen7_exec_parse@bitmasks.html">SKIP</a> ([fdo#109289]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([i915#2856]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2527] / [i915#2856]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#4281])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl1/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl3/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk9/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@i915_pm_rpm@modeset-non-lpsp.html">SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb5/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> ([fdo#109303])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-unsupported:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@i915_query@query-topology-unsupported.html">SKIP</a> ([fdo#109302])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@mock@sanitycheck:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-snb7/igt@i915_selftest@mock@sanitycheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb7/igt@i915_selftest@mock@sanitycheck.html">SKIP</a> ([fdo#109271])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_atomic@atomic_plane_damage.html">SKIP</a> ([i915#4765])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> ([i915#404])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> ([i915#1769])</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> ([i915#1769]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> ([i915#5286]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">SKIP</a> ([i915#5286]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#109271]) +207 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> ([fdo#111614]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk2/igt@kms_big_fb@linear-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk5/igt@kms_big_fb@linear-32bpp-rotate-0.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>
<p>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-snb4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb2/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-iclb5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-glk5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">INCOMPLETE</a> ([i915#2828] / [i915#5441])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">INCOMPLETE</a> ([i915#1373] / [i915#5441])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> ([i915#5441]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-tglb7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> ([i915#5441])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html">INCOMPLETE</a> ([i915#5441]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11409/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">INCOMPLETE</a> ([i915#5441])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">INCOMPLETE</a> ([i915#5441] / [i915#794]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +4 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> ([fdo#110723]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">INCOMPLETE</a> ([i915#1982] / [i915#5441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> ([i915#5441]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> ([fdo#111615]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> ([fdo#109271]) +275 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk8/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl2/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl4/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb8/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109278] / [i915#3886]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb7/igt@kms_ccs@pipe-d-bad-rotation-90-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_cdclk@mode-transition.html">SKIP</a> ([i915#3742])</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-storm:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb7/igt@kms_chamelium@dp-hpd-storm.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-mode-timings:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-apl6/igt@kms_chamelium@dp-mode-timings.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-kbl6/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-tglb2/igt@kms_chamelium@vga-frame-dump.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-deep-color:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_color@pipe-c-deep-color.html">SKIP</a> ([fdo#109278] / [i915#3555])</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-negative:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb2/igt@kms_color@pipe-d-ctm-negative.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-0-25:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +27 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-glk9/igt@kms_color_chamelium@pipe-c-ctm-0-5.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6837/shard-iclb6/igt@kms_color_chamelium@pipe-d-ctm-green-to-red.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; [SKIP][130] ([i915#3116]) +1 similar issue<br />
   [</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8219147172057612242==--
