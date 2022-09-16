Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============2522610585793453712=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ananya Sharma" <ananya.sharma@intel.com>
Date: Fri, 16 Sep 2022 18:45:55 -0000
Message-ID: <166335395554.18049.9589832503804005480@emeril.freedesktop.org>
References: <20220916125819.516618-1-ananya.sharma@intel.com>
In-Reply-To: <20220916125819.516618-1-ananya.sharma@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgTVBPICsg?=
 =?utf-8?q?pipe_color_test?=
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

--===============2522610585793453712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: MPO + pipe color test
URL   : https://patchwork.freedesktop.org/series/108655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_12145_full -> IGTPW_7790_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7790_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7790_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/index.html

Participating hosts (11 -> 7)
------------------------------

  Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7790_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [FAIL][1] +9 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@kms_color@ctm-0-25@pipe-b-edp-1.html

  * igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2:
    - shard-glk:          [PASS][2] -> [FAIL][3] +11 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk7/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk1/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-tglb:         [PASS][4] -> [FAIL][5] +15 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * {igt@kms_color@degamma-multiplane@pipe-a-dp-1} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][6] +8 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl7/igt@kms_color@degamma-multiplane@pipe-a-dp-1.html

  * {igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][7] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk1/igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1.html

  * igt@kms_color@degamma@pipe-b-edp-1:
    - shard-iclb:         [PASS][8] -> [FAIL][9] +8 similar issues
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_color@degamma@pipe-b-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_color@degamma@pipe-b-edp-1.html

  * igt@kms_color@degamma@pipe-c-dp-1:
    - shard-apl:          [PASS][10] -> [FAIL][11] +9 similar issues
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl1/igt@kms_color@degamma@pipe-c-dp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl8/igt@kms_color@degamma@pipe-c-dp-1.html

  * {igt@kms_color@gamma-multiplane@pipe-a-edp-1} (NEW):
    - shard-tglb:         NOTRUN -> [FAIL][12] +7 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_color@gamma-multiplane@pipe-a-edp-1.html

  * {igt@kms_color@gamma-multiplane@pipe-a-vga-1} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][13] +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-snb7/igt@kms_color@gamma-multiplane@pipe-a-vga-1.html

  * {igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-1} (NEW):
    - {shard-tglu}:       NOTRUN -> [FAIL][14] +3 similar issues
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglu-4/igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-1.html

  * igt@kms_color@gamma@pipe-a-vga-1:
    - shard-snb:          [PASS][15] -> [FAIL][16] +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-snb6/igt@kms_color@gamma@pipe-a-vga-1.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-snb4/igt@kms_color@gamma@pipe-a-vga-1.html

  * {igt@kms_color_chamelium@ctm-multiplane} (NEW):
    - {shard-tglu}:       NOTRUN -> [SKIP][17] +1 similar issue
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglu-6/igt@kms_color_chamelium@ctm-multiplane.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:
    - {shard-tglu}:       NOTRUN -> [FAIL][18] +3 similar issues
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglu-4/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1.html

  * igt@kms_color@degamma@pipe-a-hdmi-a-1:
    - {shard-tglu}:       [PASS][19] -> [FAIL][20] +7 similar issues
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglu-3/igt@kms_color@degamma@pipe-a-hdmi-a-1.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglu-3/igt@kms_color@degamma@pipe-a-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12145_full and IGTPW_7790_full:

