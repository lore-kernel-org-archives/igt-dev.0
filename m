Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============6490120605708645737=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Dec 2021 20:23:44 -0000
Message-ID: <163899502460.8231.1451162683293577137@emeril.freedesktop.org>
References: <20211207131013.27252-1-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211207131013.27252-1-zbigniew.kempczynski@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Ffence=3A_Adopt_to_use_no-reloc_in_three_syncobj_su?=
 =?utf-8?q?btests?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============6490120605708645737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/gem_exec_fence: Adopt to use no-reloc in three syncobj subtests
URL   : https://patchwork.freedesktop.org/series/97655/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_10968_full -> IGTPW_6474_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_6474_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_6474_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html

Participating hosts (10 -> 7)
------------------------------

  Missing    (3): pig-skl-6260u pig-glk-j5005 shard-rkl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_6474_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-iclb:         [PASS][1] -> ([PASS][2], [FAIL][3])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_vblank@pipe-c-wait-busy-hang:
    - shard-kbl:          [PASS][4] -> ([DMESG-WARN][5], [PASS][6])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy-hang.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy-hang.html

  
Known issues
------------

  Here are the changes found in IGTPW_6474_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> ([SKIP][7], [SKIP][8]) ([i915#1839]) +1 similar issue
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb8/igt@feature_discovery@display-2x.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> ([SKIP][9], [SKIP][10]) ([i915#1839])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@feature_discovery@display-2x.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> ([SKIP][11], [SKIP][12]) ([fdo#109271]) +93 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@feature_discovery@display-3x.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_persistence@idempotent:
    - shard-snb:          NOTRUN -> ([SKIP][13], [SKIP][14]) ([fdo#109271] / [i915#1099]) +1 similar issue
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@gem_ctx_persistence@idempotent.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb5/igt@gem_ctx_persistence@idempotent.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271] / [i915#1099]) +1 similar issue
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_ctx_sseu@mmap-args:
    - shard-apl:          NOTRUN -> [SKIP][16] ([fdo#109271]) +29 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@gem_ctx_sseu@mmap-args.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][17] -> ([PASS][18], [TIMEOUT][19]) ([i915#3063])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][20] -> ([TIMEOUT][21], [TIMEOUT][22]) ([i915#3063] / [i915#3648])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@unwedge-stress.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][23] ([i915#4525])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglb:         NOTRUN -> [SKIP][24] ([i915#4525])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][25] -> [FAIL][26] ([i915#2846])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][27] -> ([FAIL][28], [PASS][29]) ([i915#2846])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk1/igt@gem_exec_fair@basic-deadline.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-deadline.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][30] -> ([FAIL][31], [FAIL][32]) ([i915#2842]) +3 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][33] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> ([FAIL][34], [FAIL][35]) ([i915#2842])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> ([FAIL][36], [FAIL][37]) ([i915#2842])
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-kbl:          [PASS][38] -> [FAIL][39] ([i915#2842])
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html
    - shard-iclb:         [PASS][40] -> [FAIL][41] ([i915#2842]) +1 similar issue
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][42] -> ([FAIL][43], [FAIL][44]) ([i915#2842]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][45] -> ([FAIL][46], [FAIL][47]) ([i915#2842])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html
    - shard-tglb:         [PASS][48] -> ([PASS][49], [FAIL][50]) ([i915#2842])
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> ([SKIP][51], [SKIP][52]) ([fdo#109283])
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_params@no-bsd.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> ([SKIP][53], [SKIP][54]) ([fdo#109283])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_exec_params@no-bsd.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> ([SKIP][55], [SKIP][56]) ([fdo#109271]) +118 similar issues
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb4/igt@gem_exec_schedule@semaphore-codependency.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][57] -> ([DMESG-WARN][58], [DMESG-WARN][59]) ([i915#118])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_huc_copy@huc-copy:
    - shard-tglb:         [PASS][60] -> ([PASS][61], [SKIP][62]) ([i915#2190])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_huc_copy@huc-copy.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gem_huc_copy@huc-copy.html

  * igt@gem_lmem_swapping@heavy-random:
    - shard-apl:          NOTRUN -> ([SKIP][63], [SKIP][64]) ([fdo#109271] / [i915#4613]) +1 similar issue
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@gem_lmem_swapping@heavy-random.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_lmem_swapping@heavy-random.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#4613])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@parallel-random-verify:
    - shard-glk:          NOTRUN -> [SKIP][66] ([fdo#109271] / [i915#4613])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@gem_lmem_swapping@parallel-random-verify.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][67] ([i915#4613])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_lmem_swapping@verify-random.html
    - shard-iclb:         NOTRUN -> ([SKIP][68], [SKIP][69]) ([i915#4613])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@gem_lmem_swapping@verify-random.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> ([SKIP][70], [SKIP][71]) ([fdo#109271] / [i915#4613])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_lmem_swapping@verify-random.html
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglb:         NOTRUN -> ([SKIP][72], [SKIP][73]) ([i915#4270])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_pxp@create-regular-buffer.html
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_pxp@create-regular-buffer.html
    - shard-iclb:         NOTRUN -> ([SKIP][74], [SKIP][75]) ([i915#4270]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gem_pxp@create-regular-buffer.html
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_pxp@reject-modify-context-protection-on:
    - shard-tglb:         NOTRUN -> [SKIP][76] ([i915#4270])
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-on.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> ([SKIP][77], [SKIP][78]) ([fdo#109312])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_softpin@evict-snoop.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> ([SKIP][79], [SKIP][80]) ([fdo#109312])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_softpin@evict-snoop.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb8/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([fdo#109271] / [i915#3323])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> ([SKIP][83], [SKIP][84]) ([i915#3297]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> ([SKIP][85], [SKIP][86]) ([i915#3297]) +1 similar issue
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> ([FAIL][87], [FAIL][88]) ([i915#3318])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@gem_userptr_blits@vma-merge.html
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][89] ([fdo#109289])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> ([SKIP][90], [SKIP][91]) ([fdo#109289])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gen7_exec_parse@oacontrol-tracking.html
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html
    - shard-tglb:         NOTRUN -> ([SKIP][92], [SKIP][93]) ([fdo#109289])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gen7_exec_parse@oacontrol-tracking.html
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> ([SKIP][94], [SKIP][95]) ([i915#2856])
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen9_exec_parse@cmd-crossing-page.html
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> ([SKIP][96], [SKIP][97]) ([i915#2856])
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gen9_exec_parse@cmd-crossing-page.html
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> ([FAIL][98], [FAIL][99]) ([i915#454])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> ([FAIL][100], [FAIL][101]) ([i915#454])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][102] ([i915#2681] / [i915#2684])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> ([WARN][103], [WARN][104]) ([i915#1804] / [i915#2684])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> ([SKIP][105], [SKIP][106]) ([fdo#109271]) +157 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-kbl:          NOTRUN -> [SKIP][107] ([fdo#109271]) +45 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> ([SKIP][108], [SKIP][109]) ([fdo#109506] / [i915#2411])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> ([SKIP][110], [SKIP][111]) ([fdo#109293] / [fdo#109506])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rpm@system-suspend-execbuf:
    - shard-tglb:         [PASS][112] -> ([INCOMPLETE][113], [PASS][114]) ([i915#2411] / [i915#456] / [i915#750])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html

  * igt@i915_selftest@live@gtt:
    - shard-snb:          [PASS][115] -> ([DMESG-FAIL][116], [PASS][117]) ([i915#4610])
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-snb4/igt@i915_selftest@live@gtt.html
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@i915_selftest@live@gtt.html
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@i915_selftest@live@gtt.html

  * igt@i915_suspend@fence-restore-tiled2untiled:
    - shard-kbl:          [PASS][118] -> [DMESG-WARN][119] ([i915#180])
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> ([SKIP][120], [SKIP][121]) ([i915#3826])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> ([SKIP][122], [SKIP][123]) ([i915#3826])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> ([SKIP][124], [SKIP][125]) ([fdo#109271] / [i915#3777])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([fdo#109271] / [i915#3777])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> ([SKIP][128], [SKIP][129]) ([fdo#111614])
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> ([SKIP][130], [SKIP][131]) ([fdo#110725] / [fdo#111614])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> ([SKIP][132], [SKIP][133]) ([fdo#109271] / [i915#3777]) +2 similar issues
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> ([SKIP][134], [SKIP][135]) ([fdo#111615]) +2 similar issues
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][136] ([fdo#109271] / [i915#3777])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][137] ([fdo#111615] / [i915#3689])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][138], [SKIP][139]) ([i915#3689]) +4 similar issues
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> ([SKIP][140], [SKIP][141]) ([fdo#109271] / [i915#3886]) +4 similar issues
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> ([SKIP][142], [SKIP][143]) ([i915#3689] / [i915#3886]) +2 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> ([SKIP][144], [SKIP][145]) ([fdo#109271] / [i915#3886]) +7 similar issues
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> ([SKIP][146], [SKIP][147]) ([fdo#109271] / [i915#3886]) +1 similar issue
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> ([SKIP][148], [SKIP][149]) ([fdo#111615] / [i915#3689])
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> ([SKIP][150], [SKIP][151]) ([fdo#109278] / [i915#3886]) +3 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-glk:          NOTRUN -> [SKIP][152] ([fdo#109271] / [i915#3886])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html
    - shard-kbl:          NOTRUN -> [SKIP][153] ([fdo#109271] / [i915#3886]) +1 similar issue
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:
    - shard-apl:          NOTRUN -> [SKIP][154] ([fdo#109271] / [i915#3886])
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs:
    - shard-iclb:         NOTRUN -> [SKIP][155] ([fdo#109278]) +3 similar issues
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][156] ([i915#3689]) +1 similar issue
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> ([SKIP][157], [SKIP][158]) ([i915#3742])
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_cdclk@plane-scaling.html
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> ([SKIP][159], [SKIP][160]) ([i915#3742]) +1 similar issue
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cdclk@plane-scaling.html
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> ([SKIP][161], [SKIP][162]) ([fdo#109271] / [fdo#111827]) +7 similar issues
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@kms_chamelium@dp-hpd-fast.html
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> ([SKIP][163], [SKIP][164]) ([f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html

--===============6490120605708645737==
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
<tr><td><b>Series:</b></td><td>tests/gem_exec_fence: Adopt to use no-reloc in three syncobj subtests</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/97655/">https://patchwork.freedesktop.org/series/97655/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10968_full -&gt; IGTPW_6474_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6474_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_6474_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html</p>
<h2>Participating hosts (10 -&gt; 7)</h2>
<p>Missing    (3): pig-skl-6260u pig-glk-j5005 shard-rkl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6474_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-wait-busy-hang:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy-hang.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@kms_vblank@pipe-c-wait-busy-hang.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_vblank@pipe-c-wait-busy-hang.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6474_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb8/igt@feature_discovery@display-2x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@feature_discovery@display-2x.html">SKIP</a>) ([i915#1839]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@feature_discovery@display-2x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@feature_discovery@display-2x.html">SKIP</a>) ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@feature_discovery@display-3x.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@feature_discovery@display-3x.html">SKIP</a>) ([fdo#109271]) +93 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@idempotent:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@gem_ctx_persistence@idempotent.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb5/igt@gem_ctx_persistence@idempotent.html">SKIP</a>) ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_sseu@mmap-args:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@gem_ctx_sseu@mmap-args.html">SKIP</a> ([fdo#109271]) +29 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a>) ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_eio@unwedge-stress.html">TIMEOUT</a>) ([i915#3063] / [i915#3648])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel-ordering:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html">SKIP</a> ([i915#4525])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@gem_exec_fair@basic-deadline.html">PASS</a>) ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk9/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a>) ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a>) ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a>) ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_params@no-bsd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP</a>) ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_exec_params@no-bsd.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_exec_params@no-bsd.html">SKIP</a>) ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb4/igt@gem_exec_schedule@semaphore-codependency.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_exec_schedule@semaphore-codependency.html">SKIP</a>) ([fdo#109271]) +118 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a>) ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_huc_copy@huc-copy:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_huc_copy@huc-copy.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gem_huc_copy@huc-copy.html">SKIP</a>) ([i915#2190])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-random:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_lmem_swapping@heavy-random.html">SKIP</a>) ([fdo#109271] / [i915#4613]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-random-verify:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@gem_lmem_swapping@parallel-random-verify.html">SKIP</a> ([fdo#109271] / [i915#4613])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@gem_lmem_swapping@verify-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_lmem_swapping@verify-random.html">SKIP</a>) ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_lmem_swapping@verify-random.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_lmem_swapping@verify-random.html">SKIP</a>) ([fdo#109271] / [i915#4613])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_pxp@create-regular-buffer.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_pxp@create-regular-buffer.html">SKIP</a>) ([i915#4270])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gem_pxp@create-regular-buffer.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_pxp@create-regular-buffer.html">SKIP</a>) ([i915#4270]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@reject-modify-context-protection-on:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_pxp@reject-modify-context-protection-on.html">SKIP</a> ([i915#4270])</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_softpin@evict-snoop.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_softpin@evict-snoop.html">SKIP</a>) ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb8/igt@gem_softpin@evict-snoop.html">SKIP</a>) ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a>) ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a>) ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a>) ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@gem_userptr_blits@vma-merge.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_userptr_blits@vma-merge.html">FAIL</a>) ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a>) ([fdo#109289])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a>) ([fdo#109289])</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a>) ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a>) ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>) ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@i915_pm_dc@dc6-dpms.html">FAIL</a>) ([i915#454])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#2681] / [i915#2684])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb7/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>) ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>) ([fdo#109271]) +157 similar issues</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +45 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>) ([fdo#109506] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a>) ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@system-suspend-execbuf.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@i915_pm_rpm@system-suspend-execbuf.html">PASS</a>) ([i915#2411] / [i915#456] / [i915#750])</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gtt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-snb4/igt@i915_selftest@live@gtt.html">PASS</a> -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@i915_selftest@live@gtt.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@i915_selftest@live@gtt.html">PASS</a>) ([i915#4610])</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@fence-restore-tiled2untiled:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl1/igt@i915_suspend@fence-restore-tiled2untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@i915_suspend@fence-restore-tiled2untiled.html">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a>) ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>) ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a>) ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a>) ([fdo#109271] / [i915#3777]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-a-ccs-on-another-bo-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a>) ([i915#3689]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +4 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb7/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([i915#3689] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +7 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a>) ([fdo#109271] / [i915#3886]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a>) ([fdo#111615] / [i915#3689])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a>) ([fdo#109278] / [i915#3886]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109271] / [i915#3886]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-c-bad-aux-stride-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886])</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb8/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_rc_ccs.html">SKIP</a> ([fdo#109278]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb2/igt@kms_cdclk@plane-scaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_cdclk@plane-scaling.html">SKIP</a>) ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cdclk@plane-scaling.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_cdclk@plane-scaling.html">SKIP</a>) ([i915#3742]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; (<a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb2/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a>) ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; ([SKIP][163], [SKIP][164]) ([f</li>
</ul>
</li>
</ul>

</body>
</html>

--===============6490120605708645737==--
