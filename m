Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3059150453414119951=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jake Freeland" <jake@technologyfriends.net>
Date: Wed, 24 Aug 2022 20:15:08 -0000
Message-ID: <166137210835.9872.4623069320862336785@emeril.freedesktop.org>
References: <20220823165642.4115-1-jfree@freebsd.org>
In-Reply-To: <20220823165642.4115-1-jfree@freebsd.org>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcmVwbGFj?=
 =?utf-8?q?ed_/bin/bash_shebangs_with_/bin/sh_for_BSD_compatibility_=28rev?=
 =?utf-8?q?4=29?=
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

--===============3059150453414119951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: replaced /bin/bash shebangs with /bin/sh for BSD compatibility (rev4)
URL   : https://patchwork.freedesktop.org/series/107314/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12017_full -> IGTPW_7673_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7673_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7673_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/index.html

Participating hosts (12 -> 9)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7673_full:

### IGT changes ###

#### Possible regressions ####

  * igt@api_intel_allocator@fork-simple-stress-signal:
    - shard-tglb:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@api_intel_allocator@fork-simple-stress-signal.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-iclb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html

  
Known issues
------------

  Here are the changes found in IGTPW_7673_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@crc32:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#6230])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@api_intel_bb@crc32.html

  * igt@feature_discovery@display-4x:
    - shard-iclb:         NOTRUN -> [SKIP][6] ([i915#1839])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@feature_discovery@display-4x.html

  * igt@gem_ccs@ctrl-surf-copy:
    - shard-iclb:         NOTRUN -> [SKIP][7] ([i915#5327]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_ccs@ctrl-surf-copy.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-iclb:         NOTRUN -> [SKIP][8] ([i915#6335])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-apl:          NOTRUN -> [INCOMPLETE][9] ([i915#4939] / [i915#6598]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][10] ([fdo#109271] / [i915#1099])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_eio@suspend:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][11] ([i915#6598]) +4 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@gem_eio@suspend.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][12] ([i915#6598] / [i915#6628])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][13] -> [SKIP][14] ([i915#4525]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [PASS][15] -> [FAIL][16] ([i915#2842])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][17] ([i915#2842]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-kbl:          NOTRUN -> [FAIL][18] ([i915#2842])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][19] ([i915#2842])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][20] -> [FAIL][21] ([i915#2842])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-iclb:         [PASS][22] -> [FAIL][23] ([i915#2842])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][24] ([i915#2842]) +5 similar issues
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_huc_copy@huc-copy:
    - shard-apl:          NOTRUN -> [SKIP][25] ([fdo#109271] / [i915#2190])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl3/igt@gem_huc_copy@huc-copy.html
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][28] ([i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#4613]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_lmem_swapping@basic.html
    - shard-apl:          NOTRUN -> [SKIP][30] ([fdo#109271] / [i915#4613]) +1 similar issue
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl8/igt@gem_lmem_swapping@basic.html
    - shard-glk:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk5/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-kbl:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl1/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl6/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb6/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4270]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4270])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +283 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][40] ([i915#768]) +6 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_softpin@noreloc-s3:
    - shard-glk:          NOTRUN -> [INCOMPLETE][41] ([i915#6598]) +6 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk8/igt@gem_softpin@noreloc-s3.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][42] ([i915#4939] / [i915#6598])
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb2/igt@gem_softpin@noreloc-s3.html

  * igt@gem_userptr_blits@access-control:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#3297])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@gem_userptr_blits@access-control.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][44] ([i915#3318])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_userptr_blits@vma-merge.html
    - shard-snb:          NOTRUN -> [FAIL][45] ([i915#2724])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb2/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [FAIL][46] ([i915#3318])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk5/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][47] ([i915#3318])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][48] ([fdo#109271]) +375 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb5/igt@gem_vm_create@invalid-create.html

  * igt@gen3_render_tiledy_blits:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([fdo#109289]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gen3_render_tiledy_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2856]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [PASS][51] -> [FAIL][52] ([i915#454])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb7/igt@i915_pm_dc@dc6-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#6590])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rc6_residency@rc6-fence:
    - shard-iclb:         NOTRUN -> [WARN][54] ([i915#2684])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][56] ([fdo#110892])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_pm_rpm@system-suspend-devices:
    - shard-glk:          [PASS][57] -> [INCOMPLETE][58] ([i915#6598])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk9/igt@i915_pm_rpm@system-suspend-devices.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk6/igt@i915_pm_rpm@system-suspend-devices.html
    - shard-apl:          [PASS][59] -> [INCOMPLETE][60] ([i915#6598])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl7/igt@i915_pm_rpm@system-suspend-devices.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl6/igt@i915_pm_rpm@system-suspend-devices.html

  * igt@i915_pm_rps@engine-order:
    - shard-glk:          [PASS][61] -> [FAIL][62] ([i915#6537])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk1/igt@i915_pm_rps@engine-order.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/igt@i915_pm_rps@engine-order.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-iclb:         NOTRUN -> [SKIP][63] ([fdo#109303])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@hangcheck:
    - shard-tglb:         [PASS][64] -> [DMESG-WARN][65] ([i915#5591])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb7/igt@i915_selftest@live@hangcheck.html
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@debugfs-reader:
    - shard-snb:          [PASS][66] -> [INCOMPLETE][67] ([i915#4939] / [i915#6598])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-snb5/igt@i915_suspend@debugfs-reader.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@i915_suspend@debugfs-reader.html
    - shard-iclb:         [PASS][68] -> [INCOMPLETE][69] ([i915#6598])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb5/igt@i915_suspend@debugfs-reader.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-apl:          [PASS][70] -> [INCOMPLETE][71] ([i915#4939] / [i915#6598]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html
    - shard-snb:          [PASS][72] -> [INCOMPLETE][73] ([i915#4817] / [i915#4939] / [i915#6598])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          NOTRUN -> [INCOMPLETE][74] ([i915#4817] / [i915#6598])
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb5/igt@i915_suspend@forcewake.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][75] ([i915#4765])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([i915#404])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#5286]) +9 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#5286])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][79] ([fdo#111614])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110725] / [fdo#111614]) +4 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111615]) +1 similar issue
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-iclb:         NOTRUN -> [SKIP][82] ([fdo#110723]) +2 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [i915#3886]) +8 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([i915#3689]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109278]) +40 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [i915#3886]) +9 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [i915#3886]) +9 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +76 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][89] ([fdo#109271] / [i915#3886]) +4 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][90] ([i915#3742])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][91] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk8/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
    - shard-kbl:          NOTRUN -> [SKIP][92] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-hpd:
    - shard-apl:          NOTRUN -> [SKIP][93] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl8/igt@kms_chamelium@vga-hpd.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][94] ([fdo#109271] / [fdo#111827]) +10 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb6/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@ctm-0-25:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@kms_color_chamelium@ctm-0-25.html

  * igt@kms_content_protection@atomic:
    - shard-tglb:         NOTRUN -> [SKIP][96] ([i915#1063])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-apl:          NOTRUN -> [TIMEOUT][97] ([i915#1319]) +2 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([fdo#109300] / [fdo#111066]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_content_protection@lic.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][99] ([i915#1319] / [i915#6637]) +1 similar issue
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_content_protection@srm.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][100] ([i915#3528])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-iclb:         NOTRUN -> [SKIP][101] ([i915#3528])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][102] ([i915#5287]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([i915#5287]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109274]) +21 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#6375])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][107] ([i915#2672]) +5 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][108] ([fdo#109280]) +64 similar issues
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][109] ([i915#6497])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][110] ([fdo#109280] / [fdo#111825]) +4 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-tglb:         [PASS][111] -> [SKIP][112] ([i915#433])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][113] -> [FAIL][114] ([i915#1188]) +1 similar issue
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][115] ([i915#6403]) +2 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][116] ([i915#6598]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][117] ([i915#6520] / [i915#6598])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
    - shard-snb:          NOTRUN -> [INCOMPLETE][118] ([i915#4939])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][119] ([i915#265])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-glk:          NOTRUN -> [FAIL][120] ([i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
    - shard-apl:          NOTRUN -> [FAIL][121] ([fdo#108145] / [i915#265])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html
    - shard-glk:          NOTRUN -> [FAIL][122] ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][123] ([i915#3536]) +2 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_plane_lowres@tiling-none@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][124] ([i915#5176]) +11 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> [SKIP][125] ([fdo#109271]) +210 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#658]) +1 similar issue
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#658]) +5 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][128] ([fdo#111068] / [i915#658]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         NOTRUN -> [SKIP][129] ([i915#2920])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#1911])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html
    - shard-glk:          NOTRUN -> [SKIP][131] ([fdo#109271] / [i915#658]) +4 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk9/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][132] ([fdo#109642] / [fdo#111068] / [i915#658])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html
    - shard-kbl:          NOTRUN -> [SKIP][133] ([fdo#109271] / [i915#658])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_cursor_blt:
    - shard-iclb:         NOTRUN -> [SKIP][134] ([fdo#109441]) +7 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html

  * igt@kms_selftest@all:
    - shard-iclb:         NOTRUN -> [SKIP][135] ([i915#6433])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_selftest@all.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][136] ([fdo#109309])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flipline:
    - shard-iclb:         NOTRUN -> [SKIP][137] ([i915#3555]) +2 similar issues
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_vrr@flipline.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][138] ([i915#2530]) +6 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][139] ([fdo#109278] / [i915#2530])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html
    - shard-tglb:         NOTRUN -> [SKIP][140] ([i915#2530])
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([fdo#109289])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@perf@per-context-mode-unprivileged.html

  * igt@perf@stress-open-close:
    - shard-glk:          NOTRUN -> [INCOMPLETE][142] ([i915#5213])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk2/igt@perf@stress-open-close.html

  * igt@prime_nv_pcopy@test3_2:
    - shard-iclb:         NOTRUN -> [SKIP][143] ([fdo#109291]) +8 similar issues
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@prime_nv_pcopy@test3_2.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][144] ([fdo#109291])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][145] ([fdo#109271] / [i915#2994]) +1 similar issue
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl1/igt@sysfs_clients@fair-1.html
    - shard-glk:          NOTRUN -> [SKIP][146] ([fdo#109271] / [i915#2994]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][147] ([i915#2994]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@sysfs_clients@split-25.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [INCOMPLETE][148] ([i915#6598] / [i915#6601]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-glk:          [INCOMPLETE][150] ([i915#6598]) -> [PASS][151] +2 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][152] ([i915#5784]) -> [PASS][153] +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb5/igt@gem_eio@reset-stress.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][154] ([i915#2842]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][156] ([i915#2842]) -> [PASS][157] +2 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][158] ([i915#2842]) -> [PASS][159] +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][160] ([i915#5566] / [i915#716]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-glk5/igt@gen9_exec_parse@allowed-all.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk9/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         [INCOMPLETE][162] ([i915#6598]) -> [PASS][163] +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@i915_suspend@basic-s3-without-i915.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html
    - shard-apl:          [INCOMPLETE][164] ([i915#6598]) -> [PASS][165] +1 similar issue
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl3/igt@i915_suspend@basic-s3-without-i915.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - shard-kbl:          [DMESG-WARN][166] ([i915#180]) -> [PASS][167] +2 similar issues
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - shard-snb:          [INCOMPLETE][168] ([i915#6598]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  * igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
    - shard-snb:          [INCOMPLETE][170] ([i915#4939] / [i915#6598]) -> [PASS][171] +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
    - shard-iclb:         [INCOMPLETE][172] -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [INCOMPLETE][174] ([i915#4939] / [i915#6598]) -> [PASS][175] +3 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-iclb:         [INCOMPLETE][176] ([fdo#111764]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-kbl:          [INCOMPLETE][178] ([i915#3614] / [i915#4939] / [i915#6598]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [TIMEOUT][180] ([i915#3063]) -> [FAIL][181] ([i915#5784])
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-tglb7/igt@gem_eio@unwedge-stress.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][182] ([i915#4525]) -> [FAIL][183] ([i915#6117])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_pm_dc@dc3co-vpb-simulation:
    - shard-iclb:         [SKIP][184] ([i915#588]) -> [SKIP][185] ([i915#658])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-iclb:         [INCOMPLETE][186] ([i915#6598]) -> [INCOMPLETE][187] ([i915#1982] / [i915#6598])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         [SKIP][188] ([i915#2920]) -> [SKIP][189] ([i915#658])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [FAIL][190] ([i915#5939]) -> [SKIP][191] ([fdo#109642] / [fdo#111068] / [i915#658])
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_psr2_su@page_flip-p010.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][192], [FAIL][193], [FAIL][194]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][195], [FAIL][196]) ([i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl3/igt@runner@aborted.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl6/igt@runner@aborted.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl7/igt@runner@aborted.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl7/igt@runner@aborted.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl3/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#108145]: https://bugs.freedesktop.org/show_bug.cgi?id=108145
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109283]: https://bugs.freedesktop.org/show_bug.cgi?id=109283
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109293]: https://bugs.freedesktop.org/show_bug.cgi?id=109293
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111764]: https://bugs.freedesktop.org/show_bug.cgi?id=111764
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#1188]: https://gitlab.freedesktop.org/drm/intel/issues/1188
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2435]: https://gitlab.freedesktop.org/drm/intel/issues/2435
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3825]: https://gitlab.freedesktop.org/drm/intel/issues/3825
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5287]: https://gitlab.freedesktop.org/drm/intel/issues/5287
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5327]: https://gitlab.freedesktop.org/drm/intel/issues/5327
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5591]: https://gitlab.freedesktop.org/drm/intel/issues/5591
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#588]: https://gitlab.freedesktop.org/drm/intel/issues/588
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6375]: https://gitlab.freedesktop.org/drm/intel/issues/6375
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6520]: https://gitlab.freedesktop.org/drm/intel/issues/6520
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#6537]: https://gitlab.freedesktop.org/drm/intel/issues/6537
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601
  [i915#6628]: https://gitlab.freedesktop.org/drm/intel/issues/6628
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6634 -> IGTPW_7673
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12017: d09b6a64bd55b1c8c7baada7537621015f0cfd71 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7673: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/index.html
  IGT_6634: e01fe99f00692864b709253638c809231d1fb333 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/index.html

--===============3059150453414119951==
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
<tr><td><b>Series:</b></td><td>replaced /bin/bash shebangs with /bin/sh for=
 BSD compatibility (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107314/">https://patchwork.freedesktop.org/series/107314/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7673/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12017_full -&gt; IGTPW_7673_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7673_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7673_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/index.=
html</p>
<h2>Participating hosts (12 -&gt; 9)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7673=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@api_intel_allocator@fork-simple-stress-signal:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb5/igt@api_intel_allocator@fork-simple-stress-signal=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7673/shard-tglb3/igt@api_intel_allocator@fork-simple-stress-signal.htm=
l">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7673/shard-iclb2/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPL=
ETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7673_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@crc32:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@api_intel_bb@crc32.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6230">i915#6230=
</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@feature_discovery@display-4x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_ccs@ctrl-surf-copy.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327">i915#=
5327</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6335">i915#6335</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_ctx_isolation@preservation-s3@b=
cs0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/6598">i915#6598</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb4/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb5/igt@gem_eio@suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#65=
98</a>) +4 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-snb4/igt@gem_eio@suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#659=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6628">i9=
15#6628</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673=
/shard-iclb6/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) =
+1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-=
tglb3/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>) +3 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-tglb7/igt@gem_exec_fair@basic-none-rrul@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/sh=
ard-glk6/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-iclb8/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/s=
hard-iclb7/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl3/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tglb7/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb7/igt@gem_huc_copy@huc-copy.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#21=
90</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#=
4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl8/igt@gem_lmem_swapping@basic.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613=
">i915#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk5/igt@gem_lmem_swapping@basic.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613=
">i915#4613</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-kbl1/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-snb6/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gem_pxp@dmabuf-shared-protected-ds=
t-is-context-refcounted.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@gem_pxp@reject-modify-context-prot=
ection-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +283 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@noreloc-s3:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk8/igt@gem_softpin@noreloc-s3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i=
915#6598</a>) +6 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-snb2/igt@gem_softpin@noreloc-s3.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i=
915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
598">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@access-control:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@gem_userptr_blits@access-control.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
297">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl2/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-snb2/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">i9=
15#2724</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk5/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb1/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb5/igt@gem_vm_create@invalid-create.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +375 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_tiledy_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@gen3_render_tiledy_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@gen9_exec_parse@allowed-all.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb7/igt@i915_pm_dc@dc6-psr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@i=
915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/454">i915#454</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@i915_pm_freq_mult@media-freq@gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.ht=
ml">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/26=
84">i915#2684</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109506">fdo#109506</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110892">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-devices:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-glk9/igt@i915_pm_rpm@system-suspend-devices.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/sha=
rd-glk6/igt@i915_pm_rpm@system-suspend-devices.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</=
p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-apl7/igt@i915_pm_rpm@system-suspend-devices.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/sha=
rd-apl6/igt@i915_pm_rpm@system-suspend-devices.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</=
p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@engine-order:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-glk1/igt@i915_pm_rps@engine-order.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-glk7/i=
gt@i915_pm_rps@engine-order.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/6537">i915#6537</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb7/igt@i915_selftest@live@hangcheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-t=
glb5/igt@i915_selftest@live@hangcheck.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5591">i915#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-snb5/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-snb4=
/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-iclb5/igt@i915_suspend@debugfs-reader.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-icl=
b2/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-apl2/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
73/shard-apl3/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i915=
#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598=
">i915#6598</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_76=
73/shard-snb4/igt@i915_suspend@fence-restore-tiled2untiled.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4817">i915=
#4817</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939=
">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6598">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb5/igt@i915_suspend@forcewake.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4817">=
i915#4817</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb8/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_big_fb@4-tiled-32bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-3=
2bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_big_fb@x-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111614">fdo#111614</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-glk7/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +40 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_ccs@pipe-b-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_ccs@pipe-c-bad-aux-stride-y_til=
ed_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +76 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_cdclk@plane-scaling.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3742">i915=
#3742</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk8/igt@kms_chamelium@dp-hpd-enable-disable-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +11 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_chamelium@dp-hpd-enable-disable-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl8/igt@kms_chamelium@vga-hpd.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827=
">fdo#111827</a>) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb6/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +10 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@kms_color_chamelium@ctm-0-25.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_content_protection@atomic.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063=
">i915#1063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_content_protection@legacy.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/13=
19">i915#1319</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_content_protection@lic.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">=
fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111066">fdo#111066</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6637">i915#6637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_dp_tiled_display@basic-test-pat=
tern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3528">i915#3528</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_draw_crc@draw-method-xrgb8888-=
pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-32bpp-yftileccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/6375">i915#6375</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +5=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +64 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-t=
glb3/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/433">i915#433</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/s=
hard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-apl6/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-b-dp-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6598">i915#6598</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-b-vga-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6520">i915#6520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_plane@plane-panning-bottom-righ=
t-suspend@pipe-a-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl7/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk7/igt@kms_plane_alpha_blend@pipe-b-constan=
t-alpha-max.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/265">i915#265</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb5/igt@kms_plane_lowres@tiling-none@pipe-=
a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp=
-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-glk3/igt@kms_plane_scaling@planes-upscale-fa=
ctor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +210 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl2/igt@kms_psr2_sf@plane-move-sf-dmg-area.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-tglb5/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i9=
15#1911</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk9/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) +4 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb8/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">f=
do#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-kbl7/igt@kms_psr2_su@page_flip-nv12.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fd=
o#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_psr@psr2_cursor_blt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_selftest@all.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb7/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
09">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb2/igt@kms_vrr@flipline.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2530">i915#2530</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-tglb7/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2530">i915#2530</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb3/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-glk2/igt@perf@stress-open-close.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5213">=
i915#5213</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_2:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@prime_nv_pcopy@test3_2.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291">fdo#=
109291</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-apl1/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-glk7/igt@sysfs_clients@fair-1.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i=
915#2994</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7673/shard-iclb3/igt@sysfs_clients@split-25.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/6601">i915#6601</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7673/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.ht=
ml">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7673/shard-glk3/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb5/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-tg=
lb7/igt@gem_eio@reset-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
673/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7673/shard-glk7/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> +2 s=
imilar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/s=
hard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-glk5/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7673/shard-glk9/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-iclb2/igt@i915_suspend@basic-s3-without-i915.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598"=
>i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7673/shard-iclb1/igt@i915_suspend@basic-s3-without-i915.html">PASS</a>=
 +2 similar issues</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-apl3/igt@i915_suspend@basic-s3-without-i915.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">=
i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7673/shard-apl6/igt@i915_suspend@basic-s3-without-i915.html">PASS</a> +=
1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-kbl7/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7673/shard-kbl4/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.htm=
l">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-snb2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga=
-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_pipe_crc_basic@suspend-read-crc@=
pipe-a-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7673/shard-snb4/igt@kms_vblank@pipe-b-ts-continuation=
-dpms-suspend.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7673/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-susp=
end.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7673/shard-apl7/igt@kms_vblank@pipe-b-ts-continuation-susp=
end.html">PASS</a> +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111764">fdo#111764</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7673/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-susp=
end.html">PASS</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12017/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3614">i915#3614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7673/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuatio=
n-suspend.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-tglb7/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shar=
d-tglb3/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5784">i915#5784</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7673/shard-iclb2/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb2/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/588">i915#588=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/=
shard-iclb5/igt@i915_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb6/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7673/shard-iclb1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1982">i915#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7673/shard-iclb1/igt@kms_psr2_sf@cursor-plane-move-co=
ntinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12017/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/sha=
rd-iclb5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12017/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12017/shard-apl6/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12017/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6599">i915=
#6599</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7673/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/shard-apl3/igt@runner@aborted.html"=
>FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002=
">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6599">i915#6599</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6634 -&gt; IGTPW_7673</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12017: d09b6a64bd55b1c8c7baada7537621015f0cfd71 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7673: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7673/index.htm=
l<br />
  IGT_6634: e01fe99f00692864b709253638c809231d1fb333 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============3059150453414119951==--
