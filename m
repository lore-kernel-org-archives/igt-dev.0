Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============8770749730330701506=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 07 Dec 2021 17:00:22 -0000
Message-ID: <163889642286.10819.404628352171233075@emeril.freedesktop.org>
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

--===============8770749730330701506==
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

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-kbl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl7/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@sysfs_heartbeat_interval@precise@vecs0.html
    - shard-tglb:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb6/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@sysfs_heartbeat_interval@precise@vecs0.html

  * igt@testdisplay:
    - shard-apl:          [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl2/igt@testdisplay.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl8/igt@testdisplay.html
    - shard-kbl:          [PASS][7] -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl6/igt@testdisplay.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@testdisplay.html

  
New tests
---------

  New tests have been introduced between CI_DRM_10968_full and IGTPW_6474_full:

### New IGT tests (5) ###

  * igt@gem_ctx_exec@basic-close-race:
    - Statuses : 5 pass(s)
    - Exec time: [5.43, 5.50] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 9.54] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-clipping-clamping:
    - Statuses : 5 pass(s) 1 skip(s)
    - Exec time: [0.0, 11.21] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 2.00] s

  * igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-clipping-clamping:
    - Statuses : 1 pass(s)
    - Exec time: [1.99] s

  

Known issues
------------

  Here are the changes found in IGTPW_6474_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@feature_discovery@display-2x:
    - shard-tglb:         NOTRUN -> [SKIP][9] ([i915#1839]) +1 similar issue
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@feature_discovery@display-2x.html
    - shard-iclb:         NOTRUN -> [SKIP][10] ([i915#1839])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@feature_discovery@display-2x.html

  * igt@feature_discovery@display-3x:
    - shard-glk:          NOTRUN -> [SKIP][11] ([fdo#109271]) +108 similar issues
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@feature_discovery@display-3x.html

  * igt@gem_ctx_persistence@smoketest:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271] / [i915#1099]) +3 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_ctx_persistence@smoketest.html

  * igt@gem_eio@in-flight-contexts-10ms:
    - shard-tglb:         [PASS][13] -> [TIMEOUT][14] ([i915#3063])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html

  * igt@gem_eio@unwedge-stress:
    - shard-tglb:         [PASS][15] -> [TIMEOUT][16] ([i915#3063] / [i915#3648])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@unwedge-stress.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@unwedge-stress.html

  * igt@gem_exec_balancer@parallel-ordering:
    - shard-iclb:         NOTRUN -> [SKIP][17] ([i915#4525])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_balancer@parallel-ordering.html
    - shard-tglb:         NOTRUN -> [SKIP][18] ([i915#4525])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@gem_exec_balancer@parallel-ordering.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-kbl:          [PASS][19] -> [FAIL][20] ([i915#2846])
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl1/igt@gem_exec_fair@basic-deadline.html
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-deadline.html
    - shard-glk:          [PASS][21] -> [FAIL][22] ([i915#2846])
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk1/igt@gem_exec_fair@basic-deadline.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-glk:          [PASS][23] -> [FAIL][24] ([i915#2842]) +3 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-vip@rcs0:
    - shard-tglb:         NOTRUN -> [FAIL][25] ([i915#2842])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-iclb:         NOTRUN -> [FAIL][26] ([i915#2842])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_exec_fair@basic-none-vip@rcs0.html
    - shard-glk:          NOTRUN -> [FAIL][27] ([i915#2842])
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html

  * igt@gem_exec_fair@basic-none@rcs0:
    - shard-iclb:         [PASS][28] -> [FAIL][29] ([i915#2842]) +1 similar issue
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglb:         [PASS][30] -> [FAIL][31] ([i915#2842]) +2 similar issues
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-kbl:          [PASS][32] -> [FAIL][33] ([i915#2842]) +1 similar issue
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_params@no-bsd:
    - shard-tglb:         NOTRUN -> [SKIP][34] ([fdo#109283])
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_params@no-bsd.html
    - shard-iclb:         NOTRUN -> [SKIP][35] ([fdo#109283])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_exec_params@no-bsd.html

  * igt@gem_exec_schedule@semaphore-codependency:
    - shard-snb:          NOTRUN -> [SKIP][36] ([fdo#109271]) +141 similar issues
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb4/igt@gem_exec_schedule@semaphore-codependency.html

  * igt@gem_exec_whisper@basic-fds-priority-all:
    - shard-glk:          [PASS][37] -> [DMESG-WARN][38] ([i915#118])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html

  * igt@gem_lmem_swapping@parallel-multi:
    - shard-apl:          NOTRUN -> [SKIP][39] ([fdo#109271] / [i915#4613]) +2 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html

  * igt@gem_lmem_swapping@verify-random:
    - shard-tglb:         NOTRUN -> [SKIP][40] ([i915#4613])
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_lmem_swapping@verify-random.html
    - shard-iclb:         NOTRUN -> [SKIP][41] ([i915#4613])
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_lmem_swapping@verify-random.html
    - shard-glk:          NOTRUN -> [SKIP][42] ([fdo#109271] / [i915#4613]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_lmem_swapping@verify-random.html

  * igt@gem_pxp@create-regular-buffer:
    - shard-tglb:         NOTRUN -> [SKIP][43] ([i915#4270]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_pxp@create-regular-buffer.html
    - shard-iclb:         NOTRUN -> [SKIP][44] ([i915#4270]) +1 similar issue
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_pxp@create-regular-buffer.html

  * igt@gem_softpin@evict-snoop:
    - shard-iclb:         NOTRUN -> [SKIP][45] ([fdo#109312])
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_softpin@evict-snoop.html
    - shard-tglb:         NOTRUN -> [SKIP][46] ([fdo#109312])
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_softpin@evict-snoop.html

  * igt@gem_userptr_blits@dmabuf-sync:
    - shard-kbl:          NOTRUN -> [SKIP][47] ([fdo#109271] / [i915#3323])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html

  * igt@gem_userptr_blits@dmabuf-unsync:
    - shard-tglb:         NOTRUN -> [SKIP][48] ([i915#3297]) +1 similar issue
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html

  * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
    - shard-iclb:         NOTRUN -> [SKIP][49] ([i915#3297]) +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html

  * igt@gem_userptr_blits@vma-merge:
    - shard-apl:          NOTRUN -> [FAIL][50] ([i915#3318])
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_userptr_blits@vma-merge.html

  * igt@gen7_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][51] ([fdo#109289]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html

  * igt@gen7_exec_parse@oacontrol-tracking:
    - shard-iclb:         NOTRUN -> [SKIP][52] ([fdo#109289])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html

  * igt@gen9_exec_parse@cmd-crossing-page:
    - shard-tglb:         NOTRUN -> [SKIP][53] ([i915#2856])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen9_exec_parse@cmd-crossing-page.html
    - shard-iclb:         NOTRUN -> [SKIP][54] ([i915#2856])
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html

  * igt@i915_pm_dc@dc6-dpms:
    - shard-kbl:          NOTRUN -> [FAIL][55] ([i915#454])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html
    - shard-tglb:         NOTRUN -> [FAIL][56] ([i915#454])
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_rc6_residency@rc6-idle:
    - shard-tglb:         NOTRUN -> [WARN][57] ([i915#2681] / [i915#2684])
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@i915_pm_rc6_residency@rc6-idle.html
    - shard-iclb:         NOTRUN -> [WARN][58] ([i915#1804] / [i915#2684])
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-apl:          NOTRUN -> [SKIP][59] ([fdo#109271]) +176 similar issues
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-tglb:         NOTRUN -> [SKIP][60] ([fdo#109506] / [i915#2411])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html
    - shard-iclb:         NOTRUN -> [SKIP][61] ([fdo#109293] / [fdo#109506])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-tglb:         NOTRUN -> [SKIP][62] ([i915#3826])
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-iclb:         NOTRUN -> [SKIP][63] ([i915#3826])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-kbl:          NOTRUN -> [SKIP][64] ([fdo#109271] / [i915#3777])
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-glk:          NOTRUN -> [SKIP][65] ([fdo#109271] / [i915#3777])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-tglb:         NOTRUN -> [SKIP][66] ([fdo#111614])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
    - shard-iclb:         NOTRUN -> [SKIP][67] ([fdo#110725] / [fdo#111614])
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-apl:          NOTRUN -> [SKIP][68] ([fdo#109271] / [i915#3777]) +3 similar issues
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-tglb:         NOTRUN -> [SKIP][69] ([fdo#111615]) +2 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][70] ([i915#3689]) +6 similar issues
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html

  * igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][71] ([fdo#109271] / [i915#3886]) +5 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-tglb:         NOTRUN -> [SKIP][72] ([i915#3689] / [i915#3886]) +2 similar issues
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html
    - shard-apl:          NOTRUN -> [SKIP][73] ([fdo#109271] / [i915#3886]) +8 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:
    - shard-kbl:          NOTRUN -> [SKIP][74] ([fdo#109271] / [i915#3886]) +2 similar issues
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:
    - shard-tglb:         NOTRUN -> [SKIP][75] ([fdo#111615] / [i915#3689]) +1 similar issue
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html

  * igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:
    - shard-iclb:         NOTRUN -> [SKIP][76] ([fdo#109278] / [i915#3886]) +3 similar issues
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-iclb:         NOTRUN -> [SKIP][77] ([i915#3742])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_cdclk@plane-scaling.html
    - shard-tglb:         NOTRUN -> [SKIP][78] ([i915#3742]) +1 similar issue
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium@dp-hpd-fast:
    - shard-snb:          NOTRUN -> [SKIP][79] ([fdo#109271] / [fdo#111827]) +7 similar issues
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@kms_chamelium@dp-hpd-fast.html

  * igt@kms_chamelium@hdmi-edid-change-during-suspend:
    - shard-apl:          NOTRUN -> [SKIP][80] ([fdo#109271] / [fdo#111827]) +12 similar issues
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html

  * igt@kms_chamelium@hdmi-hpd-for-each-pipe:
    - shard-iclb:         NOTRUN -> [SKIP][81] ([fdo#109284] / [fdo#111827]) +4 similar issues
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium@hdmi-hpd-storm:
    - shard-kbl:          NOTRUN -> [SKIP][82] ([fdo#109271] / [fdo#111827]) +8 similar issues
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html

  * igt@kms_color_chamelium@pipe-b-ctm-0-75:
    - shard-tglb:         NOTRUN -> [SKIP][83] ([fdo#109284] / [fdo#111827]) +8 similar issues
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html

  * igt@kms_color_chamelium@pipe-d-ctm-limited-range:
    - shard-iclb:         NOTRUN -> [SKIP][84] ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html

  * igt@kms_color_chamelium@pipe-d-degamma:
    - shard-glk:          NOTRUN -> [SKIP][85] ([fdo#109271] / [fdo#111827]) +9 similar issues
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.html

  * igt@kms_content_protection@lic:
    - shard-apl:          NOTRUN -> [TIMEOUT][86] ([i915#1319])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl8/igt@kms_content_protection@lic.html
    - shard-iclb:         NOTRUN -> [SKIP][87] ([fdo#109300] / [fdo#111066])
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_content_protection@lic.html
    - shard-tglb:         NOTRUN -> [SKIP][88] ([fdo#111828])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_content_protection@lic.html
    - shard-kbl:          NOTRUN -> [TIMEOUT][89] ([i915#1319])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_content_protection@lic.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:
    - shard-tglb:         NOTRUN -> [SKIP][90] ([i915#3359]) +3 similar issues
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html

  * igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:
    - shard-tglb:         NOTRUN -> [SKIP][91] ([i915#3319])
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html

  * igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:
    - shard-iclb:         NOTRUN -> [SKIP][92] ([fdo#109278] / [fdo#109279])
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html

  * igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:
    - shard-tglb:         NOTRUN -> [SKIP][93] ([fdo#109279] / [i915#3359]) +2 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html

  * igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:
    - shard-iclb:         NOTRUN -> [SKIP][94] ([fdo#109278]) +21 similar issues
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-iclb:         NOTRUN -> [SKIP][95] ([fdo#109274] / [fdo#109278])
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@pipe-d-torture-bo:
    - shard-kbl:          NOTRUN -> [SKIP][96] ([fdo#109271] / [i915#533]) +1 similar issue
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html
    - shard-apl:          NOTRUN -> [SKIP][97] ([fdo#109271] / [i915#533]) +1 similar issue
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html

  * igt@kms_dp_tiled_display@basic-test-pattern:
    - shard-iclb:         NOTRUN -> [SKIP][98] ([i915#426])
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html
    - shard-tglb:         NOTRUN -> [SKIP][99] ([i915#426])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html

  * igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
    - shard-glk:          NOTRUN -> [FAIL][100] ([i915#1888])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-kbl:          [PASS][101] -> [INCOMPLETE][102] ([i915#180] / [i915#636])
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-iclb:         NOTRUN -> [SKIP][103] ([fdo#109274]) +3 similar issues
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-dp1:
    - shard-apl:          [PASS][104] -> [FAIL][105] ([i915#79])
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
    - shard-kbl:          [PASS][106] -> [DMESG-WARN][107] ([i915#180]) +3 similar issues
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
    - shard-apl:          NOTRUN -> [SKIP][108] ([fdo#109271] / [i915#2672])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html

  * igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:
    - shard-apl:          NOTRUN -> [DMESG-WARN][109] ([i915#1226])
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html
    - shard-kbl:          NOTRUN -> [DMESG-WARN][110] ([i915#1226])
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-iclb:         NOTRUN -> [SKIP][111] ([fdo#109285])
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html
    - shard-tglb:         NOTRUN -> [SKIP][112] ([fdo#109285])
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-iclb:         NOTRUN -> [SKIP][113] ([fdo#109280]) +23 similar issues
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-kbl:          NOTRUN -> [DMESG-WARN][114] ([i915#180]) +2 similar issues
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
    - shard-tglb:         NOTRUN -> [SKIP][115] ([fdo#111825]) +31 similar issues
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-kbl:          NOTRUN -> [SKIP][116] ([fdo#109271]) +107 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
    - shard-glk:          NOTRUN -> [SKIP][117] ([fdo#109271] / [i915#533]) +2 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
    - shard-apl:          [PASS][118] -> [DMESG-WARN][119] ([i915#180]) +2 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html

  * igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:
    - shard-glk:          NOTRUN -> [FAIL][120] ([fdo#108145] / [i915#265])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html

  * igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:
    - shard-apl:          NOTRUN -> [FAIL][121] ([i915#265])
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:
    - shard-apl:          NOTRUN -> [FAIL][122] ([fdo#108145] / [i915#265])
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html

  * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
    - shard-kbl:          NOTRUN -> [FAIL][123] ([fdo#108145] / [i915#265])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html

  * igt@kms_plane_lowres@pipe-d-tiling-y:
    - shard-tglb:         NOTRUN -> [SKIP][124] ([i915#3536])
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-y.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
    - shard-tglb:         NOTRUN -> [SKIP][125] ([i915#2920]) +2 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html
    - shard-iclb:         NOTRUN -> [SKIP][126] ([i915#658]) +2 similar issues
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
    - shard-apl:          NOTRUN -> [SKIP][127] ([fdo#109271] / [i915#658]) +3 similar issues
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html
    - shard-glk:          NOTRUN -> [SKIP][128] ([fdo#109271] / [i915#658]) +3 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:
    - shard-kbl:          NOTRUN -> [SKIP][129] ([fdo#109271] / [i915#658]) +3 similar issues
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-iclb:         NOTRUN -> [SKIP][130] ([fdo#109441])
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html
    - shard-tglb:         NOTRUN -> [FAIL][131] ([i915#132] /

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/index.html

--===============8770749730330701506==
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
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl7/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a></p>
</li>
<li>
<p>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb6/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl2/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl8/igt@testdisplay.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl6/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@testdisplay.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10968_full and IGTPW_6474_full:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@gem_ctx_exec@basic-close-race:</p>
<ul>
<li>Statuses : 5 pass(s)</li>
<li>Exec time: [5.43, 5.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-a-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 9.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-b-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 5 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 11.21] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-c-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 2.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@scaler-with-clipping-clamping@pipe-d-scaler-with-clipping-clamping:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.99] s</li>
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
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@feature_discovery@display-2x.html">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-3x:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@feature_discovery@display-3x.html">SKIP</a> ([fdo#109271]) +108 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@smoketest:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb6/igt@gem_ctx_persistence@smoketest.html">SKIP</a> ([fdo#109271] / [i915#1099]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-contexts-10ms:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html">TIMEOUT</a> ([i915#3063])</li>
</ul>
</li>
<li>
<p>igt@gem_eio@unwedge-stress:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb2/igt@gem_eio@unwedge-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_eio@unwedge-stress.html">TIMEOUT</a> ([i915#3063] / [i915#3648])</li>
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
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk7/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> ([i915#2842]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-vip@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_exec_fair@basic-none-vip@rcs0.html">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-iclb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-iclb7/igt@gem_exec_fair@basic-none@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_exec_fair@basic-none@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglb:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-tglb1/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> ([i915#2842]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> ([i915#2842]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_params@no-bsd:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_exec_params@no-bsd.html">SKIP</a> ([fdo#109283])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-codependency:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb4/igt@gem_exec_schedule@semaphore-codependency.html">SKIP</a> ([fdo#109271]) +141 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-fds-priority-all:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-glk2/igt@gem_exec_whisper@basic-fds-priority-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk4/igt@gem_exec_whisper@basic-fds-priority-all.html">DMESG-WARN</a> ([i915#118])</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@parallel-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@gem_lmem_swapping@parallel-multi.html">SKIP</a> ([fdo#109271] / [i915#4613]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([i915#4613])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk8/igt@gem_lmem_swapping@verify-random.html">SKIP</a> ([fdo#109271] / [i915#4613]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-buffer:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@gem_pxp@create-regular-buffer.html">SKIP</a> ([i915#4270]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_softpin@evict-snoop:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@gem_softpin@evict-snoop.html">SKIP</a> ([fdo#109312])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-sync:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@gem_userptr_blits@dmabuf-sync.html">SKIP</a> ([fdo#109271] / [i915#3323])</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@dmabuf-unsync:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gem_userptr_blits@dmabuf-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@invalid-mmap-offset-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@vma-merge:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@gem_userptr_blits@vma-merge.html">FAIL</a> ([i915#3318])</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@cmd-crossing-page:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen7_exec_parse@cmd-crossing-page.html">SKIP</a> ([fdo#109289]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@oacontrol-tracking:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen7_exec_parse@oacontrol-tracking.html">SKIP</a> ([fdo#109289])</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@cmd-crossing-page:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@gen9_exec_parse@cmd-crossing-page.html">SKIP</a> ([i915#2856])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl2/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> ([i915#454])</p>
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
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> ([i915#1804] / [i915#2684])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109271]) +176 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109506] / [i915#2411])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> ([fdo#109293] / [fdo#109506])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> ([i915#3826])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#111614])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> ([fdo#110725] / [fdo#111614])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> ([fdo#109271] / [i915#3777]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> ([fdo#111615]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_ccs@pipe-b-bad-rotation-90-y_tiled_ccs.html">SKIP</a> ([i915#3689]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +5 similar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([i915#3689] / [i915#3886]) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_ccs@pipe-b-crc-primary-rotation-180-y_tiled_gen12_mc_ccs.html">SKIP</a> ([fdo#109271] / [i915#3886]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb1/igt@kms_ccs@pipe-b-crc-sprite-planes-basic-yf_tiled_ccs.html">SKIP</a> ([fdo#111615] / [i915#3689]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_ccs@pipe-b-random-ccs-data-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> ([fdo#109278] / [i915#3886]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cdclk@plane-scaling.html">SKIP</a> ([i915#3742]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-snb7/igt@kms_chamelium@dp-hpd-fast.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl4/igt@kms_chamelium@hdmi-edid-change-during-suspend.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +12 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_chamelium@hdmi-hpd-for-each-pipe.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-storm:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_chamelium@hdmi-hpd-storm.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_color_chamelium@pipe-b-ctm-0-75.html">SKIP</a> ([fdo#109284] / [fdo#111827]) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-limited-range:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html">SKIP</a> ([fdo#109278] / [fdo#109284] / [fdo#111827]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-degamma:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk2/igt@kms_color_chamelium@pipe-d-degamma.html">SKIP</a> ([fdo#109271] / [fdo#111827]) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl8/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#109300] / [fdo#111066])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_content_protection@lic.html">SKIP</a> ([fdo#111828])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_content_protection@lic.html">TIMEOUT</a> ([i915#1319])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cursor_crc@pipe-b-cursor-32x10-sliding.html">SKIP</a> ([i915#3359]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_cursor_crc@pipe-b-cursor-32x32-rapid-movement.html">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_cursor_crc@pipe-b-cursor-512x512-sliding.html">SKIP</a> ([fdo#109278] / [fdo#109279])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb2/igt@kms_cursor_crc@pipe-d-cursor-512x170-offscreen.html">SKIP</a> ([fdo#109279] / [i915#3359]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_cursor_edge_walk@pipe-d-128x128-top-edge.html">SKIP</a> ([fdo#109278]) +21 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> ([fdo#109274] / [fdo#109278])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl3/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl4/igt@kms_cursor_legacy@pipe-d-torture-bo.html">SKIP</a> ([fdo#109271] / [i915#533]) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb6/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_dp_tiled_display@basic-test-pattern.html">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-rgb565-render-ytiled:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk6/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html">FAIL</a> ([i915#1888])</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> ([i915#180] / [i915#636])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> ([fdo#109274]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-dp1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl6/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl1/igt@kms_flip@flip-vs-expired-vblank@b-dp1.html">FAIL</a> ([i915#79])</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html">DMESG-WARN</a> ([i915#180]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html">SKIP</a> ([fdo#109271] / [i915#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html">DMESG-WARN</a> ([i915#1226])</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_flip_tiling@flip-change-tiling@dp-1-pipe-a-y-to-yf-ccs.html">DMESG-WARN</a> ([i915#1226])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb6/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> ([fdo#109285])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> ([fdo#109280]) +23 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html">SKIP</a> ([fdo#111825]) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> ([fdo#109271]) +107 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk5/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d.html">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10968/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c.html">DMESG-WARN</a> ([i915#180]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk3/igt@kms_plane_alpha_blend@pipe-a-constant-alpha-max.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl6/igt@kms_plane_alpha_blend@pipe-b-alpha-transparent-fb.html">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-7efc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl2/igt@kms_plane_alpha_blend@pipe-c-alpha-7efc.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-c-alpha-basic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl7/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html">FAIL</a> ([fdo#108145] / [i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@pipe-d-tiling-y:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb3/igt@kms_plane_lowres@pipe-d-tiling-y.html">SKIP</a> ([i915#3536])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#2920]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4.html">SKIP</a> ([i915#658]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-apl7/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-glk9/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-kbl6/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-1.html">SKIP</a> ([fdo#109271] / [i915#658]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6474/shard-iclb5/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> ([fdo#109441])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; [FAIL][131] ([i915#132] /</p>
</li>
</ul>
</li>
</ul>

</body>
</html>

--===============8770749730330701506==--
