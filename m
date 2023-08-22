Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============0710991410066900959=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Tue, 22 Aug 2023 12:01:53 -0000
Message-ID: <169270571350.20551.4376908589533153744@emeril.freedesktop.org>
References: <20230822094035.3424673-1-jouni.hogander@intel.com>
In-Reply-To: <20230822094035.3424673-1-jouni.hogander@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgVGVzdGNh?=
 =?utf-8?q?ses_for_dirtyfb_ioctl?=
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

--===============0710991410066900959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Testcases for dirtyfb ioctl
URL   : https://patchwork.freedesktop.org/series/122731/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_13542_full -> IGTPW_9633_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_9633_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_9633_full, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_9633_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1} (NEW):
    - shard-mtlp:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1.html

  * {igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3} (NEW):
    - shard-dg2:          NOTRUN -> [SKIP][2] +2 similar issues
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1 (NEW):
    - shard-rkl:          NOTRUN -> [SKIP][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html
    - shard-tglu:         NOTRUN -> [SKIP][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4 (NEW):
    - shard-dg1:          NOTRUN -> [SKIP][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html

  
New tests
---------

  New tests have been introduced between CI_DRM_13542_full and IGTPW_9633_full:

### New IGT tests (25) ###

  * igt@kms_dirtyfb@dirtyfb-ioctl:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-dp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-dp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-2:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_9633_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@api_intel_bb@blit-reloc-keep-cache:
    - shard-dg2:          NOTRUN -> [SKIP][6] ([i915#8411]) +1 similar issue
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html

  * igt@api_intel_bb@render-ccs:
    - shard-dg2:          NOTRUN -> [FAIL][7] ([i915#6122])
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@api_intel_bb@render-ccs.html

  * igt@drm_buddy@drm_buddy_test:
    - shard-snb:          NOTRUN -> [SKIP][8] ([fdo#109271] / [i915#8661])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@drm_buddy@drm_buddy_test.html

  * igt@drm_fdinfo@most-busy-check-all@bcs0:
    - shard-dg2:          NOTRUN -> [SKIP][9] ([i915#8414]) +30 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html

  * igt@drm_fdinfo@most-busy-idle-check-all@rcs0:
    - shard-rkl:          [PASS][10] -> [FAIL][11] ([i915#7742])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html

  * igt@feature_discovery@display-2x:
    - shard-dg2:          NOTRUN -> [SKIP][12] ([i915#1839])
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@feature_discovery@display-2x.html

  * igt@gem_ccs@block-multicopy-compressed:
    - shard-mtlp:         NOTRUN -> [SKIP][13] ([i915#5325])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html

  * igt@gem_ccs@block-multicopy-inplace:
    - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#3555] / [i915#5325])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html

  * igt@gem_close_race@multigpu-basic-threads:
    - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#7697])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - shard-rkl:          [PASS][16] -> [FAIL][17] ([i915#6268])
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@heartbeat-stop:
    - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8555])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-stop.html

  * igt@gem_ctx_persistence@hostile:
    - shard-snb:          NOTRUN -> [SKIP][19] ([fdo#109271] / [i915#1099]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@gem_ctx_persistence@hostile.html

  * igt@gem_ctx_persistence@legacy-engines-hang@bsd1:
    - shard-mtlp:         [PASS][20] -> [FAIL][21] ([i915#2410])
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html

  * igt@gem_eio@hibernate:
    - shard-dg2:          NOTRUN -> [ABORT][22] ([i915#7975] / [i915#8213])
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@kms:
    - shard-dg2:          NOTRUN -> [INCOMPLETE][23] ([i915#7892])
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_eio@kms.html

  * igt@gem_exec_balancer@bonded-dual:
    - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4771])
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html

  * igt@gem_exec_balancer@bonded-semaphore:
    - shard-dg2:          NOTRUN -> [SKIP][25] ([i915#4812])
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html

  * igt@gem_exec_balancer@parallel:
    - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#4525])
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@gem_exec_balancer@parallel.html

  * igt@gem_exec_capture@capture-invisible@lmem0:
    - shard-dg2:          NOTRUN -> [SKIP][27] ([i915#6334]) +1 similar issue
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html

  * igt@gem_exec_capture@pi@rcs0:
    - shard-mtlp:         [PASS][28] -> [FAIL][29] ([i915#4475])
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_exec_capture@pi@rcs0.html
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@gem_exec_capture@pi@rcs0.html

  * igt@gem_exec_fair@basic-none-rrul@rcs0:
    - shard-rkl:          NOTRUN -> [FAIL][30] ([i915#2842])
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html
    - shard-tglu:         NOTRUN -> [FAIL][31] ([i915#2842])
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@gem_exec_fair@basic-none-rrul@rcs0.html

  * igt@gem_exec_fair@basic-none-share:
    - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#3539] / [i915#4852])
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gem_exec_fair@basic-none-share.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [PASS][33] -> [FAIL][34] ([i915#2842])
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-tglu:         [PASS][35] -> [FAIL][36] ([i915#2842])
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_exec_fair@basic-pace-solo@rcs0:
    - shard-glk:          [PASS][37] -> [FAIL][38] ([i915#2842])
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html

  * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
    - shard-snb:          NOTRUN -> [SKIP][39] ([fdo#109271]) +230 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb4/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html

  * igt@gem_exec_reloc@basic-cpu-gtt:
    - shard-rkl:          NOTRUN -> [SKIP][40] ([i915#3281]) +2 similar issues
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt.html

  * igt@gem_exec_reloc@basic-gtt-wc-active:
    - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#3281]) +8 similar issues
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gem_exec_reloc@basic-gtt-wc-active.html

  * igt@gem_exec_reloc@basic-wc-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][42] ([i915#3281]) +1 similar issue
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html

  * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
    - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4860]) +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html

  * igt@gem_lmem_swapping@heavy-multi:
    - shard-apl:          NOTRUN -> [SKIP][44] ([fdo#109271] / [i915#4613])
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html

  * igt@gem_mmap_gtt@zero-extend:
    - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#4077]) +16 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html

  * igt@gem_mmap_wc@copy:
    - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#4083]) +4 similar issues
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_mmap_wc@copy.html

  * igt@gem_mmap_wc@write-cpu-read-wc:
    - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#4083])
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@gem_mmap_wc@write-cpu-read-wc.html

  * igt@gem_pwrite@basic-random:
    - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#3282]) +3 similar issues
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@gem_pwrite@basic-random.html

  * igt@gem_pxp@create-regular-context-1:
    - shard-mtlp:         NOTRUN -> [SKIP][49] ([i915#4270])
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@gem_pxp@create-regular-context-1.html

  * igt@gem_pxp@protected-raw-src-copy-not-readible:
    - shard-dg2:          NOTRUN -> [SKIP][50] ([i915#4270]) +4 similar issues
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html

  * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
    - shard-rkl:          NOTRUN -> [SKIP][51] ([i915#4270]) +1 similar issue
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
    - shard-tglu:         NOTRUN -> [SKIP][52] ([i915#4270])
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html

  * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
    - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#8411])
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html

  * igt@gem_userptr_blits@coherency-unsync:
    - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#3297]) +3 similar issues
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html

  * igt@gem_userptr_blits@map-fixed-invalidate-busy:
    - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3297] / [i915#4880])
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html

  * igt@gen3_render_linear_blits:
    - shard-rkl:          NOTRUN -> [SKIP][56] ([fdo#109289]) +2 similar issues
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@gen3_render_linear_blits.html

  * igt@gen7_exec_parse@batch-without-end:
    - shard-dg2:          NOTRUN -> [SKIP][57] ([fdo#109289]) +1 similar issue
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@gen7_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@batch-without-end:
    - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#2527]) +1 similar issue
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html
    - shard-tglu:         NOTRUN -> [SKIP][59] ([i915#2527] / [i915#2856])
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@gen9_exec_parse@batch-without-end.html

  * igt@gen9_exec_parse@bb-secure:
    - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#2856])
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gen9_exec_parse@bb-secure.html

  * igt@gen9_exec_parse@secure-batches:
    - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#2527])
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html

  * igt@gen9_exec_parse@valid-registers:
    - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#2856]) +8 similar issues
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gen9_exec_parse@valid-registers.html

  * igt@i915_hangman@engine-engine-error@vcs0:
    - shard-mtlp:         [PASS][63] -> [FAIL][64] ([i915#7069])
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html

  * igt@i915_module_load@reload-with-fault-injection:
    - shard-dg2:          NOTRUN -> [DMESG-WARN][65] ([i915#7061] / [i915#8617])
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html
    - shard-mtlp:         [PASS][66] -> [ABORT][67] ([i915#8489] / [i915#8668])
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html

  * igt@i915_pipe_stress@stress-xrgb8888-untiled:
    - shard-mtlp:         [PASS][68] -> [FAIL][69] ([i915#8691])
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html

  * igt@i915_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2:          NOTRUN -> [SKIP][70] ([i915#7091])
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@i915_pm_backlight@fade:
    - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#5354] / [i915#7561])
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@i915_pm_backlight@fade.html

  * igt@i915_pm_backlight@fade-with-suspend:
    - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#7561])
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@i915_pm_backlight@fade-with-suspend.html

  * igt@i915_pm_dc@dc5-psr:
    - shard-rkl:          NOTRUN -> [SKIP][73] ([i915#658]) +1 similar issue
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html
    - shard-tglu:         NOTRUN -> [SKIP][74] ([i915#658]) +1 similar issue
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@i915_pm_dc@dc5-psr.html

  * igt@i915_pm_rc6_residency@rc6-accuracy:
    - shard-dg2:          [PASS][75] -> [FAIL][76] ([i915#8230])
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-12/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@i915_pm_rc6_residency@rc6-accuracy.html
    - shard-mtlp:         [PASS][77] -> [SKIP][78] ([i915#8403])
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html

  * igt@i915_pm_rc6_residency@rc6-idle@rcs0:
    - shard-dg1:          [PASS][79] -> [FAIL][80] ([i915#3591])
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - shard-dg1:          [PASS][81] -> [SKIP][82] ([i915#1397])
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_pm_rpm@modeset-non-lpsp-stress:
    - shard-rkl:          [PASS][83] -> [SKIP][84] ([i915#1397]) +1 similar issue
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html

  * igt@i915_pm_rpm@modeset-pc8-residency-stress:
    - shard-dg2:          NOTRUN -> [SKIP][85] ([fdo#109506])
   [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html

  * igt@i915_pm_rps@min-max-config-idle:
    - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#6621])
   [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html

  * igt@i915_pm_rps@thresholds-park@gt0:
    - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#8925]) +1 similar issue
   [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@i915_pm_rps@thresholds-park@gt0.html

  * igt@i915_query@query-topology-coherent-slice-mask:
    - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#6188])
   [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html

  * igt@i915_query@query-topology-known-pci-ids:
    - shard-dg2:          NOTRUN -> [SKIP][89] ([fdo#109303])
   [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@i915_query@query-topology-known-pci-ids.html

  * igt@i915_suspend@basic-s2idle-without-i915:
    - shard-snb:          NOTRUN -> [DMESG-WARN][90] ([i915#8841])
   [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190]) +14 similar issues
   [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-x-tiled-legacy:
    - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4212]) +1 similar issue
   [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:
    - shard-dg1:          NOTRUN -> [SKIP][93] ([i915#8502]) +7 similar issues
   [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html

  * igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [FAIL][94] ([i915#8247]) +1 similar issue
   [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - shard-dg1:          NOTRUN -> [FAIL][95] ([i915#8247]) +3 similar issues
   [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-apl:          NOTRUN -> [SKIP][96] ([fdo#109271]) +60 similar issues
   [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-mtlp:         NOTRUN -> [SKIP][97] ([fdo#111614])
   [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#5286]) +2 similar issues
   [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][99] ([fdo#111615] / [i915#5286])
   [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-mtlp:         [PASS][100] -> [FAIL][101] ([i915#3743])
   [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-rkl:          NOTRUN -> [SKIP][102] ([fdo#111614] / [i915#3638])
   [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html
    - shard-tglu:         NOTRUN -> [SKIP][103] ([fdo#111614])
   [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2:          NOTRUN -> [SKIP][104] ([fdo#111614]) +5 similar issues
   [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-rkl:          NOTRUN -> [SKIP][105] ([fdo#110723]) +2 similar issues
   [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-rkl:          NOTRUN -> [SKIP][106] ([fdo#111615]) +1 similar issue
   [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-tglu:         NOTRUN -> [SKIP][107] ([fdo#111615]) +2 similar issues
   [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
    - shard-mtlp:         NOTRUN -> [SKIP][108] ([fdo#111615])
   [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#4538] / [i915#5190]) +9 similar issues
   [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][110] ([i915#3689] / [i915#5354]) +22 similar issues
   [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#5354] / [i915#6095]) +6 similar issues
   [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html
    - shard-mtlp:         NOTRUN -> [SKIP][112] ([i915#6095]) +6 similar issues
   [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html

  * igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
    - shard-mtlp:         NOTRUN -> [SKIP][113] ([i915#3886] / [i915#6095])
   [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#3734] / [i915#5354] / [i915#6095]) +1 similar issue
   [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html

  * igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:
    - shard-apl:          NOTRUN -> [SKIP][115] ([fdo#109271] / [i915#3886]) +1 similar issue
   [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-rkl:          NOTRUN -> [SKIP][116] ([i915#5354] / [i915#6095]) +8 similar issues
   [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
    - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#3689] / [i915#3886] / [i915#5354]) +4 similar issues
   [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:
    - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#5354]) +53 similar issues
   [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html

  * igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:
    - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#5354] / [i915#6095])
   [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html

  * igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#3689] / [i915#3886] / [i915#5354] / [i915#6095])
   [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
    - shard-tglu:         NOTRUN -> [SKIP][121] ([i915#3689] / [i915#5354] / [i915#6095]) +2 similar issues
   [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html

  * igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:
    - shard-rkl:          NOTRUN -> [SKIP][122] ([i915#5354]) +11 similar issues
   [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#7213] / [i915#9010])
   [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4087] / [i915#7213]) +3 similar issues
   [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
    - shard-dg2:          NOTRUN -> [SKIP][125] ([i915#4087]) +3 similar issues
   [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-rkl:          NOTRUN -> [SKIP][126] ([fdo#111827])
   [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_chamelium_color@ctm-0-25.html
    - shard-tglu:         NOTRUN -> [SKIP][127] ([fdo#111827])
   [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2:          NOTRUN -> [SKIP][128] ([fdo#111827]) +2 similar issues
   [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-tglu:         NOTRUN -> [SKIP][129] ([i915#7828])
   [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
    - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#7828]) +1 similar issue
   [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2:          NOTRUN -> [SKIP][131] ([i915#7828]) +11 similar issues
   [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-dg1:          NOTRUN -> [SKIP][132] ([i915#7828])
   [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-rkl:          NOTRUN -> [SKIP][133] ([i915#7828]) +2 similar issues
   [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2:          NOTRUN -> [TIMEOUT][134] ([i915#7173]) +1 similar issue
   [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#3299])
   [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#7118])
   [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-mtlp:         NOTRUN -> [SKIP][137] ([i915#3359])
   [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2:          NOTRUN -> [SKIP][138] ([i915#3359]) +1 similar issue
   [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2:          NOTRUN -> [SKIP][139] ([i915#3555]) +5 similar issues
   [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-snb:          NOTRUN -> [SKIP][140] ([fdo#109271] / [fdo#111767]) +1 similar issue
   [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-tglu:         NOTRUN -> [SKIP][141] ([fdo#109274]) +1 similar issue
   [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2:          NOTRUN -> [SKIP][142] ([fdo#109274] / [i915#5354]) +4 similar issues
   [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg1:          NOTRUN -> [SKIP][143] ([fdo#111767] / [fdo#111825])
   [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][144] -> [FAIL][145] ([i915#2346])
   [144]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:
    - shard-dg1:          [PASS][146] -> [DMESG-WARN][147] ([i915#4423])
   [146]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html
   [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4103] / [i915#4213]) +1 similar issue
   [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-rkl:          NOTRUN -> [SKIP][149] ([i915#4103])
   [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2 (NEW):
    - shard-glk:          NOTRUN -> [SKIP][150] ([fdo#109271]) +5 similar issues
   [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk7/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#1257])
   [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_dp_aux_dev.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3469])
   [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_fence_pin_leak:
    - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#4881])
   [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_fence_pin_leak.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-dg1:          NOTRUN -> [SKIP][154] ([fdo#111825]) +3 similar issues
   [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-dg2:          NOTRUN -> [SKIP][155] ([fdo#109274] / [fdo#111767])
   [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-rkl:          NOTRUN -> [SKIP][156] ([fdo#111825]) +4 similar issues
   [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-dg2:          NOTRUN -> [SKIP][157] ([fdo#109274]) +7 similar issues
   [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-mtlp:         NOTRUN -> [SKIP][158] ([i915#3637]) +1 similar issue
   [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-apl:          NOTRUN -> [SKIP][159] ([fdo#109271] / [fdo#111767])
   [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-tglu:         NOTRUN -> [SKIP][160] ([fdo#109274] / [i915#3637])
   [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-fences:
    - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#8381])
   [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip@flip-vs-fences.html
    - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#8381])
   [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@flip-vs-fences.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#2672]) +1 similar issue
   [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][164] ([i915#8810])
   [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg1:          NOTRUN -> [SKIP][165] ([i915#2587] / [i915#2672])
   [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#2672]) +1 similar issue
   [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#2587] / [i915#2672])
   [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#2672]) +8 similar issues
   [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#5274])
   [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#1825]) +9 similar issues
   [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][171] ([fdo#109280]) +2 similar issues
   [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-dg1:          NOTRUN -> [SKIP][172] ([i915#8708]) +1 similar issue
   [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-dg2:          NOTRUN -> [FAIL][173] ([i915#6880])
   [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
    - shard-dg2:          NOTRUN -> [SKIP][174] ([i915#8708]) +22 similar issues
   [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#5460])
   [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#3023]) +7 similar issues
   [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:
    - shard-tglu:         NOTRUN -> [SKIP][177] ([fdo#110189]) +4 similar issues
   [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#3458]) +26 similar issues
   [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-rkl:          NOTRUN -> [SKIP][179] ([fdo#111825] / [i915#1825]) +9 similar issues
   [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][180] ([i915#8708]) +3 similar issues
   [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#6118])
   [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-rkl:          NOTRUN -> [SKIP][182] ([i915#3555] / [i915#8228])
   [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#3555] / [i915#8228]) +1 similar issue
   [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2:          NOTRUN -> [SKIP][184] ([i915#4816])
   [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:
    - shard-mtlp:         NOTRUN -> [SKIP][185] ([fdo#109289])
   [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - shard-mtlp:         [PASS][186] -> [DMESG-WARN][187] ([i915#2017])
   [186]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html
   [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:
    - shard-apl:          [PASS][188] -> [DMESG-WARN][189] ([i915#180])
   [188]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html
   [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#3555]) +2 similar issues
   [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html
    - shard-dg2:          NOTRUN -> [SKIP][191] ([i915#3555] / [i915#8806])
   [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:
    - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#5176]) +11 similar issues
   [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:
    - shard-dg1:          NOTRUN -> [SKIP][193] ([i915#5176]) +15 similar issues
   [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:
    - shard-tglu:         NOTRUN -> [SKIP][194] ([i915#5176]) +7 similar issues
   [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][195] ([i915#5176]) +7 similar issues
   [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:
    - shard-rkl:          NOTRUN -> [SKIP][196] ([i915#5235]) +5 similar issues
   [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:
    - shard-dg1:          NOTRUN -> [SKIP][197] ([i915#5235]) +11 similar issues
   [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:
    - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#5235]) +3 similar issues
   [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:
    - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#5235]) +15 similar issues
   [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#658])
   [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#658]) +6 similar issues
   [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@primary_render:
    - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#1072]) +3 similar issues
   [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_psr@primary_render.html

  * igt@kms_psr@psr2_cursor_mmap_gtt:
    - shard-mtlp:         NOTRUN -> [SKIP][203] ([i915#4077])
   [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_psr@psr2_cursor_mmap_gtt.html

  * igt@kms_psr@psr2_sprite_plane_move:
    - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#1072]) +8 similar issues
   [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_psr@psr2_sprite_plane_move.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-mtlp:         NOTRUN -> [SKIP][205] ([i915#4235])
   [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#4235] / [i915#5190])
   [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#3555])
   [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_selftest@drm_format:
    - shard-apl:          NOTRUN -> [SKIP][208] ([fdo#109271] / [i915#8661]) +1 similar issue
   [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_selftest@drm_format.html

  * igt@kms_selftest@drm_plane:
    - shard-dg2:          NOTRUN -> [SKIP][209] ([i915#8661])
   [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_selftest@drm_plane.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
    - shard-snb:          NOTRUN -> [FAIL][210] ([i915#5465]) +1 similar issue
   [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#8623]) +1 similar issue
   [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@pipe-c-query-forked-hang:
    - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#4070] / [i915#6768]) +1 similar issue
   [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_vblank@pipe-c-query-forked-hang.html

  * igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:
    - shard-apl:          [PASS][213] -> [ABORT][214] ([i915#180])
   [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html
   [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html

  * igt@kms_vblank@pipe-d-query-idle-hang:
    - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#4070] / [i915#533] / [i915#6768])
   [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_vblank@pipe-d-query-idle-hang.html

  * igt@perf@gen8-unprivileged-single-ctx-counters:
    - shard-rkl:          NOTRUN -> [SKIP][216] ([i915#2436])
   [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html
    - shard-tglu:         NOTRUN -> [SKIP][217] ([fdo#109289]) +1 similar issue
   [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@perf@gen8-unprivileged-single-ctx-counters.html

  * igt@perf@mi-rpc:
    - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#2434])
   [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@perf@mi-rpc.html

  * igt@perf@non-zero-reason@0-rcs0:
    - shard-dg2:          NOTRUN -> [FAIL][219] ([i915#7484])
   [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html

  * igt@perf_pmu@busy-idle-check-all@bcs0:
    - shard-mtlp:         [PASS][220] -> [FAIL][221] ([i915#4521]) +4 similar issues
   [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html
   [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html

  * igt@perf_pmu@enable-race@bcs0:
    - shard-glk:          [PASS][222] -> [DMESG-WARN][223] ([i915#118])
   [222]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk4/igt@perf_pmu@enable-race@bcs0.html
   [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk5/igt@perf_pmu@enable-race@bcs0.html

  * igt@perf_pmu@frequency@gt0:
    - shard-dg2:          NOTRUN -> [FAIL][224] ([i915#6806])
   [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@perf_pmu@frequency@gt0.html

  * igt@perf_pmu@rc6@other-idle-gt0:
    - shard-dg2:          NOTRUN -> [SKIP][225] ([i915#8516])
   [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@perf_pmu@rc6@other-idle-gt0.html
    - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#8516])
   [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html

  * igt@perf_pmu@rc6@runtime-pm-long-gt1:
    - shard-mtlp:         [PASS][227] -> [SKIP][228] ([i915#8537]) +2 similar issues
   [227]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html
   [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html

  * igt@perf_pmu@semaphore-busy@vcs1:
    - shard-dg1:          [PASS][229] -> [FAIL][230] ([i915#4349]) +2 similar issues
   [229]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html
   [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html
    - shard-mtlp:         [PASS][231] -> [FAIL][232] ([i915#4349]) +3 similar issues
   [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html
   [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html

  * igt@perf_pmu@semaphore-busy@vecs0:
    - shard-dg2:          [PASS][233] -> [FAIL][234] ([i915#4349]) +7 similar issues
   [233]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-11/igt@perf_pmu@semaphore-busy@vecs0.html
   [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@perf_pmu@semaphore-busy@vecs0.html

  * igt@prime_udl:
    - shard-dg2:          NOTRUN -> [SKIP][235] ([fdo#109291])
   [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@prime_udl.html

  * igt@sysfs_heartbeat_interval@nopreempt@bcs0:
    - shard-mtlp:         [PASS][236] -> [FAIL][237] ([i915#6015])
   [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html
   [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html

  * igt@sysfs_timeslice_duration@timeout@vecs0:
    - shard-mtlp:         [PASS][238] -> [ABORT][239] ([i915#8521] / [i915#8865])
   [238]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html
   [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html

  * igt@tools_test@sysfs_l3_parity:
    - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#4818])
   [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@tools_test@sysfs_l3_parity.html

  * igt@v3d/v3d_submit_cl@bad-bo:
    - shard-rkl:          NOTRUN -> [SKIP][241] ([fdo#109315]) +2 similar issues
   [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@v3d/v3d_submit_cl@bad-bo.html
    - shard-tglu:         NOTRUN -> [SKIP][242] ([fdo#109315] / [i915#2575])
   [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@v3d/v3d_submit_cl@bad-bo.html

  * igt@v3d/v3d_submit_csd@bad-extension:
    - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#2575]) +2 similar issues
   [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@v3d/v3d_submit_csd@bad-extension.html

  * igt@v3d/v3d_submit_csd@multi-and-single-sync:
    - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#2575])
   [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@v3d/v3d_submit_csd@multi-and-single-sync.html

  * igt@v3d/v3d_submit_csd@single-out-sync:
    - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#2575]) +14 similar issues
   [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@v3d/v3d_submit_csd@single-out-sync.html

  * igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:
    - shard-dg2:          NOTRUN -> [SKIP][246] ([i915#7711]) +9 similar issues
   [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html

  * igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:
    - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#7711]) +2 similar issues
   [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html
    - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#2575]) +1 similar issue
   [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html

  * igt@vc4/vc4_lookup_fail@bad-color-write:
    - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#7711]) +1 similar issue
   [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@vc4/vc4_lookup_fail@bad-color-write.html

  
#### Possible fixes ####

  * igt@gem_ctx_persistence@engines-hostile@vcs0:
    - shard-mtlp:         [FAIL][250] ([i915#2410]) -> [PASS][251] +2 similar issues
   [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html
   [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html

  * igt@gem_ctx_persistence@saturated-hostile@vecs0:
    - shard-mtlp:         [FAIL][252] ([i915#7816]) -> [PASS][253] +2 similar issues
   [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html
   [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html

  * igt@gem_eio@banned:
    - shard-mtlp:         [FAIL][254] ([i915#8798]) -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_eio@banned.html
   [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@gem_eio@banned.html

  * igt@gem_eio@hibernate:
    - shard-tglu:         [ABORT][256] ([i915#7975] / [i915#8213] / [i915#8398]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-10/igt@gem_eio@hibernate.html
   [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-3/igt@gem_eio@hibernate.html

  * igt@gem_eio@reset-stress:
    - shard-dg1:          [FAIL][258] ([i915#5784]) -> [PASS][259] +1 similar issue
   [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-12/igt@gem_eio@reset-stress.html
   [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-16/igt@gem_eio@reset-stress.html

  * igt@gem_exec_endless@dispatch@ccs0:
    - shard-mtlp:         [TIMEOUT][260] ([i915#7016]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@gem_exec_endless@dispatch@ccs0.html
   [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_exec_endless@dispatch@ccs0.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][262] ([i915#2846]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk5/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@bcs0:
    - shard-rkl:          [FAIL][264] ([i915#2842]) -> [PASS][265] +1 similar issue
   [264]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html
   [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html

  * igt@gem_exec_flush@basic-batch-kernel-default-uc:
    - shard-mtlp:         [DMESG-FAIL][266] ([i915#8962] / [i915#9121]) -> [PASS][267]
   [266]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
   [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-uc.html

  * igt@gem_exec_schedule@preemptive-hang@vcs0:
    - shard-mtlp:         [FAIL][268] ([i915#9051]) -> [PASS][269]
   [268]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html
   [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - shard-dg1:          [TIMEOUT][270] ([i915#5493]) -> [PASS][271]
   [270]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@i915_pm_rc6_residency@rc6-idle@bcs0:
    - shard-dg1:          [FAIL][272] ([i915#3591]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html
   [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html

  * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-rkl:          [SKIP][274] ([i915#1397]) -> [PASS][275]
   [274]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html
   [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@i915_pm_rpm@dpms-non-lpsp:
    - shard-dg1:          [SKIP][276] ([i915#1397]) -> [PASS][277]
   [276]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html
   [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@i915_pm_rpm@dpms-non-lpsp.html

  * igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2:          [SKIP][278] ([i915#1397]) -> [PASS][279] +1 similar issue
   [278]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html
   [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@i915_pm_rps@reset:
    - shard-snb:          [INCOMPLETE][280] ([i915#7790]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-snb6/igt@i915_pm_rps@reset.html
   [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb5/igt@i915_pm_rps@reset.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-mtlp:         [FAIL][282] ([i915#5138]) -> [PASS][283]
   [282]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-mtlp:         [FAIL][284] ([i915#3743]) -> [PASS][285] +2 similar issues
   [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
    - shard-mtlp:         [FAIL][286] ([i915#8248]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
   [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-apl:          [FAIL][288] ([i915#2346]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:
    - shard-glk:          [FAIL][290] ([i915#79]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html
   [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html

  * igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x:
    - shard-mtlp:         [FAIL][292] ([i915#9056]) -> [PASS][293] +4 similar issues
   [292]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x.html
   [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-dg2:          [FAIL][294] ([i915#6880]) -> [PASS][295] +4 similar issues
   [294]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
    - shard-tglu:         [FAIL][296] ([i915#8292]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-9/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
   [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html

  * igt@kms_prime@basic-crc-vgem@second-to-first:
    - shard-mtlp:         [DMESG-WARN][298] ([i915#1982]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@kms_prime@basic-crc-vgem@second-to-first.html
   [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_prime@basic-crc-vgem@second-to-first.html

  * igt@perf_pmu@most-busy-idle-check-all@bcs0:
    - shard-dg1:          [FAIL][300] ([i915#5234]) -> [PASS][301]
   [300]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@bcs0.html
   [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@bcs0.html

  * igt@sysfs_heartbeat_interval@nopreempt@vcs0:
    - shard-mtlp:         [FAIL][302] ([i915#6015]) -> [PASS][303]
   [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html
   [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html

  * igt@sysfs_heartbeat_interval@precise@vecs0:
    - shard-mtlp:         [FAIL][304] ([i915#8332]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html
   [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html

  
#### Warnings ####

  * igt@i915_pm_rc6_residency@media-rc6-accuracy:
    - shard-mtlp:         [SKIP][306] ([fdo#109289]) -> [SKIP][307] ([i915#8403])
   [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html
   [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html

  * igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:
    - shard-dg1:          [SKIP][308] ([i915#3689] / [i915#5354] / [i915#6095]) -> [SKIP][309] ([i915#3689] / [i915#4423] / [i915#5354] / [i915#6095])
   [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html
   [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html

  * igt@kms_content_protection@content_type_change:
    - shard-dg2:          [SKIP][310] ([i915#7118]) -> [SKIP][311] ([i915#7118] / [i915#7162])
   [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-10/igt@kms_content_protection@content_type_change.html
   [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_content_protection@content_type_change.html

  * igt@kms_content_protection@mei_interface:
    - shard-dg2:          [SKIP][312] ([i915#7118] / [i915#7162]) -> [SKIP][313] ([i915#7118])
   [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-11/igt@kms_content_protection@mei_interface.html
   [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_content_protection@mei_interface.html
    - shard-rkl:          [SKIP][314] ([i915#7118]) -> [SKIP][315] ([fdo#109300])
   [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_content_protection@mei_interface.html
   [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_content_protection@mei_interface.html
    - shard-dg1:          [SKIP][316] ([i915#7116]) -> [SKIP][317] ([fdo#109300])
   [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-17/igt@kms_content_protection@mei_interface.html
   [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_content_protection@mei_interface.html
    - shard-tglu:         [SKIP][318] ([i915#6944] / [i915#7116] / [i915#7118]) -> [SKIP][319] ([fdo#109300])
   [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-3/igt@kms_content_protection@mei_interface.html
   [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-3/igt@kms_content_protection@mei_interface.html

  * igt@kms_fbcon_fbt@psr:
    - shard-rkl:          [SKIP][320] ([i915#3955]) -> [SKIP][321] ([fdo#110189] / [i915#3955])
   [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_fbcon_fbt@psr.html
   [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-rkl:          [SKIP][322] ([fdo#110189] / [i915#3955]) -> [SKIP][323] ([i915#3955])
   [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html
   [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_force_connector_basic@force-load-detect:
    - shard-rkl:          [SKIP][324] ([fdo#109285]) -> [SKIP][325] ([fdo#109285] / [i915#4098])
   [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html
   [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-dg1:          [SKIP][326] ([i915#3458]) -> [SKIP][327] ([i915#3458] / [i915#4423])
   [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
   [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-rkl:          [SKIP][328] ([i915#4070] / [i915#4816]) -> [SKIP][329] ([i915#4816])
   [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_psr@primary_mmap_gtt:
    - shard-dg1:          [SKIP][330] ([i915#1072]) -> [SKIP][331] ([i915#1072] / [i915#4078])
   [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_psr@primary_mmap_gtt.html
   [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_psr@primary_mmap_gtt.html

  * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
    - shard-dg2:          [INCOMPLETE][332] ([i915#5493]) -> [CRASH][333] ([i915#7331])
   [332]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
   [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109285]: https://bugs.freedesktop.org/show_bug.cgi?id=109285
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109300]: https://bugs.freedesktop.org/show_bug.cgi?id=109300
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111767]: https://bugs.freedesktop.org/show_bug.cgi?id=111767
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#118]: https://gitlab.freedesktop.org/drm/intel/issues/118
  [i915#1257]: https://gitlab.freedesktop.org/drm/intel/issues/1257
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#180]: https://gitlab.freedesktop.org/drm/intel/issues/180
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2410]: https://gitlab.freedesktop.org/drm/intel/issues/2410
  [i915#2434]: https://gitlab.freedesktop.org/drm/intel/issues/2434
  [i915#2436]: https://gitlab.freedesktop.org/drm/intel/issues/2436
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#3023]: https://gitlab.freedesktop.org/drm/intel/issues/3023
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3591]: https://gitlab.freedesktop.org/drm/intel/issues/3591
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3743]: https://gitlab.freedesktop.org/drm/intel/issues/3743
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4087]: https://gitlab.freedesktop.org/drm/intel/issues/4087
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
  [i915#4235]: https://gitlab.freedesktop.org/drm/intel/issues/4235
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4423]: https://gitlab.freedesktop.org/drm/intel/issues/4423
  [i915#4475]: https://gitlab.freedesktop.org/drm/intel/issues/4475
  [i915#4521]: https://gitlab.freedesktop.org/drm/intel/issues/4521
  [i915#4525]: https://gitlab.freedesktop.org/drm/intel/issues/4525
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4816]: https://gitlab.freedesktop.org/drm/intel/issues/4816
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4881]: https://gitlab.freedesktop.org/drm/intel/issues/4881
  [i915#5138]: https://gitlab.freedesktop.org/drm/intel/issues/5138
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5190]: https://gitlab.freedesktop.org/drm/intel/issues/5190
  [i915#5234]: https://gitlab.freedesktop.org/drm/intel/issues/5234
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5460]: https://gitlab.freedesktop.org/drm/intel/issues/5460
  [i915#5465]: https://gitlab.freedesktop.org/drm/intel/issues/5465
  [i915#5493]: https://gitlab.freedesktop.org/drm/intel/issues/5493
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6015]: https://gitlab.freedesktop.org/drm/intel/issues/6015
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6118]: https://gitlab.freedesktop.org/drm/intel/issues/6118
  [i915#6122]: https://gitlab.freedesktop.org/drm/intel/issues/6122
  [i915#6188]: https://gitlab.freedesktop.org/drm/intel/issues/6188
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6806]: https://gitlab.freedesktop.org/drm/intel/issues/6806
  [i915#6880]: https://gitlab.freedesktop.org/drm/intel/issues/6880
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#7016]: https://gitlab.freedesktop.org/drm/intel/issues/7016
  [i915#7061]: https://gitlab.freedesktop.org/drm/intel/issues/7061
  [i915#7069]: https://gitlab.freedesktop.org/drm/intel/issues/7069
  [i915#7091]: https://gitlab.freedesktop.org/drm/intel/issues/7091
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7162]: https://gitlab.freedesktop.org/drm/intel/issues/7162
  [i915#7173]: https://gitlab.freedesktop.org/drm/intel/issues/7173
  [i915#7213]: https://gitlab.freedesktop.org/drm/intel/issues/7213
  [i915#7331]: https://gitlab.freedesktop.org/drm/intel/issues/7331
  [i915#7484]: https://gitlab.freedesktop.org/drm/intel/issues/7484
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7790]: https://gitlab.freedesktop.org/drm/intel/issues/7790
  [i915#7816]: https://gitlab.freedesktop.org/drm/intel/issues/7816
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7892]: https://gitlab.freedesktop.org/drm/intel/issues/7892
  [i915#79]: https://gitlab.freedesktop.org/drm/intel/issues/79
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8213]: https://gitlab.freedesktop.org/drm/intel/issues/8213
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8230]: https://gitlab.freedesktop.org/drm/intel/issues/8230
  [i915#8247]: https://gitlab.freedesktop.org/drm/intel/issues/8247
  [i915#8248]: https://gitlab.freedesktop.org/drm/intel/issues/8248
  [i915#8292]: https://gitlab.freedesktop.org/drm/intel/issues/8292
  [i915#8332]: https://gitlab.freedesktop.org/drm/intel/issues/8332
  [i915#8381]: https://gitlab.freedesktop.org/drm/intel/issues/8381
  [i915#8398]: https://gitlab.freedesktop.org/drm/intel/issues/8398
  [i915#8403]: https://gitlab.freedesktop.org/drm/intel/issues/8403
  [i915#8411]: https://gitlab.freedesktop.org/drm/intel/issues/8411
  [i915#8414]: https://gitlab.freedesktop.org/drm/intel/issues/8414
  [i915#8489]: https://gitlab.freedesktop.org/drm/intel/issues/8489
  [i915#8502]: https://gitlab.freedesktop.org/drm/intel/issues/8502
  [i915#8516]: https://gitlab.freedesktop.org/drm/intel/issues/8516
  [i915#8521]: https://gitlab.freedesktop.org/drm/intel/issues/8521
  [i915#8537]: https://gitlab.freedesktop.org/drm/intel/issues/8537
  [i915#8555]: https://gitlab.freedesktop.org/drm/intel/issues/8555
  [i915#8617]: https://gitlab.freedesktop.org/drm/intel/issues/8617
  [i915#8623]: https://gitlab.freedesktop.org/drm/intel/issues/8623
  [i915#8661]: https://gitlab.freedesktop.org/drm/intel/issues/8661
  [i915#8668]: https://gitlab.freedesktop.org/drm/intel/issues/8668
  [i915#8691]: https://gitlab.freedesktop.org/drm/intel/issues/8691
  [i915#8708]: https://gitlab.freedesktop.org/drm/intel/issues/8708
  [i915#8798]: https://gitlab.freedesktop.org/drm/intel/issues/8798
  [i915#8806]: https://gitlab.freedesktop.org/drm/intel/issues/8806
  [i915#8810]: https://gitlab.freedesktop.org/drm/intel/issues/8810
  [i915#8841]: https://gitlab.freedesktop.org/drm/intel/issues/8841
  [i915#8865]: https://gitlab.freedesktop.org/drm/intel/issues/8865
  [i915#8925]: https://gitlab.freedesktop.org/drm/intel/issues/8925
  [i915#8962]: https://gitlab.freedesktop.org/drm/intel/issues/8962
  [i915#9010]: https://gitlab.freedesktop.org/drm/intel/issues/9010
  [i915#9051]: https://gitlab.freedesktop.org/drm/intel/issues/9051
  [i915#9056]: https://gitlab.freedesktop.org/drm/intel/issues/9056
  [i915#9121]: https://gitlab.freedesktop.org/drm/intel/issues/9121


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7448 -> IGTPW_9633
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_13542: e9193f5af644feeda019392109ba1ecdf8bf09e2 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_9633: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html

--===============0710991410066900959==
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
<tr><td><b>Series:</b></td><td>Testcases for dirtyfb ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122731/">https://patchwork.freedesktop.org/series/122731/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_13542_full -&gt; IGTPW_9633_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_9633_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_9633_full, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_9633_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1} (NEW):</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3} (NEW):</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1 (NEW):</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1.html">SKIP</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4 (NEW):</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4.html">SKIP</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_13542_full and IGTPW_9633_full:</p>
<h3>New IGT tests (25)</h3>
<ul>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-dp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@default-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@fbc-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-dp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-1:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@psr-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_9633_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@api_intel_bb@blit-reloc-keep-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@api_intel_bb@render-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@api_intel_bb@render-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6122">i915#6122</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_buddy@drm_buddy_test:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@drm_buddy@drm_buddy_test.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@bcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@drm_fdinfo@most-busy-check-all@bcs0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8414">i915#8414</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_fdinfo@most-busy-idle-check-all@rcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@drm_fdinfo@most-busy-idle-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>)</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1839">i915#1839</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@gem_ccs@block-multicopy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gem_ccs@block-multicopy-inplace.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5325">i915#5325</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_close_race@multigpu-basic-threads:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_close_race@multigpu-basic-threads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7697">i915#7697</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@heartbeat-stop:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gem_ctx_persistence@heartbeat-stop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8555">i915#8555</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hostile:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@gem_ctx_persistence@hostile.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-hang@bsd1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-2/igt@gem_ctx_persistence@legacy-engines-hang@bsd1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_eio@kms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_eio@kms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7892">i915#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-dual:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@gem_exec_balancer@bonded-dual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4771">i915#4771</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@bonded-semaphore:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_exec_balancer@bonded-semaphore.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4812">i915#4812</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@parallel:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@gem_exec_balancer@parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4525">i915#4525</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@capture-invisible@lmem0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6334">i915#6334</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_capture@pi@rcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_exec_capture@pi@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@gem_exec_capture@pi@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4475">i915#4475</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gem_exec_fair@basic-none-share.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3539">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4852">i915#4852</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl2/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-3/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk5/igt@gem_exec_fair@basic-pace-solo@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb4/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +230 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-cpu-gtt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_exec_reloc@basic-cpu-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-active:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gem_exec_reloc@basic-gtt-wc-active.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wc-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gem_exec_reloc@basic-wc-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_fenced_exec_thrash@no-spare-fences-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4860">i915#4860</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@heavy-multi:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@gem_lmem_swapping@heavy-multi.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@zero-extend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_mmap_gtt@zero-extend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>) +16 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@copy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_mmap_wc@copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_wc@write-cpu-read-wc:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@gem_mmap_wc@write-cpu-read-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4083">i915#4083</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pwrite@basic-random:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@gem_pwrite@basic-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@create-regular-context-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@gem_pxp@create-regular-context-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_pxp@verify-pxp-execution-after-suspend-resume:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4270">i915#4270</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_set_tiling_vs_blt@tiled-to-untiled:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8411">i915#8411</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@coherency-unsync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@gem_userptr_blits@coherency-unsync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@map-fixed-invalidate-busy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@gem_userptr_blits@map-fixed-invalidate-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3297">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4880">i915#4880</a>)</li>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@gen3_render_linear_blits.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen7_exec_parse@batch-without-end:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@gen7_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-without-end:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@gen9_exec_parse@batch-without-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-secure:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@gen9_exec_parse@bb-secure.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@secure-batches:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@gen9_exec_parse@secure-batches.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@valid-registers:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@gen9_exec_parse@valid-registers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2856">i915#2856</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_hangman@engine-engine-error@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-2/igt@i915_hangman@engine-engine-error@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7069">i915#7069</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7061">i915#7061</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8617">i915#8617</a>)</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_module_load@reload-with-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8489">i915#8489</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8668">i915#8668</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_pipe_stress@stress-xrgb8888-untiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8691">i915#8691</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@i915_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7091">i915#7091</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@i915_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@i915_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7561">i915#7561</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc5-psr:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@i915_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-12/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@i915_pm_rc6_residency@rc6-accuracy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8230">i915#8230</a>)</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-5/igt@i915_pm_rc6_residency@rc6-accuracy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@i915_pm_rc6_residency@rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@rcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-4/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109506">fdo#109506</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@min-max-config-idle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@i915_pm_rps@min-max-config-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6621">i915#6621</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@thresholds-park@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@i915_pm_rps@thresholds-park@gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8925">i915#8925</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-coherent-slice-mask:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@i915_query@query-topology-coherent-slice-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6188">i915#6188</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_query@query-topology-known-pci-ids:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@i915_query@query-topology-known-pci-ids.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109303">fdo#109303</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s2idle-without-i915:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb2/igt@i915_suspend@basic-s2idle-without-i915.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8841">i915#8841</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_addfb_basic@basic-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4212">i915#4212</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y-rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8502">i915#8502</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8247">i915#8247</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +60 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_big_fb@4-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5286">i915#5286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3638">i915#3638</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111614">fdo#111614</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110723">fdo#110723</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>) +2 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111615">fdo#111615</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4538">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_ccs@pipe-a-bad-pixel-format-4_tiled_dg2_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +6 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3734">i915#3734</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl7/igt@kms_ccs@pipe-a-missing-ccs-buffer-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-b-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_ccs@pipe-c-crc-primary-basic-4_tiled_mtl_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +53 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_ccs@pipe-c-crc-primary-rotation-180-4_tiled_dg2_rc_ccs_cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@kms_ccs@pipe-c-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@kms_ccs@pipe-d-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_ccs@pipe-d-missing-ccs-buffer-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9010">i915#9010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7213">i915#7213</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4087">i915#4087</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111827">fdo#111827</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</p>
</li>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7828">i915#7828</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-4.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7173">i915#7173</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3299">i915#3299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3359">i915#3359</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_cursor_legacy@flip-vs-cursor-busy-crc-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4213">i915#4213</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4103">i915#4103</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2 (NEW):</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk7/igt@kms_dirtyfb@dirtyfb-ioctl@drrs-hdmi-a-2.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1257">i915#1257</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3469">i915#3469</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fence_pin_leak:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_fence_pin_leak.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4881">i915#4881</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl1/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://bugs.freedesktop.org/show_bug.cgi?id=111767">fdo#111767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109274">fdo#109274</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3637">i915#3637</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-fences:</p>
<ul>
<li>
<p>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@kms_flip@flip-vs-fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8381">i915#8381</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8810">i915#8810</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-14/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2587">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2672">i915#2672</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109280">fdo#109280</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +22 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5460">i915#5460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3023">i915#3023</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-cpu.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) +26 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111825">fdo#111825</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1825">i915#1825</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8708">i915#8708</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6118">i915#6118</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_hdr@static-toggle-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8228">i915#8228</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@kms_pipe_b_c_ivb@enable-pipe-c-while-b-has-3-lanes.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl7/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>) +2 similar issues</p>
</li>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8806">i915#8806</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-19/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_plane_scaling@plane-upscale-with-rotation-factor-0-25@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5176">i915#5176</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +5 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-14/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5235">i915#5235</a>) +15 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_psr2_sf@overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_render:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_psr@primary_render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_gtt:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-1/igt@kms_psr@psr2_cursor_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4077">i915#4077</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_plane_move:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_psr@psr2_sprite_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4235">i915#4235</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5190">i915#5190</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3555">i915#3555</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_format:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_selftest@drm_format.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_selftest@drm_plane:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_selftest@drm_plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8661">i915#8661</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb1/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5465">i915#5465</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8623">i915#8623</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-query-forked-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_vblank@pipe-c-query-forked-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl3/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_vblank@pipe-c-ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-d-query-idle-hang:</p>
<ul>
<li>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_vblank@pipe-d-query-idle-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/533">i915#533</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6768">i915#6768</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@gen8-unprivileged-single-ctx-counters:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2436">i915#2436</a>)</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-8/igt@perf@gen8-unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@perf@mi-rpc:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@perf@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2434">i915#2434</a>)</li>
</ul>
</li>
<li>
<p>igt@perf@non-zero-reason@0-rcs0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@perf@non-zero-reason@0-rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7484">i915#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@perf_pmu@busy-idle-check-all@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4521">i915#4521</a>) +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@enable-race@bcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk4/igt@perf_pmu@enable-race@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk5/igt@perf_pmu@enable-race@bcs0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/118">i915#118</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@frequency@gt0:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@perf_pmu@frequency@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6806">i915#6806</a>)</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@other-idle-gt0:</p>
<ul>
<li>
<p>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</p>
</li>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@perf_pmu@rc6@other-idle-gt0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8516">i915#8516</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6@runtime-pm-long-gt1:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@perf_pmu@rc6@runtime-pm-long-gt1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8537">i915#8537</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vcs1:</p>
<ul>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +2 similar issues</p>
</li>
<li>
<p>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@perf_pmu@semaphore-busy@vcs1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@semaphore-busy@vecs0:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-11/igt@perf_pmu@semaphore-busy@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@perf_pmu@semaphore-busy@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) +7 similar issues</li>
</ul>
</li>
<li>
<p>igt@prime_udl:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@prime_udl.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109291">fdo#109291</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@bcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>)</li>
</ul>
</li>
<li>
<p>igt@sysfs_timeslice_duration@timeout@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@sysfs_timeslice_duration@timeout@vecs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8521">i915#8521</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8865">i915#8865</a>)</li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-12/igt@tools_test@sysfs_l3_parity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4818">i915#4818</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_cl@bad-bo:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-4/igt@v3d/v3d_submit_cl@bad-bo.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109315">fdo#109315</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@bad-extension:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@v3d/v3d_submit_csd@bad-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@multi-and-single-sync:</p>
<ul>
<li>shard-dg1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@v3d/v3d_submit_csd@multi-and-single-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@v3d/v3d_submit_csd@single-out-sync:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@v3d/v3d_submit_csd@single-out-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done:</p>
<ul>
<li>shard-dg2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-8/igt@vc4/vc4_dmabuf_poll@poll-read-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done:</p>
<ul>
<li>
<p>shard-rkl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +2 similar issues</p>
</li>
<li>
<p>shard-tglu:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@vc4/vc4_dmabuf_poll@poll-write-waits-until-write-done.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>igt@vc4/vc4_lookup_fail@bad-color-write:</p>
<ul>
<li>shard-mtlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-6/igt@vc4/vc4_lookup_fail@bad-color-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7711">i915#7711</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@gem_ctx_persistence@engines-hostile@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2410">i915#2410</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_ctx_persistence@engines-hostile@vcs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@saturated-hostile@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7816">i915#7816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_ctx_persistence@saturated-hostile@vecs0.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_eio@banned:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@gem_eio@banned.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8798">i915#8798</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@gem_eio@banned.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@hibernate:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-10/igt@gem_eio@hibernate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7975">i915#7975</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8213">i915#8213</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/8398">i915#8398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-3/igt@gem_eio@hibernate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-12/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-16/igt@gem_eio@reset-stress.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@ccs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@gem_exec_endless@dispatch@ccs0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7016">i915#7016</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_exec_endless@dispatch@ccs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk5/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@bcs0:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@gem_exec_fair@basic-none@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@gem_exec_fair@basic-none@bcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_flush@basic-batch-kernel-default-uc:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8962">i915#8962</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/9121">i915#9121</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@gem_exec_flush@basic-batch-kernel-default-uc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@preemptive-hang@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@gem_exec_schedule@preemptive-hang@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9051">i915#9051</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@gem_exec_schedule@preemptive-hang@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3591">i915#3591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-19/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-1/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-10/igt@i915_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rps@reset:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-snb6/igt@i915_pm_rps@reset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7790">i915#7790</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-snb5/igt@i915_pm_rps@reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5138">i915#5138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3743">i915#3743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-2/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8248">i915#8248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-glk1/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/79">i915#79</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-glk2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-1/igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/9056">i915#9056</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_flip_tiling@flip-change-tiling@edp-1-pipe-b-4-to-x.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6880">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-9/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8292">i915#8292</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-6/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prime@basic-crc-vgem@second-to-first:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-4/igt@kms_prime@basic-crc-vgem@second-to-first.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@kms_prime@basic-crc-vgem@second-to-first.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@most-busy-idle-check-all@bcs0:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-17/igt@perf_pmu@most-busy-idle-check-all@bcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5234">i915#5234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-12/igt@perf_pmu@most-busy-idle-check-all@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@nopreempt@vcs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-8/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6015">i915#6015</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-3/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@sysfs_heartbeat_interval@precise@vecs0:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-6/igt@sysfs_heartbeat_interval@precise@vecs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8332">i915#8332</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-8/igt@sysfs_heartbeat_interval@precise@vecs0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@media-rc6-accuracy:</p>
<ul>
<li>shard-mtlp:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-mtlp-7/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109289">fdo#109289</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-mtlp-5/igt@i915_pm_rc6_residency@media-rc6-accuracy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8403">i915#8403</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_ccs@pipe-d-crc-primary-basic-y_tiled_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3689">i915#3689</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/5354">i915#5354</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/6095">i915#6095</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-10/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-11/igt@kms_content_protection@content_type_change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei_interface:</p>
<ul>
<li>
<p>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-11/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7162">i915#7162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-3/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>)</p>
</li>
<li>
<p>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-2/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-17/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</p>
</li>
<li>
<p>shard-tglu:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-tglu-3/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6944">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7116">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7118">i915#7118</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-tglu-3/igt@kms_content_protection@mei_interface.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109300">fdo#109300</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=110189">fdo#110189</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3955">i915#3955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109285">fdo#109285</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3458">i915#3458</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4423">i915#4423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-rkl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-rkl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4070">i915#4070</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4816">i915#4816</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_mmap_gtt:</p>
<ul>
<li>shard-dg1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg1-14/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg1-18/igt@kms_psr@primary_mmap_gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4078">i915#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
<ul>
<li>shard-dg2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_13542/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5493">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/shard-dg2-6/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7331">i915#7331</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7448 -&gt; IGTPW_9633</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_13542: e9193f5af644feeda019392109ba1ecdf8bf09e2 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_9633: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9633/index.html<br />
  IGT_7448: 84aa6d50648d9349fb4f1520f37e5374908c9f4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============0710991410066900959==--
