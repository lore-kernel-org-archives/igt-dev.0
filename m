Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4089119430055884409=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kamil Konieczny" <kamil.konieczny@linux.intel.com>
Date: Thu, 29 Sep 2022 11:19:13 -0000
Message-ID: <166445035359.11956.16237996205563300702@emeril.freedesktop.org>
References: <20220927162419.38735-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220927162419.38735-1-kamil.konieczny@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgYWRkIEk5?=
 =?utf-8?q?15=5FMMAP=5FOFFSET=5FFIXED_tests_part_2/2?=
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

--===============4089119430055884409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: add I915_MMAP_OFFSET_FIXED tests part 2/2
URL   : https://patchwork.freedesktop.org/series/109129/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12191_full -> IGTPW_7851_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7851_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7851_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html

Participating hosts (9 -> 8)
------------------------------

  Additional (2): shard-dg1 shard-tglu 
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7851_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_mmap_offset@close-race:
    - shard-glk:          [PASS][1] -> ([FAIL][2], [PASS][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk2/igt@gem_mmap_offset@close-race.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk2/igt@gem_mmap_offset@close-race.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@gem_mmap_offset@close-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_balancer@parallel-ordering:
    - {shard-dg1}:        NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-dg1-13/igt@gem_exec_balancer@parallel-ordering.html

  * igt@i915_module_load@resize-bar:
    - {shard-dg1}:        NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-dg1-13/igt@i915_module_load@resize-bar.html

  * igt@nouveau_crc@pipe-a-source-rg:
    - {shard-dg1}:        NOTRUN -> [SKIP][6] +30 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-dg1-18/igt@nouveau_crc@pipe-a-source-rg.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12191_full and IGTPW_7851_full:

### New IGT tests (28) ###

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.43] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.42] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.25] s

  * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [3.36] s

  * igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.65] s

  * igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a4:
    - Statuses : 1 pass(s)
    - Exec time: [0.61] s

  * igt@kms_lease@atomic_implicit_crtc@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@atomic_implicit_crtc@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@atomic_implicit_crtc@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@atomic_implicit_crtc@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_lease@lease_invalid_connector@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.14] s

  * igt@kms_lease@lease_invalid_connector@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_connector@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_connector@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_crtc@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_lease@lease_invalid_crtc@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_crtc@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_crtc@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_lease@lease_invalid_plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@lease_invalid_plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@kms_lease@simple_lease@pipe-a-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_lease@simple_lease@pipe-b-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@simple_lease@pipe-c-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_lease@simple_lease@pipe-d-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  

