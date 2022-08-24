Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============5123976484420515813=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthikeya Sunkesula" <karthikeya.sunkesula@intel.com>
Date: Wed, 24 Aug 2022 00:41:26 -0000
Message-ID: <166130168643.9870.15640500609572964198@emeril.freedesktop.org>
References: <20220823063155.1309939-1-karthikeya.sunkesula@intel.com>
In-Reply-To: <20220823063155.1309939-1-karthikeya.sunkesula@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgaTkxNS9w?=
 =?utf-8?q?m=3AAdd_descriptions_to_pm_tests?=
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

--===============5123976484420515813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915/pm:Add descriptions to pm tests
URL   : https://patchwork.freedesktop.org/series/107609/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12014_full -> IGTPW_7669_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7669_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7669_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/index.html

Participating hosts (13 -> 9)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7669_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_eio@suspend:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_eio@suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@ctm-0-50:
    - {shard-rkl}:        NOTRUN -> [SKIP][2] +1 similar issue
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@kms_color@ctm-0-50.html

  
Known issues
------------

  Here are the changes found in IGTPW_7669_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-iclb:         NOTRUN -> [SKIP][3] ([i915#1839]) +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@block-copy-compressed:
    - shard-iclb:         NOTRUN -> [SKIP][4] ([i915#5327])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@gem_ccs@block-copy-compressed.html

  * igt@gem_create@create-ext-cpu-access-sanity-check:
    - shard-iclb:         NOTRUN -> [SKIP][5] ([i915#6335]) +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_create@create-ext-cpu-access-sanity-check.html

  * igt@gem_ctx_persistence@legacy-engines-cleanup:
    - shard-snb:          NOTRUN -> [SKIP][6] ([fdo#109271] / [i915#1099])
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_ctx_persistence@legacy-engines-cleanup.html

  * igt@gem_eio@suspend:
    - shard-snb:          NOTRUN -> [INCOMPLETE][7] ([i915#6598] / [i915#6628])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_eio@suspend.html

  * igt@gem_exec_balancer@parallel:
    - shard-iclb:         [PASS][8] -> [SKIP][9] ([i915#4525])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb4/igt@gem_exec_balancer@parallel.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_balancer@parallel-keep-in-fence:
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#4525]) +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-apl:          NOTRUN -> [FAIL][11] ([i915#2846])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl7/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          NOTRUN -> [FAIL][12] ([i915#2846])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][13] ([i915#2842])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-glk:          NOTRUN -> [FAIL][14] ([i915#2842])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-iclb:         NOTRUN -> [FAIL][15] ([i915#2842]) +4 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][16] -> [FAIL][17] ([i915#2842]) +5 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_suspend@basic-s4-devices@smem:
    - shard-apl:          [PASS][18] -> [INCOMPLETE][19] ([i915#6598])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@gem_exec_suspend@basic-s4-devices@smem.html
    - shard-snb:          [PASS][20] -> [INCOMPLETE][21] ([i915#4972] / [i915#6598])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
    - shard-glk:          [PASS][22] -> [INCOMPLETE][23] ([i915#6598])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk7/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk1/igt@gem_exec_suspend@basic-s4-devices@smem.html
    - shard-iclb:         [PASS][24] -> [INCOMPLETE][25] ([i915#6598]) +1 similar issue
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb6/igt@gem_exec_suspend@basic-s4-devices@smem.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@gem_exec_suspend@basic-s4-devices@smem.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][26] -> [SKIP][27] ([i915#2190])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@gem_huc_copy@huc-copy.html
    - shard-glk:          NOTRUN -> [SKIP][28] ([fdo#109271] / [i915#2190])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk6/igt@gem_huc_copy@huc-copy.html
    - shard-iclb:         NOTRUN -> [SKIP][29] ([i915#2190])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@basic:
    - shard-iclb:         NOTRUN -> [SKIP][30] ([i915#4613]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@gem_lmem_swapping@basic.html
    - shard-apl:          NOTRUN -> [SKIP][31] ([fdo#109271] / [i915#4613]) +2 similar issues
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@gem_lmem_swapping@basic.html

  * igt@gem_lmem_swapping@random:
    - shard-glk:          NOTRUN -> [SKIP][32] ([fdo#109271] / [i915#4613]) +2 similar issues
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_lmem_swapping@random.html

  * igt@gem_pread@exhaustion:
    - shard-apl:          NOTRUN -> [WARN][33] ([i915#2658])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl7/igt@gem_pread@exhaustion.html
    - shard-snb:          NOTRUN -> [WARN][34] ([i915#2658])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_pread@exhaustion.html
    - shard-glk:          NOTRUN -> [WARN][35] ([i915#2658])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk3/igt@gem_pread@exhaustion.html
    - shard-iclb:         NOTRUN -> [WARN][36] ([i915#2658])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_pread@exhaustion.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4270]) +4 similar issues
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_pxp@reject-modify-context-protection-off-2.html
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4270])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271]) +275 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf-tiled.html

  * igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271]) +253 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs.html

  * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#768]) +9 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html

  * igt@gem_userptr_blits@huge-split:
    - shard-snb:          NOTRUN -> [FAIL][42] ([i915#2724]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@gem_userptr_blits@huge-split.html

  * igt@gem_userptr_blits@unsync-unmap:
    - shard-iclb:         NOTRUN -> [SKIP][43] ([i915#3297])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][44] ([i915#3318])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@gem_userptr_blits@vma-merge.html
    - shard-glk:          NOTRUN -> [FAIL][45] ([i915#3318])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk3/igt@gem_userptr_blits@vma-merge.html
    - shard-iclb:         NOTRUN -> [FAIL][46] ([i915#3318])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_userptr_blits@vma-merge.html

  * igt@gem_vm_create@invalid-create:
    - shard-snb:          NOTRUN -> [SKIP][47] ([fdo#109271]) +378 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb5/igt@gem_vm_create@invalid-create.html

  * igt@gen3_render_linear_blits:
    - shard-iclb:         NOTRUN -> [SKIP][48] ([fdo#109289]) +8 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gen3_render_linear_blits.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#2856]) +5 similar issues
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@gen9_exec_parse@allowed-all.html

  * igt@i915_module_load@load:
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#6227])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@i915_module_load@load.html

  * igt@i915_pm_freq_mult@media-freq@gt0:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#6590])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@i915_pm_freq_mult@media-freq@gt0.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109293] / [fdo#109506]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([fdo#110892]) +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-iclb:         NOTRUN -> [SKIP][54] ([fdo#109303])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_selftest@live@hangcheck:
    - shard-snb:          [PASS][55] -> [INCOMPLETE][56] ([i915#3921])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb6/igt@i915_selftest@live@hangcheck.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@i915_selftest@live@hangcheck.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-snb:          [PASS][57] -> [INCOMPLETE][58] ([i915#4817] / [i915#6598] / [i915#6601])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@debugfs-reader:
    - shard-kbl:          [PASS][59] -> [DMESG-WARN][60] ([i915#180]) +6 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@i915_suspend@debugfs-reader.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@i915_suspend@debugfs-reader.html
    - shard-apl:          [PASS][61] -> [INCOMPLETE][62] ([i915#4939])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl6/igt@i915_suspend@debugfs-reader.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@i915_suspend@debugfs-reader.html
    - shard-snb:          [PASS][63] -> [INCOMPLETE][64] ([i915#4939])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb4/igt@i915_suspend@debugfs-reader.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb4/igt@i915_suspend@debugfs-reader.html

  * igt@i915_suspend@forcewake:
    - shard-snb:          NOTRUN -> [INCOMPLETE][65] ([i915#4817] / [i915#6598])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@i915_suspend@forcewake.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([i915#3826])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@atomic_plane_damage:
    - shard-iclb:         NOTRUN -> [SKIP][67] ([i915#4765])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_atomic@atomic_plane_damage.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([i915#404])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][69] ([i915#5286]) +9 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#5286]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([fdo#111614])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][72] ([fdo#110725] / [fdo#111614])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][73] ([fdo#111615]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#110723]) +3 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278]) +49 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][77] ([fdo#109271] / [i915#3886]) +1 similar issue
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3689] / [i915#6095])
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][79] ([fdo#109271] / [i915#3886]) +11 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl8/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#109278] / [i915#3886]) +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][81] ([fdo#109271] / [i915#3886]) +12 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk9/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@kms_chamelium@common-hpd-after-suspend.html

  * igt@kms_chamelium@hdmi-crc-multiple:
    - shard-glk:          NOTRUN -> [SKIP][83] ([fdo#109271] / [fdo#111827]) +11 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk2/igt@kms_chamelium@hdmi-crc-multiple.html

  * igt@kms_chamelium@vga-hpd-with-enabled-mode:
    - shard-snb:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-mode.html

  * igt@kms_color_chamelium@ctm-0-75:
    - shard-iclb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +11 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_color_chamelium@ctm-0-75.html

  * igt@kms_color_chamelium@ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][86] ([fdo#109284] / [fdo#111827])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@kms_color_chamelium@ctm-limited-range.html

  * igt@kms_color_chamelium@degamma:
    - shard-kbl:          NOTRUN -> [SKIP][87] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@kms_color_chamelium@degamma.html

  * igt@kms_content_protection@atomic:
    - shard-apl:          NOTRUN -> [TIMEOUT][88] ([i915#1319]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl8/igt@kms_content_protection@atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#1063])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@kms_content_protection@atomic.html
    - shard-iclb:         NOTRUN -> [SKIP][90] ([fdo#109300] / [fdo#111066])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic:
    - shard-kbl:          NOTRUN -> [TIMEOUT][91] ([i915#1319] / [i915#6637]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_content_protection@lic.html

  * igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([i915#3528])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#5287]) +1 similar issue
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([i915#5287]) +4 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([i915#3555] / [i915#3828])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109274]) +21 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109274] / [fdo#111825] / [i915#3637])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:
    - shard-kbl:          [PASS][98] -> [FAIL][99] ([i915#79])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1.html

  * igt@kms_flip@flip-vs-suspend@a-edp1:
    - shard-iclb:         NOTRUN -> [INCOMPLETE][100] ([i915#6598]) +4 similar issues
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-glk:          NOTRUN -> [INCOMPLETE][101] ([i915#6598]) +6 similar issues
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][102] ([i915#2672]) +9 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109285])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][104] ([fdo#109280]) +61 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-iclb:         NOTRUN -> [SKIP][105] ([i915#5438])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#6497])
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][107] ([fdo#109280] / [fdo#111825]) +4 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][108] -> [FAIL][109] ([i915#1188])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:
    - shard-apl:          NOTRUN -> [INCOMPLETE][110] ([i915#6598]) +3 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([i915#3555]) +7 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][112] ([i915#6403]) +2 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:
    - shard-snb:          NOTRUN -> [INCOMPLETE][113] ([i915#6520] / [i915#6598])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          NOTRUN -> [INCOMPLETE][114] ([i915#4939] / [i915#6598]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
    - shard-snb:          NOTRUN -> [INCOMPLETE][115] ([i915#4939] / [i915#6598]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#3536]) +2 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_plane_lowres@tiling-none@pipe-a-edp-1.html

  * igt@kms_plane_multiple@atomic-pipe-d-tiling-y:
    - shard-kbl:          NOTRUN -> [SKIP][117] ([fdo#109271]) +89 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([i915#5176]) +14 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][119] ([i915#5235]) +2 similar issues
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-kbl:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#658]) +2 similar issues
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-iclb:         NOTRUN -> [SKIP][121] ([i915#2920]) +1 similar issue
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-iclb:         NOTRUN -> [SKIP][122] ([i915#658]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][123] ([fdo#109271] / [i915#658]) +5 similar issues
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#111068] / [i915#658]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-apl:          NOTRUN -> [SKIP][125] ([fdo#109271] / [i915#658]) +6 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-tglb:         NOTRUN -> [SKIP][126] ([i915#1911])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_psr2_su@page_flip-nv12.html
    - shard-iclb:         NOTRUN -> [SKIP][127] ([fdo#109642] / [fdo#111068] / [i915#658])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [PASS][128] -> [SKIP][129] ([fdo#109441]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb2/igt@kms_psr@psr2_no_drrs.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr@psr2_sprite_blt:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109441]) +2 similar issues
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-iclb:         NOTRUN -> [SKIP][131] ([i915#5289])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_selftest@all:
    - shard-iclb:         NOTRUN -> [SKIP][132] ([i915#6433])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_selftest@all.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][133] ([fdo#109309])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@pipe-c-ts-continuation-suspend:
    - shard-iclb:         [PASS][134] -> [INCOMPLETE][135] ([fdo#111764])
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
    - shard-apl:          [PASS][136] -> [INCOMPLETE][137] ([i915#4939] / [i915#6598])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-wait-forked-hang:
    - shard-kbl:          [PASS][138] -> [SKIP][139] ([fdo#109271])
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl1/igt@kms_vblank@pipe-c-wait-forked-hang.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@kms_vblank@pipe-c-wait-forked-hang.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> [SKIP][140] ([i915#2530]) +3 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-ctx-flip-detection:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([i915#2530])
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-d-source-outp-complete:
    - shard-iclb:         NOTRUN -> [SKIP][142] ([fdo#109278] / [i915#2530])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@nouveau_crc@pipe-d-source-outp-complete.html

  * igt@perf@per-context-mode-unprivileged:
    - shard-tglb:         NOTRUN -> [SKIP][143] ([fdo#109289])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@perf@per-context-mode-unprivileged.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][144] ([fdo#109291])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html

  * igt@prime_nv_test@i915_import_pread_pwrite:
    - shard-iclb:         NOTRUN -> [SKIP][145] ([fdo#109291]) +8 similar issues
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@prime_nv_test@i915_import_pread_pwrite.html

  * igt@sysfs_clients@fair-1:
    - shard-apl:          NOTRUN -> [SKIP][146] ([fdo#109271] / [i915#2994]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl8/igt@sysfs_clients@fair-1.html

  * igt@sysfs_clients@split-25:
    - shard-iclb:         NOTRUN -> [SKIP][147] ([i915#2994]) +3 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@sysfs_clients@split-25.html

  * igt@sysfs_clients@split-50:
    - shard-glk:          NOTRUN -> [SKIP][148] ([fdo#109271] / [i915#2994]) +2 similar issues
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk7/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_ctx_isolation@preservation-s3@bcs0:
    - shard-kbl:          [DMESG-WARN][149] ([i915#180]) -> [PASS][150] +3 similar issues
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html

  * igt@gem_ctx_isolation@preservation-s3@rcs0:
    - shard-snb:          [INCOMPLETE][151] ([i915#6598] / [i915#6601]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-glk:          [INCOMPLETE][153] ([i915#6598]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-iclb:         [INCOMPLETE][155] -> [PASS][156] +1 similar issue
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html
    - shard-apl:          [INCOMPLETE][157] ([i915#6598]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html

  * igt@gem_eio@in-flight-contexts-immediate:
    - shard-tglb:         [TIMEOUT][159] ([i915#3063]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html

  * igt@gem_eio@reset-stress:
    - shard-tglb:         [FAIL][161] ([i915#5784]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb3/igt@gem_eio@reset-stress.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@gem_eio@reset-stress.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [SKIP][163] ([i915#4525]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_fair@basic-deadline:
    - {shard-rkl}:        [FAIL][165] ([i915#2846]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-flow@rcs0:
    - shard-tglb:         [FAIL][167] ([i915#2842]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][169] ([i915#2842]) -> [PASS][170] +1 similar issue
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-glk:          [FAIL][171] ([i915#2842]) -> [PASS][172] +1 similar issue
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-kbl:          [FAIL][173] ([i915#2842]) -> [PASS][174] +1 similar issue
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - {shard-rkl}:        [SKIP][175] ([i915#3281]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_tiled_partial_pwrite_pread@reads:
    - {shard-rkl}:        [SKIP][177] ([i915#3282]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@reads.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-glk:          [DMESG-WARN][179] ([i915#5566] / [i915#716]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-glk1/igt@gen9_exec_parse@allowed-all.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-glk5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-kbl:          [DMESG-WARN][181] ([i915#5566] / [i915#716]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@gen9_exec_parse@allowed-single.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@gen9_exec_parse@allowed-single.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
    - shard-apl:          [INCOMPLETE][183] -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:
    - shard-snb:          [INCOMPLETE][185] -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][187] ([i915#5235]) -> [PASS][188] +5 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [SKIP][189] ([fdo#109642] / [fdo#111068] / [i915#658]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb4/igt@kms_psr2_su@page_flip-xrgb8888.html
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2_primary_render:
    - shard-iclb:         [SKIP][191] ([fdo#109441]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb3/igt@kms_psr@psr2_primary_render.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_psr@psr2_primary_render.html

  * igt@kms_vblank@pipe-b-ts-continuation-suspend:
    - shard-apl:          [INCOMPLETE][193] ([i915#4939] / [i915#6598]) -> [PASS][194] +2 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-iclb:         [INCOMPLETE][195] ([fdo#111764]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
    - shard-snb:          [INCOMPLETE][197] ([i915#4939] / [i915#6598]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-iclb:         [INCOMPLETE][199] ([i915#6598]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@perf@mi-rpc:
    - {shard-rkl}:        [SKIP][201] ([i915#2434]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-rkl-2/igt@perf@mi-rpc.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@perf@mi-rpc.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-iclb:         [INCOMPLETE][203] ([i915#6598]) -> [FAIL][204] ([fdo#103375])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-iclb6/igt@kms_frontbuffer_tracking@psr-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@runner@aborted:
    - shard-kbl:          ([FAIL][205], [FAIL][206], [FAIL][207], [FAIL][208]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#716]) -> ([FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl1/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
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
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1319]: https://gitlab.freedesktop.org/drm/intel/issues/1319
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2724]: https://gitlab.freedesktop.org/drm/intel/issues/2724
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
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
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3639]: https://gitlab.freedesktop.org/drm/intel/issues/3639
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3828]: https://gitlab.freedesktop.org/drm/intel/issues/3828
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3921]: https://gitlab.freedesktop.org/drm/intel/issues/3921
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4765]: https://gitlab.freedesktop.org/drm/intel/issues/4765
  [i915#4778]: https://gitlab.freedesktop.org/drm/intel/issues/4778
  [i915#4817]: https://gitlab.freedesktop.org/drm/intel/issues/4817
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4972]: https://gitlab.freedesktop.org/drm/intel/issues/4972
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
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
  [i915#5438]: https://gitlab.freedesktop.org/drm/intel/issues/5438
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5982]: https://gitlab.freedesktop.org/drm/intel/issues/5982
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6520]: https://gitlab.freedesktop.org/drm/intel/issues/6520
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6598]: https://gitlab.freedesktop.org/drm/intel/issues/6598
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#6601]: https://gitlab.freedesktop.org/drm/intel/issues/6601
  [i915#6628]: https://gitlab.freedesktop.org/drm/intel/issues/6628
  [i915#6637]: https://gitlab.freedesktop.org/drm/intel/issues/6637
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6634 -> IGTPW_7669
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12014: 1de33826aa86910c175ca773bc8f92d5948d094e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7669: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/index.html
  IGT_6634: e01fe99f00692864b709253638c809231d1fb333 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/index.html

--===============5123976484420515813==
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
<tr><td><b>Series:</b></td><td>i915/pm:Add descriptions to pm tests</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/107609/">https://patchwork.freedesktop.org/series/107609/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7669/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12014_full -&gt; IGTPW_7669_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7669_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7669_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/index.=
html</p>
<h2>Participating hosts (13 -&gt; 9)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-dg1 pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7669=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_eio@suspend:<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_eio@suspend.html">INCOMPLETE</=
a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_color@ctm-0-50:<ul>
<li>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@kms_color@ctm-0-50.html">SKIP</a> =
+1 similar issue</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7669_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@feature_discovery@display-2x.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839"=
>i915#1839</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-copy-compressed:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@gem_ccs@block-copy-compressed.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5327=
">i915#5327</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_create@create-ext-cpu-access-s=
anity-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6335">i915#6335</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-cleanup:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
cleanup.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@suspend:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_eio@suspend.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#65=
98</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6628">i=
915#6628</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb4/igt@gem_exec_balancer@parallel.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-icl=
b3/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-in-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@gem_exec_balancer@parallel-keep-in=
-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4525">i915#4525</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl7/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-glk1/igt@gem_exec_fair@basic-deadline.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i=
915#2846</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@gem_exec_fair@basic-none-rrul@rcs0=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_exec_fair@basic-none@vecs0.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/284=
2">i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-k=
bl1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +5 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s4-devices@smem:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-apl2/igt@gem_exec_suspend@basic-s4-devices@smem.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669=
/shard-apl1/igt@gem_exec_suspend@basic-s4-devices@smem.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#659=
8</a>)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-snb6/igt@gem_exec_suspend@basic-s4-devices@smem.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669=
/shard-snb6/igt@gem_exec_suspend@basic-s4-devices@smem.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4972">i915#497=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i9=
15#6598</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-glk7/igt@gem_exec_suspend@basic-s4-devices@smem.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669=
/shard-glk1/igt@gem_exec_suspend@basic-s4-devices@smem.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#659=
8</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-iclb6/igt@gem_exec_suspend@basic-s4-devices@smem.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_766=
9/shard-iclb1/igt@gem_exec_suspend@basic-s4-devices@smem.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6=
598</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tglb7/igt=
@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2190">i915#2190</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-glk6/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gem_huc_copy@huc-copy.html">SKIP</a=
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
tree/drm-tip/IGTPW_7669/shard-iclb6/igt@gem_lmem_swapping@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#=
4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl1/igt@gem_lmem_swapping@basic.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613=
">i915#4613</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_lmem_swapping@random.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo=
#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/46=
13">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl7/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-snb2/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-glk3/igt@gem_pread@exhaustion.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#2658=
</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_pread@exhaustion.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i915#265=
8</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-tglb3/igt@gem_pxp@reject-modify-context-prote=
ction-off-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@x-tiled-to-vebox-yf-tiled:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl2/igt@gem_render_copy@x-tiled-to-vebox-yf=
-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +275 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-y-tiled-mc-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk7/igt@gem_render_copy@y-tiled-ccs-to-y-ti=
led-mc-ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271">fdo#109271</a>) +253 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@gem_render_copy@yf-tiled-to-vebox-=
x-tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/768">i915#768</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@huge-split:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb6/igt@gem_userptr_blits@huge-split.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2724">=
i915#2724</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@gem_userptr_blits@unsync-unmap.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/329=
7">i915#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl1/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-glk3/igt@gem_userptr_blits@vma-merge.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i9=
15#3318</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb3/igt@gem_userptr_blits@vma-merge.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3318">i=
915#3318</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_vm_create@invalid-create:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb5/igt@gem_vm_create@invalid-create.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a>) +378 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@gen3_render_linear_blits.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fd=
o#109289</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@gen9_exec_parse@allowed-all.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@i915_module_load@load.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6227">i915#6=
227</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@i915_pm_freq_mult@media-freq@gt0.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
590">i915#6590</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@i915_pm_rpm@gem-execbuf-stress-pc8=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109293">fdo#109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109506">fdo#109506</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110892">fdo#110892</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@i915_query@query-topology-known-pc=
i-ids.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-snb6/igt@i915_selftest@live@hangcheck.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-sn=
b6/igt@i915_selftest@live@hangcheck.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3921">i915#3921</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-snb2/igt@i915_suspend@basic-s3-without-i915.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/sh=
ard-snb6/igt@i915_suspend@basic-s3-without-i915.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/4817">i915#4817</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6598">i915#6598=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6601">i91=
5#6601</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@debugfs-reader:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-kbl7/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7=
/igt@i915_suspend@debugfs-reader.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) +6 similar issues=
</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-apl6/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-apl1=
/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-snb4/igt@i915_suspend@debugfs-reader.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-snb4=
/igt@i915_suspend@debugfs-reader.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/4939">i915#4939</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb6/igt@i915_suspend@forcewake.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4817">=
i915#4817</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_addfb_basic@invalid-smem-bo-on=
-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/3826">i915#3826</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic_plane_damage:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_atomic@atomic_plane_damage.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/476=
5">i915#4765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_atomic@plane-primary-overlay-m=
utable-zpos.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/404">i915#404</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_big_fb@4-tiled-16bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_big_fb@4-tiled-8bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_big_fb@linear-64bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@kms_big_fb@yf-tiled-16bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_big_fb@yf-tiled-8bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110723">fdo#110723</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_ccs@pipe-a-crc-primary-rotatio=
n-180-y_tiled_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_ccs@pipe-a-crc-sprite-planes-b=
asic-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +49 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl8/igt@kms_ccs@pipe-b-crc-sprite-planes-ba=
sic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +11 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +12 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk9/igt@kms_ccs@pipe-c-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +12 similar issues=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl1/igt@kms_chamelium@common-hpd-after-susp=
end.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-multiple:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk2/igt@kms_chamelium@hdmi-crc-multiple.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb4/igt@kms_chamelium@vga-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-0-75:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_color_chamelium@ctm-0-75.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284=
">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-limited-range:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@kms_color_chamelium@ctm-limited-ra=
nge.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@degamma:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@kms_color_chamelium@degamma.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl8/igt@kms_content_protection@atomic.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/131=
9">i915#1319</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-tglb5/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063"=
>i915#1063</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_content_protection@atomic.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300=
">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_content_protection@lic.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6637">i915#6637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@kms_dp_tiled_display@basic-test-pa=
ttern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3528">i915#3528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb21010=
10-mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-pwrite-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_draw_crc@draw-method-xrgb8888-=
pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5287">i915#5287</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_dsc@dsc-with-formats.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i91=
5#3555</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/382=
8">i915#3828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_flip@2x-blocking-wf_vblank.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
74">fdo#109274</a>) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_flip@2x-plain-flip-ts-check.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl4/igt@kms_flip@flip-vs-expired-vblank-interruptible@=
c-dp1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7669/shard-kbl1/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@c-dp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-edp1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_flip@flip-vs-suspend@a-edp1.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/6598">i915#6598</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk8/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/6598">i915#6598</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +9=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109285">fdo#109285</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +61 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_frontbuffer_tracking@fbc-tilin=
g-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/5438">i915#5438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-rg=
b565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +4 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/s=
hard-kbl1/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl2/igt@kms_hdr@bpc-switch-suspend@pipe-a-d=
p-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/6598">i915#6598</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_hdr@static-toggle-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555=
">i915#3555</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb1/igt@kms_invalid_mode@clock-too-high@ed=
p-1-pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/6403">i915#6403</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc=
@pipe-b-vga-1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6520">i915#6520</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6598">i915#6598</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-apl3/igt@kms_plane@plane-panning-bottom-right=
-suspend@pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/4939">i915#4939</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/6598">i915#6598</a>) +1 similar issue</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-snb2/igt@kms_plane@plane-panning-bottom-right=
-suspend@pipe-b-planes.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/4939">i915#4939</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/6598">i915#6598</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_plane_lowres@tiling-none@pipe-=
a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@atomic-pipe-d-tiling-y:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-kbl1/igt@kms_plane_multiple@atomic-pipe-d-ti=
ling-y.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a>) +89 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-edp=
-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_plane_scaling@plane-upscale-wi=
th-rotation-factor-0-25@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +14 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@kms_psr2_sf@cursor-plane-update-sf.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_psr2_sf@overlay-plane-move-con=
tinuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-glk5/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>) +5 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl1/igt@kms_psr2_sf@plane-move-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-tglb7/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1911">i9=
15#1911</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">f=
do#109642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb6/igt=
@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb5/igt@kms_psr@psr2_sprite_blt.html">SKIP=
</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo=
#109441</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_rotation_crc@primary-4-tiled-r=
eflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@kms_selftest@all.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6433">i915#6433</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@kms_tv_load_detect@load-detect.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1093=
09">fdo#109309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-iclb7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7669/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMP=
LETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111764"=
>fdo#111764</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
669/shard-apl7/igt@kms_vblank@pipe-c-ts-continuation-suspend.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939">i9=
15#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-forked-hang:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl1/igt@kms_vblank@pipe-c-wait-forked-hang.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/sh=
ard-kbl1/igt@kms_vblank@pipe-c-wait-forked-hang.html">SKIP</a> (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@nouveau_crc@pipe-a-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb3/igt@nouveau_crc@pipe-d-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-source-outp-complete:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb2/igt@nouveau_crc@pipe-d-source-outp-com=
plete.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@per-context-mode-unprivileged:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb7/igt@perf@per-context-mode-unprivileged=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-tglb5/igt@prime_nv_pcopy@test_semaphore.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_import_pread_pwrite:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@prime_nv_test@i915_import_pread_pw=
rite.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109291">fdo#109291</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-apl8/igt@sysfs_clients@fair-1.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-25:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-iclb6/igt@sysfs_clients@split-25.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7669/shard-glk7/igt@sysfs_clients@split-50.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994=
">i915#2994</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7669/shard-kbl4/igt@gem_ctx_isolation@preservation-s3@bcs0.html">PAS=
S</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
<ul>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-snb4/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/6601">i915#6601</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7669/shard-snb6/igt@gem_ctx_isolation@preservation-s3@rcs0.ht=
ml">PASS</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7669/shard-glk2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-iclb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html">I=
NCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7669/shard-iclb1/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PASS</=
a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-apl6/igt@gem_ctx_isolation@preservation-s3@rcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7669/shard-apl2/igt@gem_ctx_isolation@preservation-s3@rcs0.html">PA=
SS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-immediate:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3063"=
>i915#3063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7669/shard-tglb7/igt@gem_eio@in-flight-contexts-immediate.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-tglb3/igt@gem_eio@reset-stress.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-tg=
lb7/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb8/igt@gem_exec_balancer@parallel-bb-first.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7669/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-rkl-1/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/s=
hard-rkl-2/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-flow@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-tglb7/igt@gem_exec_fair@basic-flow@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/=
shard-tglb5/igt@gem_exec_fair@basic-flow@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
669/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/s=
hard-glk1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/=
shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">i91=
5#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7669/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-rkl-2/igt@gem_tiled_partial_pwrite_pread@reads.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i9=
15#3282</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7669/shard-rkl-5/igt@gem_tiled_partial_pwrite_pread@reads.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-glk1/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5=
566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716">i=
915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7669/shard-glk5/igt@gen9_exec_parse@allowed-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-kbl7/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7669/shard-kbl7/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-=
1.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7669/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-=
dp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-vga=
-1.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7669/shard-snb5/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a=
-vga-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-iclb8/igt@kms_plane_scalin=
g@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a> +5 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb4/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109=
642</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068"=
>fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7669/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb3/igt@kms_psr@psr2_primary_render.html">SKIP</a> (<=
a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/=
shard-iclb2/igt@kms_psr@psr2_primary_render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7669/shard-apl3/igt@kms_vblank@pipe-b-ts-continuation-susp=
end.html">PASS</a> +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html=
">INCOMPLETE</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111764">fdo#111764</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7669/shard-iclb7/igt@kms_vblank@pipe-b-ts-continuation-susp=
end.html">PASS</a></p>
</li>
<li>
<p>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12014/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4939">i915#4939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7669/shard-snb6/igt@kms_vblank@pipe-b-ts-continuation-susp=
end.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb5/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspen=
d.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/6598">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7669/shard-iclb3/igt@kms_vblank@pipe-c-ts-continuation-dp=
ms-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-rkl-2/igt@perf@mi-rpc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-rkl-5/igt@pe=
rf@mi-rpc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12014/shard-iclb6/igt@kms_frontbuffer_tracking@psr-suspend.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
98">i915#6598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7669/shard-iclb3/igt@kms_frontbuffer_tracking@psr-suspend.html">FAI=
L</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103375">fd=
o#103375</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12014/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12014/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12014/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/intel/issues/716">i915#716</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7669/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/=
shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7669/shard-kbl7/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/shard-k=
bl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_7669/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3002">i915#30=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i=
915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5=
257">i915#5257</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6634 -&gt; IGTPW_7669</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12014: 1de33826aa86910c175ca773bc8f92d5948d094e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7669: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7669/index.htm=
l<br />
  IGT_6634: e01fe99f00692864b709253638c809231d1fb333 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============5123976484420515813==--
