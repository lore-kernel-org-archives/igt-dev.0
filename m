Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8970513334511076480=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Fri, 01 Jul 2022 06:45:22 -0000
Message-ID: <165665792269.30282.6744357952250856366@emeril.freedesktop.org>
References: <20220630145816.68461-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220630145816.68461-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/kms=5Flegacy=5Fcolorkey=3A_IGT_test_Cleanup_=28rev3=29?=
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

--===============8970513334511076480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/i915/kms_legacy_colorkey: IGT test Cleanup (rev3)
URL   : https://patchwork.freedesktop.org/series/105222/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_11834_full -> IGTPW_7447_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_7447_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_7447_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/index.html

Participating hosts (13 -> 10)
------------------------------

  Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_7447_full:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_ctx_persistence@smoketest:
    - shard-glk:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk1/igt@gem_ctx_persistence@smoketest.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk8/igt@gem_ctx_persistence@smoketest.html

  * igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:
    - shard-tglb:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb3/igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_ctx_isolation@preservation-s3@vcs0:
    - {shard-tglu}:       NOTRUN -> [DMESG-WARN][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglu-8/igt@gem_ctx_isolation@preservation-s3@vcs0.html

  * {igt@gem_exec_capture@capture-recoverable}:
    - shard-iclb:         NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_capture@capture-recoverable.html
    - {shard-rkl}:        NOTRUN -> [SKIP][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html
    - {shard-tglu}:       NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglu-6/igt@gem_exec_capture@capture-recoverable.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:
    - {shard-dg1}:        NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - {shard-dg1}:        [SKIP][10] ([fdo#111825]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:
    - {shard-dg1}:        NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:
    - {shard-dg1}:        [PASS][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu.html

  * igt@kms_vblank@pipe-a-wait-forked-busy-hang:
    - {shard-dg1}:        NOTRUN -> [TIMEOUT][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-16/igt@kms_vblank@pipe-a-wait-forked-busy-hang.html

  
New tests
---------

  New tests have been introduced between CI_DRM_11834_full and IGTPW_7447_full:

### New IGT tests (17) ###

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.19] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.21] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-128x128:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-256x256:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-64x64:
    - Statuses : 1 pass(s)
    - Exec time: [3.20] s

  * igt@kms_legacy_colorkey@invalid-plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_legacy_colorkey@invalid-plane@outrange-id:
    - Statuses : 9 pass(s)
    - Exec time: [0.0] s

  * igt@kms_legacy_colorkey@invalid-plane@zero-id:
    - Statuses : 9 pass(s)
    - Exec time: [0.0] s

  * igt@kms_legacy_colorkey@valid-plane:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_legacy_colorkey@valid-plane@pipe-a:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.10] s

  * igt@kms_legacy_colorkey@valid-plane@pipe-b:
    - Statuses : 5 pass(s)
    - Exec time: [0.0, 0.04] s

  * igt@kms_legacy_colorkey@valid-plane@pipe-c:
    - Statuses : 4 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_legacy_colorkey@valid-plane@pipe-d:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_7447_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_param@set-priority-not-supported:
    - shard-tglb:         NOTRUN -> [SKIP][16] ([fdo#109314])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gem_ctx_param@set-priority-not-supported.html
    - shard-iclb:         NOTRUN -> [SKIP][17] ([fdo#109314])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_ctx_param@set-priority-not-supported.html

  * igt@gem_ctx_persistence@processes:
    - shard-snb:          NOTRUN -> [SKIP][18] ([fdo#109271] / [i915#1099]) +1 similar issue
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-snb2/igt@gem_ctx_persistence@processes.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-tglb:         [PASS][19] -> [FAIL][20] ([i915#5099])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb2/igt@gem_ctx_persistence@smoketest.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-glk:          [PASS][21] -> [TIMEOUT][22] ([i915#3063])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk2/igt@gem_eio@in-flight-contexts-10ms.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk2/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@in-flight-contexts-1us:
    - shard-tglb:         [PASS][23] -> [TIMEOUT][24] ([i915#3063])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-kbl:          NOTRUN -> [FAIL][25] ([i915#6117])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_endless@dispatch@vcs1:
    - shard-tglb:         [PASS][26] -> [INCOMPLETE][27] ([i915#3778])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@gem_exec_endless@dispatch@vcs1.html

  * igt@gem_exec_fair@basic-none@vcs1:
    - shard-kbl:          NOTRUN -> [FAIL][28] ([i915#2842]) +4 similar issues
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html

  * igt@gem_exec_fair@basic-none@vecs0:
    - shard-apl:          [PASS][29] -> [FAIL][30] ([i915#2842]) +1 similar issue
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html

  * igt@gem_exec_fair@basic-pace@vcs0:
    - shard-iclb:         [PASS][31] -> [FAIL][32] ([i915#2842])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_exec_fair@basic-pace@vcs0.html

  * igt@gem_exec_parallel@engines@fds:
    - shard-kbl:          NOTRUN -> [INCOMPLETE][33] ([i915#6310] / [i915#794])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_exec_parallel@engines@fds.html

  * igt@gem_exec_params@no-blt:
    - shard-iclb:         NOTRUN -> [SKIP][34] ([fdo#109283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_params@no-blt.html
    - shard-tglb:         NOTRUN -> [SKIP][35] ([fdo#109283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@gem_exec_params@no-blt.html

  * igt@gem_huc_copy@huc-copy:
    - shard-kbl:          NOTRUN -> [SKIP][36] ([fdo#109271] / [i915#2190])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_huc_copy@huc-copy.html
    - shard-apl:          NOTRUN -> [SKIP][37] ([fdo#109271] / [i915#2190])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl4/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
    - shard-tglb:         NOTRUN -> [SKIP][38] ([i915#4613]) +1 similar issue
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-kbl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613]) +7 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-ccs:
    - shard-glk:          NOTRUN -> [SKIP][40] ([fdo#109271] / [i915#4613]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#4613]) +2 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@gem_lmem_swapping@verify-ccs.html
    - shard-apl:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@gem_lmem_swapping@verify-ccs.html

  * igt@gem_pwrite@basic-exhaustion:
    - shard-kbl:          NOTRUN -> [WARN][43] ([i915#2658])
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html

  * igt@gem_pxp@create-protected-buffer:
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#4270]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_pxp@create-protected-buffer.html

  * igt@gem_render_copy@y-tiled-to-vebox-linear:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([i915#768]) +1 similar issue
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-linear.html

  * igt@gem_softpin@evict-single-offset:
    - shard-apl:          NOTRUN -> [FAIL][46] ([i915#4171])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl7/igt@gem_softpin@evict-single-offset.html
    - shard-kbl:          NOTRUN -> [FAIL][47] ([i915#4171])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_softpin@evict-single-offset.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][48] ([fdo#109271] / [i915#3323])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@input-checking:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][49] ([i915#4991]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@gem_userptr_blits@input-checking.html

  * igt@gem_userptr_blits@unsync-unmap-after-close:
    - shard-tglb:         NOTRUN -> [SKIP][50] ([i915#3297])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-after-close.html
    - shard-iclb:         NOTRUN -> [SKIP][51] ([i915#3297])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_userptr_blits@unsync-unmap-after-close.html

  * igt@gen9_exec_parse@allowed-all:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([i915#2856]) +1 similar issue
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@gen9_exec_parse@allowed-all.html

  * igt@gen9_exec_parse@unaligned-jump:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2527] / [i915#2856])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gen9_exec_parse@unaligned-jump.html

  * igt@i915_hangman@gt-engine-error@vecs0:
    - shard-glk:          [PASS][54] -> [INCOMPLETE][55] ([i915#6310])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk7/igt@i915_hangman@gt-engine-error@vecs0.html
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk7/igt@i915_hangman@gt-engine-error@vecs0.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][56] ([i915#454])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [PASS][57] -> [SKIP][58] ([fdo#109271])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl3/igt@i915_pm_dc@dc9-dpms.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl4/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - shard-kbl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +370 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp:
    - shard-iclb:         NOTRUN -> [SKIP][60] ([fdo#110892])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html

  * igt@i915_suspend@basic-s3-without-i915:
    - shard-iclb:         NOTRUN -> [SKIP][61] ([i915#5903])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@i915_suspend@basic-s3-without-i915.html

  * igt@i915_suspend@forcewake:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][62] ([i915#180]) +2 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@i915_suspend@forcewake.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-tglb:         NOTRUN -> [SKIP][63] ([i915#1769])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
    - shard-iclb:         NOTRUN -> [SKIP][64] ([i915#1769])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][65] ([i915#5286])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-iclb:         NOTRUN -> [SKIP][66] ([fdo#110725] / [fdo#111614]) +1 similar issue
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([fdo#111614])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-iclb:         NOTRUN -> [SKIP][68] ([fdo#110723])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([i915#3689])
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][70] ([fdo#109271] / [i915#3886]) +4 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +13 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#6095]) +1 similar issue
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-glk:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +2 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][74] ([fdo#109278] / [i915#3886]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([i915#3689] / [i915#6095]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#3689] / [i915#3886])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][77] ([fdo#111615] / [i915#3689])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][78] ([fdo#109278]) +17 similar issues
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_chamelium@dp-hpd:
    - shard-glk:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +5 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk6/igt@kms_chamelium@dp-hpd.html
    - shard-snb:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +3 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-snb7/igt@kms_chamelium@dp-hpd.html

  * igt@kms_chamelium@dp-hpd-with-enabled-mode:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_chamelium@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium@vga-hpd-without-ddc:
    - shard-apl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl2/igt@kms_chamelium@vga-hpd-without-ddc.html

  * igt@kms_color@pipe-d-ctm-green-to-red:
    - shard-iclb:         NOTRUN -> [SKIP][83] ([fdo#109278] / [i915#1149])
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_color@pipe-d-ctm-green-to-red.html

  * igt@kms_color_chamelium@pipe-c-ctm-0-5:
    - shard-kbl:          NOTRUN -> [SKIP][84] ([fdo#109271] / [fdo#111827]) +28 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-tglb:         NOTRUN -> [SKIP][85] ([fdo#109284] / [fdo#111827]) +2 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html
    - shard-iclb:         NOTRUN -> [SKIP][86] ([fdo#109278] / [fdo#109284] / [fdo#111827])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_content_protection@srm:
    - shard-kbl:          NOTRUN -> [TIMEOUT][87] ([i915#1319]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:
    - shard-apl:          NOTRUN -> [SKIP][88] ([fdo#109271]) +116 similar issues
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([i915#6076])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1.html

  * igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#5287])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled.html

  * igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled:
    - shard-iclb:         NOTRUN -> [SKIP][91] ([i915#5287]) +1 similar issue
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-tglb:         NOTRUN -> [SKIP][92] ([fdo#109274] / [fdo#111825]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-iclb:         NOTRUN -> [SKIP][93] ([fdo#109274]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:
    - shard-kbl:          [PASS][94] -> [DMESG-WARN][95] ([i915#180]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-iclb:         NOTRUN -> [SKIP][96] ([fdo#109280]) +19 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-glk:          NOTRUN -> [SKIP][97] ([fdo#109271]) +62 similar issues
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-tglb:         NOTRUN -> [SKIP][98] ([fdo#109280] / [fdo#111825]) +7 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:
    - shard-kbl:          [PASS][99] -> [FAIL][100] ([i915#1188])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html

  * igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:
    - shard-iclb:         NOTRUN -> [SKIP][101] ([fdo#109289])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
    - shard-kbl:          NOTRUN -> [FAIL][102] ([fdo#108145] / [i915#265]) +1 similar issue
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][103] ([i915#265])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html
    - shard-kbl:          NOTRUN -> [FAIL][104] ([i915#265]) +1 similar issue
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-tglb:         NOTRUN -> [SKIP][105] ([fdo#112054])
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1:
    - shard-iclb:         NOTRUN -> [SKIP][106] ([i915#3536]) +2 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:
    - shard-iclb:         [PASS][107] -> [SKIP][108] ([i915#5235]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-iclb:         NOTRUN -> [SKIP][109] ([fdo#111068] / [i915#658])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-apl:          NOTRUN -> [SKIP][110] ([fdo#109271] / [i915#658]) +2 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-tglb:         NOTRUN -> [SKIP][111] ([i915#2920])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-glk:          NOTRUN -> [SKIP][112] ([fdo#109271] / [i915#658]) +1 similar issue
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
    - shard-iclb:         NOTRUN -> [SKIP][113] ([i915#658])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-iclb:         [PASS][114] -> [SKIP][115] ([fdo#109642] / [fdo#111068] / [i915#658])
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271] / [i915#658]) +7 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_setmode@basic@pipe-a-vga-1:
    - shard-snb:          NOTRUN -> [FAIL][117] ([i915#5465]) +1 similar issue
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html

  * igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:
    - shard-kbl:          [PASS][118] -> [INCOMPLETE][119] ([i915#3614] / [i915#4939])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-wait-idle:
    - shard-glk:          NOTRUN -> [SKIP][120] ([fdo#109271] / [i915#533])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk5/igt@kms_vblank@pipe-d-wait-idle.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-kbl:          NOTRUN -> [SKIP][121] ([fdo#109271] / [i915#2437])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_writeback@writeback-fb-id.html

  * igt@prime_nv_pcopy@test3_5:
    - shard-snb:          NOTRUN -> [SKIP][122] ([fdo#109271]) +128 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-snb5/igt@prime_nv_pcopy@test3_5.html

  * igt@prime_nv_pcopy@test_semaphore:
    - shard-tglb:         NOTRUN -> [SKIP][123] ([fdo#109291])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb1/igt@prime_nv_pcopy@test_semaphore.html
    - shard-iclb:         NOTRUN -> [SKIP][124] ([fdo#109291])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@prime_nv_pcopy@test_semaphore.html

  * igt@sw_sync@sync_merge:
    - shard-kbl:          NOTRUN -> [FAIL][125] ([i915#6140])
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@sw_sync@sync_merge.html
    - shard-apl:          NOTRUN -> [FAIL][126] ([i915#6140])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl7/igt@sw_sync@sync_merge.html

  * igt@sysfs_clients@fair-7:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#2994]) +2 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl1/igt@sysfs_clients@fair-7.html

  * igt@sysfs_clients@split-10:
    - shard-iclb:         NOTRUN -> [SKIP][128] ([i915#2994]) +1 similar issue
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@sysfs_clients@split-10.html
    - shard-kbl:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#2994]) +7 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@sysfs_clients@split-10.html
    - shard-tglb:         NOTRUN -> [SKIP][130] ([i915#2994])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@sysfs_clients@split-10.html
    - shard-glk:          NOTRUN -> [SKIP][131] ([fdo#109271] / [i915#2994])
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk9/igt@sysfs_clients@split-10.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - {shard-rkl}:        [SKIP][132] ([i915#2582]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-1/igt@fbdev@nullptr.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-2/igt@fbdev@nullptr.html
    - {shard-dg1}:        [SKIP][134] ([i915#2582]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-17/igt@fbdev@nullptr.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-16/igt@fbdev@nullptr.html

  * igt@gem_ctx_bad_destroy@invalid-pad:
    - {shard-dg1}:        [SKIP][136] ([i915#2575]) -> [PASS][137] +7 similar issues
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-17/igt@gem_ctx_bad_destroy@invalid-pad.html
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@gem_ctx_bad_destroy@invalid-pad.html

  * igt@gem_ctx_persistence@engines-hang@vcs0:
    - {shard-dg1}:        [FAIL][138] ([i915#4883]) -> [PASS][139] +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-12/igt@gem_ctx_persistence@engines-hang@vcs0.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-16/igt@gem_ctx_persistence@engines-hang@vcs0.html

  * igt@gem_ctx_persistence@legacy-engines-hang@blt:
    - {shard-rkl}:        [SKIP][140] ([i915#6252]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.html

  * igt@gem_eio@kms:
    - shard-tglb:         [FAIL][142] ([i915#5784]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb5/igt@gem_eio@kms.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@parallel-keep-submit-fence:
    - shard-iclb:         [SKIP][144] ([i915#4525]) -> [PASS][145] +2 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence.html

  * igt@gem_exec_fair@basic-none-share@rcs0:
    - shard-tglb:         [FAIL][146] ([i915#2842]) -> [PASS][147] +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html
    - shard-glk:          [FAIL][148] ([i915#2842]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - shard-apl:          [FAIL][150] ([i915#2842]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-iclb:         [FAIL][152] ([i915#2842]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb5/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [FAIL][154] ([i915#2842]) -> [PASS][155] +1 similar issue
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_fair@basic-throttle@rcs0:
    - shard-iclb:         [FAIL][156] ([i915#2849]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
    - {shard-rkl}:        [SKIP][158] ([fdo#109313]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [SKIP][160] ([i915#2190]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb7/igt@gem_huc_copy@huc-copy.html
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@gem_huc_copy@huc-copy.html

  * igt@gem_readwrite@beyond-eob:
    - {shard-rkl}:        [SKIP][162] ([i915#3282]) -> [PASS][163] +2 similar issues
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-1/igt@gem_readwrite@beyond-eob.html
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-5/igt@gem_readwrite@beyond-eob.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - {shard-rkl}:        [SKIP][164] ([i915#3281]) -> [PASS][165] +6 similar issues
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gen9_exec_parse@bb-large:
    - shard-apl:          [TIMEOUT][166] ([i915#4639]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl8/igt@gen9_exec_parse@bb-large.html
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl4/igt@gen9_exec_parse@bb-large.html

  * igt@gen9_exec_parse@bb-start-param:
    - {shard-rkl}:        [SKIP][168] ([i915#2527]) -> [PASS][169] +2 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-glk:          [INCOMPLETE][170] ([i915#6310]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk3/igt@i915_hangman@engine-engine-error@vcs0.html
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk6/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-dg1}:        [SKIP][172] ([i915#1397]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-17/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_suspend@fence-restore-untiled:
    - shard-kbl:          [DMESG-WARN][174] ([i915#180]) -> [PASS][175] +2 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html

  * igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:
    - shard-glk:          [FAIL][176] ([i915#2346]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [INCOMPLETE][178] ([i915#180] / [i915#1982] / [i915#4939]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-apl:          [DMESG-WARN][180] ([i915#180]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-iclb:         [SKIP][182] ([i915#3701]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1:
    - shard-iclb:         [SKIP][184] ([i915#5176]) -> [PASS][185] +1 similar issue
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.html

  * igt@kms_psr@psr2_cursor_plane_move:
    - shard-iclb:         [SKIP][186] ([fdo#109441]) -> [PASS][187] +2 similar issues
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-glk:          [DMESG-WARN][188] ([i915#6310]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-glk7/igt@kms_rotation_crc@primary-rotation-90.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-glk6/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@perf@invalid-create-userspace-config:
    - {shard-dg1}:        [SKIP][190] ([i915#5608]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-dg1-17/igt@perf@invalid-create-userspace-config.html
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-12/igt@perf@invalid-create-userspace-config.html

  
#### Warnings ####

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-apl:          [FAIL][192] ([i915#2842]) -> [FAIL][193] ([i915#2851])
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-tglb:         [FAIL][194] ([i915#2876]) -> [FAIL][195] ([i915#2842])
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-iclb:         [WARN][196] ([i915#2684]) -> [FAIL][197] ([i915#2684])
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-iclb:         [SKIP][198] ([i915#2920]) -> [SKIP][199] ([i915#658])
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-iclb:         [SKIP][200] ([i915#658]) -> [SKIP][201] ([i915#2920])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@runner@aborted:
    - shard-apl:          ([FAIL][202], [FAIL][203], [FAIL][204], [FAIL][205]) ([i915#180] / [i915#3002] / [i915#4312] / [i915#5257]) -> ([FAIL][206], [FAIL][207]) ([i915#3002] / [i915#4312] / [i915#5257])
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl2/igt@runner@aborted.html
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl3/igt@runner@aborted.html
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl7/igt@runner@aborted.html
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl8/igt@runner@aborted.html
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@runner@aborted.html
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl3/igt@runner@aborted.html
    - shard-kbl:          ([FAIL][208], [FAIL][209], [FAIL][210], [FAIL][211], [FAIL][212], [FAIL][213], [FAIL][214], [FAIL][215], [FAIL][216], [FAIL][217], [FAIL][218], [FAIL][219], [FAIL][220], [FAIL][221], [FAIL][222], [FAIL][223], [FAIL][224], [FAIL][225]) ([fdo#109271] / [i915#180] / [i915#4312] / [i915#5257] / [i915#92]) -> ([FAIL][226], [FAIL][227], [FAIL][228], [FAIL][229], [FAIL][230], [FAIL][231], [FAIL][232], [FAIL][233], [FAIL][234], [FAIL][235], [FAIL][236], [FAIL][237], [FAIL][238], [FAIL][239], [FAIL][240], [FAIL][241]) ([fdo#109271] / [i915#180] / [i915#3002] / [i915#4312] / [i915#5257])
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@runner@aborted.html
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@runner@aborted.html
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@runner@aborted.html
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl6/igt@runner@aborted.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl6/igt@runner@aborted.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@runner@aborted.html
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@runner@aborted.html
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.html
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.html
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@runner@aborted.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@runner@aborted.html
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@runner@aborted.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.html
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.html
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@runner@aborted.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
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
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109313]: https://bugs.freedesktop.org/show_bug.cgi?id=109313
  [fdo#109314]: https://bugs.freedesktop.org/show_bug.cgi?id=109314
  [fdo#109441]: https://bugs.freedesktop.org/show_bug.cgi?id=109441
  [fdo#109642]: https://bugs.freedesktop.org/show_bug.cgi?id=109642
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110254]: https://bugs.freedesktop.org/show_bug.cgi?id=110254
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#110725]: https://bugs.freedesktop.org/show_bug.cgi?id=110725
  [fdo#110892]: https://bugs.freedesktop.org/show_bug.cgi?id=110892
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111314]: https://bugs.freedesktop.org/show_bug.cgi?id=111314
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [fdo#112283]: https://bugs.freedesktop.org/show_bug.cgi?id=112283
  [i915#1063]: https://gitlab.freedesktop.org/drm/intel/issues/1063
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#1149]: https://gitlab.freedesktop.org/drm/intel/issues/1149
  [i915#1155]: https://gitlab.freedesktop.org/drm/intel/issues/1155
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
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1911]: https://gitlab.freedesktop.org/drm/intel/issues/1911
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2433]: https://gitlab.freedesktop.org/drm/intel/issues/2433
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2530]: https://gitlab.freedesktop.org/drm/intel/issues/2530
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#265]: https://gitlab.freedesktop.org/drm/intel/issues/265
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2684]: https://gitlab.freedesktop.org/drm/intel/issues/2684
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2849]: https://gitlab.freedesktop.org/drm/intel/issues/2849
  [i915#2851]: https://gitlab.freedesktop.org/drm/intel/issues/2851
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2876]: https://gitlab.freedesktop.org/drm/intel/issues/2876
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
  [i915#3323]: https://gitlab.freedesktop.org/drm/intel/issues/3323
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3361]: https://gitlab.freedesktop.org/drm/intel/issues/3361
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3558]: https://gitlab.freedesktop.org/drm/intel/issues/3558
  [i915#3614]: https://gitlab.freedesktop.org/drm/intel/issues/3614
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3701]: https://gitlab.freedesktop.org/drm/intel/issues/3701
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3742]: https://gitlab.freedesktop.org/drm/intel/issues/3742
  [i915#3778]: https://gitlab.freedesktop.org/drm/intel/issues/3778
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3938]: https://gitlab.freedesktop.org/drm/intel/issues/3938
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4016]: https://gitlab.freedesktop.org/drm/intel/issues/4016
  [i915#4032]: https://gitlab.freedesktop.org/drm/intel/issues/4032
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4171]: https://gitlab.freedesktop.org/drm/intel/issues/4171
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4278]: https://gitlab.freedesktop.org/drm/intel/issues/4278
  [i915#4312]: https://gitlab.freedesktop.org/drm/intel/issues/4312
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4369]: https://gitlab.freedesktop.org/drm/intel/issues/4369
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4462]: https://gitlab.freedesktop.org/drm/intel/issues/4462
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4639]: https://gitlab.freedesktop.org/drm/intel/issues/4639
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4853]: https://gitlab.freedesktop.org/drm/intel/issues/4853
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4879]: https://gitlab.freedesktop.org/drm/intel/issues/4879
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#4883]: https://gitlab.freedesktop.org/drm/intel/issues/4883
  [i915#4893]: https://gitlab.freedesktop.org/drm/intel/issues/4893
  [i915#4939]: https://gitlab.freedesktop.org/drm/intel/issues/4939
  [i915#4958]: https://gitlab.freedesktop.org/drm/intel/issues/4958
  [i915#4991]: https://gitlab.freedesktop.org/drm/intel/issues/4991
  [i915#5099]: https://gitlab.freedesktop.org/drm/intel/issues/5099
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5182]: https://gitlab.freedesktop.org/drm/intel/issues/5182
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
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5608]: https://gitlab.freedesktop.org/drm/intel/issues/5608
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#5903]: https://gitlab.freedesktop.org/drm/intel/issues/5903
  [i915#6076]: https://gitlab.freedesktop.org/drm/intel/issues/6076
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6117]: https://gitlab.freedesktop.org/drm/intel/issues/6117
  [i915#6140]: https://gitlab.freedesktop.org/drm/intel/issues/6140
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6259]: https://gitlab.freedesktop.org/drm/intel/issues/6259
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6310]: https://gitlab.freedesktop.org/drm/intel/issues/6310
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#768]: https://gitlab.freedesktop.org/drm/intel/issues/768
  [i915#794]: https://gitlab.freedesktop.org/drm/intel/issues/794
  [i915#92]: https://gitlab.freedesktop.org/drm/intel/issues/92


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6553 -> IGTPW_7447
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_11834: 521bf6e9c3ca9405ea53baa3ba0feb597fd24219 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_7447: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/index.html
  IGT_6553: 3cf110f8dcd1f4f02cf84339664b413abdaebf7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/index.html

--===============8970513334511076480==
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
<tr><td><b>Series:</b></td><td>tests/i915/kms_legacy_colorkey: IGT test Cle=
anup (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/105222/">https://patchwork.freedesktop.org/series/105222/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7447/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_11834_full -&gt; IGTPW_7447_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7447_full absolutely need to b=
e<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in IGTPW_7447_full, please notify your bug team to allow them<=
br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/index.=
html</p>
<h2>Participating hosts (13 -&gt; 10)</h2>
<p>Missing    (3): pig-skl-6260u pig-kbl-iris pig-glk-j5005 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7447=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk1/igt@gem_ctx_persistence@smoketest.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-g=
lk8/igt@gem_ctx_persistence@smoketest.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x64:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb3/igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64=
x64.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7447/shard-tglb7/igt@kms_cursor_crc@cursor-sliding@pipe-d-edp-1-64x=
64.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglu-8/igt@gem_ctx_isolation@preservation-s3=
@vcs0.html">DMESG-WARN</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@gem_exec_capture@capture-recoverable}:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_capture@capture-recoverabl=
e.html">SKIP</a></p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-rkl-2/igt@gem_exec_capture@capture-recoverabl=
e.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglu-6/igt@gem_exec_capture@capture-recoverab=
le.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-blt-xtiled:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_draw_crc@draw-method-xrgb2101=
010-blt-xtiled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D111825">fdo#111825</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_track=
ing@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-pwrite:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-2p-p=
rimscrn-spr-indfb-draw-pwrite.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-cpu:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-=
mmap-cpu.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7447/shard-dg1-18/igt@kms_frontbuffer_tracking@fbc-rgb101010-d=
raw-mmap-cpu.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-wait-forked-busy-hang:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-dg1-16/igt@kms_vblank@pipe-a-wait-forked-bus=
y-hang.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_11834_full and IGTPW_7447_=
full:</p>
<h3>New IGT tests (17)</h3>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-b-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.19] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-c-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-128x128:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-256x256:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@top-bottom@pipe-d-hdmi-a-3-64x64:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@invalid-plane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@invalid-plane@outrange-id:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@invalid-plane@zero-id:</p>
<ul>
<li>Statuses : 9 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@valid-plane:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@valid-plane@pipe-a:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@valid-plane@pipe-b:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@valid-plane@pipe-c:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_legacy_colorkey@valid-plane@pipe-d:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7447_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_param@set-priority-not-supported:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gem_ctx_param@set-priority-not-supp=
orted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109314">fdo#109314</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_ctx_param@set-priority-not-supp=
orted.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109314">fdo#109314</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@processes:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-snb2/igt@gem_ctx_persistence@processes.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb2/igt@gem_ctx_persistence@smoketest.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-=
tglb2/igt@gem_ctx_persistence@smoketest.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/5099">i915#5099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard=
-glk2/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-1us:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb7/igt@gem_eio@in-flight-contexts-1us.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard=
-tglb7/igt@gem_eio@in-flight-contexts-1us.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3063">i915#3063</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_exec_balancer@parallel-ordering=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6117">i915#6117</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb2/igt@gem_exec_endless@dispatch@vcs1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard=
-tglb5/igt@gem_exec_endless@dispatch@vcs1.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/3778">i915#3778</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@gem_exec_fair@basic-none@vcs1.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842"=
>i915#2842</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl1/igt@gem_exec_fair@basic-none@vecs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-=
apl3/igt@gem_exec_fair@basic-none@vecs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) +1 similar iss=
ue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-=
iclb4/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_parallel@engines@fds:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_exec_parallel@engines@fds.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6310">i915#6310</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/794">i915#794</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-blt:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_exec_params@no-blt.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb3/igt@gem_exec_params@no-blt.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109283">fdo#1=
09283</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl4/igt@gem_huc_copy@huc-copy.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">=
i915#2190</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@gem_lmem_swapping@heavy-verify-mul=
ti-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/4613">i915#4613</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@gem_lmem_swapping@parallel-random-v=
erify.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/4613">i915#4613</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-glk8/igt@gem_lmem_swapping@verify-ccs.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb7/igt@gem_lmem_swapping@verify-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4613">=
i915#4613</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl3/igt@gem_lmem_swapping@verify-ccs.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/4613">i915#4613</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-exhaustion:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_pwrite@basic-exhaustion.html">W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2658">i=
915#2658</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-protected-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_pxp@create-protected-buffer.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/42=
70">i915#4270</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@y-tiled-to-vebox-linear:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb4/igt@gem_render_copy@y-tiled-to-vebox-l=
inear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/768">i915#768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-single-offset:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl7/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl1/igt@gem_softpin@evict-single-offset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4171=
">i915#4171</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3323">i915#3323</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@input-checking:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@gem_userptr_blits@input-checking.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/4991">i915#4991</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-afte=
r-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3297">i915#3297</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb1/igt@gem_userptr_blits@unsync-unmap-afte=
r-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3297">i915#3297</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@gen9_exec_parse@allowed-all.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2856">=
i915#2856</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@unaligned-jump:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@gen9_exec_parse@unaligned-jump.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/252=
7">i915#2527</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@gt-engine-error@vecs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk7/igt@i915_hangman@gt-engine-error@vecs0.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/sh=
ard-glk7/igt@i915_hangman@gt-engine-error@vecs0.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/6310">i915#6310</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</=
a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl3/igt@i915_pm_dc@dc9-dpms.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl4/igt@i9=
15_pm_dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a>) +370 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@i915_pm_rpm@modeset-non-lpsp.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892=
">fdo#110892</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@i915_suspend@basic-s3-without-i915=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/5903">i915#5903</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@i915_suspend@forcewake.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i=
915#180</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb1/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1769">i915#1769</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_atomic_transition@plane-all-mod=
eset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/1769">i915#1769</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@kms_big_fb@4-tiled-64bpp-rotate-27=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issue=
s/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_big_fb@linear-32bpp-rotate-270=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
110725">fdo#110725</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D111614">fdo#111614</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@kms_big_fb@x-tiled-32bpp-rotate-90=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb7/igt@kms_big_fb@yf-tiled-max-hw-stride-=
64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D110723">fdo#110723</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb3/igt@kms_ccs@pipe-a-bad-aux-stride-y_ti=
led_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_ccs@pipe-a-bad-pixel-format-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_=
tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/3886">i915#3886</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_ccs@pipe-a-crc-primary-basic-4=
_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-glk2/igt@kms_ccs@pipe-a-missing-ccs-buffer-y=
_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_ccs@pipe-a-random-ccs-data-y_t=
iled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-pixel-format-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@kms_ccs@pipe-b-bad-pixel-format-4_=
tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y=
_tiled_gen12_mc_ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3689">i915#3689</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/3886">i915#3886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-missing-ccs-buffer-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_ccs@pipe-b-missing-ccs-buffer-=
yf_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111615">fdo#111615</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/3689">i915#3689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_ccs@pipe-d-crc-primary-basic-y=
_tiled_ccs.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109278">fdo#109278</a>) +17 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-glk6/igt@kms_chamelium@dp-hpd.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>) +5 similar issues</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-snb7/igt@kms_chamelium@dp-hpd.html">SKIP</a> =
(<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1092=
71</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827">=
fdo#111827</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_chamelium@dp-hpd-with-enabled-=
mode.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?i=
d=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111827">fdo#111827</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-hpd-without-ddc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-apl2/igt@kms_chamelium@vga-hpd-without-ddc.h=
tml">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111827">fdo#111827</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-d-ctm-green-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_color@pipe-d-ctm-green-to-red.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel=
/issues/1149">i915#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@kms_color_chamelium@pipe-c-ctm-0-5.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cg=
i?id=3D111827">fdo#111827</a>) +28 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb5/igt@kms_color_chamelium@pipe-d-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109278">fdo#109278</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D109284">fdo#109284</a> / <a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@kms_content_protection@srm.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1319"=
>i915#1319</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement@pipe-b-dp-1-32x10:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_cursor_crc@cursor-rapid-movemen=
t@pipe-b-dp-1-32x10.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>) +116 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-edp-1:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@p=
ipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6076">i915#6076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb2101010-pwrite-4tiled:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@kms_draw_crc@draw-method-xrgb21010=
10-pwrite-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/5287">i915#5287</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-xrgb8888-mmap-gtt-4tiled:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb3/igt@kms_draw_crc@draw-method-xrgb8888-=
mmap-gtt-4tiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/5287">i915#5287</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_flip@2x-blocking-absolute-wf_v=
blank-interruptible.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_flip@2x-flip-vs-modeset-vs-han=
g.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109274">fdo#109274</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7447/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@c-dp1.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1=
80">i915#180</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_frontbuffer_tracking@fbc-2p-pr=
imscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> (<a href=3D"https://bugs.free=
desktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +19 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-glk9/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.fre=
edesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +62 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@kms_frontbuffer_tracking@psr-2p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://bugs.freedeskt=
op.org/show_bug.cgi?id=3D109280">fdo#109280</a> / <a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D111825">fdo#111825</a>) +7 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl7/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/s=
hard-kbl4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-modeset-pipe-c:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb1/igt@kms_pipe_b_c_ivb@pipe-b-dpms-off-m=
odeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_=
bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_plane_alpha_blend@pipe-b-alpha-=
opaque-fb.html">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108145">fdo#108145</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/intel/issues/265">i915#265</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-transparent-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl6/igt@kms_plane_alpha_blend@pipe-c-alpha-t=
ransparent-fb.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/265">i915#265</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_plane_lowres@tiling-yf.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112054">=
fdo#112054</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb5/igt@kms_plane_lowres@tiling-yf@pipe-a-=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/3536">i915#3536</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb7/igt@kms_plane_scaling@planes-downscale-factor-0-5=
@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_7447/shard-iclb2/igt@kms_plane_scaling@planes-downscale-f=
actor-0-5@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/5235">i915#5235</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_psr2_sf@overlay-plane-update-c=
ontinuous-sf.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D111068">fdo#111068</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl6/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb5/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/2920">i915#2920</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-glk3/igt@kms_psr2_sf@primary-plane-update-sf-=
dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb4/igt@kms_psr2_sf@primary-plane-update-sf=
-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/658">i915#658</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11834/shard-iclb2/igt@kms_psr2_su@page_flip-xrgb8888.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-=
iclb1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109642">fdo#109642</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111068">fdo#111068</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)=
</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_psr2_su@page_flip-xrgb8888.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/658">i915#658</a>) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-vga-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-snb7/igt@kms_setmode@basic@pipe-a-vga-1.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5465=
">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl6/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7447/shard-kbl4/igt@kms_vblank@pipe-a-ts-continuation-dpms-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/3614">i915#3614</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/4939">i915#4939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-wait-idle:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-glk5/igt@kms_vblank@pipe-d-wait-idle.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">=
fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/533">i915#533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@kms_writeback@writeback-fb-id.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271=
">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2437">i915#2437</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test3_5:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-snb5/igt@prime_nv_pcopy@test3_5.html">SKIP</=
a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#1=
09271</a>) +128 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_nv_pcopy@test_semaphore:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb1/igt@prime_nv_pcopy@test_semaphore.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb7/igt@prime_nv_pcopy@test_semaphore.html"=
>SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109291=
">fdo#109291</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sw_sync@sync_merge:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl7/igt@sw_sync@sync_merge.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#6140</=
a>)</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-apl7/igt@sw_sync@sync_merge.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6140">i915#6140</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@fair-7:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7447/shard-apl1/igt@sysfs_clients@fair-7.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109=
271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">=
i915#2994</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@split-10:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-iclb5/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>) +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl4/igt@sysfs_clients@split-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>) +7 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-tglb5/igt@sysfs_clients@split-10.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994">i915#2=
994</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-glk9/igt@sysfs_clients@split-10.html">SKIP</a=
> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#10=
9271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2994"=
>i915#2994</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>
<p>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11834/shard-rkl-1/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-rkl-2/igt@f=
bdev@nullptr.html">PASS</a></p>
</li>
<li>
<p>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11834/shard-dg1-17/igt@fbdev@nullptr.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-dg1-16/igt=
@fbdev@nullptr.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_bad_destroy@invalid-pad:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-17/igt@gem_ctx_bad_destroy@invalid-pad.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
47/shard-dg1-18/igt@gem_ctx_bad_destroy@invalid-pad.html">PASS</a> +7 simil=
ar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@engines-hang@vcs0:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-12/igt@gem_ctx_persistence@engines-hang@vcs0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4883">=
i915#4883</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7447/shard-dg1-16/igt@gem_ctx_persistence@engines-hang@vcs0.html">PASS<=
/a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@blt:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-rkl-5/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
252">i915#6252</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_7447/shard-rkl-4/igt@gem_ctx_persistence@legacy-engines-hang@blt.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb5/igt@gem_eio@kms.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tglb7/igt@ge=
m_eio@kms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-keep-submit-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb7/igt@gem_exec_balancer@parallel-keep-submit-fence.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
4525">i915#4525</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_7447/shard-iclb1/igt@gem_exec_balancer@parallel-keep-submit-fence=
.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11834/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915=
#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7447/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a> +1 =
similar issue</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11834/shard-glk3/igt@gem_exec_fair@basic-none-share@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
447/shard-glk7/igt@gem_exec_fair@basic-none-share@rcs0.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl1/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/s=
hard-apl3/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb5/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i91=
5#2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7447/shard-iclb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/s=
hard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> +1 similar issue=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2849">i915#=
2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
447/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-rkl-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109313">fdo#109313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7447/shard-rkl-5/igt@gem_exec_flush@basic-batch-kernel-default=
-cmd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2190">i915#2190</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-tg=
lb2/igt@gem_huc_copy@huc-copy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_readwrite@beyond-eob:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-rkl-1/igt@gem_readwrite@beyond-eob.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard=
-rkl-5/igt@gem_readwrite@beyond-eob.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/3281">=
i915#3281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7447/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">PASS<=
/a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-large:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl8/igt@gen9_exec_parse@bb-large.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4639">i915#4639</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/sha=
rd-apl4/igt@gen9_exec_parse@bb-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-param:</p>
<ul>
<li>{shard-rkl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-rkl-1/igt@gen9_exec_parse@bb-start-param.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#252=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447=
/shard-rkl-5/igt@gen9_exec_parse@bb-start-param.html">PASS</a> +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk3/igt@i915_hangman@engine-engine-error@vcs0.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/63=
10">i915#6310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_7447/shard-glk6/igt@i915_hangman@engine-engine-error@vcs0.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-18/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-d=
g1-17/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-untiled:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl7/igt@i915_suspend@fence-restore-untiled.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">=
i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7447/shard-kbl6/igt@i915_suspend@fence-restore-untiled.html">PASS</a> +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor@atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor@atomic-transi=
tions.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2346">i915#2346</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7447/shard-glk5/igt@kms_cursor_legacy@flip-vs-cursor@atomic=
-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl8/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1982">i915=
#1982</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4939=
">i915#4939</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7447/shard-apl3/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl3/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7447/shard-apl2/igt@kms_flip@flip-vs-suspend-interruptible@a-d=
p1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp=
-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/3701">i915#3701</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb8/igt@kms_flip_scaled_crc@flip-=
32bpp-ytile-to-64bpp-ytile-downscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-b-edp-1:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb3/igt@kms_plane_scaling@plane-scaler-with-clipping-=
clamping-pixel-formats@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-iclb6/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-b-edp-1.ht=
ml">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb1/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a>=
 (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109=
441</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
47/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> +2 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-glk7/igt@kms_rotation_crc@primary-rotation-90.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/631=
0">i915#6310</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7447/shard-glk6/igt@kms_rotation_crc@primary-rotation-90.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@perf@invalid-create-userspace-config:</p>
<ul>
<li>{shard-dg1}:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-dg1-17/igt@perf@invalid-create-userspace-config.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5608">i=
915#5608</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_7447/shard-dg1-12/igt@perf@invalid-create-userspace-config.html">PASS</a=
></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl8/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#=
2842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
447/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2851">i915#2851</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2876">i915#2876=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/=
shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i91=
5#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7447/shard-iclb4/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-exce=
ed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2920">i915#2920</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7447/shard-iclb3/igt@kms_psr2_sf@cursor-plane-move-continuo=
us-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-iclb5/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/6=
58">i915#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7447/shard-iclb2/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/292=
0">i915#2920</a>)</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-apl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-apl2/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl3/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11834/shard-apl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-apl8/igt@runner@aborte=
d.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/180">i915#180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/=
issues/3002">i915#3002</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/4312">i915#4312</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/intel/issues/5257">i915#5257</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_7447/shard-apl6/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-=
apl3/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/3002">i915#3002</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/4312">i915#4312</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/5257">i915#5257</a>)</p>
</li>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11834/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl7/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI=
_DRM_11834/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DR=
M_11834/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl6/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1=
1834/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html=
">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_1183=
4/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/s=
hard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html">FAIL=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shar=
d-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-k=
bl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_11834/shard-kbl1/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11834/shard-kbl4=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_11834/shard-kbl4/igt@runner@aborted.html">FAIL</a>) (<a=
 href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#=
180</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">=
i915#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
5257">i915#5257</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7447/shard-kbl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7447/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.=
html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7=
447/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html">F=
AIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/sha=
rd-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl6=
/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7447/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl1/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_7447/shard-kbl7/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl7/igt@runner@ab=
orted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7447/shard-kbl4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/shard-kbl4/igt@runner@aborted.h=
tml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_74=
47/shard-kbl1/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/intel/issues/3002">i915#3002</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312">i915#4312</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5257">i915#5257</=
a>)</p>
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
<li>IGT: IGT_6553 -&gt; IGTPW_7447</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_11834: 521bf6e9c3ca9405ea53baa3ba0feb597fd24219 @ git://anongit.fr=
eedesktop.org/gfx-ci/linux<br />
  IGTPW_7447: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7447/index.htm=
l<br />
  IGT_6553: 3cf110f8dcd1f4f02cf84339664b413abdaebf7d @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>

</body>
</html>

--===============8970513334511076480==--