Known issues
------------

  Here are the changes found in IGTPW_7851_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-iclb:         NOTRUN -> ([SKIP][7], [SKIP][8]) ([i915#1839])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@feature_discovery@display-2x.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@feature_discovery@display-2x.html
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#1839])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@psr2:
    - shard-iclb:         [PASS][10] -> ([SKIP][11], [PASS][12]) ([i915#658])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@feature_discovery@psr2.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@feature_discovery@psr2.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@feature_discovery@psr2.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-tglb:         [PASS][13] -> ([PASS][14], [FAIL][15]) ([i915#6268])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-apl:          [PASS][16] -> [FAIL][17] ([i915#5099])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@gem_ctx_persistence@smoketest.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][18] -> ([SKIP][19], [SKIP][20]) ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         [PASS][21] -> ([SKIP][22], [PASS][23]) ([i915#4525]) +1 similar issue
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [PASS][24] -> ([PASS][25], [FAIL][26]) ([i915#2846])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk6/igt@gem_exec_fair@basic-deadline.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-iclb:         NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [PASS][28] -> [FAIL][29] ([i915#2842])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-tglb:         NOTRUN -> [SKIP][30] ([i915#4613])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random:
    - shard-iclb:         NOTRUN -> ([SKIP][31], [SKIP][32]) ([i915#4613])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gem_lmem_swapping@parallel-random.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem_lmem_swapping@parallel-random.html
    - shard-apl:          NOTRUN -> [SKIP][33] ([fdo#109271] / [i915#4613])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_lmem_swapping@parallel-random.html
    - shard-tglb:         NOTRUN -> ([SKIP][34], [SKIP][35]) ([i915#4613])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_lmem_swapping@parallel-random.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@gem_lmem_swapping@parallel-random.html
    - shard-glk:          NOTRUN -> ([SKIP][36], [SKIP][37]) ([fdo#109271] / [i915#4613])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk2/igt@gem_lmem_swapping@parallel-random.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@gem_lmem_swapping@parallel-random.html

  * igt@gem_lmem_swapping@smem-oom:
    - shard-apl:          NOTRUN -> ([SKIP][38], [SKIP][39]) ([fdo#109271] / [i915#4613])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@gem_lmem_swapping@smem-oom.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@gem_lmem_swapping@smem-oom.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#4270])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@reject-modify-context-protection-off-2:
    - shard-iclb:         NOTRUN -> ([SKIP][41], [SKIP][42]) ([i915#4270]) +1 similar issue
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-off-2.html
    - shard-tglb:         NOTRUN -> ([SKIP][43], [SKIP][44]) ([i915#4270])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@gem_pxp@reject-modify-context-protection-off-2.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-off-2.html

  * igt@gem_userptr_blits@input-checking:
    - shard-tglb:         NOTRUN -> ([DMESG-WARN][45], [DMESG-WARN][46]) ([i915#4991])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_userptr_blits@input-checking.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@readonly-pwrite-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][47] ([i915#3297])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-glk:          NOTRUN -> [SKIP][48] ([fdo#109271]) +7 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@gem_userptr_blits@readonly-pwrite-unsync.html
    - shard-iclb:         NOTRUN -> ([SKIP][49], [SKIP][50]) ([i915#3297])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_userptr_blits@readonly-pwrite-unsync.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html

  * igt@gem_workarounds@suspend-resume-fd:
    - shard-apl:          [PASS][51] -> ([DMESG-WARN][52], [PASS][53]) ([i915#180]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_workarounds@suspend-resume-fd.html
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@gem_workarounds@suspend-resume-fd.html

  * igt@gen7_exec_parse@basic-rejected:
    - shard-iclb:         NOTRUN -> ([SKIP][54], [SKIP][55]) ([fdo#109289])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gen7_exec_parse@basic-rejected.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html

  * igt@gen9_exec_parse@bb-chained:
    - shard-tglb:         NOTRUN -> ([SKIP][56], [SKIP][57]) ([i915#2527] / [i915#2856])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gen9_exec_parse@bb-chained.html
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gen9_exec_parse@bb-chained.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-tglb:         NOTRUN -> [SKIP][58] ([i915#2527] / [i915#2856])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gen9_exec_parse@bb-secure.html
    - shard-iclb:         NOTRUN -> ([SKIP][59], [SKIP][60]) ([i915#2856])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gen9_exec_parse@bb-secure.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@gen9_exec_parse@bb-secure.html

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-tglb:         NOTRUN -> ([SKIP][61], [SKIP][62]) ([fdo#109289]) +2 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-iclb:         NOTRUN -> ([SKIP][63], [SKIP][64]) ([fdo#110892])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-tglb:         NOTRUN -> ([SKIP][65], [SKIP][66]) ([fdo#111644] / [i915#1397] / [i915#2411])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@i915_selftest@live@hugepages:
    - shard-apl:          [PASS][67] -> ([PASS][68], [DMESG-WARN][69]) ([i915#5904]) +35 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@i915_selftest@live@hugepages.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@i915_selftest@live@hugepages.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@i915_selftest@live@hugepages.html

  * igt@kms_addfb_basic@size-max:
    - shard-apl:          [PASS][70] -> ([PASS][71], [DMESG-WARN][72]) ([i915#5904] / [i915#62]) +1 similar issue
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@kms_addfb_basic@size-max.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_addfb_basic@size-max.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> ([SKIP][73], [SKIP][74]) ([i915#5286]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#5286])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-tglb:         NOTRUN -> ([SKIP][76], [SKIP][77]) ([i915#5286]) +1 similar issue
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-apl:          [PASS][78] -> [DMESG-WARN][79] ([i915#5904] / [i915#62]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([fdo#110725] / [fdo#111614])
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
    - shard-tglb:         NOTRUN -> [SKIP][81] ([fdo#111614])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-apl:          NOTRUN -> ([DMESG-WARN][82], [PASS][83]) ([i915#5904] / [i915#62])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][84] ([fdo#111615])
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-tglb:         NOTRUN -> ([SKIP][85], [SKIP][86]) ([fdo#111615])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - shard-snb:          NOTRUN -> [SKIP][87] ([fdo#109271]) +20 similar issues
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb7/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][88], [SKIP][89]) ([i915#3689] / [i915#6095])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([i915#6095])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([i915#3689] / [i915#3886]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][94], [SKIP][95]) ([fdo#111615] / [i915#3689])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][96], [SKIP][97]) ([i915#3689]) +2 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([fdo#109271] / [i915#3886]) +3 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][100] ([fdo#109271] / [i915#3886])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([fdo#109271] / [i915#3886]) +1 similar issue
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][103], [SKIP][104]) ([fdo#109278] / [i915#3886]) +1 similar issue
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][105] ([i915#3689] / [i915#3886])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][106] ([i915#6095]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> ([SKIP][107], [SKIP][108]) ([fdo#109271]) +71 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:
    - shard-iclb:         NOTRUN -> ([SKIP][109], [SKIP][110]) ([fdo#109278]) +5 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#3689]) +2 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-crc-fast:
    - shard-iclb:         NOTRUN -> ([SKIP][112], [SKIP][113]) ([fdo#109284] / [fdo#111827]) +3 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@kms_chamelium@dp-crc-fast.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@kms_chamelium@dp-crc-fast.html
    - shard-snb:          NOTRUN -> ([SKIP][114], [SKIP][115]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb6/igt@kms_chamelium@dp-crc-fast.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb7/igt@kms_chamelium@dp-crc-fast.html
    - shard-apl:          NOTRUN -> ([SKIP][116], [SKIP][117]) ([fdo#109271] / [fdo#111827]) +3 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_chamelium@dp-crc-fast.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_chamelium@dp-crc-fast.html

  * igt@kms_chamelium@dp-crc-single:
    - shard-tglb:         NOTRUN -> ([SKIP][118], [SKIP][119]) ([fdo#109284] / [fdo#111827]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_chamelium@dp-crc-single.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_chamelium@dp-crc-single.html

  * igt@kms_chamelium@dp-hpd:
    - shard-glk:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([fdo#109271] / [fdo#111827]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_chamelium@dp-hpd.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_chamelium@dp-hpd.html

  * igt@kms_chamelium@dp-hpd-enable-disable-mode:
    - shard-glk:          NOTRUN -> [SKIP][122] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_chamelium@dp-hpd-enable-disable-mode.html
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109284] / [fdo#111827]) +1 similar issue
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_chamelium@dp-hpd-enable-disable-mode.html

  * igt@kms_chamelium@vga-frame-dump:
    - shard-apl:          NOTRUN -> [SKIP][124] ([fdo#109271] / [fdo#111827]) +1 similar issue
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@kms_chamelium@vga-frame-dump.html

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> ([FAIL][125], [FAIL][126]) ([i915#315] / [i915#6946]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_color@ctm-0-25@pipe-b-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_color@ctm-0-25@pipe-b-edp-1.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-tglb:         NOTRUN -> [FAIL][127] ([i915#315]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-tglb:         NOTRUN -> [SKIP][128] ([i915#3555]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-tglb:         NOTRUN -> ([SKIP][129], [SKIP][130]) ([i915#3555])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:
    - shard-apl:          NOTRUN -> ([PASS][131], [DMESG-WARN][132]) ([i915#180]) +1 similar issue
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-tglb:         NOTRUN -> ([SKIP][133], [SKIP][134]) ([fdo#109274] / [fdo#111825])
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-tglb:         NOTRUN -> ([SKIP][135], [SKIP][136]) ([fdo#109274] / [fdo#111825] / [i915#3637] / [i915#3966])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_flip@2x-absolute-wf_vblank.html
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-busy-flip:
    - shard-iclb:         NOTRUN -> ([SKIP][137], [SKIP][138]) ([fdo#109274]) +1 similar issue
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip@2x-busy-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_flip@2x-busy-flip.html
    - shard-tglb:         NOTRUN -> ([SKIP][139], [SKIP][140]) ([fdo#109274] / [fdo#111825] / [i915#3637])
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip@2x-busy-flip.html
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-tglb:         NOTRUN -> [SKIP][141] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][142] ([i915#180])
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-glk:          [PASS][143] -> ([FAIL][144], [PASS][145]) ([i915#2122])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][146] ([i915#2672]) +6 similar issues
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-tglb:         NOTRUN -> ([SKIP][147], [SKIP][148]) ([i915#2587] / [i915#2672]) +2 similar issues
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][149], [SKIP][150]) ([i915#2672])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][151] ([i915#2587] / [i915#2672])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> ([SKIP][152], [SKIP][153]) ([i915#2587] / [i915#2672]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][154] ([i915#3555]) +2 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-apl:          [PASS][155] -> ([PASS][156], [DMESG-WARN][157]) ([i915#1982] / [i915#5904] / [i915#62])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:
    - shard-tglb:         NOTRUN -> [SKIP][158] ([i915#6497])
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglb:         NOTRUN -> ([SKIP][159], [SKIP][160]) ([i915#6497]) +2 similar issues
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> ([SKIP][161], [SKIP][162]) ([fdo#109280]) +10 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> ([SKIP][163], [SKIP][164]) ([fdo#109280] / [fdo#111825]) +10 similar issues
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][165] ([fdo#109280] / [fdo#111825]) +5 similar issues
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-iclb:         NOTRUN -> ([SKIP][166], [SKIP][167]) ([i915#3555])
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:
    - shard-tglb:         NOTRUN -> ([SKIP][168], [SKIP][169]) ([i915#6403]) +3 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:
    - shard-apl:          [PASS][170] -> [SKIP][171] ([fdo#109271]) +1 similar issue
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes.html

  * igt@kms_plane_alpha_blend@pipe-d-alpha-basic:
    - shard-iclb:         NOTRUN -> [SKIP][172] ([fdo#109278])
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-alpha-basic.html

  * igt@kms_plane_lowres@tiling-y@pipe-b-dp-1:
    - shard-apl:          [PASS][173] -> ([PASS][174], [SKIP][175]) ([fdo#109271]) +2 similar issues
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl8/igt@kms_plane_lowres@tiling-y@pipe-b-dp-1.html
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_plane_lowres@tiling-y@pipe-b-dp-1.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_plane_lowres@tiling-y@pipe-b-dp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][176] -> ([PASS][177], [SKIP][178]) ([i915#5235]) +2 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1:
    - shard-glk:          NOTRUN -> ([SKIP][179], [SKIP][180]) ([fdo#109271]) +74 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-apl:          [PASS][181] -> [DMESG-WARN][182] ([i915#180] / [i915#5904] / [i915#62]) +1 similar issue
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl6/igt@kms_properties@crtc-properties-legacy.html
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@psr2_dpms:
    - shard-iclb:         [PASS][183] -> [SKIP][184] ([fdo#109441])
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_psr@psr2_dpms.html
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_psr@psr2_dpms.html

  * igt@kms_psr@psr2_primary_mmap_gtt:
    - shard-iclb:         NOTRUN -> ([SKIP][185], [SKIP][186]) ([fdo#109441])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.html
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-tglb:         NOTRUN -> ([FAIL][187], [FAIL][188]) ([i915#132] / [i915#3467]) +2 similar issues
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_psr@psr2_sprite_render.html
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-tglb:         NOTRUN -> [SKIP][189] ([fdo#111615] / [i915#5289])
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sequence@get-forked@dp-1-pipe-c:
    - shard-apl:          [PASS][190] -> ([PASS][191], [DMESG-WARN][192]) ([i915#180] / [i915#5904] / [i915#62]) +7 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@kms_sequence@get-forked@dp-1-pipe-c.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_sequence@get-forked@dp-1-pipe-c.html
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_sequence@get-forked@dp-1-pipe-c.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-tglb:         NOTRUN -> ([SKIP][193], [SKIP][194]) ([i915#2437])
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_writeback@writeback-fb-id.html
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_writeback@writeback-fb-id.html
    - shard-glk:          NOTRUN -> ([SKIP][195], [SKIP][196]) ([fdo#109271] / [i915#2437])
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_writeback@writeback-fb-id.html
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_writeback@writeback-fb-id.html
    - shard-iclb:         NOTRUN -> ([SKIP][197], [SKIP][198]) ([i915#2437])
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_writeback@writeback-fb-id.html
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-apl:          NOTRUN -> ([SKIP][199], [SKIP][200]) ([fdo#109271] / [i915#2437]) +1 similar issue
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl6/igt@kms_writeback@writeback-invalid-parameters.html
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@nouveau_crc@pipe-a-ctx-flip-detection:
    - shard-iclb:         NOTRUN -> ([SKIP][201], [SKIP][202]) ([i915#6971]) +45 similar issues
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-detection.html
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html

  * igt@nouveau_crc@pipe-b-source-outp-inactive:
    - shard-tglb:         NOTRUN -> ([SKIP][203], [SKIP][204]) ([i915#6971]) +29 similar issues
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-inactive.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-tglb:         NOTRUN -> [SKIP][205] ([i915#6971]) +18 similar issues
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_nv_pcopy@test3_4:
    - shard-apl:          NOTRUN -> [SKIP][206] ([fdo#109271]) +48 similar issues
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@prime_nv_pcopy@test3_4.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> ([SKIP][207], [SKIP][208]) ([fdo#109271]) +95 similar issues
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb5/igt@prime_nv_pcopy@test3_5.html
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb6/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_test@i915_blt_fill_nv_read:
    - shard-iclb:         NOTRUN -> [SKIP][209] ([i915#6971]) +2 similar issues
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@prime_nv_test@i915_blt_fill_nv_read.html

  * igt@sysfs_clients@fair-0:
    - shard-apl:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([fdo#109271] / [i915#2994])
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@sysfs_clients@fair-0.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@sysfs_clients@fair-0.html
    - shard-tglb:         NOTRUN -> [SKIP][212] ([i915#2994])
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@sysfs_clients@fair-0.html
    - shard-glk:          NOTRUN -> ([SKIP][213], [SKIP][214]) ([fdo#109271] / [i915#2994])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk6/igt@sysfs_clients@fair-0.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9/igt@sysfs_clients@fair-0.html
    - shard-iclb:         NOTRUN -> [SKIP][215] ([i915#2994])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@sysfs_clients@fair-0.html

  * igt@sysfs_clients@sema-50:
    - shard-tglb:         NOTRUN -> ([SKIP][216], [SKIP][217]) ([i915#2994])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@sysfs_clients@sema-50.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@sysfs_clients@sema-50.html

  
#### Possible fixes ####

  * igt@drm_import_export@flink:
    - shard-tglb:         [INCOMPLETE][218] ([i915#6453]) -> ([PASS][219], [PASS][220])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb5/igt@drm_import_export@flink.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@drm_import_export@flink.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@drm_import_export@flink.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-iclb:         [TIMEOUT][221] ([i915#3070]) -> ([PASS][222], [PASS][223])
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@gem_eio@in-flight-contexts-1us.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gem_eio@in-flight-contexts-1us.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][224] ([i915#2842]) -> ([PASS][225], [PASS][226])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_mmap_offset@clear@smem0:
    - shard-snb:          [FAIL][227] ([i915#6973]) -> ([PASS][228], [PASS][229])
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-snb2/igt@gem_mmap_offset@clear@smem0.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb5/igt@gem_mmap_offset@clear@smem0.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb7/igt@gem_mmap_offset@clear@smem0.html

  * igt@i915_pm_dc@dc6-psr:
    - shard-iclb:         [FAIL][230] ([i915#3989] / [i915#454]) -> ([PASS][231], [PASS][232])
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb3/igt@i915_pm_dc@dc6-psr.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@i915_pm_dc@dc6-psr.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@i915_pm_dc@dc6-psr.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-glk:          [DMESG-FAIL][233] ([i915#118] / [i915#1888]) -> ([PASS][234], [PASS][235])
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:
    - shard-glk:          [FAIL][236] ([i915#79]) -> ([PASS][237], [PASS][238])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][239] ([i915#3555]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [SKIP][241] ([i915#5235]) -> ([PASS][242], [PASS][243]) +2 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-tglb:         [SKIP][244] ([i915#5519]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-glk:          [FAIL][246] ([i915#5852]) -> ([PASS][247], [PASS][248])
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@perf_pmu@rc6-suspend:
    - shard-apl:          [DMESG-WARN][249] ([i915#180]) -> ([PASS][250], [PASS][251])
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@perf_pmu@rc6-suspend.html
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl6/igt@perf_pmu@rc6-suspend.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@perf_pmu@rc6-suspend.html

  
#### Warnings ####

  * igt@gem_exec_balancer@parallel-contexts:
    - shard-iclb:         [SKIP][252] ([i915#4525]) -> ([PASS][253], [SKIP][254]) ([i915#4525])
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [SKIP][255] ([i915#4525]) -> ([FAIL][256], [FAIL][257]) ([i915#6117])
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][258] ([i915#2842]) -> ([FAIL][259], [PASS][260]) ([i915#2842]) +1 similar issue
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][261] ([i915#2842]) -> ([FAIL][262], [PASS][263]) ([i915#2842])
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@vecs0:
    - shard-iclb:         [FAIL][264] ([i915#2842]) -> ([FAIL][265], [PASS][266]) ([i915#2842]) +1 similar issue
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gem_exec_fair@basic-pace@vecs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-glk:          [FAIL][267] ([i915#2842]) -> ([PASS][268], [FAIL][269]) ([i915#2842])
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk1/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@kms_content_protection@mei_interface:
    - shard-tglb:         [SKIP][270] ([i915#1063]) -> ([SKIP][271], [SKIP][272]) ([fdo#109300])
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-tglb8/igt@kms_content_protection@mei_interface.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_content_protection@mei_interface.html
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_content_protection@mei_interface.html
    - shard-iclb:         [SKIP][273] ([fdo#109300] / [fdo#111066]) -> ([SKIP][274], [SKIP][275]) ([fdo#109300])
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_content_protection@mei_interface.html
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_content_protection@mei_interface.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@kms_content_protection@mei_interface.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][276] ([i915#2346]) -> ([PASS][277], [FAIL][278]) ([i915#2346])
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-basic:
    - shard-apl:          [FAIL][279] ([fdo#108145] / [i915#265]) -> ([FAIL][280], [FAIL][281]) ([fdo#108145] / [i915#265] / [i915#4573])
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html

  * igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
    - shard-apl:          [FAIL][282] ([i915#265]) -> ([FAIL][283], [FAIL][284]) ([i915#265] / [i915#4573]) +1 similar issue
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
    - shard-glk:          [FAIL][285] ([i915#265]) -> ([FAIL][286], [FAIL][287]) ([i915#265] / [i915#4573]) +1 similar issue
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-glk:          [FAIL][288] ([fdo#108145] / [i915#265]) -> ([FAIL][289], [FAIL][290]) ([fdo#108145] / [i915#265] / [i915#4573]) +2 similar issues
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][291] ([i915#658]) -> ([SKIP][292], [SKIP][293]) ([i915#2920] / [i915#658])
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][294] ([fdo#111068] / [i915#658]) -> ([SKIP][295], [SKIP][296]) ([fdo#111068] / [i915#2920] / [i915#658]) +1 similar issue
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-iclb:         [SKIP][297] ([i915#2920]) -> ([SKIP][298], [SKIP][299]) ([fdo#111068] / [i915#2920] / [i915#658])
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-iclb:         [SKIP][300] ([fdo#109642] / [fdo#111068] / [i915#658]) -> ([FAIL][301], [SKIP][302]) ([fdo#109642] / [fdo#111068] / [i915#5939] / [i915#658])
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb4/igt@kms_psr2_su@page_flip-p010.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2_no_drrs:
    - shard-iclb:         [SKIP][303] ([fdo#109441]) -> ([SKIP][304], [PASS][305]) ([fdo#109441]) +1 similar issue
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@kms_psr@psr2_no_drrs.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr@psr2_no_drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [SKIP][306] ([i915#5519]) -> ([SKIP][307], [PASS][308]) ([i915#5519])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-apl:          [SKIP][309] ([fdo#109271] / [i915#533]) -> [SKIP][310] ([fdo#109271])
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][311], [FAIL][312], [FAIL][313]) ([i915#3002] / [i915#4312]) -> ([FAIL][314], [FAIL][315], [FAIL][316], [FAIL][317], [FAIL][318], [FAIL][319], [FAIL][320], [FAIL][321]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312])
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl1/igt@runner@aborted.html
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@runner@aborted.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl7/igt@runner@aborted.html
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@runner@aborted.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@runner@aborted.html
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@runner@aborted.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.html
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@runner@aborted.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@runner@aborted.html
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.html

  
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
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109312]: https://bugs.freedesktop.org/show_bug.cgi?id=109312
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2122]: https://gitlab.freedesktop.org/drm/intel/issues/2122
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2411]: https://gitlab.freedesktop.org/drm/intel/issues/2411
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3070]: https://gitlab.freedesktop.org/drm/intel/issues/3070
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3301]: https://gitlab.freedesktop.org/drm/intel/issues/3301
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3966]: https://gitlab.freedesktop.org/drm/intel/issues/3966
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4573]: https://gitlab.freedesktop.org/drm/intel/issues/4573
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4854]: https://gitlab.freedesktop.org/drm/intel/issues/4854
  [i915#4855]: https://gitlab.freedesktop.org/drm/intel/issues/4855
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4873]: https://gitlab.freedesktop.org/drm/intel/issues/4873
  [i915#4874]: https://gitlab.freedesktop.org/drm/intel/issues/4874
  [i915#4877]: https://gitlab.freedesktop.org/drm/intel/issues/4877
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5852]: https://gitlab.freedesktop.org/drm/intel/issues/5852
  [i915#5904]: https://gitlab.freedesktop.org/drm/intel/issues/5904
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6227]: https://gitlab.freedesktop.org/drm/intel/issues/6227
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6245]: https://gitlab.freedesktop.org/drm/intel/issues/6245
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6344]: https://gitlab.freedesktop.org/drm/intel/issues/6344
  [i915#6403]: https://gitlab.freedesktop.org/drm/intel/issues/6403
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6433]: https://gitlab.freedesktop.org/drm/intel/issues/6433
  [i915#6453]: https://gitlab.freedesktop.org/drm/intel/issues/6453
  [i915#6463]: https://gitlab.freedesktop.org/drm/intel/issues/6463
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6971]: https://gitlab.freedesktop.org/drm/intel/issues/6971
  [i915#6973]: https://gitlab.freedesktop.org/drm/intel/issues/6973
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6665 -> IGTPW_7851
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12191: b16161a277e2e302cf488cda83f48d6d1a3052f4 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7851: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html
  IGT_6665: aecdb7ff269899b13b127bfa595d091af9781d94 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.html

--===============4089119430055884409==
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
<tr><td><b>Series:</b></td><td>add I915_MMAP_OFFSET_FIXED tests part 2/2</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109129/">https://patchwork.freedesktop.org/series/109129/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7851/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12191_full -&gt; IGTPW_7851_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7851_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7851_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.=
html</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Additional (2): shard-dg1 shard-tglu <br />
  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7851=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@gem_mmap_offset@close-race:<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk2/igt@gem_mmap_offset@close-race.html">PASS</a> -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk=
2/igt@gem_mmap_offset@close-race.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk3/igt@gem_mmap_offset@close-r=
ace.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-dg1-13/igt@gem_exec_balancer@parallel-orderi=
ng.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-dg1-13/igt@i915_module_load@resize-bar.html"=
>DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-source-rg:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-dg1-18/igt@nouveau_crc@pipe-a-source-rg.html=
">SKIP</a> +30 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12191_full and IGTPW_7851_=
full:</p>
<h3>New IGT tests (28)</h3>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.65] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-hdmi-a4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic_implicit_crtc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic_implicit_crtc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic_implicit_crtc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic_implicit_crtc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_connector@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_crtc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_crtc@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_crtc@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_crtc@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease_invalid_plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@simple_lease@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7851_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@feature_discovery@display-2x.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/s=
hard-iclb4/igt@feature_discovery@display-2x.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@feature_discovery@display-2x.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1839">=
i915#1839</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@psr2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@feature_discovery@psr2.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb6/=
igt@feature_discovery@psr2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@feature_discovery@psr2.html"=
>PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658"=
>i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-tglb1/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shar=
d-tglb7/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@gem_ctx_exec=
@basic-nohangcheck.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl1/igt@gem_ctx_persistence@smoketest.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-a=
pl2/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb1/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851=
/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@ge=
m_exec_balancer@parallel-bb-first.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb1/igt@gem_exec_balancer@parallel-out-fence.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-iclb8/igt@gem_exec_balancer@parallel-out-fence.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@=
gem_exec_balancer@parallel-out-fence.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk9/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-g=
lk6/igt@gem_exec_fair@basic-deadline.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9/igt@gem_exec_fair@basic=
-deadline.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2846">i915#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_exec_fair@basic-none@vcs1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842=
">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-apl2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_lmem_swapping@parallel-multi.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gem_lmem_swapping@parallel-random.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
851/shard-iclb7/igt@gem_lmem_swapping@parallel-random.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)=
</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-apl1/igt@gem_lmem_swapping@parallel-random.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4613">i915#4613</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_lmem_swapping@parallel-random.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
851/shard-tglb2/igt@gem_lmem_swapping@parallel-random.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)=
</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-glk2/igt@gem_lmem_swapping@parallel-random.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
51/shard-glk5/igt@gem_lmem_swapping@parallel-random.html">SKIP</a>) (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#461=
3</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl8/igt@gem_lmem_swapping@smem-oom.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sha=
rd-apl7/igt@gem_lmem_swapping@smem-oom.html">SKIP</a>) (<a href=3D"https://=
bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@gem_pxp@create-regular-context-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-off-2:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@gem_pxp@reject-modify-context-prot=
ection-off-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-iclb5/igt@gem_pxp@reject-modify-context-protection-o=
ff-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@gem_pxp@reject-modify-context-prot=
ection-off-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-tglb3/igt@gem_pxp@reject-modify-context-protection-o=
ff-2.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@gem_userptr_blits@input-checking.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7851/shard-tglb1/igt@gem_userptr_blits@input-checking.html">DMESG-WARN=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4991">i91=
5#4991</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb5/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-glk7/igt@gem_userptr_blits@readonly-pwrite-un=
sync.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a>) +7 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7851/shard-iclb6/igt@gem_userptr_blits@readonly-pwrite-unsync.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3297">=
i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-fd:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl3/igt@gem_workarounds@suspend-resume-fd.html">PASS</=
a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-apl1/igt@gem_workarounds@suspend-resume-fd.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7/igt@gem=
_workarounds@suspend-resume-fd.html">PASS</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gen7_exec_parse@basic-rejected.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-iclb6/igt@gen7_exec_parse@basic-rejected.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289">fdo#109289</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-chained:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gen9_exec_parse@bb-chained.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-tglb7/igt@gen9_exec_parse@bb-chained.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@gen9_exec_parse@bb-secure.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i91=
5#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/285=
6">i915#2856</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@gen9_exec_parse@bb-secure.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shar=
d-iclb8/igt@gen9_exec_parse@bb-secure.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rc6_residency@media-rc6-a=
ccuracy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7851/shard-tglb1/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">=
SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109289=
">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7851/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10892">fdo#110892</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stres=
s-no-wait.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7851/shard-tglb3/igt@i915_pm_rpm@modeset-non-lpsp-stress-no-wait.h=
tml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11644">fdo#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/2411">i915#2411</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hugepages:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl2/igt@i915_selftest@live@hugepages.html">PASS</a> -&=
gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-a=
pl2/igt@i915_selftest@live@hugepages.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@i915_selftest@live@=
hugepages.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5904">i915#5904</a>) +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl2/igt@kms_addfb_basic@size-max.html">PASS</a> -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/=
igt@kms_addfb_basic@size-max.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_addfb_basic@size-max.ht=
ml">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5904">i915#5904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/62">i915#62</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_big_fb@4-tiled-16bpp-rotate-90=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7851/shard-iclb3/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a=
>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5286">i915#5286</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_big_fb@4-tiled-max-hw-stride-=
64bpp-rotate-0-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/5286">i915#5286</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-1=
80.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7851/shard-apl3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5904">i915#5904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/62">i915#62</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_big_fb@x-tiled-64bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.=
html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7851/shard-apl2/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">PASS</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#=
62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_big_fb@yf-tiled-max-hw-stride=
-32bpp-rotate-180.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_big_fb@yf-tiled-max-hw-stride-32b=
pp-rotate-180.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-snb7/igt@kms_ccs@pipe-a-bad-aux-stride-y_til=
ed_gen12_rc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-=
4_tiled_dg2_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_ccs@pipe-a-crc-primary-basic-4_t=
iled_dg2_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-a-random-ccs-data-4_=
tiled_dg2_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled=
_dg2_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-=
y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-basic-=
yf_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-basic-yf_tiled_=
ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_ccs@pipe-b-crc-primary-rotati=
on-180-y_tiled_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_ccs@pipe-b-crc-primary-rotation-=
180-y_tiled_ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl7/igt@kms_ccs@pipe-b-crc-sprite-planes-b=
asic-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@kms_ccs@pipe-b-crc-sprite-plan=
es-basic-y_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-apl8/igt@kms_ccs@pipe-c-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_ccs@pipe-c-bad-rotation-90-y_ti=
led_gen12_rc_ccs_cc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-glk3/igt@kms_ccs@pipe-c-bad-rotation-90-y_til=
ed_gen12_rc_ccs_cc.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_ccs@pipe-c-crc-primary-rotatio=
n-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_ccs@pipe-c-crc-primary-r=
otation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar i=
ssue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-rotation=
-180-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_ccs@pipe-c-random-ccs-data-4_t=
iled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_ccs@pipe-d-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_ccs@pipe-d-bad-pixel-format-y_til=
ed_gen12_mc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a>) +71 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-rotation-180-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_ccs@pipe-d-crc-primary-rotatio=
n-180-4_tiled_dg2_rc_ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@kms_ccs@pipe-d-crc-primary-rot=
ation-180-4_tiled_dg2_rc_ccs.html">SKIP</a>) (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109278">fdo#109278</a>) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_ccs@pipe-d-crc-primary-rotation=
-180-4_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/3689">i915#3689</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@kms_chamelium@dp-crc-fast.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shar=
d-iclb1/igt@kms_chamelium@dp-crc-fast.html">SKIP</a>) (<a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"h=
ttps://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 si=
milar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-snb6/igt@kms_chamelium@dp-crc-fast.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard=
-snb7/igt@kms_chamelium@dp-crc-fast.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 simi=
lar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-apl2/igt@kms_chamelium@dp-crc-fast.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard=
-apl7/igt@kms_chamelium@dp-crc-fast.html">SKIP</a>) (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +3 simi=
lar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-single:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_chamelium@dp-crc-single.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/s=
hard-tglb2/igt@kms_chamelium@dp-crc-single.html">SKIP</a>) (<a href=3D"http=
s://bugs.freedesktop.org/show_bug.cgi?id=3D109284">fdo#109284</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) =
+2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_chamelium@dp-hpd.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk=
3/igt@kms_chamelium@dp-hpd.html">SKIP</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-enable-disable-mode:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-glk7/igt@kms_chamelium@dp-hpd-enable-disable-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_chamelium@dp-hpd-enable-disable=
-mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111827">fdo#111827</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-frame-dump:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-apl1/igt@kms_chamelium@vga-frame-dump.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
>fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111827">fdo#111827</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_color@ctm-0-25@pipe-b-edp-1.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
51/shard-iclb3/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/315">i915#315</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6946">i915#6946</a>=
) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_color@ctm-0-25@pipe-c-edp-1.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/31=
5">i915#315</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_cursor_crc@cursor-random-32x10=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/3555">i915#3555</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_cursor_crc@cursor-rapid-movem=
ent-32x32.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7851/shard-tglb7/igt@kms_cursor_crc@cursor-rapid-movement-32x32.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl8/igt@kms_cursor_crc@cursor-suspend@pipe=
-b-dp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7851/shard-apl3/igt@kms_cursor_crc@cursor-suspend@pipe-b-dp-1.html">=
DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/180">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_cursor_legacy@2x-long-cursor-=
vs-flip-atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7851/shard-tglb2/igt@kms_cursor_legacy@2x-long-cursor-vs-flip=
-atomic.html">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_flip@2x-absolute-wf_vblank.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-tglb7/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a>) (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> /=
 <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#1118=
25</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3637">i=
915#3637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3=
966">i915#3966</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip@2x-busy-flip.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-ic=
lb5/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109274">fdo#109274</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip@2x-busy-flip.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tg=
lb2/igt@kms_flip@2x-busy-flip.html">SKIP</a>) (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_flip@2x-nonexisting-fb.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109274">=
fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_flip@flip-vs-suspend-interrupti=
ble@a-dp1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interruptible@=
a-hdmi-a1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7851/shard-glk8/igt@kms_flip@plain-flip-fb-recreate-interrup=
tible@a-hdmi-a1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7851/shard-glk5/igt@kms_flip@plain-flip-fb-recreate-interrup=
tible@a-hdmi-a1.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2122">i915#2122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-4ti=
le-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>=
) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_flip_scaled_crc@flip-32bpp-yf=
tile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms=
_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid=
-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2587">i915#2587</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/2672">i915#2672</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/=
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscali=
ng@pipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_flip_scaled_crc@flip-64bpp-4t=
ile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/ig=
t@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@p=
ipe-a-valid-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/2587">i915#2587</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-i=
ndfb-onoff.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7851/shard-apl2/igt@kms_frontbuffer_tracking@fbc-1p-primscr=
n-spr-indfb-onoff.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-apl3/igt@kms_frontbuffer_tracking@fbc-1p-primsc=
rn-spr-indfb-onoff.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_frontbuffer_tracking@fbcpsr-1p=
-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/6497">i915#6497</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:=
</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@kms_frontbuffer_trac=
king@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/6497">i915#6497</a>) +2 si=
milar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-p=
rimscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_frontbuffer_trackin=
g@psr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html">SKIP</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +10 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@kms_frontbuffer_tracking@psr-2p-s=
cndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://bugs.fr=
eedesktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +10 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-sc=
ndscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +5 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_hdr@static-toggle-dpms.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-iclb2/igt@kms_hdr@static-toggle-dpms.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@edp-1-pipe-d:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_invalid_mode@clock-too-high@e=
dp-1-pipe-d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7851/shard-tglb7/igt@kms_invalid_mode@clock-too-high@edp-1-pipe-=
d.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/6403">i915#6403</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b-planes:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl2/igt@kms_plane@plane-panning-bottom-right-suspend@p=
ipe-b-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-apl3/igt@kms_plane@plane-panning-bottom-right-s=
uspend@pipe-b-planes.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.or=
g/show_bug.cgi?id=3D109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-d-alpha-basic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_plane_alpha_blend@pipe-d-alpha=
-basic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109278">fdo#109278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl8/igt@kms_plane_lowres@tiling-y@pipe-b-dp-1.html">PA=
SS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-apl2/igt@kms_plane_lowres@tiling-y@pipe-b-dp-1.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@k=
ms_plane_lowres@tiling-y@pipe-b-dp-1.html">SKIP</a>) (<a href=3D"https://bu=
gs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-iclb5/igt@kms_plane_scaling@planes-downscale-=
factor-0-5@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_plane_scaling@planes-downsc=
ale-factor-0-5@pipe-a-edp-1.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pi=
pe-c-hdmi-a-1:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-glk1/igt@kms_plane_scaling@planes-upscale-f=
actor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c-hdmi-a-1.h=
tml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a>) +74 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl6/igt@kms_properties@crtc-properties-legacy.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851=
/shard-apl3/igt@kms_properties@crtc-properties-legacy.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5904">i915#=
5904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/62">i=
915#62</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@kms_psr@psr2_dpms.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@km=
s_psr@psr2_dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb1/igt@kms_psr@psr2_primary_mmap_gtt.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851=
/shard-iclb4/igt@kms_psr@psr2_primary_mmap_gtt.html">SKIP</a>) (<a href=3D"=
https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb2/igt@kms_psr@psr2_sprite_render.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-tglb3/igt@kms_psr@psr2_sprite_render.html">FAIL</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/132">i915#132</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3467">i915#3467</a>) +2 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@kms_rotation_crc@primary-yf-tiled-=
reflect-x-180.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/intel/issues/5289">i915#5289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@dp-1-pipe-c:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl7/igt@kms_sequence@get-forked@dp-1-pipe-c.html">PASS=
</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/=
shard-apl2/igt@kms_sequence@get-forked@dp-1-pipe-c.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@kms_=
sequence@get-forked@dp-1-pipe-c.html">DMESG-WARN</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/5904">i915#5904</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/62">i915#62</a>) +7 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/=
shard-tglb2/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/s=
hard-glk8/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</=
p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/=
shard-iclb5/igt@kms_writeback@writeback-fb-id.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2437">i915#2437</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-apl6/igt@kms_writeback@writeback-invalid-pa=
rameters.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7851/shard-apl7/igt@kms_writeback@writeback-invalid-parameters.html=
">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1092=
71">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/2437">i915#2437</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-a-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-iclb8/igt@nouveau_crc@pipe-a-ctx-flip-detec=
tion.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7851/shard-iclb1/igt@nouveau_crc@pipe-a-ctx-flip-detection.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6971">i915#=
6971</a>) +45 similar issues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-source-outp-inactive:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb8/igt@nouveau_crc@pipe-b-source-outp-in=
active.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7851/shard-tglb1/igt@nouveau_crc@pipe-b-source-outp-inactive.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6971">i=
915#6971</a>) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-tglb1/igt@prime_nv_api@nv_i915_reimport_twic=
e_check_flink_name.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/6971">i915#6971</a>) +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_4:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-apl3/igt@prime_nv_pcopy@test3_4.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +48 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-snb5/igt@prime_nv_pcopy@test3_5.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-s=
nb6/igt@prime_nv_pcopy@test3_5.html">SKIP</a>) (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +95 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/6971">i915#6971</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-0:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-apl8/igt@sysfs_clients@fair-0.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7=
/igt@sysfs_clients@fair-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-tglb1/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7851/shard-glk6/igt@sysfs_clients@fair-0.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk9=
/igt@sysfs_clients@fair-0.html">SKIP</a>) (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2994">i915#2994</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-iclb4/igt@sysfs_clients@fair-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#299=
4</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-50:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-tglb7/igt@sysfs_clients@sema-50.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-t=
glb3/igt@sysfs_clients@sema-50.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2994">i915#2994</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_import_export@flink:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-tglb5/igt@drm_import_export@flink.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6453">i915#6453=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851=
/shard-tglb2/igt@drm_import_export@flink.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb3/igt@drm_import_exp=
ort@flink.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3070">i915#=
3070</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7851/shard-iclb3/igt@gem_eio@in-flight-contexts-1us.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@gem=
_eio@in-flight-contexts-1us.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7851/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk5/igt=
@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_offset@clear@smem0:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-snb2/igt@gem_mmap_offset@clear@smem0.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6973">i915#6973</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/sh=
ard-snb5/igt@gem_mmap_offset@clear@smem0.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-snb7/igt@gem_mmap_offset=
@clear@smem0.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb3/igt@i915_pm_dc@dc6-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-=
iclb1/igt@i915_pm_dc@dc6-psr.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/igt@i915_pm_dc@dc6-psr.html">P=
ASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate=
-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/118">i915#118</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1888">i915#1888</a>) -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7851/shard-glk8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_7851/shard-glk5/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-180.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/79">=
i915#79</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7851/shard-glk3/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-=
glk7/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a1.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp=
-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/igt@kms=
_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default=
-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/intel/issues/5235">i915#5235</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb7/igt@kms_plane_scali=
ng@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb3/i=
gt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1=
.html">PASS</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-tglb5/igt@kms_psr_stress_test@flip-primary-inva=
lidate-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5852">i915#5852</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7851/shard-glk2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-=
0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7851/shard-glk5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">PA=
SS</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl1/igt@perf_pmu@rc6-suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard=
-apl6/igt@perf_pmu@rc6-suspend.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl2/igt@perf_pmu@rc6-suspend.html=
">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-contexts:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb3/igt@gem_exec_balancer@parallel-contexts.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7851/shard-iclb4/igt@gem_exec_balancer@parallel-contexts.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/=
igt@gem_exec_balancer@parallel-contexts.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i91=
5#4525</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7851/shard-iclb1/igt@gem_exec_balancer@parallel-ordering.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb4/=
igt@gem_exec_balancer@parallel-ordering.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7851/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb8/=
igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar is=
sue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7851/shard-apl6/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@g=
em_exec_fair@basic-none-solo@rcs0.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb4/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#284=
2</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@gem_ex=
ec_fair@basic-pace@vecs0.html">PASS</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2=
842</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
851/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-glk1/igt@gem=
_exec_fair@basic-throttle@rcs0.html">FAIL</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12191/shard-tglb8/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1063">i91=
5#1063</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_7851/shard-tglb3/igt@kms_content_protection@mei_interface.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-tglb7=
/igt@kms_content_protection@mei_interface.html">SKIP</a>) (<a href=3D"https=
://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12191/shard-iclb2/igt@kms_content_protection@mei_interface.html">SKI=
P</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fd=
o#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1066">fdo#111066</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-iclb7/igt@kms_content_protection@mei_interface.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/s=
hard-iclb1/igt@kms_content_protection@mei_interface.html">SKIP</a>) (<a hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109300">fdo#109300</a>)=
</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-glk8/igt@kms_cursor_legacy@flip-vs-cursor@atomi=
c-transitions.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7851/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-tr=
ansitions.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-basic:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html"=
>FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145=
">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/265">i915#265</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-apl8/igt@kms_plane_alpha_blend@pipe-a-alpha-basic.html">FAIL</a>) (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">fdo#10814=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/265">i91=
5#265</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4573=
">i915#4573</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12191/shard-apl2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-=
fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/265">i915#265</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-apl6/igt@kms_plane_alpha_blend@pipe-a-alpha-transpar=
ent-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7851/shard-apl7/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/265">i915#265</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4573">i915#4573</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_12191/shard-glk2/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-=
fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/265">i915#265</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-glk9/igt@kms_plane_alpha_blend@pipe-a-alpha-transpar=
ent-fb.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7851/shard-glk6/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb=
.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/265">i915#265</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4573">i915#4573</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html"=
>FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145=
">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/265">i915#265</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-glk1/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-glk7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a>) (=
<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108145">fdo#10814=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/265">i91=
5#265</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4573=
">i915#4573</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb4/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_785=
1/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2920">i915#2=
920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i=
915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/658">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-d=
mg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7851/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.ht=
ml">SKIP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11=
1068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2920">i915#2920</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7851/shard-iclb2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-are=
a.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7851/shard-iclb6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SK=
IP</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">=
fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2920">i915#2920</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642<=
/a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo=
#111068</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/65=
8">i915#658</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7851/shard-iclb2/igt@kms_psr2_su@page_flip-p010.html">FAIL</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb5/igt@=
kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard=
-iclb8/igt@kms_psr@psr2_no_drrs.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr@psr2_no_drrs.ht=
ml">PASS</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9441">fdo#109441</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-iclb3/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7851/shard-iclb6/igt@kms_psr_stress_test@flip-primary-inv=
alidate-overlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_7851/shard-iclb2/igt@kms_psr_stress_test@flip-primary-invali=
date-overlay.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12191/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/533">i915#=
533</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
51/shard-apl3/igt@kms_vblank@pipe-d-wait-idle.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_12191/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12191/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12191/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl7=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7851/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl8/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl1/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7851/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/shard-apl3/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_78=
51/shard-apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a>)</l=
i>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6665 -&gt; IGTPW_7851</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12191: b16161a277e2e302cf488cda83f48d6d1a3052f4 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7851: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7851/index.htm=
l<br />
  IGT_6665: aecdb7ff269899b13b127bfa595d091af9781d94 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============4089119430055884409==--