### New IGT tests (44) ###

  * igt@kms_color@ctm-multiplane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@ctm-multiplane@pipe-a-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.32] s

  * igt@kms_color@ctm-multiplane@pipe-a-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [0.47, 0.59] s

  * igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_color@ctm-multiplane@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-b-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.48] s

  * igt@kms_color@ctm-multiplane@pipe-b-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.40] s

  * igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-multiplane@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@ctm-multiplane@pipe-c-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@ctm-multiplane@pipe-c-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.34, 1.40] s

  * igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@ctm-multiplane@pipe-d-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.34] s

  * igt@kms_color@degamma-multiplane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@degamma-multiplane@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma-multiplane@pipe-a-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.52, 0.68] s

  * igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.81] s

  * igt@kms_color@degamma-multiplane@pipe-a-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.59] s

  * igt@kms_color@degamma-multiplane@pipe-b-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [1.30, 1.31] s

  * igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.54] s

  * igt@kms_color@degamma-multiplane@pipe-b-vga-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color@degamma-multiplane@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.57] s

  * igt@kms_color@degamma-multiplane@pipe-c-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [1.35, 1.41] s

  * igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.55] s

  * igt@kms_color@degamma-multiplane@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.34] s

  * igt@kms_color@gamma-multiplane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_color@gamma-multiplane@pipe-a-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.41] s

  * igt@kms_color@gamma-multiplane@pipe-a-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.49, 0.61] s

  * igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.20, 0.69] s

  * igt@kms_color@gamma-multiplane@pipe-a-vga-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.13] s

  * igt@kms_color@gamma-multiplane@pipe-b-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.56] s

  * igt@kms_color@gamma-multiplane@pipe-b-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [1.33, 1.41] s

  * igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.20] s

  * igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-2:
    - Statuses : 1 fail(s)
    - Exec time: [0.58] s

  * igt@kms_color@gamma-multiplane@pipe-b-vga-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_color@gamma-multiplane@pipe-c-dp-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.56] s

  * igt@kms_color@gamma-multiplane@pipe-c-edp-1:
    - Statuses : 2 fail(s)
    - Exec time: [1.33, 1.41] s

  * igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-1:
    - Statuses : 2 fail(s)
    - Exec time: [0.19, 0.55] s

  * igt@kms_color@gamma-multiplane@pipe-d-edp-1:
    - Statuses : 1 fail(s)
    - Exec time: [1.35] s

  * igt@kms_color@gamma-multiplane@pipe-d-hdmi-a-1:
    - Statuses : 1 fail(s)
    - Exec time: [0.20] s

  * igt@kms_color_chamelium@ctm-multiplane:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@degamma-multiplane:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_chamelium@gamma-multiplane:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7790_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][21] ([fdo#109271] / [i915#1099])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-snb4/igt@gem_ctx_persistence@process.html

  * igt@gem_exec_balancer@parallel-bb-first:
    - shard-iclb:         [PASS][22] -> [SKIP][23] ([i915#4525])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html

  * igt@gem_exec_balancer@parallel-out-fence:
    - shard-iclb:         NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb5/igt@gem_exec_balancer@parallel-out-fence.html

  * igt@gem_exec_endless@dispatch@vecs0:
    - shard-tglb:         [PASS][25] -> [INCOMPLETE][26] ([i915#3778])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb3/igt@gem_exec_endless@dispatch@vecs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@gem_exec_endless@dispatch@vecs0.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-glk:          [PASS][27] -> [FAIL][28] ([i915#2842]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-iclb:         NOTRUN -> [FAIL][29] ([i915#2842])
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-apl:          NOTRUN -> [FAIL][30] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-tglb:         NOTRUN -> [FAIL][31] ([i915#2842])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][32] ([i915#2842])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_params@secure-non-root:
    - shard-iclb:         NOTRUN -> [SKIP][33] ([fdo#112283])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@gem_exec_params@secure-non-root.html
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#112283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gem_exec_params@secure-non-root.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][35] -> [SKIP][36] ([i915#2190])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb8/igt@gem_huc_copy@huc-copy.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@massive-random:
    - shard-iclb:         NOTRUN -> [SKIP][37] ([i915#4613]) +1 similar issue
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@gem_lmem_swapping@massive-random.html

  * igt@gem_lmem_swapping@parallel-random-engines:
    - shard-apl:          NOTRUN -> [SKIP][38] ([fdo#109271] / [i915#4613]) +2 similar issues
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl6/igt@gem_lmem_swapping@parallel-random-engines.html

  * igt@gem_lmem_swapping@random:
    - shard-tglb:         NOTRUN -> [SKIP][39] ([i915#4613]) +1 similar issue
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@gem_lmem_swapping@random.html
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk2/igt@gem_lmem_swapping@random.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-iclb:         NOTRUN -> [WARN][41] ([i915#2658])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-iclb:         NOTRUN -> [SKIP][42] ([i915#4270]) +2 similar issues
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#4270]) +2 similar issues
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb7/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html

  * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#768]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html

  * igt@gem_userptr_blits@coherency-sync:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109290])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_userptr_blits@coherency-sync.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#110542])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gem_userptr_blits@coherency-sync.html

  * igt@gem_workarounds@suspend-resume-context:
    - shard-apl:          [PASS][47] -> [DMESG-WARN][48] ([i915#180]) +1 similar issue
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl3/igt@gem_workarounds@suspend-resume-context.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl2/igt@gem_workarounds@suspend-resume-context.html

  * igt@gen9_exec_parse@basic-rejected:
    - shard-tglb:         NOTRUN -> [SKIP][49] ([i915#2527] / [i915#2856]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html
    - shard-iclb:         NOTRUN -> [SKIP][50] ([i915#2856]) +1 similar issue
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@gen9_exec_parse@basic-rejected.html

  * igt@i915_module_load@resize-bar:
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#6412])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@i915_module_load@resize-bar.html
    - shard-tglb:         NOTRUN -> [SKIP][52] ([i915#6412])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@i915_module_load@resize-bar.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-iclb:         NOTRUN -> [SKIP][53] ([i915#1769] / [i915#3555])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
    - shard-tglb:         NOTRUN -> [SKIP][54] ([i915#1769] / [i915#3555])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][55] ([i915#5286]) +4 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-tglb:         NOTRUN -> [SKIP][56] ([i915#5286]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-glk:          [PASS][57] -> [FAIL][58] ([i915#1888] / [i915#5138])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk8/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-iclb:         NOTRUN -> [SKIP][59] ([fdo#110725] / [fdo#111614]) +2 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#111614])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#110723]) +1 similar issue
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([fdo#111615]) +1 similar issue
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_joiner@2x-modeset:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#2705])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_big_joiner@2x-modeset.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#2705])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_big_joiner@2x-modeset.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3886]) +1 similar issue
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#109278] / [i915#3886]) +3 similar issues
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#3689] / [i915#3886])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3886]) +2 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#6095])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][70] ([fdo#109278]) +9 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][71] ([i915#3689]) +2 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs.html

  * igt@kms_chamelium@dp-hpd-after-suspend:
    - shard-snb:          NOTRUN -> [SKIP][72] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [fdo#111827]) +4 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl2/igt@kms_chamelium@dp-hpd-after-suspend.html

  * igt@kms_chamelium@vga-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@kms_chamelium@vga-hpd-for-each-pipe.html

  * igt@kms_color_chamelium@ctm-max:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_color_chamelium@ctm-max.html
    - shard-glk:          NOTRUN -> [SKIP][76] ([fdo#109271] / [fdo#111827]) +2 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk7/igt@kms_color_chamelium@ctm-max.html

  * {igt@kms_color_chamelium@ctm-multiplane} (NEW):
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#109284]) +2 similar issues
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_color_chamelium@ctm-multiplane.html

  * {igt@kms_color_chamelium@degamma-multiplane} (NEW):
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109284]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_color_chamelium@degamma-multiplane.html

  * igt@kms_content_protection@uevent:
    - shard-iclb:         NOTRUN -> [SKIP][79] ([fdo#109300] / [fdo#111066])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-iclb:         NOTRUN -> [SKIP][80] ([i915#3555]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109274]) +3 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
    - shard-tglb:         NOTRUN -> [SKIP][82] ([fdo#109274] / [fdo#111825])
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:
    - shard-glk:          [PASS][83] -> [FAIL][84] ([i915#79])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109274] / [fdo#111825] / [i915#3637]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@c-dp1:
    - shard-apl:          NOTRUN -> [DMESG-WARN][86] ([i915#62]) +2 similar issues
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl6/igt@kms_flip@plain-flip-ts-check@c-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][87] ([i915#2672]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode:
    - shard-iclb:         NOTRUN -> [SKIP][88] ([i915#2672] / [i915#3555]) +1 similar issue
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-iclb:         NOTRUN -> [SKIP][89] ([i915#2587] / [i915#2672]) +2 similar issues
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-apl:          [PASS][90] -> [DMESG-FAIL][91] ([i915#62])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109280]) +16 similar issues
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([i915#6497]) +3 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:
    - shard-glk:          NOTRUN -> [SKIP][94] ([fdo#109271]) +46 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:
    - shard-apl:          NOTRUN -> [SKIP][95] ([fdo#109271]) +96 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
    - shard-snb:          NOTRUN -> [SKIP][96] ([fdo#109271]) +83 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html
    - shard-tglb:         NOTRUN -> [SKIP][97] ([fdo#109280] / [fdo#111825]) +11 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#112054] / [i915#5288])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][99] ([i915#3536]) +5 similar issues
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [PASS][100] -> [SKIP][101] ([i915#5176]) +1 similar issue
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1:
    - shard-iclb:         [PASS][102] -> [SKIP][103] ([i915#5235]) +2 similar issues
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:
    - shard-apl:          NOTRUN -> [SKIP][104] ([fdo#109271] / [i915#658]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl3/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-glk:          NOTRUN -> [SKIP][105] ([fdo#109271] / [i915#658])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-iclb:         NOTRUN -> [SKIP][106] ([fdo#111068] / [i915#658]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
    - shard-tglb:         NOTRUN -> [SKIP][107] ([i915#2920])
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-iclb:         [PASS][108] -> [SKIP][109] ([fdo#109642] / [fdo#111068] / [i915#658])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2_sprite_mmap_gtt:
    - shard-iclb:         NOTRUN -> [SKIP][110] ([fdo#109441])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html
    - shard-tglb:         NOTRUN -> [FAIL][111] ([i915#132] / [i915#3467])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_psr@psr2_sprite_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_render:
    - shard-iclb:         [PASS][112] -> [SKIP][113] ([fdo#109441])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_psr@psr2_sprite_render.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_psr@psr2_sprite_render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-iclb:         [PASS][114] -> [SKIP][115] ([i915#5519])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-iclb:         NOTRUN -> [SKIP][116] ([i915#2437])
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_writeback@writeback-fb-id.html

  * igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:
    - shard-iclb:         NOTRUN -> [SKIP][117] ([fdo#109278] / [i915#2530])
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame.html

  * igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:
    - shard-iclb:         NOTRUN -> [SKIP][118] ([fdo#109291]) +1 similar issue
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name.html

  * igt@prime_nv_test@i915_nv_sharing:
    - shard-tglb:         NOTRUN -> [SKIP][119] ([fdo#109291])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@prime_nv_test@i915_nv_sharing.html

  * igt@prime_vgem@fence-read-hang:
    - shard-iclb:         NOTRUN -> [SKIP][120] ([fdo#109295]) +1 similar issue
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@prime_vgem@fence-read-hang.html
    - shard-tglb:         NOTRUN -> [SKIP][121] ([fdo#109295])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@prime_vgem@fence-read-hang.html

  * igt@sysfs_clients@sema-25:
    - shard-apl:          NOTRUN -> [SKIP][122] ([fdo#109271] / [i915#2994])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl7/igt@sysfs_clients@sema-25.html
    - shard-tglb:         NOTRUN -> [SKIP][123] ([i915#2994])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@sysfs_clients@sema-25.html
    - shard-glk:          NOTRUN -> [SKIP][124] ([fdo#109271] / [i915#2994])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk6/igt@sysfs_clients@sema-25.html

  * igt@sysfs_clients@split-50:
    - shard-iclb:         NOTRUN -> [SKIP][125] ([i915#2994]) +1 similar issue
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@sysfs_clients@split-50.html

  
#### Possible fixes ####

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][126] ([i915#4525]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][128] ([i915#2842]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][130] ([i915#2842]) -> [PASS][131] +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_suspend@basic-s3@smem:
    - shard-apl:          [DMESG-WARN][132] ([i915#180]) -> [PASS][133] +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@gem_exec_suspend@basic-s3@smem.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl1/igt@gem_exec_suspend@basic-s3@smem.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [DMESG-WARN][134] ([i915#5566] / [i915#716]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk6/igt@gen9_exec_parse@allowed-single.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk1/igt@gen9_exec_parse@allowed-single.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-tglb:         [FAIL][136] ([i915#3989]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb6/igt@i915_pm_dc@dc5-psr.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@i915_pm_dc@dc5-psr.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:
    - shard-glk:          [FAIL][138] ([i915#2346]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-iclb:         [SKIP][140] ([i915#3555]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [SKIP][142] ([i915#5235]) -> [PASS][143] +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr@psr2_primary_blt:
    - shard-iclb:         [SKIP][144] ([fdo#109441]) -> [PASS][145] +1 similar issue
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb7/igt@kms_psr@psr2_primary_blt.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_psr@psr2_primary_blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-tglb:         [SKIP][146] ([i915#5519]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  
#### Warnings ####

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [FAIL][148] ([i915#5784]) -> [TIMEOUT][149] ([i915#3063])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-tglb1/igt@gem_eio@unwedge-stress.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         [FAIL][150] ([i915#6117]) -> [SKIP][151] ([i915#4525])
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][152] ([i915#658]) -> [SKIP][153] ([i915#2920]) +1 similar issue
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-iclb:         [FAIL][154] ([i915#5939]) -> [SKIP][155] ([fdo#109642] / [fdo#111068] / [i915#658])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][156], [FAIL][157], [FAIL][158], [FAIL][159], [FAIL][160]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599]) -> ([FAIL][161], [FAIL][162], [FAIL][163], [FAIL][164]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257] / [i915#6599])
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl3/igt@runner@aborted.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@runner@aborted.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl8/igt@runner@aborted.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@runner@aborted.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@runner@aborted.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl7/igt@runner@aborted.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl2/igt@runner@aborted.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl1/igt@runner@aborted.html
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl7/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109278]: https://bugs.freedesktop.org/show_bug.cgi?id=109278
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109284]: https://bugs.freedesktop.org/show_bug.cgi?id=109284
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109290]: https://bugs.freedesktop.org/show_bug.cgi?id=109290
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#111066]: https://bugs.freedesktop.org/show_bug.cgi?id=111066
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111644]: https://bugs.freedesktop.org/show_bug.cgi?id=111644
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1888]: https://gitlab.freedesktop.org/drm/intel/issues/1888
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#2994]: https://gitlab.freedesktop.org/drm/intel/issues/2994
  [i915#3002]: https://gitlab.freedesktop.org/drm/intel/issues/3002
  [i915#3063]: https://gitlab.freedesktop.org/drm/intel/issues/3063
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3467]: https://gitlab.freedesktop.org/drm/intel/issues/3467
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5257]: https://gitlab.freedesktop.org/drm/intel/issues/5257
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5519]: https://gitlab.freedesktop.org/drm/intel/issues/5519
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5939]: https://gitlab.freedesktop.org/drm/intel/issues/5939
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#62]: https://gitlab.freedesktop.org/drm/intel/issues/62
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6412]: https://gitlab.freedesktop.org/drm/intel/issues/6412
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6590]: https://gitlab.freedesktop.org/drm/intel/issues/6590
  [i915#6599]: https://gitlab.freedesktop.org/drm/intel/issues/6599
  [i915#716]: https://gitlab.freedesktop.org/drm/intel/issues/716
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6656 -> IGTPW_7790
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12145: 2dc9ea03abff1bfc8c8ebe0f7ef056edf77cc29e @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7790: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/index.html
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/index.html

--===============2522610585793453712==
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
<tr><td><b>Series:</b></td><td>MPO + pipe color test</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/108655/">https://patchwork.freedesktop.org/series/108655/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7790/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12145_full -&gt; IGTPW_7790_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7790_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7790_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/index.=
html</p>
<h2>Participating hosts (11 -&gt; 7)</h2>
<p>Missing    (4): pig-skl-6260u pig-kbl-iris shard-rkl pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7790=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@kms_color@ctm-0-25@pipe-b-edp-1.ht=
ml">FAIL</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk7/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sh=
ard-glk1/igt@kms_color@ctm-0-25@pipe-b-hdmi-a-2.html">FAIL</a> +11 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shar=
d-tglb1/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">FAIL</a> +15 similar issu=
es</li>
</ul>
</li>
<li>
<p>{igt@kms_color@degamma-multiplane@pipe-a-dp-1} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-apl7/igt@kms_color@degamma-multiplane@pipe-a=
-dp-1.html">FAIL</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1} (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-glk1/igt@kms_color@degamma-multiplane@pipe-a=
-hdmi-a-1.html">FAIL</a> +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_color@degamma@pipe-b-edp-1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard=
-iclb2/igt@kms_color@degamma@pipe-b-edp-1.html">FAIL</a> +8 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-apl1/igt@kms_color@degamma@pipe-c-dp-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-a=
pl8/igt@kms_color@degamma@pipe-c-dp-1.html">FAIL</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@gamma-multiplane@pipe-a-edp-1} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_color@gamma-multiplane@pipe-a-=
edp-1.html">FAIL</a> +7 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color@gamma-multiplane@pipe-a-vga-1} (NEW):</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-snb7/igt@kms_color@gamma-multiplane@pipe-a-v=
ga-1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-1} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglu-4/igt@kms_color@gamma-multiplane@pipe-b=
-hdmi-a-1.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-snb6/igt@kms_color@gamma@pipe-a-vga-1.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-sn=
b4/igt@kms_color@gamma@pipe-a-vga-1.html">FAIL</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@ctm-multiplane} (NEW):</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglu-6/igt@kms_color_chamelium@ctm-multiplan=
e.html">SKIP</a> +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_color@ctm-0-75@pipe-a-hdmi-a-1:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglu-4/igt@kms_color@ctm-0-75@pipe-a-hdmi-a-=
1.html">FAIL</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-1:</p>
<ul>
<li>{shard-tglu}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglu-3/igt@kms_color@degamma@pipe-a-hdmi-a-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/s=
hard-tglu-3/igt@kms_color@degamma@pipe-a-hdmi-a-1.html">FAIL</a> +7 similar=
 issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12145_full and IGTPW_7790_=
full:</p>
<h3>New IGT tests (44)</h3>
<ul>
<li>
<p>igt@kms_color@ctm-multiplane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.47, 0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.34, 1.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.52, 0.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.30, 1.31] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.57] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.35, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.49, 0.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.20, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-a-vga-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.33, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-b-vga-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-dp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [1.33, 1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-c-hdmi-a-1:</p>
<ul>
<li>Statuses : 2 fail(s)</li>
<li>Exec time: [0.19, 0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma-multiplane@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-multiplane:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@degamma-multiplane:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@gamma-multiplane:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7790_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-snb4/igt@gem_ctx_persistence@process.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-bb-first:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@gem_exec_balancer@parallel-bb-first.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/=
shard-iclb3/igt@gem_exec_balancer@parallel-bb-first.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-out-fence:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb5/igt@gem_exec_balancer@parallel-out-fen=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb3/igt@gem_exec_endless@dispatch@vecs0.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shar=
d-tglb6/igt@gem_exec_endless@dispatch@vecs0.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/s=
hard-glk2/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-apl6/igt@gem_exec_fair@basic-pace-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb5/igt@gem_exec_fair@basic-pace-solo@rcs0.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@secure-non-root:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb2/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gem_exec_params@secure-non-root.htm=
l">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1122=
83">fdo#112283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb8/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb7/ig=
t@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2190">i915#2190</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@massive-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@gem_lmem_swapping@massive-random.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-engines:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-apl6/igt@gem_lmem_swapping@parallel-random-e=
ngines.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/4613">i915#4613</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb2/igt@gem_lmem_swapping@random.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">i915=
#4613</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-glk2/igt@gem_lmem_swapping@random.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#=
109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/461=
3">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@gem_pwrite@basic-exhaustion.html">=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">=
i915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@gem_pxp@protected-raw-src-copy-not=
-readible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb7/igt@gem_pxp@verify-pxp-key-change-afte=
r-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/4270">i915#4270</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@gem_render_copy@y-tiled-ccs-to-yf-=
tiled-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-sync:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb3/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
290">fdo#109290</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gem_userptr_blits@coherency-sync.ht=
ml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110=
542">fdo#110542</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_workarounds@suspend-resume-context:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-apl3/igt@gem_workarounds@suspend-resume-context.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_779=
0/shard-apl2/igt@gem_workarounds@suspend-resume-context.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180=
</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527=
">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/2856">i915#2856</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb7/igt@gen9_exec_parse@basic-rejected.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856=
">i915#2856</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@resize-bar:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb4/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb6/igt@i915_module_load@resize-bar.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6412">i=
915#6412</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/intel/issues/1769">i915#1769</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/5286">i915#5286</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_big_fb@4-tiled-max-hw-stride-6=
4bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk8/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sha=
rd-glk7/igt@kms_big_fb@linear-8bpp-rotate-180.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/1888">i915#1888</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111614">fdo#111614</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
10723">fdo#110723</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@2x-modeset:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_big_joiner@2x-modeset.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2705">i91=
5#2705</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-glk1/igt@kms_ccs@pipe-a-crc-sprite-planes-ba=
sic-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_ccs@pipe-b-bad-rotation-90-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/3886">i915#3886</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_=
tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_ccs@pipe-c-crc-primary-basic-4=
_tiled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_ccs@pipe-d-bad-aux-stride-y_ti=
led_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109278">fdo#109278</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-rotation-90-4_tiled_dg2_rc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_ccs@pipe-d-bad-rotation-90-4_t=
iled_dg2_rc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/3689">i915#3689</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-after-suspend:</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-snb2/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-apl2/igt@kms_chamelium@dp-hpd-after-suspend.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +4 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb8/igt@kms_chamelium@vga-hpd-for-each-pip=
e.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@ctm-max:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_color_chamelium@ctm-max.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-glk7/igt@kms_color_chamelium@ctm-max.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@ctm-multiplane} (NEW):</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@kms_color_chamelium@ctm-multiplane=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109284">fdo#109284</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@kms_color_chamelium@degamma-multiplane} (NEW):</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_color_chamelium@degamma-multip=
lane.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109284">fdo#109284</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_content_protection@uevent.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10930=
0">fdo#109300</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D111066">fdo#111066</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_cursor_crc@cursor-sliding-max-=
size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/3555">i915#3555</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a>) +3 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_cursor_legacy@2x-cursor-vs-flip=
-atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D111825">fdo#111825</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a1-hdmi-a2:=
</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptib=
le@ac-hdmi-a1-hdmi-a2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7790/shard-glk5/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ac-hdmi-a1-hdmi-a2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/79">i915#79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_flip@2x-plain-flip-interruptib=
le.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D111825">fdo#111825</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-dp1:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-apl6/igt@kms_flip@plain-flip-ts-check@c-dp1.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/62">i915#62</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1=
 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling@pipe-a-default-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_flip_scaled_crc@flip-32bpp-yti=
le-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3555">i91=
5#3555</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</=
a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-apl1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb=
-msflip-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7790/shard-apl6/igt@kms_frontbuffer_tracking@fbc-1p-primscr=
n-indfb-msflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/62">i915#62</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-mo=
desetfrombusy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/6497">i915#6497</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-glk5/igt@kms_frontbuffer_tracking@psr-1p-pri=
mscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +46 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +96 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-snb7/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesk=
top.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +83 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +11 similar issu=
es</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5288">i915#5288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@kms_plane_lowres@tiling-yf@pipe-b-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb8/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms_plane_scal=
ing@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5176">i9=
15#5176</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c-e=
dp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb7/igt@kms_plane_scaling@planes-unity-scaling-downsc=
ale-factor-0-5@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb2/igt@kms_plane_scaling@plan=
es-unity-scaling-downscale-factor-0-5@pipe-c-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-apl3/igt@kms_psr2_sf@overlay-plane-move-cont=
inuous-exceed-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sh=
ow_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-glk6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb2/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2920">i915#2920</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sha=
rd-iclb3/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_mmap_gtt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb4/igt@kms_psr@psr2_sprite_mmap_gtt.html">=
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441"=
>fdo#109441</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb5/igt@kms_psr@psr2_sprite_mmap_gtt.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/132">i=
915#132</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/34=
67">i915#3467</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_psr@psr2_sprite_render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-icl=
b3/igt@kms_psr@psr2_sprite_render.html">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb4/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_7790/shard-iclb6/igt@kms_psr_stress_test@flip-primary-invalidate=
-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/5519">i915#5519</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb7/igt@kms_writeback@writeback-fb-id.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2437=
">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@nouveau_crc@pipe-d-ctx-flip-skip-c=
urrent-frame.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_api@nv_i915_reimport_twice_check_flink_name:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb6/igt@prime_nv_api@nv_i915_reimport_twic=
e_check_flink_name.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_nv_sharing:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-tglb6/igt@prime_nv_test@i915_nv_sharing.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10929=
1">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@fence-read-hang:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-iclb7/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb3/igt@prime_vgem@fence-read-hang.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109295">f=
do#109295</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@sema-25:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-apl7/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-tglb2/igt@sysfs_clients@sema-25.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#29=
94</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7790/shard-glk6/igt@sysfs_clients@sema-25.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-50:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7790/shard-iclb4/igt@sysfs_clients@split-50.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#=
2994</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb6/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7790/shard-iclb2/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb8/igt@gem_exec_fair@basic-none-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7790/shard-tglb3/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
790/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a> +1 sim=
ilar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@smem:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-apl2/igt@gem_exec_suspend@basic-s3@smem.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915=
#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
790/shard-apl1/igt@gem_exec_suspend@basic-s3@smem.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk6/igt@gen9_exec_parse@allowed-single.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5566">i91=
5#5566</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/716=
">i915#716</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7790/shard-glk1/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb6/igt@i915_pm_dc@dc5-psr.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-tglb2=
/igt@i915_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions-varying-size:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-glk9/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions-varying-size.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7790/shard-glk7/igt@kms_cursor_legacy@flip-vs-=
cursor@atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp=
-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-iclb3/igt@kms=
_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default=
-mode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/5235">i915#5235</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_7790/shard-iclb1/igt@kms_plane_scaling@planes-downs=
cale-factor-0-5@pipe-a-edp-1.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_blt:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb7/igt@kms_psr@psr2_primary_blt.html">SKIP</a> (<a h=
ref=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sha=
rd-iclb2/igt@kms_psr@psr2_primary_blt.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb1/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/5519">i915#5519</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_7790/shard-tglb8/igt@kms_psr_stress_test@invalidate-primar=
y-flip-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-tglb1/igt@gem_eio@unwedge-stress.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-t=
glb6/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb4/igt@gem_exec_balancer@parallel-ordering.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6117">i91=
5#6117</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7790/shard-iclb7/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb6/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/658">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_7790/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous=
-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/in=
tel/issues/2920">i915#2920</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12145/shard-iclb2/igt@kms_psr2_su@page_flip-nv12.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5939">i915#5939</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sha=
rd-iclb5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://=
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
p/CI_DRM_12145/shard-apl3/igt@runner@aborted.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/C=
I_DRM_12145/shard-apl8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12145/shard-apl2/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_D=
RM_12145/shard-apl2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6599">i915#=
6599</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7790/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/shard-apl2/igt@runner@aborted.html">=
FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/sh=
ard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_7790/shard-apl7/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180"=
>i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/6599">i915#6599</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6656 -&gt; IGTPW_7790</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12145: 2dc9ea03abff1bfc8c8ebe0f7ef056edf77cc29e @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7790: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7790/index.htm=
l<br />
  IGT_6656: 24100c4e181c50e3678aeca9c641b8a43555ad73 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============2522610585793453712==--
