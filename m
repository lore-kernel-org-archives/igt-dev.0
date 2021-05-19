Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 19 May 2021 03:52:08 -0000
Message-ID: <162139632836.17247.184526795525299423@emeril.freedesktop.org>
References: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20210511090000.1521342-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNTog?=
 =?utf-8?q?Handle_the_case_where_legacy_mmap_is_not_available_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1385450003=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1385450003==
Content-Type: multipart/alternative;
 boundary="===============1200625075056745730=="

--===============1200625075056745730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: Handle the case where legacy mmap is not available (rev2)
URL   : https://patchwork.freedesktop.org/series/90001/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10097_full -> IGTPW_5820_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_5820_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_5820_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_5820_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_gtt@fault-concurrent-y:
    - shard-snb:          NOTRUN -> [INCOMPLETE][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace@bcs0:
    - shard-glk:          [SKIP][2] ([fdo#109271] / [i915#3457]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@gem_exec_fair@basic-pace@bcs0.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@gem_exec_fair@basic-pace@bcs0.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
    - shard-glk:          [INCOMPLETE][4] ([i915#3468]) -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:
    - shard-glk:          [FAIL][6] ([i915#3457]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html

  * {igt@kms_plane@plane-position-hole@pipe-b-planes}:
    - shard-glk:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk5/igt@kms_plane@plane-position-hole@pipe-b-planes.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@kms_plane@plane-position-hole@pipe-b-planes.html

  
Known issues
------------

  Here are the changes found in IGTPW_5820_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-noreloc-purge-cache:
    - shard-apl:          NOTRUN -> [DMESG-WARN][10] ([i915#3457]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@api_intel_bb@blit-noreloc-purge-cache.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][11] ([i915#3457]) +1 similar issue
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@api_intel_bb@blit-noreloc-purge-cache.html

  * igt@api_intel_bb@delta-check:
    - shard-glk:          NOTRUN -> [DMESG-FAIL][12] ([i915#3457]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk7/igt@api_intel_bb@delta-check.html
    - shard-iclb:         NOTRUN -> [DMESG-WARN][13] ([i915#3457]) +2 similar issues
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb8/igt@api_intel_bb@delta-check.html

  * igt@feature_discovery@display-4x:
    - shard-tglb:         NOTRUN -> [SKIP][14] ([i915#1839])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@feature_discovery@display-4x.html
    - shard-iclb:         NOTRUN -> [SKIP][15] ([i915#1839])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@feature_discovery@display-4x.html

  * igt@gem_create@create-massive:
    - shard-iclb:         NOTRUN -> [DMESG-WARN][16] ([i915#3002])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@gem_create@create-massive.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][17] ([i915#3002])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl4/igt@gem_create@create-massive.html
    - shard-tglb:         NOTRUN -> [DMESG-WARN][18] ([i915#3002])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@gem_create@create-massive.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][19] ([i915#3002])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk8/igt@gem_create@create-massive.html

  * igt@gem_ctx_persistence@clone:
    - shard-snb:          NOTRUN -> [SKIP][20] ([fdo#109271] / [i915#1099]) +6 similar issues
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@gem_ctx_persistence@clone.html

  * igt@gem_ctx_persistence@legacy-engines-persistence@render:
    - shard-apl:          [PASS][21] -> [FAIL][22] ([i915#3457])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl6/igt@gem_ctx_persistence@legacy-engines-persistence@render.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gem_ctx_persistence@legacy-engines-persistence@render.html

  * igt@gem_eio@in-flight-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][23] ([i915#180] / [i915#3457])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl7/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_endless@dispatch@rcs0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][24] ([i915#2502] / [i915#3457])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gem_exec_endless@dispatch@rcs0.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#2842] / [i915#3457]) +6 similar issues
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#2842] / [i915#3457]) +5 similar issues
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-kbl:          NOTRUN -> [FAIL][27] ([i915#2842] / [i915#3457])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@submit-chain:
    - shard-apl:          NOTRUN -> [FAIL][28] ([i915#3457]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_exec_fence@submit-chain.html

  * igt@gem_exec_fence@syncobj-wait:
    - shard-glk:          [PASS][29] -> [FAIL][30] ([i915#3457]) +12 similar issues
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk6/igt@gem_exec_fence@syncobj-wait.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@gem_exec_fence@syncobj-wait.html

  * igt@gem_exec_flush@basic-wb-set-default:
    - shard-glk:          [PASS][31] -> [INCOMPLETE][32] ([i915#2944])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@gem_exec_flush@basic-wb-set-default.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@gem_exec_flush@basic-wb-set-default.html

  * igt@gem_exec_params@no-blt:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#109283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@gem_exec_params@no-blt.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][34] ([fdo#109271] / [i915#2190])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][35] ([i915#3468]) +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html

  * igt@gem_mmap_gtt@cpuset-medium-copy-xy:
    - shard-snb:          NOTRUN -> [INCOMPLETE][36] ([i915#3468] / [i915#3485])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html

  * igt@gem_mmap_gtt@medium-copy-xy:
    - shard-iclb:         [PASS][37] -> [INCOMPLETE][38] ([i915#2502])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-iclb5/igt@gem_mmap_gtt@medium-copy-xy.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb8/igt@gem_mmap_gtt@medium-copy-xy.html

  * igt@gem_pread@exhaustion:
    - shard-tglb:         NOTRUN -> [WARN][39] ([i915#2658])
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][40] ([i915#2658])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][42] ([i915#2658])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@gem_pread@exhaustion.html
    - shard-kbl:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@gem_pread@exhaustion.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-tglb:         NOTRUN -> [INCOMPLETE][44] ([i915#3468]) +2 similar issues
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#768]) +3 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html

  * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
    - shard-apl:          NOTRUN -> [INCOMPLETE][46] ([i915#3468])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-iclb:         NOTRUN -> [INCOMPLETE][47] ([i915#3468]) +3 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html
    - shard-glk:          NOTRUN -> [INCOMPLETE][48] ([i915#3468]) +2 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109312]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_softpin@evict-snoop.html

  * igt@gem_softpin@evict-snoop-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([fdo#109312]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html

  * igt@gem_userptr_blits@input-checking:
    - shard-snb:          NOTRUN -> [DMESG-WARN][51] ([i915#3002])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#3297]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#3297])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen3_render_linear_blits:
    - shard-tglb:         NOTRUN -> [SKIP][54] ([fdo#109289]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@gen3_render_linear_blits.html
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109289]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@basic-offset:
    - shard-apl:          NOTRUN -> [SKIP][56] ([fdo#109271]) +161 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gen7_exec_parse@basic-offset.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][57] ([fdo#112306]) +2 similar issues
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@bb-start-cmd:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([fdo#112306]) +2 similar issues
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html

  * igt@i915_hangman@error-state-capture@bcs0:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][59] ([i915#3457]) +7 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl7/igt@i915_hangman@error-state-capture@bcs0.html

  * igt@i915_module_load@reload:
    - shard-snb:          NOTRUN -> [DMESG-WARN][60] ([i915#3457]) +5 similar issues
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@i915_module_load@reload.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-snb:          [PASS][61] -> [INCOMPLETE][62] ([i915#2880])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#3288])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html
    - shard-iclb:         NOTRUN -> [FAIL][64] ([i915#3343])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#1937])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html

  * igt@i915_pm_rpm@cursor-dpms:
    - shard-tglb:         [PASS][66] -> [DMESG-WARN][67] ([i915#2411] / [i915#3457])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-tglb7/igt@i915_pm_rpm@cursor-dpms.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@i915_pm_rpm@cursor-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110892]) +1 similar issue
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111644] / [i915#1397] / [i915#2411])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rps@reset:
    - shard-apl:          NOTRUN -> [DMESG-FAIL][70] ([i915#3457])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@i915_pm_rps@reset.html

  * igt@i915_pm_sseu@full-enable:
    - shard-iclb:         NOTRUN -> [SKIP][71] ([fdo#109288])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@i915_pm_sseu@full-enable.html
    - shard-glk:          NOTRUN -> [DMESG-WARN][72] ([i915#3457])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][73] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][74] ([fdo#111614]) +5 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([fdo#110723])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([fdo#111615]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic:
    - shard-glk:          NOTRUN -> [FAIL][77] ([fdo#108145]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][78] ([fdo#109271] / [fdo#111827]) +15 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-enable-disable-mode:
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +26 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +19 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_chamelium@vga-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [fdo#111827]) +18 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk1/igt@kms_chamelium@vga-hpd-enable-disable-mode.html

  * igt@kms_color@pipe-d-ctm-blue-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#109278] / [i915#1149]) +1 similar issue
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_color@pipe-d-ctm-blue-to-red.html

  * igt@kms_color@pipe-d-degamma:
    - shard-tglb:         NOTRUN -> [FAIL][83] ([i915#1149])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@kms_color@pipe-d-degamma.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#109284] / [fdo#111827]) +16 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +17 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html

  * igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html

  * igt@kms_content_protection@atomic:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109300] / [fdo#111066])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_content_protection@atomic.html
    - shard-apl:          NOTRUN -> [TIMEOUT][88] ([i915#1319]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#3116])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@pipe-a-cursor-256x256-random:
    - shard-snb:          NOTRUN -> [FAIL][90] ([i915#3457]) +8 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html

  * igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3319] / [i915#3457]) +3 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:
    - shard-kbl:          NOTRUN -> [FAIL][92] ([i915#3444] / [i915#3457]) +11 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
    - shard-glk:          [PASS][93] -> [FAIL][94] ([i915#3444] / [i915#3457]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109278] / [fdo#109279] / [i915#3457]) +5 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html

  * igt@kms_cursor_crc@pipe-b-cursor-64x64-random:
    - shard-iclb:         NOTRUN -> [FAIL][96] ([i915#3457]) +12 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html
    - shard-glk:          NOTRUN -> [FAIL][97] ([i915#3444] / [i915#3457]) +13 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html

  * igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:
    - shard-apl:          [PASS][98] -> [FAIL][99] ([i915#3444] / [i915#3457])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:
    - shard-snb:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#3457]) +59 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html
    - shard-kbl:          NOTRUN -> [SKIP][101] ([fdo#109271] / [i915#3457]) +22 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:
    - shard-apl:          NOTRUN -> [FAIL][102] ([i915#3444] / [i915#3457]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html

  * igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:
    - shard-tglb:         NOTRUN -> [FAIL][103] ([i915#2124] / [i915#3457]) +16 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-128x128-onscreen:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#3457]) +22 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-128x128-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#3457]) +29 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk8/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#3359] / [i915#3457]) +6 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html

  * igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([fdo#109278] / [i915#3457]) +19 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][108] ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:
    - shard-tglb:         [PASS][109] -> [FAIL][110] ([i915#2124] / [i915#3457]) +3 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:
    - shard-glk:          NOTRUN -> [FAIL][111] ([i915#70]) +1 similar issue
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html

  * igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:
    - shard-glk:          [PASS][112] -> [FAIL][113] ([i915#70])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
    - shard-snb:          NOTRUN -> [SKIP][114] ([fdo#109271]) +441 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([fdo#109274] / [fdo#109278]) +11 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_dp_dsc@basic-dsc-enable-dp:
    - shard-tglb:         NOTRUN -> [SKIP][116] ([fdo#109349])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@kms_dp_dsc@basic-dsc-enable-dp.html
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109349])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109274]) +6 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#111825]) +62 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [PASS][120] -> [DMESG-WARN][121] ([i915#180])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@flip-vs-suspend@c-dp1:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][122] ([i915#180]) +4 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:
    - shard-apl:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#2642])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html
    - shard-kbl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#2642])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:
    - shard-glk:          [PASS][125] -> [FAIL][126] ([i915#699]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html

  * igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:
    - shard-glk:          [PASS][127] -> [FAIL][128] ([i915#3484]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a.html
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([fdo#109280]) +50 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-kbl:          NOTRUN -> [SKIP][130] ([fdo#109271]) +170 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-glk:          NOTRUN -> [SKIP][131] ([fdo#109271])

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/index.html

--===============1200625075056745730==
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
<tr><td><b>Series:</b></td><td>i915: Handle the case where legacy mmap is not available (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/90001/">https://patchwork.freedesktop.org/series/90001/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10097_full -&gt; IGTPW_5820_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5820_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_5820_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5820_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_mmap_gtt@fault-concurrent-y:<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@gem_mmap_gtt@fault-concurrent-y.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@gem_exec_fair@basic-pace@bcs0.html">SKIP</a> ([fdo#109271] / [i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@gem_exec_fair@basic-pace@bcs0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk1/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a> ([i915#3468]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk4/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-a-planes}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">FAIL</a> ([i915#3457]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@kms_plane@plane-position-hole-dpms@pipe-a-planes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-planes}:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk5/igt@kms_plane@plane-position-hole@pipe-b-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@kms_plane@plane-position-hole@pipe-b-planes.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5820_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-noreloc-purge-cache:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@api_intel_bb@blit-noreloc-purge-cache.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@api_intel_bb@blit-noreloc-purge-cache.html">DMESG-WARN</a> ([i915#3457]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@delta-check:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk7/igt@api_intel_bb@delta-check.html">DMESG-FAIL</a> ([i915#3457]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb8/igt@api_intel_bb@delta-check.html">DMESG-WARN</a> ([i915#3457]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@feature_discovery@display-4x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl4/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk8/igt@gem_create@create-massive.html">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@clone:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@gem_ctx_persistence@clone.html">SKIP</a> ([fdo#109271] / [i915#1099]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-persistence@render:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl6/igt@gem_ctx_persistence@legacy-engines-persistence@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gem_ctx_persistence@legacy-engines-persistence@render.html">FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl7/igt@gem_eio@in-flight-suspend.html">DMESG-WARN</a> ([i915#180] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gem_exec_endless@dispatch@rcs0.html">INCOMPLETE</a> ([i915#2502] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> ([i915#2842] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@submit-chain:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_exec_fence@submit-chain.html">FAIL</a> ([i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-wait:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk6/igt@gem_exec_fence@syncobj-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@gem_exec_fence@syncobj-wait.html">FAIL</a> ([i915#3457]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-wb-set-default:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk7/igt@gem_exec_flush@basic-wb-set-default.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@gem_exec_flush@basic-wb-set-default.html">INCOMPLETE</a> ([i915#2944])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@gem_exec_params@no-blt.html">SKIP</a> ([fdo#109283])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_huc_copy@huc-copy.html">SKIP</a> ([fdo#109271] / [i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html">INCOMPLETE</a> ([i915#3468]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@cpuset-medium-copy-xy:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@gem_mmap_gtt@cpuset-medium-copy-xy.html">INCOMPLETE</a> ([i915#3468] / [i915#3485])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@medium-copy-xy:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-iclb5/igt@gem_mmap_gtt@medium-copy-xy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb8/igt@gem_mmap_gtt@medium-copy-xy.html">INCOMPLETE</a> ([i915#2502])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@gem_pread@exhaustion.html">WARN</a> ([i915#2658])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-y-tiled.html">SKIP</a> ([i915#768]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html">INCOMPLETE</a> ([i915#3468]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@gem_softpin@evict-snoop-interruptible.html">SKIP</a> ([fdo#109312]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@gem_userptr_blits@input-checking.html">DMESG-WARN</a> ([i915#3002])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gem_userptr_blits@unsync-unmap.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-after-close.html">SKIP</a> ([i915#3297])</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@gen3_render_linear_blits.html">SKIP</a> ([fdo#109289]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-offset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@gen7_exec_parse@basic-offset.html">SKIP</a> ([fdo#109271]) +161 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@gen9_exec_parse@allowed-all.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-cmd:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@gen9_exec_parse@bb-start-cmd.html">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@error-state-capture@bcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl7/igt@i915_hangman@error-state-capture@bcs0.html">DMESG-WARN</a> ([i915#3457]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb5/igt@i915_module_load@reload.html">DMESG-WARN</a> ([i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html">INCOMPLETE</a> ([i915#2880])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> ([i915#3288])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@i915_pm_dc@dc9-dpms.html">FAIL</a> ([i915#3343])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-dp.html">SKIP</a> ([fdo#109271] / [i915#1937])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@cursor-dpms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-tglb7/igt@i915_pm_rpm@cursor-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@i915_pm_rpm@cursor-dpms.html">DMESG-WARN</a> ([i915#2411] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> ([fdo#110892]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@i915_pm_rps@reset.html">DMESG-FAIL</a> ([i915#3457])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@i915_pm_sseu@full-enable.html">SKIP</a> ([fdo#109288])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@i915_pm_sseu@full-enable.html">DMESG-WARN</a> ([i915#3457])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> ([fdo#111614]) +5 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> ([fdo#110723])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> ([fdo#111615]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic.html">FAIL</a> ([fdo#108145]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb6/igt@kms_chamelium@hdmi-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-enable-disable-mode:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk1/igt@kms_chamelium@vga-hpd-enable-disable-mode.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_color@pipe-d-ctm-blue-to-red.html">SKIP</a> ([fdo#109278] / [i915#1149]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-degamma:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb8/igt@kms_color@pipe-d-degamma.html">FAIL</a> ([i915#1149])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb5/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@kms_color_chamelium@pipe-b-ctm-red-to-blue.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-red-to-blue.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_content_protection@atomic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_content_protection@atomic.html">TIMEOUT</a> ([i915#1319]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> ([i915#3116])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-256x256-random:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb2/igt@kms_cursor_crc@pipe-a-cursor-256x256-random.html">FAIL</a> ([i915#3457]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl6/igt@kms_cursor_crc@pipe-a-cursor-64x64-onscreen.html">FAIL</a> ([i915#3444] / [i915#3457]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk3/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk5/igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque.html">FAIL</a> ([i915#3444] / [i915#3457]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_cursor_crc@pipe-b-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109278] / [fdo#109279] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-64x64-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3457]) +12 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk1/igt@kms_cursor_crc@pipe-b-cursor-64x64-random.html">FAIL</a> ([i915#3444] / [i915#3457]) +13 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-128x42-sliding.html">FAIL</a> ([i915#3444] / [i915#3457])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +59 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-32x10-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +22 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-c-cursor-64x21-sliding.html">FAIL</a> ([i915#3444] / [i915#3457]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb1/igt@kms_cursor_crc@pipe-c-cursor-64x64-onscreen.html">FAIL</a> ([i915#2124] / [i915#3457]) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-128x128-onscreen:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl7/igt@kms_cursor_crc@pipe-d-cursor-128x128-onscreen.html">SKIP</a> ([fdo#109271] / [i915#3457]) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk8/igt@kms_cursor_crc@pipe-d-cursor-256x85-rapid-movement.html">SKIP</a> ([fdo#109271] / [i915#3457]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-32x10-onscreen.html">SKIP</a> ([i915#3359] / [i915#3457]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html">SKIP</a> ([fdo#109278] / [i915#3457]) +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb3/igt@kms_cursor_crc@pipe-d-cursor-512x512-sliding.html">SKIP</a> ([fdo#109279] / [i915#3359] / [i915#3457]) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-64x21-offscreen.html">FAIL</a> ([i915#2124] / [i915#3457]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk4/igt@kms_cursor_edge_walk@pipe-b-128x128-left-edge.html">FAIL</a> ([i915#70]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk2/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_cursor_edge_walk@pipe-b-128x128-top-edge.html">FAIL</a> ([i915#70])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html">SKIP</a> ([fdo#109271]) +441 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> ([fdo#109274] / [fdo#109278]) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_dsc@basic-dsc-enable-dp:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb2/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb7/igt@kms_dp_dsc@basic-dsc-enable-dp.html">SKIP</a> ([fdo#109349])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb3/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> ([fdo#109274]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> ([fdo#111825]) +62 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-apl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl3/igt@kms_flip@flip-vs-suspend@c-dp1.html">DMESG-WARN</a> ([i915#180]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-apl6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile.html">SKIP</a> ([fdo#109271] / [i915#2642])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-1-pipe-c.html">FAIL</a> ([i915#699]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10097/shard-glk8/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-glk3/igt@kms_flip_tiling@flip-changes-tiling-yf@hdmi-a-2-pipe-a.html">FAIL</a> ([i915#3484]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +50 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5820/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109271]) +170 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; [SKIP][131] ([fdo#109271])</li>
</ul>
</li>
</ul>

</body>
</html>

--===============1200625075056745730==--

--===============1385450003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1385450003==--
